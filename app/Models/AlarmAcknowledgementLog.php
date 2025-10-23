<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class AlarmAcknowledgementLog extends Model
{
    use HasFactory;

    protected $table = 'alarm_acknowledgement_logs';

    protected $fillable = [
        'sensor_id',
        'alarm_value',
        'checked_by',
        'description'
    ];
}
