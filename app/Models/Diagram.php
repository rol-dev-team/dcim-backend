<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diagram extends Model
{

    use HasFactory;

    protected $table = 'diagrams';



    protected $fillable = [
        'data_center_id',
        'name',
        'svg_content',
        'nodes',
        'edges'
    ];

    protected $casts = [
        'nodes' => 'array',
        'edges' => 'array',
    ];

    public function dataCenter()
    {
        return $this->belongsTo(DataCenterCreation::class);
    }
}
