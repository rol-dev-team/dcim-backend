<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Node extends Model
{

    protected $table = 'nodes';

    protected $fillable = [
        'data_center_id',
        'node_id',
        'node_type',
        'position',
        'data',
        'style'
    ];

    protected $casts = [
        'position' => 'array',
        'data' => 'array',
        'style' => 'array',
    ];

    public function dataCenter()
    {
        return $this->belongsTo(DataCenterCreation::class, 'data_center_id');
    }
}
