<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PartnerList extends Model
{

    use HasFactory;

    protected $table = 'partner_lists';

    protected $fillable = [
        'id',
        'name'
    ];
}
