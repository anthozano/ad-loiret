<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Iconographies extends Model
{
    protected $table = 'iconographies';

    public function photo() {
        return $this->belongsTo(__NAMESPACE__ . '\Photo');
    }
}
