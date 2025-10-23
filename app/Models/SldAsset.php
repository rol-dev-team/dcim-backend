<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SldAsset extends Model
{
    protected $fillable = ['name', 'type', 'datacenter_id', 'x_pos', 'y_pos'];

    public function datacenter() {
        return $this->belongsTo(DataCenterCreation::class);
    }

    public function conditions() {
        return $this->hasMany(Condition::class);
    }
}
