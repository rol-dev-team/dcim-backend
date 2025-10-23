<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ThresholdType extends Model
{
    use HasFactory;

    protected $table = 'threshold_types';

    protected $fillable = [
        'name',
        'attach_sound',
        'url',
        'color'
    ];
}
