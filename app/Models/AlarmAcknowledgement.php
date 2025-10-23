<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AlarmAcknowledgement extends Model
{
    protected $table = 'alarm_acknowledgements';

    protected $fillable = [
        'sensor_id',
        'alarm_value',
        'checked_by',
        'description'
    ];

    public function sensor()
    {
        return $this->belongsTo(SensorList::class, 'sensor_id');
    }
}
