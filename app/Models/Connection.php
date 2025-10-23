<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Connection extends Model
{
    protected $fillable = ['datacenter_id', 'from_asset_id', 'to_asset_id'];

    public function fromAsset() {
        return $this->belongsTo(SldAsset::class, 'from_asset_id');
    }

    public function toAsset() {
        return $this->belongsTo(SldAsset::class, 'to_asset_id');
    }
}
