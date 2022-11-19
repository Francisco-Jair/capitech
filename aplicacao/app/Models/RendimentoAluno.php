<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 19-12-2016
 * Time: 09:40:36
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\TimestampsPresenter;
use Illuminate\Database\Eloquent\SoftDeletes;

class RendimentoAluno extends Model
{
    use TimestampsPresenter;
    use SoftDeletes;

    /**
     * Tabela usada pelo Model.
     *
     * @var string
     */
    protected $table = 'rendimento_aluno';

    /**
     * Os atributos que são permitidos na inserção em massa.
     *
     * @var array
     */
    protected $fillable = ['id', 'rendimento', 'role_id', 'user_id', 'course_id'];

    /**
     * Os atributos excluídos da inserção em massa.
     *
     * @var array
     */
    protected $hidden = [];


    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at'];




    # Relações desse model
    public function a()
    {
        return $this->hasOne('App\Models\X', 'foreign_key');
    }

    public function b()
    {
        return $this->belongsTo('App\Models\X', 'foreign_key');
    }

    public function c()
    {
        return $this->hasMany('App\Models\X', 'foreign_key');
    }

    public function d()
    {
        return $this->belongsToMany('App\Role');
    }
}
