<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use App\Models\Product\Propertie;
use App\Models\Product\ProductSpecification;
use App\Models\Product\ProductVariation;

class Attribute extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name',
        'type_attribute',
        'state'
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function properties () {
        return $this->hasMany(Propertie::class);
    }

    public function specifications () {
        return $this->hasMany(ProductSpecification::class);
    }
    
    public function variations () {
        return $this->hasMany(ProductVariation::class);
    }
}
