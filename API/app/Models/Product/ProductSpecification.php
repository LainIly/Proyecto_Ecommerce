<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class ProductSpecification extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'product_id',
        'attribute_id',
        'propertie_id',
        'value_add',
    ];
    
    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function product () {
        return $this->belongsTo(Product::class);
    }

    public function attribute () {
        return $this->belongsTo(Attribute::class);
    }

    public function propertie () {
        return $this->belongsTo(Propertie::class);
    }
}
