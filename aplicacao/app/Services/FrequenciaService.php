<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:16:44
 */

namespace App\Services;

//use App\ImagemUpload;
use Illuminate\Http\Request;
use App\Http\Requests\FrequenciaRequest;
use App\Repositories\FrequenciaRepository;
//use App\Traits\ImagemUploadTraitService;

class FrequenciaService
{
    //use ImagemUploadTraitService;
    /**
     * Instância de FrequenciaRepository
     * @var FrequenciaRepository
     */
    protected $frequenciaRepository;

    /**
     * Criar uma nova nova instância de FrequenciaService
     * @param FrequenciaRepository $frequenciaRepository
     */
    public function __construct(FrequenciaRepository $frequenciaRepository)
    {
        $this->frequenciaRepository = $frequenciaRepository;
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

        if ($request->query('termo'))
            $parametros['termo'] = trim($request->get('termo'));

        if ($request->query('sort'))
            $parametros['sort'] = $request->get('sort');

        //if ($request->query('frequencia'))
        //    $parametros['frequencia'] = $request->get('frequencia');

        return $this->frequenciaRepository->index(20, $parametros, $ordenacao);
    }

    /**
     * Retornar um registro
     * @param int $id
     * @return \App\Models\Frequencia
     */
    public function find($id)
    {
        return $this->frequenciaRepository->find($id);
    }
    
    /**
     * Armazenar o novo registro no repositório de dados.
     * @param FrequenciaRequest $frequenciaRequest
     * @return \App\Models\Frequencia
     */
    public function store(FrequenciaRequest $frequenciaRequest)
    {
        $dados = $frequenciaRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($frequenciaRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($frequenciaRequest['imagem'])
                ->caminho('frequencias')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->frequenciaRepository->store($dados);
    }

    /**
     * Atualizar o registro especificado.
     * @param FrequenciaRequest $frequenciaRequest
     * @param int $id
     * @return \App\Models\Frequencia
     */
    public function update(
        FrequenciaRequest $frequenciaRequest,
        $id)
    {
        $dados = $frequenciaRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($frequenciaRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($frequenciaRequest['imagem'])
                ->caminho('frequencias')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->frequenciaRepository->update($dados, $id);
    }

    /**
     * Exibir um formulário de confirmação de exclusão de um registro específico.
     * @param int $id
     * @return array
     */
    public function confirmDestroy($id)
    {
        $verificacao = [];
        $frequencia = $this->frequenciaRepository->find($id);

        $frequenciaTemRegistros = $this->frequenciaRepository->frequenciaTemRegistros($frequencia);

        if ($frequenciaTemRegistros->count()) {
            $verificacao['frequencia'] = ['mensagem' => 'Existem registros relacionados a esse ítem!', 'registros' => $frequenciaTemRegistros];
        }

        return ['item' => $frequencia, 'verificacao' => $verificacao];
    }

    /**
     * Excluir um registro.
     * @param int $id
     * @return string
     * @throws \Exception
     */
    public function destroy($id)
    {
        $response = $this->confirmDestroy($id);
        $item = $response['item'];
        $verificacao = $response['verificacao'];

        if (count($verificacao) == 0) {
            if ($this->frequenciaRepository->destroy($item))
                $mensagem = 'Registro "' . $item->id . '" removido com sucesso';
            else $mensagem = 'Ocorreu um erro ao remover esse registro "' . $item->id . '", tente novamente';
        } else {
            $mensagem = 'Esse ítem possui registros relacionados!';
        }
        return $mensagem;
    }

    /**
     * Recuperar uma coleção de Frequencia para o listBox
     * @return array
     */
    public function listBox()
    {
        $list[''] = '';

        foreach ($this->frequenciaRepository->listBox() as $item) {
            $list[$item->id] = $item->id;
        }

        return $list;
    }

    ## REMOVER SE NÃO USAR ##
    /**
     * Remover fisicamente uma imagem
     * @param int $id
     * @param int $ordemImagem
     * @return bool
     */
    public function imageDestroy($id, $ordemImagem)
    {
        $frequencia = $this->frequenciaRepository->find($id);

        $campoRemover = 'imagem' . $ordemImagem;
        $imagem = $frequencia->$campoRemover;

        if ($imagem) {
            $pasta = config('configuracoes.upload.frequencias.caminho');
            $pastaOriginal = config('configuracoes.upload.frequencias.caminhoOriginal');

            $caminho_imagem_original = $pastaOriginal . $imagem;
            $caminho_imagem = $pasta . $imagem;

            if (\Storage::exists($caminho_imagem_original))
                \Storage::delete($caminho_imagem_original);

            if (\Storage::exists($caminho_imagem))
                \Storage::delete($caminho_imagem);

            return $this->frequenciaRepository->imageDestroy($frequencia, $campoRemover);
        }
        return false;
    }
}