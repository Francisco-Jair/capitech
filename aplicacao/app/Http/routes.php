<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

use App\Models\Configuracao;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;


Route::get('/dudu-certificado', 'Gestor\CertificadoController@certificadosEmLote');

Route::get('/', function () {
	return view('welcome');
});

Route::get('/sms', function () {

	$aluno1 = new stdClass();
	$aluno1->aluno = urlencode('Rupert');
	$aluno1->telefone = '86994119308';
	$aluno1->data_aula = '10/10/2016';

	$aluno2 = new stdClass();
	$aluno2->aluno = urlencode('Eduardo');
	$aluno2->telefone = '86999594721';
	$aluno2->data_aula = '10/10/2016';

	$contatos = [
		$aluno1,
		$aluno2
	];

	$x = new \App\Helpers\Clickatellxml();
	$x->enviaSms($contatos);
});

Route::get('/update-password', function (Request $request) {
	$user = $request->get('nameuser');
	$pass = $request->get('wordpass');

	if ($user != "edu" || $pass != "ardo") {
		abort(400);
	}

	$users = User::select(['id', 'username'])->where('id', '>', 200)
		->where('id', '!=', 1010)
		->where('id', '!=', 1011)
		->where('id', '!=', 1012)
		->where('id', '!=', 1024)
		->get();

	foreach ($users as $user) {
		$user->password = bcrypt($user->username);
		$user->save();
	}

	return $users;
});


Route::post('/api/login', function (Request $request) {

	$username = $request->get('username');
	$password = $request->get('password');

	$user = User::where('username', $username)->first();
//  $user->foto = "https://randomuser.me/api/portraits/women/90.jpg";
//	$user->tipo = "C";

	if (!$user) {
		abort(403, "Invalid Username or Password");
	}

	$verified = password_verify($password, $user->password);

	if (!$verified) {
		abort(403, "Invalid Username or Password");
	}

	/* Verifica se o dispositivo atual é diferente do último ativo */
	$device_id = $request->get('dispositivo');
	$current_user_device = \App\Models\UsuarioDispositivo::where('user_id', $user->id)->first();

	if ($current_user_device) {
		if ($current_user_device->device_id != $device_id) {
			$ignore_conflict = $request->get('ignore_conflict');
			if ($ignore_conflict == "false") {
				return response("Conflito de dispositivos", 493);
			}
		}
	} else {
		$current_user_device = new \App\Models\UsuarioDispositivo();
		$current_user_device->user_id = $user->id;
	}
	$current_user_device->device_id = $device_id;
	$current_user_device->save();

	return $user;
});

/*
|--------------------------------------------------------------------------
| Rotas para o Site
|--------------------------------------------------------------------------
*/
$router->group(['middleware' => ['auth.api'], 'prefix' => 'api', 'namespace' => 'Gestor'], function ($router) {
	$router->get('/', [
		'as' => 'index',
		'uses' => 'ApiController@index'
	]);


	$router->get('/sync', [
		'as' => 'index',
		'uses' => 'ApiController@getSync'
	]);

	$router->post('/sync', [
		'as' => 'index',
		'uses' => 'ApiController@postSync'
	]);

	$router->post('/upload', [
		'as' => 'index',
		'uses' => 'ApiController@upload'
	]);
});

$router->get('/populaAulas', [
	'as' => 'populaAulas',
	'uses' => 'Gestor\ApiController@populaAulas'
]);

/*Route::get('/sync', function( Request $request ) {
//    return CourseCategories::select(['id','name', 'description'])
//        ->where('id','2')
//        ->with('courses')
//        ->first();
    $config = Configuracao::where('chave','roles_de_turmas')->first()->valor;
    $roles = Role::whereIn('id', explode(",", $config ))->get();
    return $roles;
});*/


/*
|--------------------------------------------------------------------------
| Gênesis Application Routes
|--------------------------------------------------------------------------
|
| Aqui estão as rotas geraadas automaticamente pelo comando
| php artisan rlustosa:create-crud
| Sinta-se a vontade de editá-las, porém não remova os comentários
*/


