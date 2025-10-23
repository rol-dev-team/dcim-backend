<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RakList extends Model
{
    use HasFactory;

    protected $table = 'rak_lists';

    protected $fillable = [
        'code',
        'name'
    ];
}
