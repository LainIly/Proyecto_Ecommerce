<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class slider extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'title',
        'subtitle',
        'label',
        'imagen',
        'link',
        'state',
        'color',
        'type_slider',
        'price_original',
        'price_campaing',
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }
}
