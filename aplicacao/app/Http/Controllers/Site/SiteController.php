<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 15-09-2015
 * Time: 00:02:53
 */

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Http\Requests\ContatoRequest;
use App\Models\Certificado;
use App\Services\AssuntoService;
use App\Services\ContatoConfiguracaoService;
use App\Services\ContatoService;
use Illuminate\Http\Request;
use Validator;

class SiteController extends Controller
{
    /**
     * @param Request $request
     */
    public function __construct(Request $request)
    {
        if ($request->session()->has('locale')) {
            $locale = $request->session()->get('locale');
            \App::setLocale($locale);
        }
    }

    /**
     * @param Request $request
     * @param $locale
     * @return mixed
     */
    public function locale(Request $request, $locale)
    {
        if ($locale != 'en')
            $locale = 'pt-BR';

        $request->session()->put('locale', $locale);
        return \Redirect::route('site.index');
    }

    /**
     * @param Request $request
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $pagina = 'home';
        $keywords = '';

        $dados = [];
        return view('site.index', compact('dados', 'pagina', 'keywords'));
    }

    public function evento(){
        $pagina = 'evento';
        $keywords = '';

        $dados = [];
        return view('site.evento', compact('dados', 'pagina', 'keywords'));
    }

    public function eventocaxias(){
        $pagina = 'eventocaxias';
        $keywords = '';

        $dados = [];
        return view('site.eventocaxias', compact('dados', 'pagina', 'keywords'));
    }

    public function eventosenador(){
        $pagina = 'eventosenador';
        $keywords = '';

        $dados = [];
        return view('site.eventosenador', compact('dados', 'pagina', 'keywords'));
    }

    public function eventos(){
        $pagina = 'eventos';
        $keywords = '';

        $dados = [];
        return view('site.eventos', compact('dados', 'pagina', 'keywords'));
    }



    /**
     * Armazenar o contato.
     *
     * @param ContatoRequest $contatoRequest
     * @param ContatoService $contatoService
     * @return Response
     */
    public function contatoStore(ContatoRequest $contatoRequest, ContatoService $contatoService)
    {
        $contatoService->store($contatoRequest);
        return \Redirect::route('site.duvidas')->with('mensagem', 'Mensagem enviada com sucesso, iremos retornar em breve.');
    }

    public function duvidas(AssuntoService $assuntoService){
        $pagina = 'duvidas';
        $keywords = '';

        $listaDeAssuntos = $assuntoService->listBoxSite();

        $dados = [];
        return view('site.duvidas', compact('dados', 'pagina', 'keywords', 'listaDeAssuntos'));
    }

    public function validaCertificado(Request $request){

        $codigo = '';
        if($request->has('codigo')){
            $codigo = $request->get('codigo');
        }

        $certificados = array();
        $certificado = Certificado::where('codigo',$codigo)->first();
        if(empty($certificado)){
            $certificado = Certificado::join('mdl_user', 'mdl_user.id', '=', 'certificados.user_id')
                ->where('username', $codigo)
                ->get();
            $certificados = $certificado->all();
        }else{
            $certificados[] = $certificado;
        }

        $dados = [
            'codigo' => $codigo,
            'certificados' => $certificados
        ];

        return view('site.valida-certificado', $dados);
    }
}