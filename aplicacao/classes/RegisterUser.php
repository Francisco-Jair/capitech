<?php


namespace App\Classes;


use App\Models\Aluno;
use App\Models\Configuracao;
use App\Models\Frequencia;
use App\Models\Role;

class RegisterUser extends APIConfig
{

	public $function = 'core_user_create_users';
	public $user = 0;
	public $turma = null;

	public function createNewUser($dados)
	{

		$response = $this->client->request('POST', $this->uri, [
			'form_params' => [
				'users' => [
					0 => array_merge([
						'auth' => 'manual',
						'lang' => 'pt_br',
						'calendartype' => 'gregorian'], $dados)

				]
			]
		]);

		$retorno = json_decode($response->getBody());
		if (!isset($retorno->exception)) {

			\Log::debug(
				json_encode(
					[
						'user_id' => \Auth::gestor()->user()->id,
						'user_name' => \Auth::gestor()->user()->name,
						'type' => 'createNewUser',
						'request' => $dados
					]
				)
			);

			$this->user = $retorno[0]->id;
		} else {
			/*
			 	  +"exception": "invalid_parameter_exception"
				  +"errorcode": "invalidparameter"
				  +"message": "Valor inválido de parâmetro detectado"
				  +"debuginfo": "Username already exists: 222.222.222-22"
			 * */
			//abort(500, json_encode($user));
			\Log::error(
				json_encode(
					[
						'user_id' => \Auth::gestor()->user()->id,
						'user_name' => \Auth::gestor()->user()->name,
						'type' => 'createNewUser',
						'request' => $dados,
						'error' => $retorno,
					]
				)
			);
		}
		return $retorno;
	}

	public function deleteUser($id)
	{
		\DB::beginTransaction();

		try {

			$this->function = 'core_user_delete_users';
			$this->setUri();

			$response = $this->client->request('POST', $this->uri, [
				'form_params' => [
					'userids' => [
						0 => $id
					]
				]
			]);

			$user = json_decode($response->getBody());
			//dd($user);
			if (!isset($user->exception)) {
				//$this->user = $user[0]->id;
			} else {
				abort(500, json_encode($user));
			}

			Frequencia::where('user_id', '=', $id)->delete();
			Aluno::destroy($id);


		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}

		\DB::commit();
		return true;

	}

	public function getTurmaOfNewUser()
	{
		if ($this->user == 0) {
			$this->user = 10;
		}

		$turma = Role::select(\DB::raw('mdl_role.id as role_id, COUNT(matriculas.role_id) as total'))
			->leftJoin('matriculas', 'matriculas.role_id', '=', 'mdl_role.id')
			->where('mdl_role.archetype', '=', 'student')
			->where('mdl_role.id', '>', 8)
			->groupBy('mdl_role.id')
			->orderBy('total', 'asc')
			->orderBy('id', 'asc')
			->first();

		$this->turma = $turma->role_id;
	}

	public function enrolOnTurma()
	{
		$enrol = new EnrolUser();
		$enrol->enrol($this->turma, $this->user);
	}

}