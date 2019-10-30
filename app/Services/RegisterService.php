<?php

namespace App\Services;

use App\Repositories\MemberRepository;
use Illuminate\Support\Facades\Validator;
use App\Model\User;
use Illuminate\Support\Facades\Mail;
use App\Mail\register;
use Illuminate\Support\Facades\Session;

class RegisterService
{
    protected $MemberRepo;
    public function __construct(MemberRepository $MemberRepo)
    {
        $this->MemberRepo = $MemberRepo;
    }

    public function GetAll()
    {
        return $this->MemberRepo->GetAll();
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    public function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['same:password'],
            'level' => ['required'],
            'active' => ['required']
        ], [
            'name.required'    => '請輸入使用者名稱。',
            'username.required'    => '請輸入帳號。',
            'email.email'    => '請輸入正確的信箱。',
            'email.required'    => '請輸入信箱。',
            'password.required' => '請輸入最少8碼的密碼。',
            'password.min' => '請輸入最少8碼的密碼。',
            'password_confirmation.same' => '兩次密碼不相同。',
            'password.confirmed' => '兩次密碼不相同。',
        ]);
    }

    /**
     * 確認資料庫是否有重複註冊
     */

    public function confirm($request)
    {
        $user_name    = User::where('name', $request->name)->first();
        $user_username = User::where('username', $request->username)->first();
        $user_email   = User::where('email', $request->email)->first();
        // Check if user was successfully loaded, that the password matches
        // and active is not 1. If so, override the default error message.
        if ($user_name != null || $user_username != null || $user_email != null) {
            if ($user_name != null) {
                $errors = ['name' => '此使用者名稱已被使用過!'];
            };

            if ($user_username != null) {
                $errors = ['username' => '此帳號已被使用過!'];
            };

            if ($user_email != null) {
                $errors = ['email' => '此信箱已被註冊!'];
            };

            if ($user_name != null && $user_username != null) {
                $errors = ['name' => '此使用者名稱已被使用過!', 'username' => '此帳號已被使用過!'];
            };

            if ($user_name != null && $user_email != null) {
                $errors = ['name' => '此使用者名稱已被使用過!', 'email' => '此信箱已被註冊!'];
            };

            if ($user_username != null && $user_email != null) {
                $errors = ['username' => '此帳號已被使用過!', 'email' => '此信箱已被註冊!'];
            };

            if ($user_name != null && $user_username != null && $user_email != null) {
                $errors = ['name' => '此使用者名稱已被使用過!', 'username' => '此帳號已被使用過!', 'email' => '此信箱已被註冊!'];
            };

            return redirect()->back()
                ->withInput($request->only('username', 'remember'))
                ->withErrors($errors);
        };


        if ($request->expectsJson()) {
            return response()->json($errors, 422);
        };

        return false;
    }

    public function send($activasion)
    {
        /**
         * 方法1
         */
        // 收件者務必使用 collect 指定二維陣列，每個項目務必包含 "name", "email"
        $to = collect([
            ['name' => Session::get('name'), 'email' => Session::get('email')]
        ]);

        // 提供給模板的參數
        $MailBody = [
            'content' => "您已於BK網站註冊成功，請點選下列網址進行進一步認證",
            'link'    => url("/confirm/{$activasion}")
        ];

        // 若要直接檢視模板
        // echo (new Warning($data))->render();die;

        Mail::to($to)->send(new register($MailBody));
    }
}
