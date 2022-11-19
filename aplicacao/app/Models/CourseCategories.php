<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CourseCategories extends Model
{
    protected $table = "mdl_course_categories";
    protected $visible = ['id','name','description','courses'];

    public function courses() {
        return $this->hasMany('App\Models\Course','category','id')
            ->select(['id','category', 'shortname', 'fullname'])
            ;
//            ->with('turmas');
    }
}
