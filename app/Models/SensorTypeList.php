<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SensorTypeList extends Model
{
    use HasFactory;

    protected $table = 'sensor_type_lists';

    protected $fillable = [
        'id',
        'name'
    ];
}
