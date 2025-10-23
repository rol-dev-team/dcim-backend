<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThresholdValue extends Model
{

    use HasFactory;

    protected $table = 'threshold_values';

    protected $fillable = [
        'sensor_id',
        'threshold_type_id',
        'threshold'
    ];


    /**
     * Get the sensor associated with this threshold value
     */
    public function sensor()
    {
        return $this->belongsTo(SensorList::class, 'sensor_id');
    }

    /**
     * Get the threshold type associated with this value
     */
    public function thresholdType()
    {
        return $this->belongsTo(ThresholdType::class, 'threshold_type_id');
    }

}
