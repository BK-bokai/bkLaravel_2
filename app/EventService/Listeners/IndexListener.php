<?php

namespace App\EventService\Listeners;

use App\EventService\Events\IndexEvent;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Cache;
use Log;

class IndexListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  IndexEvent  $event
     * @return void
     */
    public function handle(IndexEvent $event)
    {
        $description = $event->description;
        $user = $event->user;
        Log::alert($description,['操作者'=>$user]);
    }
}
