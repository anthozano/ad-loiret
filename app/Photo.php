<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{
    protected $table = 'photo';

    public function cindocs() {
        return $this->hasMany(__NAMESPACE__ . '\Cindoc', 'photo_id');
    }

    public function date() {
        return $this->hasOne(__NAMESPACE__ . '\Date', 'id_date');
    }
}
