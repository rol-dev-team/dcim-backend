<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PairList extends Model
{
    //

    protected $table = 'pair_lists';

    protected $fillable = [
        'sensor_id',
        'pair_group_id',
        'status',
    ];
}
