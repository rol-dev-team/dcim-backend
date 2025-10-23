<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PairGroup extends Model
{
    protected $table = 'pair_groups';

    protected $fillable = [
        'group',
        'start_with',
        'status',
    ];
}
