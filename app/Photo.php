<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{
    protected $table = 'photo';

    public function cindocs() {
        return $this->hasMany(__NAMESPACE__ . "\\Cindoc", "photo_id");
    }

    public function date()
    {
        return $this->hasOne(__NAMESPACE__ . "\\Date", 'id');
    }

    public function geo() {
        return $this->hasOne(__NAMESPACE__ . "\\Geo", "id");
    }

    public function description() {
        return $this->hasOne(__NAMESPACE__ . "\\Description", "id");
    }

    public function tailles() {
        return $this->belongsToMany(__NAMESPACE__ . "\\Taille", "tailles");
    }
}
