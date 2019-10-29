<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Model\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use App\Services\MemberService;


class MemberController extends Controller
{
    protected $MemberService;

    public function __construct(MemberService $MemberService)
    {
        $this->MemberService = $MemberService;
    }

    public function index()
    {
        $members = User::All();
        $name = Auth::user()->name;
        return view('backend/member', compact('name', 'members'));
    }

    public function showform()
    {
        $members = User::All();
        $name = Auth::user()->name;
        return view('backend/addmember', compact('name', 'members'));
    }

    public function showMember(User $user)
    {
        $name = Auth::user()->name;
        return view('backend/editmember', compact('name', 'user'));
    }

    public function editMember(Request $request, User $user)
    {
        $this->MemberService->edit_validator($request->all())->validate();
        $user->name = $request->name;
        $user->username = $request->username;
        $user->email = $request->email;
        $user->level = $request->level;
        $user->save();
        return redirect()->route('admin.memberAdmin');
    }


    public function addUser(Request $request)
    {
        $user_name    = User::where('name', $request->name)->first();
        $user_username = User::where('username', $request->username)->first();
        $user_email   = User::where('email', $request->email)->first();
        if ($user_name != null || $user_username != null || $user_email != null) {
            return $this->MemberService->confirm($request);
        }

        $request['active'] = 'active';
        $this->MemberService->validator($request->all())->validate();

        event(new Registered($user = $this->create($request->all())));
        return redirect()->route('admin.addmember')
            ->with('status', '已新增一位會員');
    }

    public function deleteUser(Request $request, User $user)
    {
        $user->delete();
        return [
            'contain' => '已刪除用戶',
            $user
        ];
    }



    public function check(Request $request, User $user)
    {   
        $check=[];
        // 將$request的內容與$user比較，看是否有更改以及是否與其他資料重複
        $check=$this->MemberService->checkUser($request,$user);
        return $check;
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
}
