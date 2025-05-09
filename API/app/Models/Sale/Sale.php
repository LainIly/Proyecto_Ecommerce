<?php

namespace App\Models\Sale;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;

class Sale extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'user_id',
        'method_payment',
        'currency_total',
        'currency_payment',
        'discount',
        'subtotal',
        'total',
        'price_dolar',
        'description',
        'n_transaccion'
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function sale_details () {
        return $this->hasMany(SaleDetail::class);
    }

    public function sale_addres () {
        return $this->hasOne(SaleAddres::class);
    }
}
