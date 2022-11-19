<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

namespace App\Http\Controllers\Gestor;

use App\Models\Frequencia;
use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\AulaRequest;
use App\Services\AulaService;
use Illuminate\Support\Facades\DB;

class AulaController extends BaseController
{
	use LogAtividades;
	/**
	 * Instância de AulaService
	 *
	 * @var AulaService
	 */
	protected $aulaService;

	/**
	 * Criar uma nova nova instância de AulaController
	 * @param AulaService $aulaService
	 */
	public function __construct(AulaService $aulaService)
	{
		$this->log('acessou', __CLASS__, '');
		$this->aulaService = $aulaService;
		$this->service = 'aulaService';
		$this->pastaView = 'aulas';
	}


	/**
	 * Exibir uma lista paginada de registros.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function index(Request $request)
	{
		$camposPermitidosParaOrdenacao = ['id', 'data_aula', 'created_at', 'updated_at'];
		$ordenacao['sort'] = 'data_aula';
		$ordenacao['order'] = 'ASC';

		if ($request->query('sort') and in_array($request->query('sort'), $camposPermitidosParaOrdenacao)) {
			$ordenacao['sort'] = $request->query('sort');
		}

		if ($request->query('order')) {
			$ordenacao['order'] = ($request->query('order') == 'ASC' ? 'ASC' : 'DESC');
		}

		$ordenacao['reverseOrder'] = ($ordenacao['order'] == 'ASC' ? 'DESC' : 'ASC');

		$dados = $this->aulaService->index($request, $ordenacao);
		$dados->setPath('./aulas');

		$options_role_id = $this->aulaService->listBoxTurmas();
		$options_user_id = $this->aulaService->listBoxProfessor();
		$options_course_id = $this->aulaService->listBoxCurso();

		return view('gestor.' . $this->pastaView . '.index', compact('dados', 'ordenacao', 'options_role_id', 'options_user_id', 'options_course_id'));
	}

	/**
	 * Exibir um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function show($id)
	{
		$item = $this->aulaService->find($id);
		return view('gestor.' . $this->pastaView . '.form', compact('item'));
	}

	/**
	 * Exibir o formulário para criar um novo registro.
	 *
	 * @return Response
	 */
	public function create()
	{
		$options_role_id = $this->aulaService->listBoxTurmas();
		$options_user_id = $this->aulaService->listBoxProfessor();
		$options_course_id = $this->aulaService->listBoxCurso();

		return view('gestor.' . $this->pastaView . '.form', compact('options_role_id', 'options_user_id', 'options_course_id'));
	}

	/**
	 * Armazenar o novo registro.
	 *
	 * @param AulaRequest $aulaRequest
	 * @return Response
	 */
	public function store(AulaRequest $aulaRequest)
	{
		$retorno = $this->aulaService->store($aulaRequest);
		$msg = json_decode($retorno);

		if (isset($msg->debuginfo)) {
			return redirect()->route('gestor.' . $this->pastaView . '.create')
				->withInput()
				->with('mensagem', $msg->debuginfo)
				->with('tipo_mensagem', 'warning');

		} else {
			return redirect()->route('gestor.' . $this->pastaView . '.index')
				->with('mensagem', 'Salvo com sucesso')
				->with('tipo_mensagem', 'success');
		}
	}

	/**
	 * Exibir um formulário de edição de um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function edit($id)
	{
		$options_role_id = $this->aulaService->listBoxTurmas();
		$options_user_id = $this->aulaService->listBoxProfessor();
		$options_course_id = $this->aulaService->listBoxCurso();

		$item = $this->aulaService->find($id);
		return view('gestor.' . $this->pastaView . '.form', compact('item', 'options_role_id', 'options_user_id', 'options_course_id'));
	}

	/**
	 * Atualizar um registro específico.
	 *
	 * @param AulaRequest $aulaRequest
	 * @param int $id
	 * @return Response
	 */
	public function update(
		AulaRequest $aulaRequest,
		$id)
	{
		$this->aulaService->update($aulaRequest, $id);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Atualizado com sucesso')
			->with('tipo_mensagem', 'success');
	}

	public function frequencia($id)
	{
		$alunos = DB::table('aulas')
			->select('matriculas.user_id as aluno_id', 'matriculas.firstname', 'matriculas.lastname')
			->join('matriculas', function ($join) {
				$join->on('aulas.course_id', '=', 'matriculas.course_id')
					->on('aulas.role_id', '=', 'matriculas.role_id');
			})
			->where('matriculas.archetype', '=', 'student')
			->where('aulas.id', '=', $id)
			->orderBy('matriculas.firstname', 'asc')
			->whereNull('aulas.deleted_at')
            ->orderBy('matriculas.lastname', 'asc')
			->get();

		return view('gestor.' . $this->pastaView . '.frequencia', compact('alunos', 'id'));
	}

	public function storefrequencia(
		Request $request)
	{
		foreach ($request->aluno as $alunoId => $frequencia) {
			$frequenciaAluno = DB::table('frequencias')
				->where('aula_id', '=', $request->aulaId)
				->where('user_id', '=', $alunoId)
				->whereNull('frequencias.deleted_at')
				->get();

			if (!empty($frequenciaAluno)) {
				$frequenciaAluno = Frequencia::find($frequenciaAluno[0]->id);

				$frequenciaAluno->presente_m = $frequencia["M"];
				$frequenciaAluno->presente_t = $frequencia["T"];
				$frequenciaAluno->update();

			} else {
				$frequenciaAluno = new Frequencia();
				$frequenciaAluno->aula_id = $request->aulaId;
				$frequenciaAluno->user_id = $alunoId;
				$frequenciaAluno->presente_m = $frequencia["M"];
				$frequenciaAluno->presente_t = $frequencia["T"];
				$frequenciaAluno->save();
			}
		}

		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Frequência salva com sucesso')
			->with('tipo_mensagem', 'success');
	}

}
