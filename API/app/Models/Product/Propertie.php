<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\Models\Product\ProductSpecification;
use App\Models\Product\ProductVariation;

class Propertie extends Model
{
    use HasFactory;

    protected $fillable = [
        'attribute_id',
        'name',
        'code'
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Colombia');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Colombia');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function specifications () {
        return $this->hasMany(ProductSpecification::class);
    }
    
    public function variations () {
        return $this->hasMany(ProductVariation::class);
    }
}
