<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Condition extends Model
{
    protected $fillable = ['asset_id', 'parameter_name', 'condition_type', 'trigger_value', 'color'];

    public function asset() {
        return $this->belongsTo(SldAsset::class);
    }
}
