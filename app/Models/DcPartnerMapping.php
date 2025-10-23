<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DcPartnerMapping extends Model
{
    use HasFactory;

    protected $table = 'dc_partner_mappings';
    protected $fillable = [
        'id', 'data_center_id','partner_id',
    ];
}
