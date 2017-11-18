<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Geo extends Model
{
    protected $table = 'geo';

    public function photos() {
        return $this->belongsTo(__NAMESPACE__ . "\\Photo", "geo_id");
    }
}
