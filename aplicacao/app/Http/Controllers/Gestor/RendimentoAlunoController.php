<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 19-12-2016
 * Time: 09:40:36
 */

namespace App\Http\Controllers\Gestor;

use App\Models\Matricula;
use App\Models\RendimentoAluno;
use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\RendimentoAlunoRequest;
use App\Services\RendimentoAlunoService;

class RendimentoAlunoController extends BaseController
{
    use LogAtividades;
    /**
     * Instância de RendimentoAlunoService
     *
     * @var RendimentoAlunoService
     */
    protected $rendimentoalunoService;

    /**
     * Criar uma nova nova instância de RendimentoAlunoController
     * @param RendimentoAlunoService $rendimentoalunoService
     */
    public function __construct(RendimentoAlunoService $rendimentoalunoService)
    {
        $this->log('acessou',__CLASS__,'');
        $this->rendimentoalunoService = $rendimentoalunoService;
        $this->service = 'rendimentoalunoService';
        $this->pastaView = 'rendimento_aluno';
    }


    /**
     * Exibir uma lista paginada de registros.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $camposPermitidosParaOrdenacao = ['id', 'created_at', 'updated_at'];
        $ordenacao['sort'] = 'id';
        $ordenacao['order'] = 'DESC';

        if ($request->query('sort') and in_array($request->query('sort'), $camposPermitidosParaOrdenacao)) {
            $ordenacao['sort'] = $request->query('sort');
        }

        if ($request->query('order')) {
            $ordenacao['order'] = ($request->query('order') == 'ASC' ? 'ASC' : 'DESC');
        }

        $ordenacao['reverseOrder'] = ($ordenacao['order'] == 'ASC' ? 'DESC' : 'ASC');

        $dados = $this->rendimentoalunoService->index($request, $ordenacao);
        $dados->setPath('./rendimento_aluno');
        return view('gestor.' . $this->pastaView . '.index', compact('dados', 'ordenacao'));
    }

    /**
     * Exibir um registro específico.
     *
     * @param int $id
     * @return Response
     */
    public function show($id)
    {

        $user_id = \Session::get('_mdl_user_id_');

        if(empty($user_id)){
            echo 'sem permissão';exit;
        }

        $matricula_do_professor = Matricula::where('user_id', $user_id)->first();
        $matricula_dos_alunos = Matricula::where('course_id', '=', $matricula_do_professor['course_id'])
            ->where('role_id', '=', $id)
            ->orderBy('firstname')
            ->orderBy('lastname')
            ->get();

        $rendimento_dos_alunos = $this->rendimentoalunoService->frequenciasPorAluno($matricula_do_professor['course_id'], $id);

        return view('gestor.'.$this->pastaView.'.form', compact('matricula_do_professor','matricula_dos_alunos', 'rendimento_dos_alunos'));
    }

    /**
     * Exibir o formulário para criar um novo registro.
     *
     * @return Response
     */
    public function create()
    {
        //$options_rendimento_aluno_id = $this->rendimentoalunoService->listBox();
        return view('gestor.'.$this->pastaView.'.form');
    }

    /**
     * Armazenar o novo registro.
     *
     * @param RendimentoAlunoRequest $rendimentoalunoRequest
     * @return Response
     */
    public function store(RendimentoAlunoRequest $rendimentoalunoRequest)
    {

        $this->rendimentoalunoService->store($rendimentoalunoRequest);
        return redirect()->route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', 'Salvo com sucesso')
            ->with('tipo_mensagem', 'success');
    }

    /**
     * Exibir um formulário de edição de um registro específico.
     *
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        //$options_rendimento_aluno_id = $this->rendimentoalunoService->listBox();
        $item = $this->rendimentoalunoService->find($id);
        return view('gestor.'.$this->pastaView.'.form', compact('item'));
    }

    /**
     * Atualizar um registro específico.
     *
     * @param RendimentoAlunoRequest $rendimentoalunoRequest
     * @param int $id
     * @return Response
     */
    public function update(
        RendimentoAlunoRequest $rendimentoalunoRequest,
        $id)
    {
        $this->rendimentoalunoService->update($rendimentoalunoRequest, $id);
        return redirect()->route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', 'Atualizado com sucesso')
            ->with('tipo_mensagem', 'success');
    }
}
