<?php

namespace App\Models\Discount;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class Discount extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        "code",
        "type_discount",
        "discount",
        "start_date",
        "end_date",
        "discount_type",
        "type_campaing",
        "state",
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function categories(){
        return $this->hasMany(DiscountCategorie::class);
    }

    public function products(){
        return $this->hasMany(DiscountProduct::class);
    }

    public function brands(){
        return $this->hasMany(DiscountBrand::class);
    }
}
