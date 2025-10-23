<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TriggerType extends Model
{
    use HasFactory;

    protected $table = 'trigger_types';

    protected $fillable = [
        'id',
        'name'
    ];
}
