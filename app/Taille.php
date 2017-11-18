<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Taille extends Model
{
    protected $table = 'taille';

    public function photos() {
        return $this->belongsToMany(__NAMESPACE__ . "\\Photo", "tailles");
    }
}
