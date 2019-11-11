<?php

namespace App\EventService\Listeners;

use App\EventService\Events\OrderShippedEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class SendShipmentNotificationListener
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
     * @param  OrderShippedEvent  $event
     * @return void
     */
    public function handle(OrderShippedEvent $event)
    {
        //
    }
}
