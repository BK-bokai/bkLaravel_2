<?php
namespace App\Repositories;
use App\Model\User;

class MemberRepository
{
    protected $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function GetAll()
    {
        $users = $this->user->all();
        return $users;
    }
}
?>