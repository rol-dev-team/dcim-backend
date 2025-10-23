<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DoOperationTrigger extends Model
{
    use HasFactory;

    protected $table = 'do_operation_triggers';

    protected $fillable = [
        'rule',
        'sensor_id',
        'mode_id',
        'repeat_id',
        'day_id',
        'on_time',
        'off_time',
        'duration',
        'off_duration',
        'dateFrom',
        'dateTo',
        'status',
    ];


    public function sensorList()
    {
        return $this->belongsTo(SensorList::class, 'sensor_id');
    }

    public function doOperationMode()
    {
        return $this->belongsTo(DoOperationMode::class, 'mode_id');
    }

    public function repeatType()
    {
        return $this->belongsTo(RepeatType::class, 'repeat_id');
    }


    public function schedulling()
    {
        return $this->belongsTo(Schedulling::class, 'day_id');
    }

}
