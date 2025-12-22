<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SensorRealTimeValue extends Model
{

    use HasFactory;

    protected $table = 'sensor_real_time_values';

     protected $fillable = [
        'sensor_id',
        'value',
        'received_at',
        'topic'
    ];
}
