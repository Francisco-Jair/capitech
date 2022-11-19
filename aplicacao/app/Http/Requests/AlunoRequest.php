<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

namespace App\Http\Requests;

class AlunoRequest extends Request
{

	/**
	 * Regras de validação que se aplicam a solicitação padrão.
	 *
	 * @var array
	 */
	protected $regras = [
		'username' => 'required|digits:11|unique:mdl_user,username',
		'password' => 'required|min:4|max:20',
		'firstname' => 'required|min:3|max:50',
		'lastname' => 'required|min:2|max:50',
		'email' => 'required|email|unique:mdl_user,email',
	];

	/**
	 * Retorna as regras de validação que se aplicam a solicitação padrão.
	 *
	 * @return array
	 */
	public function rules()
	{
		$id = Request::segment(3) ? ',' . Request::segment(3) : '';
		$rules = [
			'username' => $this->regras['username'],
			'password' => $this->regras['password'],
			'firstname' => $this->regras['firstname'],
			'lastname' => $this->regras['lastname'],
			'email' => $this->regras['email'],
		];

		return $rules;
	}

	/**
	 * Determine se o usuário está autorizado a fazer este pedido.
	 * @return bool
	 */
	public function authorize()
	{
		return true;
	}
}