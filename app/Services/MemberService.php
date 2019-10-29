<?php

namespace App\Services;

use Illuminate\Support\Facades\Validator;
use App\Repositories\MemberRepository;
use App\Model\User;

class MemberService
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

    public function edit_validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'level' => ['required'],
        ], [
            'name.required'    => '請輸入使用者名稱。',
            'username.required'    => '請輸入帳號。',
            'email.email'    => '請輸入正確的信箱。',
            'email.required'    => '請輸入信箱。',
        ]);
    }

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
     * 將$request的內容與$user比較，看是否有更改以及是否與其他資料重複
     */
    public function checkUser($request, $user)
    {
        $check = [];
        $users_name = User::where('id', '!=', $user->id)
            ->where('name', '=', $request->name)->get();
        $users_username = User::where('id', '!=', $user->id)
            ->where('username', '=', $request->username)->get();
        $users_email = User::where('id', '!=', $user->id)
            ->where('email', '=', $request->email)->get();

        if (count($users_name) == 0 && count($users_username) == 0 && count($users_email) == 0) {
            $check['repeat'] = 0;
        } else {
            $check['repeat'] = 1;
            $check['repeat_name'] = (count($users_name) > 0) ? 1 : 0;
            $check['repeat_username'] = (count($users_username) > 0) ? 1 : 0;
            $check['repeat_email'] = (count($users_email) > 0) ? 1 : 0;
        }

        if (
            $request->name != $user->name ||
            $request->username != $user->username ||
            $request->email != $user->email ||
            $request->level != $user->level
        ) {
            $check['change'] = 1;
        } else {
            $check['change'] = 0;
        }

        return $check;
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
}
