<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 19-12-2016
 * Time: 09:40:37
 */

namespace App\Services;

//use App\ImagemUpload;
use Illuminate\Http\Request;
use App\Http\Requests\RendimentoAlunoRequest;
use App\Repositories\RendimentoAlunoRepository;
//use App\Traits\ImagemUploadTraitService;

class RendimentoAlunoService
{
    //use ImagemUploadTraitService;
    /**
     * Instância de RendimentoAlunoRepository
     * @var RendimentoAlunoRepository
     */
    protected $rendimentoalunoRepository;

    /**
     * Criar uma nova nova instância de RendimentoAlunoService
     * @param RendimentoAlunoRepository $rendimentoalunoRepository
     */
    public function __construct(RendimentoAlunoRepository $rendimentoalunoRepository)
    {
        $this->rendimentoalunoRepository = $rendimentoalunoRepository;
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

        //if ($request->query('rendimentoaluno'))
        //    $parametros['rendimentoaluno'] = $request->get('rendimentoaluno');

        return $this->rendimentoalunoRepository->index(20, $parametros, $ordenacao);
    }

    /**
     * Retornar um registro
     * @param int $id
     * @return \App\Models\RendimentoAluno
     */
    public function find($id)
    {
        return $this->rendimentoalunoRepository->find($id);
    }
    
    /**
     * Armazenar o novo registro no repositório de dados.
     * @param RendimentoAlunoRequest $rendimentoalunoRequest
     * @return \App\Models\RendimentoAluno
     */
    public function store(RendimentoAlunoRequest $rendimentoalunoRequest)
    {
        $dados = $rendimentoalunoRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($rendimentoalunoRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($rendimentoalunoRequest['imagem'])
                ->caminho('rendimento_aluno')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->rendimentoalunoRepository->store($dados);
    }

    /**
     * Atualizar o registro especificado.
     * @param RendimentoAlunoRequest $rendimentoalunoRequest
     * @param int $id
     * @return \App\Models\RendimentoAluno
     */
    public function update(
        RendimentoAlunoRequest $rendimentoalunoRequest,
        $id)
    {
        $dados = $rendimentoalunoRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($rendimentoalunoRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($rendimentoalunoRequest['imagem'])
                ->caminho('rendimento_aluno')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->rendimentoalunoRepository->update($dados, $id);
    }

    /**
     * Exibir um formulário de confirmação de exclusão de um registro específico.
     * @param int $id
     * @return array
     */
    public function confirmDestroy($id)
    {
        $verificacao = [];
        $rendimentoaluno = $this->rendimentoalunoRepository->find($id);

        $rendimentoalunoTemRegistros = $this->rendimentoalunoRepository->rendimentoalunoTemRegistros($rendimentoaluno);

        if ($rendimentoalunoTemRegistros->count()) {
            $verificacao['rendimentoaluno'] = ['mensagem' => 'Existem registros relacionados a esse ítem!', 'registros' => $rendimentoalunoTemRegistros];
        }

        return ['item' => $rendimentoaluno, 'verificacao' => $verificacao];
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
            if ($this->rendimentoalunoRepository->destroy($item))
                $mensagem = 'Registro "' . $item->id . '" removido com sucesso';
            else $mensagem = 'Ocorreu um erro ao remover esse registro "' . $item->id . '", tente novamente';
        } else {
            $mensagem = 'Esse ítem possui registros relacionados!';
        }
        return $mensagem;
    }

    /**
     * Recuperar uma coleção de RendimentoAluno para o listBox
     * @return array
     */
    public function listBox()
    {
        $list[''] = '';

        foreach ($this->rendimentoalunoRepository->listBox() as $item) {
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
        $rendimentoaluno = $this->rendimentoalunoRepository->find($id);

        $campoRemover = 'imagem' . $ordemImagem;
        $imagem = $rendimentoaluno->$campoRemover;

        if ($imagem) {
            $pasta = config('configuracoes.upload.rendimento_aluno.caminho');
            $pastaOriginal = config('configuracoes.upload.rendimento_aluno.caminhoOriginal');

            $caminho_imagem_original = $pastaOriginal . $imagem;
            $caminho_imagem = $pasta . $imagem;

            if (\Storage::exists($caminho_imagem_original))
                \Storage::delete($caminho_imagem_original);

            if (\Storage::exists($caminho_imagem))
                \Storage::delete($caminho_imagem);

            return $this->rendimentoalunoRepository->imageDestroy($rendimentoaluno, $campoRemover);
        }
        return false;
    }

    public function frequenciasPorAluno($course_id, $role_id){
        $list[''] = '';

        foreach ($this->rendimentoalunoRepository->frequenciasPorAluno($course_id,$role_id) as $item) {
            $list[$item->user_id] = $item->rendimento;
        }

        return $list;
    }
}