<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MQTTPublishEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $sensorData;

    public function __construct($sensorData)
    {
        $this->sensorData = $sensorData;
    }

    public function broadcastOn()
    {
        return new Channel('sensor-channel');
    }

    public function broadcastAs()
    {
        return 'event_name';
    }
    public function broadcastWith()
    {
        return [
            'comment' => $this->sensorData,
        ];
    }

}