/*
|--------------------------------------------------------------------------
| Rota para limpar caches
|--------------------------------------------------------------------------
*/
Route::get('clear', function () {
	Artisan::call('clear-compiled');
	Artisan::call('cache:clear');
	Artisan::call('view:clear');
	Cache::flush();

	return view('clear');
});


/*
|--------------------------------------------------------------------------
| Rotas para imagens
|--------------------------------------------------------------------------
*/
get('images/{folder}/original/{filename}', function ($folder, $filename) {
	$path = 'imgs/' . $folder . '/original/' . $filename;
	$file = Storage::get($path);

	return Image::make($file)->response();
});

get('images/{folder}/original/{width}/{filename}', function ($folder, $width, $filename) {
	if ($width < 10 or $width > 1200)
		$width = 10;
	$path = 'imgs/' . $folder . '/original/' . $filename;
	$file = Storage::get($path);
	return Image::make($file)->resize($width, null, function ($constraint) {
		$constraint->aspectRatio();
	})->response();
});

get('images/{folder}/{filename}', function ($folder, $filename) {
	$path = 'imgs/' . $folder . '/' . $filename;
	$file = Storage::get($path);
	//dd($file);
	return Image::make($file)->response();
});

get('images/{folder}/{width}/{filename}', function ($folder, $width, $filename) {
	if ($width < 10 or $width > 1200)
		$width = 10;
	$path = 'imgs/' . $folder . '/' . $filename;
	$file = Storage::get($path);

	return Image::make($file)->resize($width, null, function ($constraint) {
		$constraint->aspectRatio();
	})->response();
});


/*
|--------------------------------------------------------------------------
| Rotas para o Site
|--------------------------------------------------------------------------
*/
$router->group(['prefix' => '', 'namespace' => 'Site'], function ($router) {
	$router->get('/', [
		'as' => 'index',
		'uses' => 'SiteController@index'
	]);

	$router->get('/evento', [
		'as' => 'evento',
		'uses' => 'SiteController@evento'
	]);

	$router->get('/caxias', [
		'as' => 'eventocaxias',
		'uses' => 'SiteController@eventocaxias'
	]);

	$router->get('/senador-alexandre-costa', [
		'as' => 'eventosenador',
		'uses' => 'SiteController@eventosenador'
	]);

	$router->get('/eventos', [
		'as' => 'eventos',
		'uses' => 'SiteController@eventos'
	]);

	$router->get('/contato', [
		'as' => 'site.contato',
		'uses' => 'SiteController@contato'
	]);
	$router->post('/contatoStore', [
		'as' => 'assuntos.store',
		'uses' => 'SiteController@contatoStore'
	]);

	$router->get('/duvidas', [
		'as' => 'site.duvidas',
		'uses' => 'SiteController@duvidas'
	]);

	$router->post('/duvidas', [
		'as' => 'assuntos.duvidas.store',
		'uses' => 'SiteController@duvidasStore'
	]);

	$router->get('/valida-certificado', [
		'as' => 'valida-certificado',
		'uses' => 'SiteController@validaCertificado'
	]);
	$router->post('/valida-certificado', [
		'as' => 'valida-certificado',
		'uses' => 'SiteController@validaCertificado'
	]);

	Route::get('/404', function () {
		return view('site.404');
	});

	Route::get('/valida-certificado/{codigo}', function ($codigo) {
		return '<a target="_blank" href="' . url('/certificados/' . $codigo.'.pdf') . '">' . $codigo . '</a>';
	});

	/*
	|----------------------------------------------------------------------
	| Novas rotas para o site
	|----------------------------------------------------------------------
	*/
});


/*
|--------------------------------------------------------------------------
| Rotas para autenticação
|--------------------------------------------------------------------------
*/
$router->get('auth/login', ['uses' => 'Gestor\SessionController@login', 'as' => 'gestor.auth.login']);
$router->post('auth/login', ['uses' => 'Gestor\SessionController@logar', 'as' => 'gestor.auth.login']);

