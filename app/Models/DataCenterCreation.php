<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataCenterCreation extends Model
{
    use HasFactory;

    protected $table = 'data_center_creations';

    protected $fillable = [
        'name',
        'division',
        'address',
        'email_notification',
        'sms_notification',
        'owner_type_id',
        'status'
    ];

    /**
     * Get the owner type associated with the data center.
     */
    public function ownerType()
    {
        return $this->belongsTo(OwnerType::class, 'owner_type_id');
    }

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = ['owner_type_name'];

    /**
     * Get the owner type name.
     *
     * @return string|null
     */
    public function getOwnerTypeNameAttribute()
    {
        return $this->ownerType ? $this->ownerType->name : null;
    }
}
