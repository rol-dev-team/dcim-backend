<?php
//
//namespace App\Events;
//
//use Illuminate\Queue\SerializesModels;
//use Illuminate\Foundation\Events\Dispatchable;
//use Illuminate\Broadcasting\InteractsWithSockets;
//use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
//use Illuminate\Broadcasting\Channel;
//
//class SensorDataUpdated implements ShouldBroadcast
//{
//    use Dispatchable, InteractsWithSockets, SerializesModels;
//
//    public $sensorData;
//
//    public function __construct($sensorData)
//    {
//        $this->sensorData = $sensorData;
//    }
//
//    public function broadcastOn()
//    {
////        return new Channel('sensor-data'); // or return ['sensor-data'];
//        return ['sensor-data'];
//    }
//
//    public function broadcastAs()
//    {
//        return 'SensorDataUpdated';
//    }
//}


namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class SensorDataUpdated implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $sensorData;

    public function __construct($sensorData)
    {
        $this->sensorData = $sensorData;
    }

    public function broadcastOn()
    {
        return new Channel('sensor-data');
    }

    public function broadcastAs()
    {
        return 'SensorDataUpdated';
    }
}
