<?php

namespace App\Models\Discount;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;
use App\Models\Product\Categorie;

class DiscountCategorie extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'discount_id',
        'categorie_id',
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Colombia');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Colombia');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function categorie () {
        return $this->belongsTo(Categorie::class);
    }

    public function discount () {
        return $this->belongsTo(Discount::class);
    }
}
