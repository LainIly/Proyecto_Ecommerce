<?php

namespace App\Models\Cupone;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class Cupone extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        "code",
        "type_discount",
        "discount",
        "type_count",
        "num_use",
        "type_cupone",
        "state",
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Colombia');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Colombia');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function categories(){
        return $this->hasMany(CuponeCategorie::class);
    }

    public function products(){
        return $this->hasMany(CuponeProduct::class);
    }

    public function brands(){
        return $this->hasMany(CuponeBrand::class);
    }
}
