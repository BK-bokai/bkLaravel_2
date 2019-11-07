<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Model\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Session;
use App\Services\RegisterService;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    protected $RegisterService;


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(RegisterService $RegisterService)
    {
        $this->middleware('guest');
        $this->RegisterService = $RegisterService;
    }


    public function showRegistrationForm()
    {
        return view('frontend.register');
    }


    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/login';

    protected function redirectTo()
    {
        return route('login');
    }



    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'username' => $data['username'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'active' => $data['active'],
            'level' => $data['level']
        ]);
    }



    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $user_name    = User::where('name', $request->name)->first();
        $user_username = User::where('username', $request->username)->first();
        $user_email   = User::where('email', $request->email)->first();
        //create the random activasion code
        if ($user_name != null || $user_username != null || $user_email != null) {
            return $this->RegisterService->confirm($request);
        }
        $activasion = md5(uniqid(rand(), true));
        $request['active'] = $activasion;


        $this->RegisterService->validator($request->all())->validate();

        event(new Registered($user = $this->create($request->all())));

        // $this->RegisterService->send($activasion,$request);

        $this->RegisterService->sendServer($user->email,$activasion);

        return $this->registered($request, $user)
            ?: redirect($this->redirectPath());
    }
}
