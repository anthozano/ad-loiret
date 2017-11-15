<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Date extends Model
{
    public function photo() {
        return $this->belongsTo(__NAMESPACE__ . '\Photo');
    }
}