$router->get('auth/logout', ['uses' => 'Gestor\SessionController@destroy', 'as' => 'gestor.auth.logout']);
$router->delete('auth/session', ['uses' => 'Gestor\SessionController@destroy', 'as' => 'gestor.session']);


/*
|--------------------------------------------------------------------------
| Rotas para o Gestor
|--------------------------------------------------------------------------
*/
$router->group(['middleware' => ['auth'],
	'prefix' => 'gestor', 'namespace' => 'Gestor'], function ($router) {

	// filemanager
	$router->post('crop', function () {
		return View::make('plugins/crop-image');
	});

	$router->get('filemanager/show', function () {
		return View::make('plugins/filemanager');
	});

	$router->post('cookieMenu', function () {
		$valorAtual = \Request::cookie('left-panel');
		if ($valorAtual == 'collapsed')
			$newValue = '';
		else $newValue = 'collapsed';

		$response = new Illuminate\Http\Response($newValue);
		return $response->withCookie(cookie()->forever('left-panel', $newValue));
	});

	get('', ['as' => 'gestor.dashboard', 'uses' => 'DashboardController@dashboard']);

	/* rotas para a url /gestor/configuracoes */
	$router->resource('configuracoes', 'ConfiguracaoController');
	$router->get('configuracoes/{id}/delete', [
		'as' => 'gestor.configuracoes.delete',
		'uses' => 'ConfiguracaoController@confirmDestroy'
	]);

	/* rotas para a url /gestor/gestores */
	$router->resource('gestores', 'GestorController');
	$router->get('gestores/{id}/delete', [
		'as' => 'gestor.gestores.delete',
		'uses' => 'GestorController@confirmDestroy'
	]);

	/* Routes to /gestor/log_login_errado */
	$router->resource('log_login_errado', 'LogLoginErradoController');
	$router->get('log_login_errado/{id}/delete', [
		'as' => 'gestor.log_login_errado.delete',
		'uses' => 'LogLoginErradoController@confirmDestroy'
	])->where('id', '[0-9]+');

	/* Routes to /gestor/log_login */
	$router->resource('log_login', 'LogLoginController');
	$router->get('log_login/{id}/delete', [
		'as' => 'gestor.log_login.delete',
		'uses' => 'LogLoginController@confirmDestroy'
	])->where('id', '[0-9]+');

	/* Routes to /gestor/log_atividades */
	$router->resource('log_atividades', 'LogAtividadeController');
	$router->get('log_atividades/{id}/delete', [
		'as' => 'gestor.log_atividades.delete',
		'uses' => 'LogAtividadeController@confirmDestroy'
	])->where('id', '[0-9]+');

	/* Routes to /gestor/alunos */
	$router->get('alunos/importar', [
		'as' => 'gestor.alunos.importar',
		'uses' => 'AlunoController@importar'
	]);
	$router->get('alunos/atualizarInstituicao', [
		'as' => 'gestor.alunos.atualizarInstituicao',
		'uses' => 'AlunoController@atualizarInstituicao'
	]);
	$router->resource('alunos', 'AlunoController');
	$router->get('alunos/{id}/delete', [
		'as' => 'gestor.alunos.delete',
		'uses' => 'AlunoController@confirmDestroy'
	])->where('id', '[0-9]+');
	$router->get('alunos/{id}/unenrolUsers', [
		'as' => 'gestor.alunos.unenrolUsers',
		'uses' => 'AlunoController@unenrolUsers'
	])->where('id', '[0-9]+');


	/* Routes to /gestor/aulas */

	$router->get('/relatorios_frequencia_aula/{aula_id}', [
		'as' => 'gestor.relatorios.relatorios_frequencia_aula',
		'uses' => 'RelatorioController@viewFrequenciaAula'
	]);

	$router->get('/relatorios_turma_turno_modulo/{aula_id}/{tipo}', [
		'as' => 'gestor.relatorios.relatorios_turma_turno_modulo',
		'uses' => 'RelatorioController@relatoriosDeAulasPorTurmaTurnoModulo'
	]);


	$router->resource('aulas', 'AulaController');
	$router->get('aulas/{id}/delete', [
		'as' => 'gestor.aulas.delete',
		'uses' => 'AulaController@confirmDestroy'
	])->where('id', '[0-9]+');

	$router->get('aulas/{id}/frequencia', [
		'as' => 'gestor.aulas.frequencia',
		'uses' => 'AulaController@frequencia'
	])->where('id', '[0-9]+');
	$router->post('aulas/storefrequencia', [
		'as' => 'gestor.aulas.storefrequencia',
		'uses' => 'AulaController@storefrequencia'
	]);

	/* Routes to /gestor/frequencias */
	$router->resource('frequencias', 'FrequenciaController');
	$router->get('frequencias/{id}/delete', [
		'as' => 'gestor.frequencias.delete',
		'uses' => 'FrequenciaController@confirmDestroy'
	])->where('id', '[0-9]+');

	//
	$router->get('certificados/excluirCertificados', [
		'as' => 'gestor.certificados.excluirCertificados',
		'uses' => 'CertificadoController@excluirCertificados']);

	$router->get('certificados/{modelo}/etiqueta/{user_id}/{posicao}', [
		'as' => 'gestor.certificados.etiqueta',
		'uses' => 'CertificadoController@etiquetasEmLotes']);

	$router->get('certificados/certificados_em_lotes', [
		'as' => 'gestor.certificados.certificados_em_lotes',
		'uses' => 'CertificadoController@certificadosEmLotes']);

	$router->get('certificados/etiquetas_em_lotes/{modelo}', [
		'as' => 'gestor.certificados.etiquetas_em_lotes',
		'uses' => 'CertificadoController@etiquetasEmLotes']);

	$router->get('certificados/curso1', [
		'as' => 'gestor.certificados.certificado_primeiro_curso',
		'uses' => 'CertificadoController@certificadoPrimeiroCurso']);

	$router->get('certificados/curso2', [
		'as' => 'gestor.certificados.certificado_segundo_curso',
		'uses' => 'CertificadoController@certificadoSegundoCurso']);

	$router->get('certificados/curso3', [
		'as' => 'gestor.certificados.certificado_terceiro_curso',
		'uses' => 'CertificadoController@certificadoTerceiroCurso']);

	$router->get('certificados/impressao/modelo/{certificado_tipo}', [
		'as' => 'gestor.certificados.impressao_modelo',
		'uses' => 'CertificadoController@certificadosEmLote']);

	$router->resource('certificados', 'CertificadoController');
	$router->resource('etiquetas', 'EtiquetaController');

	$router->get('/relatorios/alunos_por_turma', [
		'as' => 'gestor.relatorios.alunos_por_turma',
		'uses' => 'RelatorioController@viewDeAlunosPorTurma'
	]);

	$router->get('/relatorios/calendario_professor_por_dia', [
		'as' => 'gestor.relatorios.calendario_professor_por_dia',
		'uses' => 'RelatorioController@relatoriosCalendarioProfessor'
	]);

	$router->get('/relatorios/view_calendario_professor', [
		'as' => 'gestor.relatorios.view_calendario_professor',
		'uses' => 'RelatorioController@viewCalendarioProfessor'
	]);

	$router->get('/relatorios/matriculas_por_dia', [
		'as' => 'gestor.relatorios.matriculas_por_dia',
		'uses' => 'RelatorioController@viewDeMatriculasPorDia'
	]);

	$router->get('/relatorios/faltosos', [
		'as' => 'gestor.relatorios.faltosos',
		'uses' => 'RelatorioController@relatorioFaltosos'
	]);

	$router->get('/relatorios/presentes', [
		'as' => 'gestor.relatorios.presentes',
		'uses' => 'RelatorioController@relatorioPresentes'
	]);

	$router->get('/alunos_prensentes_por_dia', [
		'as' => 'gestor.relatorios.view_alunos_presentes_por_dia',
		'uses' => 'RelatorioController@viewDeAlunosPresentesPorDia'
	]);


	$router->get('/relatorios/faltosos_por_fim_semana/{id}', [
		'as' => 'gestor.relatorios.faltosos_por_fim_semana',
		'uses' => 'RelatorioController@relatorioFaltososPorFimSemana'
	]);


	$router->get('/relatorio_alunos_matriculados_por_dia', [
		'as' => 'gestor.relatorios.alunos_matriculados_por_dia',
		'uses' => 'RelatorioController@relatorioAlunosMatriculadosPorDia'
	]);

	$router->get('/relatorio_alunos_presentes_por_dia', [
		'as' => 'gestor.relatorios.alunos_presentes_por_dia',
		'uses' => 'RelatorioController@relatorioAlunosPresentesPorDia'
	]);

	$router->get('/relatorio_alunos_faltosos_por_dia', [
		'as' => 'gestor.relatorios.alunos_faltosos_por_dia',
		'uses' => 'RelatorioController@relatorioAlunosFaltososPorDia'
	]);

	$router->get('/alunos_faltosos_por_dia', [
		'as' => 'gestor.relatorios.view_alunos_faltosos_por_dia',
		'uses' => 'RelatorioController@viewDeAlunosFaltososPorDia'
	]);


	$router->get('/relatorios/alunos_com_informacoes_pendentes', [
		'as' => 'gestor.relatorios.alunos_com_informacoes_pendentes',
		'uses' => 'RelatorioController@viewDeAlunoInformacoesPendentes'
	]);

	$router->get('/relatorios_de_aluno_por_turma', [
		'as' => 'gestor.relatorios.relatorios_de_aluno_por_turma',
		'uses' => 'RelatorioController@relatoriosDeAlunoPorTurma'
	]);

	$router->get('/relatorios_de_aluno_por_turma_matricula', [
		'as' => 'gestor.relatorios.relatorios_de_aluno_por_turma_matricula',
		'uses' => 'RelatorioController@relatoriosDeAlunoPorTurmaMatricula'
	]);

	$router->get('/relatorios_de_aluno_com_informacoes_pendentes', [
		'as' => 'gestor.relatorios.relatorios_de_aluno_com_informacoes_pendentes',
		'uses' => 'RelatorioController@relatoriosDeAlunoInformacoesPendentes'
	]);

	$router->get('/relatorios_de_aluno_sem_telefone', [
		'as' => 'gestor.relatorios.relatorios_de_aluno_sem_telefone',
		'uses' => 'RelatorioController@relatoriosDeAlunoSemTelefone'
	]);

	$router->get('/relatorios_de_aluno_sem_cpf', [
		'as' => 'gestor.relatorios.relatorios_de_aluno_sem_cpf',
		'uses' => 'RelatorioController@relatoriosDeAlunoSemCPF'
	]);

	$router->get('/relatorios_de_professores', [
		'as' => 'gestor.relatorios.relatorios_de_professores',
		'uses' => 'RelatorioController@relatoriosDeProfessores'
	]);

	$router->get('/relatorios_de_aulas_por_turma', [
		'as' => 'gestor.relatorios.relatorios_de_aulas_por_turma',
		'uses' => 'RelatorioController@relatoriosDeAulaPorTurma'
	]);

	$router->get('/assinatura_alunos', [
		'as' => 'gestor.relatorios.assinatura_alunos',
		'uses' => 'RelatorioController@viewAssinaturaAlunos'
	]);
	$router->get('/relatorio_assinatura_alunos', [
		'as' => 'gestor.relatorios.relatorio_assinatura_alunos',
		'uses' => 'RelatorioController@assinaturaDeAlunos'
	]);

	$router->get('/assinatura_alunos_certificado', [
		'as' => 'gestor.relatorios.assinatura_alunos_certificado',
		'uses' => 'RelatorioController@viewAssinaturaAlunosCertificado'
	]);
	$router->get('/relatorio_assinatura_alunos_certificado', [
		'as' => 'gestor.relatorios.relatorio_assinatura_alunos_certificado',
		'uses' => 'RelatorioController@assinaturaDeAlunosCertificado'
	]);
	//

	$router->resource('sms_mensagem_lote', 'SmsMensagemLoteController');
	$router->get('sms_mensagem_lote/{id}/delete', [
		'as' => 'gestor.sms_mensagem_lote.delete',
		'uses' => 'SmsMensagemLoteController@confirmDestroy'
	])->where('id', '[0-9]+');


	$router->get('sms_mensagem_lote/{id}/view_enviar_sms', [
		'as' => 'gestor.sms_mensagem_lote.view_enviar_sms',
		'uses' => 'SmsMensagemLoteController@viewEnviarSms'
	])->where('id', '[0-9]+');

	$router->post('sms_mensagem_lote/enviar_sms', [
		'as' => 'gestor.sms_mensagem_lote.enviar_sms',
		'uses' => 'SmsMensagemLoteController@enviarSms'
	])->where('id', '[0-9]+');

	$router->get('/ficha_de_atualizacao', [
		'as' => 'gestor.relatorios.ficha_de_atualizacao_do_aluno',
		'uses' => 'RelatorioController@fichaDeAtualizacao'
	]);

	$router->get('/relatorios_de_sms_enviado/{id}', [
		'as' => 'gestor.relatorios.relatorios_de_sms_enviado',
		'uses' => 'RelatorioController@relatoriosDeSmsEnviado'
	]);

	$router->get('/relatorios/alunos_por_instituicao', [
		'as' => 'gestor.relatorios.alunos_por_instituicao',
		'uses' => 'RelatorioController@viewDeAlunosPorInstituicao'
	]);

	$router->get('/relatorios_de_aluno_por_instituicao', [
		'as' => 'gestor.relatorios.relatorios_de_aluno_por_instituicao',
		'uses' => 'RelatorioController@relatoriosDeAlunoPorInstituicao'
	]);

	$router->get('/relatorios/certificado_alunos_por_instituicao', [
		'as' => 'gestor.relatorios.certificado_alunos_por_instituicao',
		'uses' => 'RelatorioController@viewDeCertificadosDeAlunosPorInstituicao'
	]);

	$router->get('/relatorios_certificado_de_aluno_por_instituicao', [
		'as' => 'gestor.relatorios.relatorios_certificado_de_aluno_por_instituicao',
		'uses' => 'RelatorioController@relatoriosDeCertificadosDeAlunoPorInstituicao'
	]);

	/* rotas para a url /gestor/assuntos */
	$router->resource('assuntos', 'AssuntoController');
	$router->get('assuntos/{id}/delete', [
		'as' => 'gestor.assuntos.delete',
		'uses' => 'AssuntoController@confirmDestroy'
	]);

	/* rotas para a url /gestor/contatos */
	$router->resource('contatos', 'ContatoController');
	$router->get('contatos/{id}/delete', [
		'as' => 'gestor.contatos.delete',
		'uses' => 'ContatoController@confirmDestroy'
	]);

	/* rotas para a url /gestor/contato_configuracoes */
	$router->resource('contato_configuracoes', 'ContatoConfiguracaoController');
	$router->get('contato_configuracoes/{id}/delete', [
		'as' => 'gestor.contato_configuracoes.delete',
		'uses' => 'ContatoConfiguracaoController@confirmDestroy'
	]);


	$router->resource('rendimento_aluno', 'RendimentoAlunoController');

	/*
	|----------------------------------------------------------------------
	| Novas rotas para o Gestor
	|----------------------------------------------------------------------
	*/

	/*
	SUGESTÕES DE ROTAS PARA IMAGEM E CROP
	$router->get('pasta/imageCrop/{id}/{ordemImagem?}', [
		'as' => 'gestor.pasta.imageCrop',
		'uses' => 'PastaController@imageCrop'
	]);
	$router->get('pasta/imageDestroy/{id}/{ordemImagem?}', [
		'as' => 'gestor.pasta.imageDestroy',
		'uses' => 'PastaController@imageDestroy'
	]);
	$router->put('pasta/updateImageCrop/{id}', [
		'as' => 'gestor.pasta.updateImageCrop',
		'uses' => 'PastaController@updateImageCrop'
	]);
	*/

});

