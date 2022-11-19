<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

namespace App\Services;

use App\Classes\EnrolUser;
use App\Classes\RegisterUser;
use App\Http\Requests\AlunoRequestUpdate;
use App\Models\Frequencia;
use Illuminate\Http\Request;
use App\Http\Requests\AlunoRequest;
use App\Repositories\AlunoRepository;

require_once(base_path('CsvServidores.php'));
require_once(base_path('AlunosLotacoes.php'));

class AlunoService
{
	/**
	 * Instância de AlunoRepository
	 * @var AlunoRepository
	 */
	protected $alunoRepository;

	/**
	 * Criar uma nova nova instância de AlunoService
	 * @param AlunoRepository $alunoRepository
	 */
	public function __construct(AlunoRepository $alunoRepository)
	{
		$this->alunoRepository = $alunoRepository;
	}

	/**
	 * Exibir uma lista de registros
	 * @param Request $request
	 * @param array $ordenacao
	 * @return array
	 */
	public function index(Request $request, $ordenacao)
	{
		$parametros = [];
		if ($request->query('id'))
			$parametros['id'] = (int)$request->get('id');

		if ($request->query('role_id'))
			$parametros['role_id'] = (int)$request->get('role_id');

		if ($request->query('termo'))
			$parametros['termo'] = trim($request->get('termo'));

		if ($request->query('sort'))
			$parametros['sort'] = $request->get('sort');

		return $this->alunoRepository->index(20, $parametros, $ordenacao);
	}

	/**
	 * Retornar um registro
	 * @param int $id
	 * @return \App\Models\Aluno
	 */
	public function find($id)
	{
		return $this->alunoRepository->find($id);
	}

	/**
	 * Armazenar o novo registro no repositório de dados.
	 * @param AlunoRequest $alunoRequest
	 * @return \App\Models\Aluno
	 */
	public function store(AlunoRequest $alunoRequest)
	{
		$dados = $alunoRequest->all();
		unset($dados['_token']);
		$dados['username'] = str_replace('.', '', $dados['username']);
		$dados['username'] = str_replace('-', '', $dados['username']);

		$dadosClone = $dados;
		unset($dados['phone1']);
		unset($dados['phone2']);
		unset($dados['role_id']);
		unset($dados['institution']);

		$retorno = null;
		try {
			$user = new RegisterUser();
			if ($retorno = $user->createNewUser($dados)) {
				/*
				 * {
				 *		"exception": "invalid_parameter_exception",
				 *		"errorcode": "invalidparameter",
				 *		"message": "Valor inv\u00e1lido de par\u00e2metro detectado",
				 *		"debuginfo": "users => Valor inv\u00e1lido de par\u00e2metro detectado: Unexpected keys (phone1, phone2) detected in parameter array."
					}
				 * */
				if ($user->user) {
					$aluno = $this->alunoRepository->update(
						['phone1' => $dadosClone['phone1'], 'phone2' => $dadosClone['phone2'], 'institution' => $dadosClone['institution']],
						$user->user
					);
				}

				if (!empty($dadosClone['role_id'])) {

					$userEnrol = new EnrolUser();
					//Frequencia::where('user_id', '=', $id)->delete();
					if ($userEnrol->unenrolUsers($user->user)) {
						$userEnrol->enrol($dadosClone['role_id'], $user->user);
					}
				}
				else{
					$user->getTurmaOfNewUser();
					$user->enrolOnTurma();
				}
			}
		} catch (\Exception $e) {

		}

		return $retorno;
	}

