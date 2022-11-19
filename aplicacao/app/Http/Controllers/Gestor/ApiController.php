<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 01-11-2015
 * Time: 00:05:20
 */

namespace App\Http\Controllers\Gestor;

use App\Http\Controllers\Controller;
use App\Models\ApiFaltaAlunoEnvio;
use App\Models\ApiFaltaAlunoSms;
use App\Models\Aula;
use App\Models\Configuracao;
use App\Models\Course;
use App\Models\Frequencia;
use App\Models\LogAtividade;
use App\Models\Matricula;
use App\Models\Role;
use App\Models\User;
use App\Models\UsuarioDispositivo;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ApiController extends Controller
{
	/**
	 * Criar uma nova nova instância de ApiController
	 *
	 */
	public function __construct()
	{
	}

	public function index()
	{
		echo 'Logado';
		dd(\Auth::user());
	}

	public function getSync(Request $request)
	{
	    //return [];
		$version_app = $request->header('version');
		$headers = $request->headers->all();
		/* Verifica versão do app */
		if (!$version_app) {
			$msg = "Primeira versão do app";
			\Log::warning(
				json_encode(
					[
						'user_id' => \Auth::api()->user()->id,
						'user_name' => \Auth::api()->user()->name,
						'type' => 'getSync',
						'headers' => $headers,
						'requests' => $request->all(),
						'msg' => $msg
					]
				)
			);

			return response($msg, 400);
		} else {
			switch ($version_app) {
				//Ajustes por versão
			}
		}

		/* Verifica o dispositivo enviado */
		$device_id = $request->header('dispositivo');
		if (empty($device_id))
			$device_id = $request->get('dispositivo');
		$current_user_device = UsuarioDispositivo::where('user_id', \Auth::user()->id)->first();
		if (!$current_user_device || $current_user_device->device_id != $device_id) {

			$msg = "Dispositivo desativado/não cadastrado";

			\Log::warning(
				json_encode(
					[
						'user_id' => \Auth::api()->user()->id,
						'user_name' => \Auth::api()->user()->name,
						'type' => 'getSync',
						'headers' => $headers,
						'requests' => $request->all(),
						'msg' => $msg
					]
				)
			);
			return response($msg, 490);
		}

		/* Força logout no app */
		$force_logout = false; //todo definir regra...
		if ($force_logout) {
			return response("Precisa autenticar novamente", 491);
		}

		/* Enviar mensagem personalizada */
		$send_message = false; //todo definir regra...
		if ($send_message) {
			return response(json_encode([
				"method" => "sendMessage",
				"params" => ["Mensagem Personalizada"]
			]), 492);
		}

		/* Forçar update */
		$force_update = false; //todo definir regra...
		if ($force_update) {
			return response(json_encode([
				"method" => "requireUpdate"
			]), 492);
		}

		$dados = [];

		try {
			$roles_de_turmas = Configuracao::where('chave', 'roles_de_turmas')->first()->valor;
			$roles = Role::whereIn('id', explode(",", $roles_de_turmas))->get();
			//$roles_id = $roles->pluck('id')->all();

			$professor = \Auth::api()->user();

			$cursos = Matricula::where('user_id', $professor->id)->get();

			foreach ($cursos as $curso) {
				$curso_id = $curso->course_id;

				$aulas = Aula::select('aulas.data_aula', 'matriculas.course', 'aulas.id', 'matriculas.role_name')
					->join('matriculas', 'matriculas.course_id', '=', 'aulas.course_id')
					->leftJoin('frequencias', 'frequencias.user_id', '=', 'matriculas.user_id')
					->where('aulas.course_id', $curso_id)
					->whereRaw('matriculas.role_id = aulas.role_id')
					->where('matriculas.archetype', 'student')
					->whereNull('aulas.deleted_at')
					->distinct()
					->get();

				foreach ($aulas as $aula) {

					/*$alunos = Aula::select('matriculas.user_id', 'matriculas.firstname', 'matriculas.lastname', 'matriculas.email', 'matriculas.phone2', 'matriculas.role', 'aulas.id as aula_id', 'aulas.data_aula', 'frequencias.presente_m', 'frequencias.presente_t')
						->join('matriculas', 'matriculas.course_id', '=', 'aulas.course_id')
						->leftJoin('frequencias', 'frequencias.user_id', '=', 'matriculas.user_id')
						->where('aulas.course_id', $curso_id)
						->where('aulas.id', $aula->id)
						->where('frequencias.user_id', 721)
						->whereRaw('matriculas.role_id = aulas.role_id')
						->where('matriculas.archetype', 'student')
						->whereNull('aulas.deleted_at')
						->groupBy('matriculas.user_8id')
						->get();*/

					$alunos = \DB::table('aulas')
						->select(
							'matriculas.user_id', 'matriculas.firstname', 'matriculas.lastname', 'matriculas.email', 'matriculas.phone2', 'matriculas.role',
							'aulas.id as aula_id', 'aulas.data_aula'
						)
						->join('matriculas', function ($join) {
							$join->on('aulas.course_id', '=', 'matriculas.course_id')
								->on('aulas.role_id', '=', 'matriculas.role_id');
						})
						->where('matriculas.archetype', '=', 'student')
						->where('aulas.id', $aula->id)
						->whereNull('aulas.deleted_at')
						->orderBy('matriculas.firstname', 'asc')
						->get();

					$aluno_turma = [];
					foreach ($alunos as $aluno) {

						$presencaAluno = \DB::table('frequencias')
							->select('presente_m', 'presente_t')
							->where('aula_id', '=', $aula->id)
							->where('user_id', '=', $aluno->user_id)
							->whereNull('frequencias.deleted_at')
							->first();
						$aluno->presente_m = (isset($presencaAluno->presente_m) ? $presencaAluno->presente_m : 'S');
						$aluno->presente_t = (isset($presencaAluno->presente_t) ? $presencaAluno->presente_t : 'S');

						$aluno_turma[] = [
							'id' => $aluno->user_id,
							'nome' => $aluno->firstname . ' ' . $aluno->lastname,
							'email' => $aluno->email,
							'telefone' => $aluno->phone2,
							'presente_m' => $aluno->presente_m,
							'presente_t' => $aluno->presente_t
						];
					}

					$data_aula = Carbon::createFromFormat('d/m/Y', $aula->data_aula)->format('Y-m-d');

					$turmas[] = [
						'id' => $aula->id,
						'nome' => $aula->role_name,
						'data' => $data_aula,
						'alunos' => $aluno_turma
					];
				}

				$dados['cursos'][] = [
					'id' => $curso->course_id,
					'nome' => $curso->course,
					'descricao' => '',
					'turmas' => $turmas
				];

				$dados = [
					'id' => 1,
					'nome' => 'CAPTEC – Capacitações e Treinamentos',
					'descricao' => '',
					'cursos' => $dados['cursos']
				];
			}

			$log = new LogAtividade();

			$log->gestor_id = 1;
			$log->operacao = 'getSync';
			$log->modulo = json_encode($professor);
			$log->pagina = \Auth::api()->user()->id;
			$log->dados = json_encode([$dados]);

			$log->save();

			\Log::info(
				json_encode(
					[
						'user_id' => \Auth::api()->user()->id,
						'user_name' => \Auth::api()->user()->name,
						'type' => 'getSync',
						'headers' => $headers,
						'request' => [$dados]
					]
				)
			);
		} catch (\Exception $e) {
			\Log::error(json_encode(
				[
					'user_id' => \Auth::api()->user()->id,
					'user_name' => \Auth::api()->user()->name,
					'type' => 'getSync',
					'headers' => $headers,
					'error' => $e
				]
			));
		}
		return [$dados];
	}

	public function postSync(Request $request)
	{
//		return [];
		try {
			$professor = \Auth::api()->user();

			$log = new LogAtividade();

			$log->gestor_id = 1;
			$log->operacao = 'postSync';
			$log->modulo = json_encode($professor);
			$log->pagina = \Auth::api()->user()->id;
			$log->dados = $request->getContent();

			$log->save();

			\Log::info(
				json_encode(
					[
						'user_id' => \Auth::api()->user()->id,
						'user_name' => \Auth::api()->user()->name,
						'type' => 'postSync',
						'request' => $request->getContent()
					]
				)
			);
			$dados = json_decode($request->getContent());

			$enviarSMSTeste = false;
			$msgDaSmsTeste = [];
			if (isset($dados->categorias)) {
				$cursos = $dados->categorias[0]->cursos;
				foreach ($cursos as $curso) {
					if (isset($curso->turmas)) {
						foreach ($curso->turmas as $aula) {
							$aula_id = $aula->id;
							$data_aula = $aula->data;
							$alunos_ordedanos_por_array = [];

							if (isset($aula->alunos)) {

								$alunos_collect = collect($aula->alunos);

								if ($alunos_collect->count()) {
									$lista_alunos = Matricula::whereIn('user_id', $alunos_collect->pluck('id')->all())
										->where(function ($query) {
											$query->where('phone1', '!=', '')
												->orWhere('phone2', '!=', '');
										})
										->groupBy('user_id')
										->get();


									if ($lista_alunos->count()) {

										foreach ($lista_alunos as $aluno_sms):
											$alunos_ordedanos_por_array[$aluno_sms['user_id']] = $aluno_sms;
										endforeach;

									}


								} else {
									$lista_alunos = [];
								}
								//dd($alunos_ordedanos_por_array);
								//dd($alunos_collect->pluck('id')->all());

								foreach ($aula->alunos as $aluno) {

									$frequencia = Frequencia::firstOrCreate([
										'aula_id' => $aula_id,
										'user_id' => $aluno->id
									]);

									$frequencia->presente_m = $aluno->presente_m;
									$frequencia->presente_t = $aluno->presente_t;
									$frequencia->save();
									$telefones_sms = [];


									$msgDaSms = urlencode('Hoje sentimos sua falta na programacao presencial da Oficina de Formacao Continuada de Educacao Infantil - CAPTEC. Sua participacao e muito importante!');
									// Olá! Professor(a) sentimos sua falta hoje pela manhã e/ou tarde na programação presencial de Oficinas da Formação Continuada de Educação Infantil - CAPTEC. Sua participação é muito importante para nós!
									// Hoje sentimos sua falta na programacao presencial da Oficina de Formacao Continuada de Educação Infantil - CAPTEC. Sua participacao e muito importante!

									if ($aluno->presente_m == 'N' or $aluno->presente_t == 'N') {

										$existe_apiFaltaAlunoSms = ApiFaltaAlunoSms::where('user_id', $aluno->id)
											->where('aula_id', $aula_id)->first();

										if (!count($existe_apiFaltaAlunoSms) and isset($alunos_ordedanos_por_array[$aluno->id])) {
											$enviarSMSTeste = true;
											if ($alunos_ordedanos_por_array[$aluno->id]['phone1'] != '') {
												$telefones_sms[] = $this->normalizaTelefone($alunos_ordedanos_por_array[$aluno->id]['phone1']);
											}

											if ($alunos_ordedanos_por_array[$aluno->id]['phone2'] != '') {
												$telefones_sms[] = $this->normalizaTelefone($alunos_ordedanos_por_array[$aluno->id]['phone2']);
											}

											$novo_api_falta_aluno = new ApiFaltaAlunoSms();
											$novo_api_falta_aluno->frequencia_id = $frequencia->id;
											$novo_api_falta_aluno->user_id = $aluno->id;
											$novo_api_falta_aluno->aula_id = $aula_id;
											$novo_api_falta_aluno->save();

											foreach ($telefones_sms as $telefone) {
												if (!empty($telefone)) {
													$log = new ApiFaltaAlunoEnvio();
													$log->api_falta_aluno_sms_id = $novo_api_falta_aluno->id;
													$log->mensagem_modelo_id = 1;
													$log->destinatario = $novo_api_falta_aluno->user_id;
													$log->numero = $telefone;
													$log->save();

													$msgDaSmsTeste[] = $novo_api_falta_aluno->user_id;
													//file_get_contents("http://api.clickatell.com/http/sendmsg?user=Infatec&password=fODKNDOPVYeKNM&api_id=3498540&to=+55" . $telefone . "&text=$msgDaSms");
												}

											}
										}
									}
								}
							}
						}
					}
				}
			}
			if ($enviarSMSTeste == true) {
				$msgDaSmsTeste = urlencode(json_encode(implode('-', $msgDaSmsTeste)));
				file_get_contents("http://api.clickatell.com/http/sendmsg?user=Infatec&password=fODKNDOPVYeKNM&api_id=3498540&to=+5586994119308&text=$msgDaSmsTeste");
			}
		} catch (\Exception $e) {
			\Log::error(json_encode(
				[
					'user_id' => \Auth::api()->user()->id,
					'user_name' => \Auth::api()->user()->name,
					'type' => 'postSync',
					'request' => $request->getContent(),
					'errorMessage' => $e->getMessage(),
					'error' => $e->getTraceAsString()
				]
			));
			$msgDaSmsTeste = urlencode($e->getMessage());
			file_get_contents("http://api.clickatell.com/http/sendmsg?user=Infatec&password=fODKNDOPVYeKNM&api_id=3498540&to=+5586994119308&text=$msgDaSmsTeste");
		}
		return 'OK';
	}

	public function populaAulas()
	{
		dd(populaAulas);
		$roles_de_turmas = Configuracao::where('chave', 'roles_de_turmas')->first()->valor;
		$roles = Role::whereIn('id', explode(",", $roles_de_turmas))->get();
		$roles_id = $roles->pluck('id')->all();

		$roles_id = [
			9,
			10,
			16,
			17,
			18,
			19,
			20
		];

		$datasAulas = [
			'2016-11-12',
			'2016-11-13',
			'2016-11-19',
			'2016-11-20',
			'2016-11-26',
			'2016-11-27',
			'2016-12-03',
		];

		$roles_de_professores = Configuracao::where('chave', 'codigo_dos_professores')->first()->valor;
		$users = User::whereIn('id', explode(",", $roles_de_professores))->get();
		$professores_ids = $users->pluck('id')->all();


		$roles_de_cursos = Configuracao::where('chave', 'codigo_dos_cursos')->first()->valor;
		$courses = Course::whereIn('id', explode(",", $roles_de_cursos))->get();
		$courses_ids = $courses->pluck('id')->all();


		\DB::insert('set foreign_key_checks = 0;');
		\DB::insert('truncate aulas;');
		\DB::insert('set foreign_key_checks = 1;');

		echo '<pre>';

		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[0]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}


		echo '<hr />';

		$roles_id = [
			10,
			16,
			17,
			18,
			19,
			20,
			9,
		];
		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[1]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}


		echo '<hr />';

		$roles_id = [
			16,
			17,
			18,
			19,
			20,
			9,
			10,
		];
		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[2]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}


		echo '<hr />';

		$roles_id = [
			17,
			18,
			19,
			20,
			9,
			10,
			16,
		];
		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[3]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}


		echo '<hr />';

		$roles_id = [
			18,
			19,
			20,
			9,
			10,
			16,
			17,
		];
		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[4]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}


		echo '<hr />';

		$roles_id = [
			19,
			20,
			9,
			10,
			16,
			17,
			18,
		];
		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[5]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}


		echo '<hr />';

		$roles_id = [
			20,
			9,
			10,
			16,
			17,
			18,
			19,
		];
		$correcao_indice = 0;
		foreach ($roles_id as $indice => $role) {
			$dados = [
				$role,
				$professores_ids[$correcao_indice],
				$courses_ids[$correcao_indice],
				$datasAulas[6]
			];
			$correcao_indice++;
			print_r($dados);

			\DB::insert('insert into aulas (role_id, user_id, course_id, data_aula, created_at, updated_at) values (?, ?, ?, ?, ?, ?)',
				array_merge($dados, [date('Y-m-d H:i:s'), date('Y-m-d H:i:s')])
			);
		}

	}

	function removeAcentos($string)
	{
		$unwanted_array = array('Š' => 'S', 'š' => 's', 'Ž' => 'Z', 'ž' => 'z', 'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'A', 'Å' => 'A', 'Æ' => 'A', 'Ç' => 'C', 'È' => 'E', 'É' => 'E',
			'Ê' => 'E', 'Ë' => 'E', 'Ì' => 'I', 'Í' => 'I', 'Î' => 'I', 'Ï' => 'I', 'Ñ' => 'N', 'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O', 'Õ' => 'O', 'Ö' => 'O', 'Ø' => 'O', 'Ù' => 'U',
			'Ú' => 'U', 'Û' => 'U', 'Ü' => 'U', 'Ý' => 'Y', 'Þ' => 'B', 'ß' => 'Ss', 'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a', 'ä' => 'a', 'å' => 'a', 'æ' => 'a', 'ç' => 'c',
			'è' => 'e', 'é' => 'e', 'ê' => 'e', 'ë' => 'e', 'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i', 'ð' => 'o', 'ñ' => 'n', 'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o',
			'ö' => 'o', 'ø' => 'o', 'ù' => 'u', 'ú' => 'u', 'û' => 'u', 'ý' => 'y', 'þ' => 'b', 'ÿ' => 'y');
		$str = strtr($string, $unwanted_array);

		return $str;
	}

	private function normalizaTelefone($telefone)
	{
		$inicioNumeroFixo = array(2, 3, 4);
		$telefone = preg_replace("/[^0-9]/", "", $telefone);
		$telefone = preg_replace("/^00(.+)/", "86$1", $telefone);
		if (strlen($telefone) < 10) $telefone = NULL; //8699309719
		elseif (strlen($telefone) == 10 and in_array(substr($telefone, 2, 1), $inicioNumeroFixo)) $telefone = NULL; //99 3521 8705
		elseif (strlen($telefone) == 10) {
			$telefone = preg_replace("/(..)(.+)/", "$19$2", $telefone);
		}
		return $telefone;
	}

	public function upload(Request $request)
	{
		$files = $request->files->all();
		foreach ($files as $file) {
			try {
				$filename = str_random(4) . '-' . $file->getClientOriginalName();
				Storage::put('pictures/' . $filename, file_get_contents($file->getRealPath()));
			} catch (\Exception $e) {
				return response("Fail", 400);
			}
		}
		return response("Success", 200);
	}
}