<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Iconographie extends Model
{
    protected $table = 'iconographie';

    public function iconographies() {
        return $this->hasMany(__NAMESPACE__ . '\Iconographies');
    }
}