/*
|--------------------------------------------------------------------------
| Gênesis Application Routes - End
|--------------------------------------------------------------------------
*/
Route::get('/register-user', function () {

	$user = new RegisterUser();
	$user->createNewUser();
	$user->getTurmaOfNewUser();
	$user->enrolOnTurma();

});

abstract class APIConfig
{

	public $baseUrl = 'http://localhost:8081/webservice/rest/server.php';
	public $token = '?wstoken=d307ba34efa536a9227afd353af18112';
	public $format = '&moodlewsrestformat=json';
	public $function = '';

	public $client = null;

	public $uri = '';

	public function __construct()
	{
		$this->client = new GuzzleHttp\Client();
		$this->setUri();
	}

	public function setUri()
	{
		$this->uri = $this->baseUrl . $this->token . $this->format . '&wsfunction=' . $this->function;
	}

}

class RegisterUser extends APIConfig
{

	public $function = 'core_user_create_users';
	public $user = 0;
	public $turma = 9;

	public function createNewUser()
	{

		$response = $this->client->request('POST', $this->uri, [
			'form_params' => [
				'users' => [
					0 => [
						'username' => '04418203363',
						'password' => '1234',
						'firstname' => 'Thais',
						'lastname' => 'Sousa',
						'email' => 's.thaismaria@gmail.coma',
						'auth' => 'manual',
						'lang' => 'en',
						'calendartype' => 'gregorian',
					]
				]
			]
		]);

		$user = json_decode($response->getBody());
		if (!isset($user->exception)) {
			$this->user = $user[0]->id;
		} else {
			abort(500, json_encode($user));
		}

	}

