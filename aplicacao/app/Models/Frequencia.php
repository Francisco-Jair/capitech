<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:16:43
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\TimestampsPresenter;
use Illuminate\Database\Eloquent\SoftDeletes;

class Frequencia extends Model
{
    use TimestampsPresenter;
    use SoftDeletes;

    /**
     * Tabela usada pelo Model.
     *
     * @var string
     */
    protected $table = 'frequencias';

    /**
     * Os atributos que são permitidos na inserção em massa.
     *
     * @var array
     */
    protected $fillable = ['id', 'aula_id', 'user_id', 'presente'];

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
    public function aula()
    {
        return $this->belongsTo('App\Models\Aula', 'aula_id');
    }

    public function usuario()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
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
