<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:16:43
 */

namespace App\Http\Controllers\Gestor;

use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\FrequenciaRequest;
use App\Services\FrequenciaService;

class FrequenciaController extends BaseController
{
    use LogAtividades;
    /**
     * Instância de FrequenciaService
     *
     * @var FrequenciaService
     */
    protected $frequenciaService;

    /**
     * Criar uma nova nova instância de FrequenciaController
     * @param FrequenciaService $frequenciaService
     */
    public function __construct(FrequenciaService $frequenciaService)
    {
        $this->log('acessou',__CLASS__,'');
        $this->frequenciaService = $frequenciaService;
        $this->service = 'frequenciaService';
        $this->pastaView = 'frequencias';
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

        $dados = $this->frequenciaService->index($request, $ordenacao);
        $dados->setPath('./frequencias');
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
        $item = $this->frequenciaService->find($id);
        return view('gestor.'.$this->pastaView.'.form', compact('item'));
    }

    /**
     * Exibir o formulário para criar um novo registro.
     *
     * @return Response
     */
    public function create()
    {
        //$options_frequencias_id = $this->frequenciaService->listBox();
        return view('gestor.'.$this->pastaView.'.form');
    }

    /**
     * Armazenar o novo registro.
     *
     * @param FrequenciaRequest $frequenciaRequest
     * @return Response
     */
    public function store(FrequenciaRequest $frequenciaRequest)
    {
        $this->frequenciaService->store($frequenciaRequest);
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
        //$options_frequencias_id = $this->frequenciaService->listBox();
        $item = $this->frequenciaService->find($id);
        return view('gestor.'.$this->pastaView.'.form', compact('item'));
    }

    /**
     * Atualizar um registro específico.
     *
     * @param FrequenciaRequest $frequenciaRequest
     * @param int $id
     * @return Response
     */
    public function update(
        FrequenciaRequest $frequenciaRequest,
        $id)
    {
        $this->frequenciaService->update($frequenciaRequest, $id);
        return redirect()->route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', 'Atualizado com sucesso')
            ->with('tipo_mensagem', 'success');
    }
}
