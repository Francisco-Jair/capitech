<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 01-11-2015
 * Time: 00:05:20
 */

namespace App\Http\Controllers\Gestor;

use App\Http\Controllers\Controller;
use App\Traits\LogAtividades;
use Illuminate\Http\Request;

class EtiquetaController extends Controller
{
    use LogAtividades;
    protected $pastaView;

    public function __construct()
    {
        $this->log('acessou',__CLASS__,'');
        $this->pastaView = 'etiquetas';
    }

    public function index()
    {
        return view('gestor.' . $this->pastaView . '.form');
    }

    /**
     * Excluir um registro.
     *
     * @param  int $id
     * @return Response
     */
    public function destroy($id)
    {
        $mensagem = $this->{$this->service}->destroy($id);
        return \Redirect::route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', $mensagem)
            ->with('tipo_mensagem', 'danger');
    }
    /**
     * Exibir um formulário de edição de um registro específico.
     *
     * @param  int $id
     * @param null $ordemImagem
     * @return Response
     */
    public function imageCrop($id, $ordemImagem = null)
    {
        $item = $this->{$this->service}->find($id);
        $item->imagem = $item->{'imagem' . $ordemImagem};
        return view('gestor.'.$this->pastaView.'.image-crop', compact('item', 'ordemImagem'));
    }

    /**
     * Atualizar um registro específico.
     *
     * @param Request $request
     * @param  int $id
     * @return Response
     */
    public function updateImageCrop(
        Request $request,
        $id)
    {
        $cortou = $this->{$this->service}->updateImageCrop($request, ''.$this->pastaView.'');
        if ($cortou)
            return \Redirect::route('gestor.'.$this->pastaView.'.index')
                ->with('mensagem', 'Imagem atualizada com sucesso')
                ->with('tipo_mensagem', 'success');
        else return \Redirect::route('gestor.'.$this->pastaView.'.imageCrop')
            ->with('mensagem', 'Erro ao atualizar imagem')
            ->with('tipo_mensagem', 'danger');
    }


    public function imageDestroy($id, $ordemImagem = null)
    {
        $retorno = $this->{$this->service}->imageDestroy($id, $ordemImagem);
        if ($retorno)
            return \Redirect::route('gestor.'.$this->pastaView.'.index')
                ->with('mensagem', 'Imagem removida com sucesso')
                ->with('tipo_mensagem', 'success');
        else return \Redirect::route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', 'Erro ao remover imagem')
            ->with('tipo_mensagem', 'danger');
    }

    public function operacaoNaoPermitida(){
        return redirect()->route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', 'Operação não permitida')
            ->with('tipo_mensagem', 'danger');
    }

}