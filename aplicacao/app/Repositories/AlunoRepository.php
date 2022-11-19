<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

namespace App\Repositories;

use App\Models\Aluno;
use App\Models\Matricula;
use App\Models\User;

class AlunoRepository
{

	/**
	 * Criar uma nova instância de AlunoRepository.
	 * @param Aluno $aluno
	 */
	public function __construct(Aluno $aluno)
	{
		$this->model = $aluno;
	}


	/**
	 * Recuperar uma Coleção paginada de Aluno
	 * @param int $registros
	 * @param array $parametros
	 * @param array $ordenacao
	 * @return Illuminate\Database\Eloquent\Collection
	 */

	public function index($registros, $parametros = [], $ordenacao = [])
	{
		if (!isset($ordenacao['sort']))
			$ordenacao['sort'] = 'id';

		if (!isset($ordenacao['order']))
			$ordenacao['order'] = 'DESC';

		$query = $this->model->orderBy($ordenacao['sort'], $ordenacao['order']);

		if (isset($parametros['id'])) {
			$id = (int)$parametros['id'];

			if ($id > 0) {
				$query = $query->where(function ($q2) use ($id) {
					$q2->whereRaw('id = ?', array($id));
				});
			}
		}

		if (isset($parametros['role_id'])) {
			$role_id = (int)$parametros['role_id'];

			if ($role_id > 0) {
				$query = $query->where(function ($q2) use ($role_id) {
					$q2->whereRaw('role_id = ?', array($role_id));
				});
			}
		}

		if (isset($parametros['termo'])) {
			$termo = strtolower(trim($parametros['termo']));

			$query = $query->where(function ($q2) use ($termo) {
				$q2->whereRaw('
                    (LOWER(firstname) LIKE ? or LOWER(nome) LIKE ? or LOWER(lastname) LIKE ? or LOWER(email) LIKE ? or LOWER(username) LIKE ?)',
					["%{$termo}%", "%{$termo}%", "%{$termo}%", "%{$termo}%", "%{$termo}%"]
				);
			});
		}

		return $query->paginate($registros);
	}


	/**
	 * Recuperar uma Coleção paginada de Aluno
	 * @param int $registros
	 * @param array $parametros
	 * @param array $ordenacao
	 * @return Illuminate\Database\Eloquent\Collection
	 */

	//fazer logica com alunos aprovados

	public function retornaAlunosAprovados($registros, $parametros = [], $ordenacao = [])
	{
		if (!isset($ordenacao['sort']))
			$ordenacao['sort'] = 'id';

		if (!isset($ordenacao['order']))
			$ordenacao['order'] = 'DESC';

		$query = $this->model->orderBy($ordenacao['sort'], $ordenacao['order']);

		if (isset($parametros['id'])) {
			$id = (int)$parametros['id'];

			if ($id > 0) {
				$query = $query->where(function ($q2) use ($id) {
					$q2->whereRaw('id = ?', array($id));
				});
			}

		}

		if (isset($parametros['termo'])) {
			$termo = strtolower(trim($parametros['termo']));

			$query = $query->where(function ($q2) use ($termo) {
				$q2->whereRaw('
                    (LOWER(firstname) LIKE ? or LOWER(lastname) LIKE ? or LOWER(email) LIKE ? or LOWER(username) LIKE ?)',
					["%{$termo}%", "%{$termo}%", "%{$termo}%", "%{$termo}%"]
				);
			});
		}

		return $query->paginate($registros);
	}

	/**
	 * Recuperar um ítem do Model Aluno
	 * @param  int $id
	 * @return Aluno $aluno
	 */
	public function find($id)
	{
		return $item = $this->model->findOrFail($id);
	}

	/**
	 * Criar Aluno
	 * @param array $dados
	 * @return Aluno $aluno
	 * @throws \Exception
	 */
	public function store(array $dados)
	{
		$aluno = new $this->model;
		return $this->saveAluno($aluno, $dados);
	}

	/**
	 * Atualizar Aluno.
	 *
	 * @param array $dados
	 * @param  int $id
	 * @return Aluno $aluno
	 * @throws \Exception
	 */
	public function update(array $dados, $id)
	{
		$userModel = new User();
		$aluno = $userModel->findOrFail($id);
		return $this->saveUser($aluno, $dados);
	}

	/**
	 * Salvar Aluno.
	 * @param Aluno $aluno
	 * @param array $dados
	 * @return Aluno
	 * @throws \Exception
	 */
	private function saveAluno(Aluno $aluno, array $dados)
	{
		\DB::beginTransaction();
		try {
			if (isset($dados['username']))
				$aluno->username = trim($dados['username']);
			if (isset($dados['password']))
				$aluno->password = trim($dados['password']);
			if (isset($dados['firstname']))
				$aluno->firstname = trim($dados['firstname']);
			if (isset($dados['lastname']))
				$aluno->lastname = trim($dados['lastname']);
			if (isset($dados['email']))
				$aluno->email = trim($dados['email']);

			$aluno->save();

		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}
		\DB::commit();

		return $aluno;
	}

	private function saveUser(User $aluno, array $dados)
	{

		\DB::beginTransaction();
		try {
			if (isset($dados['username']))
				$aluno->username = trim($dados['username']);
			if (isset($dados['password']) && !empty($dados['password']))
				$aluno->password = bcrypt(trim($dados['password']));
			if (isset($dados['firstname']))
				$aluno->firstname = trim($dados['firstname']);
			if (isset($dados['lastname']))
				$aluno->lastname = trim($dados['lastname']);
			if (isset($dados['email']))
				$aluno->email = trim(strtolower($dados['email']));
			if (isset($dados['phone1']))
				$aluno->phone1 = trim($dados['phone1']);
			if (isset($dados['phone2']))
				$aluno->phone2 = trim($dados['phone2']);
			if (isset($dados['institution']))
				$aluno->institution = trim($dados['institution']);

			$aluno->save();


		} catch (\Exception $e) {
			\DB::rollback();
			dd($e);
			throw new \Exception($e);
		}
		\DB::commit();

		return $aluno;
	}


	/**
	 * Verifica se o model tem dependência de algum outro model
	 * @param Aluno $aluno
	 * @return bool
	 */

	public function alunoTemRegistros(Aluno $aluno)
	{
		return $aluno->where('id', 0);
	}

	/**
	 * Excluir um registro.
	 * @param Aluno $aluno
	 * @return bool
	 * @throws \Exception
	 */
	public function destroy(Aluno $aluno)
	{
		\DB::beginTransaction();
		try {
			$aluno->delete();
		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}
		\DB::commit();

		return true;
	}

	/**
	 * Recuperar um array de Aluno para o listBox
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function listBox()
	{
		return $this->model
			->select('id', 'firstname', 'lastname')
			->orderBy('firstname', 'asc')
			->orderBy('lastname', 'asc')
			->get();
	}

	public function retornaTurmasDoAluno($id)
	{
		return Matricula::select('role_id', 'role_name')
			->where('user_id', $id)
			->where('role_id', '<>', 21)
			->distinct()
			->get();
	}

}