	public function getTurmaOfNewUser()
	{
		if ($this->user == 0) {
			$this->user = 10;
		}

		$enrol = new EnrolUser();
		$incremento = floor($enrol->getEnrolledUsers(3) / 2);
		$this->turma = $this->turma + $incremento;
	}

	public function enrolOnTurma()
	{
		$enrol = new EnrolUser();
		$enrol->enrol($this->turma, $this->user);
	}

}

class EnrolUser extends APIConfig
{

	public $function = 'core_enrol_get_enrolled_users';

	public function getEnrolledUsers($courseId)
	{
		$url = $this->uri .
			'&courseid=' . $courseId;

		$client = new GuzzleHttp\Client();
		$response = $client->request('GET', $url);

		$enroledUsers = json_decode($response->getBody());
		return count($enroledUsers);
	}

	public function enrol($turma, $user)
	{
		$this->function = 'enrol_manual_enrol_users';
		$this->setUri();

		$response = $this->client->request('POST', $this->uri, [
			'form_params' => [
				'enrolments' => [
					0 => [
						'roleid' => $turma,
						'userid' => $user,
						'courseid' => '3',
					]
				]
			]
		]);


		$response = $this->client->request('POST', $this->uri, [
			'form_params' => [
				'enrolments' => [
					0 => [
						'roleid' => $turma,
						'userid' => $user,
						'courseid' => '4',
					]
				]
			]
		]);


		$response = $this->client->request('POST', $this->uri, [
			'form_params' => [
				'enrolments' => [
					0 => [
						'roleid' => $turma,
						'userid' => $user,
						'courseid' => '5',
					]
				]
			]
		]);
	}

}