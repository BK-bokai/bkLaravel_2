<?php

namespace App\Services;

use App\Repositories\MemberRepository;
use Illuminate\Http\Request;
use App\Model\User;

class LoginService
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
     * Validate the user login request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function validateLogin(Request $request)
    {
        $request->validate(
            [
                'username' => 'required|string',
                'password' => 'required|string',
            ],
            [
                'username.required'    => '請輸入帳號。',
                'password.required' => '請輸入密碼。',
            ]
        );
    }



}
