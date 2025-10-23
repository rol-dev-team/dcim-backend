<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DcOwnerMapping extends Model
{
    use HasFactory;

    protected $table = 'dc_owner_mappings';
    protected $fillable = [
        'id', 'data_center_id','user_id',
    ];
}
