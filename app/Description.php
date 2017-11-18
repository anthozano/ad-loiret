<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Description extends Model
{
    protected $table = 'description';

    public function photos() {
        return $this->belongsTo(__NAMESPACE__ . "\\Photo", "description_id");
    }
}
