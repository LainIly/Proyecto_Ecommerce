<?php

namespace App\Models\Sale;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SaleAddres extends Model
{
    use HasFactory;
    protected $fillable = [
        'sale_id',
        'name',
        'surname',
        'company',
        'country_region',
        'address',
        'street',
        'city',
        'postcode_zip',
        'phone',
        'email',
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
