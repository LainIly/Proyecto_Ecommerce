<?php

namespace App\Models\Sale;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use App\Models\Product\Product;
use App\Models\User\User;
use App\Models\Product\ProductVariation;

class Cart extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'user_id',
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
        'currency'
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function user () {
        return $this->belongsTo(User::class);
    }

    public function product () {
        return $this->belongsTo(Product::class);
    }

    public function product_variation () {
        return $this->belongsTo(ProductVariation::class);
    }
}
