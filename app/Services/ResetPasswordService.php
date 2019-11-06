<?php

namespace App\Services;

use App\Repositories\MemberRepository;
use App\Model\User;
use Illuminate\Support\Facades\Validator;

class ResetPasswordService
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
     * Validate the email for the given request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     */
    public function validateEmail($request)
    {
        $request->validate(
            [
                'email' => 'required|email'
            ],
            [
                'email.required' => "請輸入正確的Email",
                'email.email' => "請輸入正確的Email",
            ]
        );
    }

    /**
     * Send a password reset link to a user.
     *
     * @param  array  $credentials
     * @return string
     */
    public function sendResetLink($email)
    {
        // First we will check to see if we found a user at the given credentials and

        // if we did not we will redirect back to this current URI with a piece of
        // "flash" data in the session to indicate to the developers the errors.
        $user = User::where('email', $email)->first();
        $tokens = md5(uniqid(rand(), true));

        //把token update到此user的資料庫裡面

        if (is_null($user)) {
            return false;
        } else {
            $id = $user['id'];
            $user = User::find($id);
            $user->reset_token = $tokens;
            $user->save();
            // Once we have the reset token, we are ready to send the message out to this
            // user with a link to reset their password. We will then redirect back to
            // the current URI having nothing set in the session to indicate errors.

            $user->sendPasswordResetNotification("{$tokens}?email={$email}");
            return true;
        }


        return false;
    }

    public function validator(array $data)
    {
        return Validator::make($data, [
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['same:password'],
            'token' => 'required',
        ], [
            'email.email'    => '請經由正確管道重設密碼。',
            'email.required'    => '請經由正確管道重設密碼。',
            'password.required' => '請輸入最少8碼的密碼。',
            'password.min' => '請輸入最少8碼的密碼。',
            'password_confirmation.same' => '兩次密碼不相同。',
            'password.confirmed' => '兩次密碼不相同。',
            'token.required' => '請經由正確管道重設密碼。',

        ]);
    }


    /**
     * Reset the given user's password.
     *
     * @param  \Illuminate\Contracts\Auth\CanResetPassword  $user
     * @param  string  $password
     * @return void
     */
    public function resetPassword($user, $password)
    {
        if ($user->password != $password) {
            $user->password = $password;
            $user->reset_token = 'have reseted';

            // $user->setRememberToken(Str::random(60));

            $user->save();
            return true;
        } else {
            return false;
        }
    }

}
