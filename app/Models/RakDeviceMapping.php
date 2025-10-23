<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RakDeviceMapping extends Model
{
    //

    use HasFactory;

    protected $table = 'rak_device_mappings';

    protected $fillable = [
        'device_id',
        'rak_id'
    ];
}
