<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Model\student_skills;
use App\Services\RegisterService;
use Illuminate\Support\Facades\Mail;
use App\Mail\register;
use Illuminate\Support\Facades\Session;

class SendMail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $activasion;
    protected $request;
    // protected $RegisterService;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($activasion, $request)
    {
        $this->activasion = $activasion;
        $this->request = $request;
        // $this->RegisterService = $RegisterService;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        Session::put('success', '註冊成功，請至信箱收取確認信');
        Session::put('name', $this->request['name']);
        Session::put('email', $this->request['email']);
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
            'link'    => url("/confirm/{$this->activasion}")
        ];

        // 若要直接檢視模板
        // echo (new Warning($data))->render();die;

        Mail::to($to)->send(new register($MailBody));
    }
}
