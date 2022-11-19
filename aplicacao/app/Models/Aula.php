<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use App\Presenters\TimestampsPresenter;
use Illuminate\Database\Eloquent\SoftDeletes;

class Aula extends Model
{
	use TimestampsPresenter;
	use SoftDeletes;

	/**
	 * Tabela usada pelo Model.
	 *
	 * @var string
	 */
	protected $table = 'aulas';

	/**
	 * Os atributos que são permitidos na inserção em massa.
	 *
	 * @var array
	 */
	protected $fillable = ['id', 'role_id', 'user_id', 'course_id', 'data_aula'];

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
	public function Frequencias()
	{
		return $this->hasMany('App\Models\Frequencia', 'aula_id');
	}

    public function role()
    {
        return $this->belongsTo('App\Models\Role', 'role_id');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function course()
    {
        return $this->belongsTo('App\Models\Course', 'course_id');
    }

    public function c()
    {
        return $this->hasMany('App\Models\X', 'foreign_key');
    }

    public function d()
    {
        return $this->belongsToMany('App\Role');
    }

	public function getDataAulaAttribute($data_aula)
	{
		if ($data_aula == '0000-00-00' or empty($data_aula))
			return '';
		return Carbon::parse($data_aula)->format('d/m/Y');
	}

	public function setDataAulaAttribute($data_aula)
	{
		if (empty($data_aula))
			$this->attributes['data_aula'] = null;
		else {
			$dia = substr($data_aula, 0, 2);
			$mes = substr($data_aula, 3, 2);
			$ano = substr($data_aula, 6, 4);

			$this->attributes['data_aula'] = Carbon::createFromDate($ano, $mes, $dia);
		}
	}
}
