<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TabListMapping extends Model
{
    protected $table = 'tab_list_mappings';

    protected $fillable = [
        'data_center_id',
        'tab_id'
    ];

    public function tab()
    {
        return $this->belongsTo(DashboardTabList::class, 'tab_id');
    }

}
