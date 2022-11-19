<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

namespace App\Http\Requests;


class AlunoRequestUpdate extends AlunoRequest
{
	/**
	 * Retorna as regras de validação que se aplicam a solicitação padrão.
	 *
	 * @return array
	 */
	public function rules()
	{
		$id = Request::segment(3) ? ',' . Request::segment(3) : '';
		$rules = [
			'username' => $this->regras['username'] . $id,
			'firstname' => $this->regras['firstname'],
			'lastname' => $this->regras['lastname'],
			'email' => $this->regras['email'] . $id,
		];
		//dd($rules);
		return $rules;
	}
}