<?php

namespace App\Models\Sale;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\Models\Product\Product;
use App\Models\Product\ProductVariation;
use App\Models\Sale\Sale;

class SaleDetail extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'sale_id',
        'product_id',
        'type_discount',
        'discount',
        'type_campaing',
        'code_cupon',
        'code_discount',
        'product_variation_id',
        'quantity',
        'price_unit',
        'subtotal',
        'total',
        'currency',
        'updated_at'
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function sale () {
        return $this->belongsTo(Sale::class);
    }

    public function product () {
        return $this->belongsTo(Product::class);
    }

    public function product_variation () {
        return $this->belongsTo(ProductVariation::class);
    }

}
