<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Edge extends Model
{
    use HasFactory;

    protected $table = 'edges'; // Ensure your table name is 'edges'

    protected $fillable = [
        'diagram_id',
        'data_center_id',
        'edge_id', // The ID from React Flow
        'source',
        'target',
        'source_handle',
        'target_handle',
        'type',
        'style',
        'marker_end',
        'data',
    ];

    protected $casts = [
        'style' => 'array',
        'marker_end' => 'array',
        'data' => 'array',
    ];

    public function diagram()
    {
        return $this->belongsTo(Diagram::class);
    }
}
