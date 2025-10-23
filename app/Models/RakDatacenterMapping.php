<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RakDatacenterMapping extends Model
{
    use HasFactory;

    protected $table = 'rak_datacenter_mappings';

    protected $fillable = [
        'data_center_id',
        'rak_id'
    ];
}
