<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Model\User;

class SendRegisterMail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $email;
    protected $activasion;


    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($email,$activasion)
    {
        $this->email = $email;
        $this->activasion = $activasion;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //找到用戶之後，對於這個用戶去進行通知function
        $user = User::where('email',$this->email)->first();
        $user->sendRegisterNotification($this->activasion);
    }
}