	public function importar()
	{
		/*echo \Config::get('database.default');
		echo \DB::connection()->getConfig('database');
		echo \DB::connection()->getConfig('host');
		echo \DB::connection()->getConfig('username');
		echo \DB::connection()->getConfig('password');
		dd();*/
		$servidores = listaServidores();

		$contador = 1;
		echo '<pre>';
		foreach ($servidores as $servidor) {

			echo $contador . ' - ';
			print_r($servidor);
			echo '<hr />';
			$contador++;

			$user = new RegisterUser();

			$phone1 = $servidor['phone1'];
			$phone2 = $servidor['phone2'];
			unset($servidor['phone1']);
			unset($servidor['phone2']);

			$servidor['username'] = str_replace('.', '', $servidor['username']);
			$servidor['username'] = str_replace('-', '', $servidor['username']);
			$servidor['email'] = strtolower($servidor['email']);

			try {
				if ($retorno = $user->createNewUser($servidor)) {

					if ($user->user) {
						$aluno = $this->alunoRepository->update(
							array('phone1' => $phone1, 'phone2' => $phone2),
							$user->user
						);
					}

					$user->getTurmaOfNewUser();
					$user->enrolOnTurma();
				} else {
					\Log::error(
						json_encode(
							[
								'user_id' => \Auth::gestor()->user()->id,
								'user_name' => \Auth::gestor()->user()->name,
								'type' => 'createNewUser',
								'request' => $servidor,
								'error' => $retorno,
							]
						)
					);
				}
			} catch (\Exception $e) {
				dd($retorno);
			}
		}
	}

	/**
	 * Atualizar o registro especificado.
	 * @param AlunoRequestUpdate $alunoRequest
	 * @param int $id
	 * @return \App\Models\Aluno
	 */
	public function update(
		AlunoRequestUpdate $alunoRequest,
		$id)
	{
		$dados = $alunoRequest->all();
		unset($dados['_token']);

		$dados['username'] = str_replace('.', '', $dados['username']);
		$dados['username'] = str_replace('-', '', $dados['username']);

		try {
			if (!empty($dados['role_id'])) {

				$user = new EnrolUser();
				Frequencia::where('user_id', '=', $id)->delete();
				if ($user->unenrolUsers($id)) {
					$user->enrol($dados['role_id'], $id);
				}
			}
		} catch (\Exception $e) {
			dd($e);
		}

		return $this->alunoRepository->update($dados, $id);
	}

	/**
	 * Exibir um formulário de confirmação de exclusão de um registro específico.
	 * @param int $id
	 * @return array
	 */
	public function confirmDestroy($id)
	{
		$verificacao = [];
		$aluno = $this->alunoRepository->find($id);

		$alunoTemRegistros = $this->alunoRepository->alunoTemRegistros($aluno);

		if ($alunoTemRegistros->count()) {
			$verificacao['aluno'] = ['mensagem' => 'Existem registros relacionados a esse ítem!', 'registros' => $alunoTemRegistros];
		}

		return ['item' => $aluno, 'verificacao' => $verificacao];
	}

	/**
	 * Excluir um registro.
	 * @param int $id
	 * @return string
	 * @throws \Exception
	 */
	public function destroy($id)
	{
		$user = new RegisterUser();

		if ($user->deleteUser($id)) {
			return 'Removido com sucesso';
		}
		return null;
	}

	/**
	 * Recuperar uma coleção de Aluno para o listBox
	 * @return array
	 */
	public function listBox()
	{
		$list[''] = '';

		foreach ($this->alunoRepository->listBox() as $item) {
			$list[$item->id] = $item->firstname . ' ' . $item->lastname;
		}

		return $list;
	}

	/**
	 * Remove as matrículas de um aluno
	 * @param int $id
	 * @return \App\Models\Aluno
	 */
	public function unenrolUsers($id)
	{
		$enrol = new EnrolUser();
		$enrol->unenrolUsers($id);
	}

	public function atualizarInstituicao()
	{
		$alunos = listaAlunosAtualizar();
		foreach ($alunos as $aluno) {
			$dados = array(
				'institution' => utf8_encode($aluno->lotacao)
			);
			$update = $this->alunoRepository->update($dados, $aluno->aluno_id);
		}
	}

	public function retornaTurmasDoAluno($id)
	{
		return $this->alunoRepository->retornaTurmasDoAluno($id);
	}

	public function atualizarInstituicaoCsv()
	{
		$alunos = listaServidoresInstituicao();
		foreach ($alunos as $aluno) {
			$dados = array(
				'institution' => utf8_encode($aluno['instituicao'])
			);
			$update = $this->alunoRepository->update($dados, $aluno['id']);
		}
	}
}