<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 16-11-2015
 * Time: 02:01:09
 */

namespace App\Http\Controllers\Gestor;

use App\Models\Aluno;
use App\Models\Aula;
use App\Models\Certificado;
use App\Models\Course;
use App\Models\Matricula;
use App\Models\RendimentoAluno;
use App\Models\RendimentoAlunoAva;
use App\Services\AlunoService;
use fpdf\FPDF;
use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\CertificadoRequest;
use App\Services\CertificadoService;

class CertificadoController extends BaseController
{
	use LogAtividades;

	/**
	 * @var CertificadoRequest
	 */
	private $certificadoRequest;
	/**
	 * @var AlunoService
	 */
	private $alunoService;
	/**
	 * @var CertificadoService
	 */
	private $certificadoService;

	/**
	 * Criar uma nova nova instância de ConfiguracaoController
	 * @param CertificadoRequest $certificadoRequest
	 * @internal param ConfiguracaoService $configuracaoService
	 */
	public function __construct(CertificadoRequest $certificadoRequest, CertificadoService $certificadoService, AlunoService $alunoService)
	{
		$this->log('acessou', __CLASS__, '');
		$this->service = 'certificadoService';
		$this->pastaView = 'certificados';
		$this->certificadoRequest = $certificadoRequest;
		$this->alunoService = $alunoService;
		$this->certificadoService = $certificadoService;
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
//
		$dados = $this->alunoService->index($request, $ordenacao);
		$dados->setPath('./certificados');
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

		$item = $this->alunoService->find($id);

		$mpdf = new \mPDF('UTF8', 'Letter-L', 14, 'Arial', 0, 0, 0, 0, 0, 0);
		$mpdf->dpi = 150;
		$mpdf->img_dpi = 150;
		$mpdf->keep_table_proportions = true;

		?>
		<html>
		<head>
			<style>
				body {
					position: relative;
					text-align: center;
					overflow: hidden;
					page-break-inside: avoid;
				}

				#bg {
					position: absolute;
					left: 0;
					right: 0;
					top: 0;
					bottom: 0;
				}

				#bg img {
					width: 100%;
					height: 100%;
					margin: 0;
				}

				#text1 {
					top: 50%;
					font-size: 20pt;
					position: absolute;
					width: 100%;
					color: #000;
				}


			</style>
		<body>

		<div id="bg">
			<img src="<?php echo asset('admin/imagens/certificado.jpg'); ?>"/>
		</div>
		<div id="text1"><?php echo $item->firstname . ' ' . $item->lastname; ?></div>

		</body>
		</html>

		<?php
		//exit;
		//var_dump($item);
		//$html = 'aaa';
		// Now collect the output buffer into a variable
		/*$html = ob_get_contents();
		ob_end_clean();


		// LOAD a stylesheet
		$stylesheet = file_get_contents('styleShowTag.css');
		$mpdf->WriteHTML($stylesheet, 1);    // The parameter 1 tells that this is css/style only and no body/html/text

		// send the captured HTML from the output buffer to the mPDF class for processing
		$mpdf->WriteHTML($html, 2);

		$mpdf->Output();
		exit;


		dd($aluno);*/
		exit;
		return view('gestor.' . $this->pastaView . '.form', compact('item'));
	}

	public function certificadosEmLotes()
	{
		$mpdf = new \mPDF('utf-8', 'A4-L');

		$link_img = asset('uploads/certificado-captec-bg-2.jpg');

		$html = '
        <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Certficado - INFATEC</title>
    <style type="text/css">
        body { font-family: Arial, sans-serif; font-size: 18px; font-weight: normal; color: #333;}
        .main { width: 900px; height: 628px; background: url(bg.jpg) no-repeat; background-size: 100%;
            position: relative;
        }
        .main .content { content: url("' . $link_img . '"); margin: 0; width: 100%; height: 100%; }
        .main h1 { position: absolute; top: 365px; text-align: center; width: 720px; left: 90px;
            font-size: 22px; display: block; z-index: 9;}

        @media print {
            body { }
            .main  { position: relative; width: 100%; height: 100%; }
            .main .content { content: url("' . $link_img . '"); margin: 0; width: 100%; height: 100%; }
            .main h1 { position: absolute; top: 465px; text-align: center; width: 920px; left: 90px;
                font-size: 22px; display: block; z-index: 9;}
        }
        @page {
            margin: 0;
            size: landscape;
        }

    </style>
</head>

<body>

    <div class="main">
        <div class="content"></div>
        <h1>Jose Agamenon Oliveira</h1>
    </div>

    <div class="main">
        <div class="content"></div>
        <h1>Jose Agamenon Oliveira</h1>
    </div>

    <div class="main">
        <div class="content"></div>
        <h1>Jose Agamenon Oliveira</h1>
    </div>

</body>

<script>
    javascript:window.print();
</script>
</html>
';

		echo $html;
		exit;
//
//        $mpdf = new mPDF('',    // mode - default ''
//            '',    // format - A4, for example, default ''
//            0,     // font size - default 0
//            '',    // default font family
//            15,    // margin_left
//            15,    // margin right
//            16,     // margin top
//            16,    // margin bottom
//            9,     // margin header
//            9,     // margin footer
//            'L');  // L - landscape, P - portrait

		$mpdf->SetDisplayMode('fullpage');
		$mpdf->WriteHTML($html);
		$mpdf->Output();
	}

	public function etiquetasEmLotes($modelo, $user_id = null, $posicao = 1)
	{
		if (!empty($user_id)) {
			$itens = null;
			$posicao = (int)$posicao;

			if ($posicao > 1) {
				for ($x = 1; $x < $posicao; $x++) {
					$itens[] = new Aluno();
				}
			}

			$alunos = collect($itens);
			//$alunos->push(Matricula::where('user_id', $user_id)->first());
			$alunos->push(Certificado::select(\DB::raw('CONCAT(mdl_user.firstname, " ", mdl_user.lastname) as nome'), 'mdl_user.id', 'mdl_user.firstname', 'mdl_user.username', 'mdl_user.lastname', \DB::raw('count(certificados.id) as n_certicados'))
				->join('mdl_user', 'mdl_user.id', '=', 'certificados.user_id')
				->groupBy('certificados.user_id')
				->where('user_id', $user_id)->first());

//			dd($alunos);

		} else if ($user_id === '0') {
			$itens = null;
			$posicao = (int)$_REQUEST['posicao'];

			if ($posicao > 1) {
				for ($x = 1; $x < $posicao; $x++) {
					$itens[] = new Aluno();
				}
			}

			$alunos = collect($itens);

			$personalizado = new Aluno();
			$personalizado->firstname = $_REQUEST['primeiralinha'];
			$personalizado->role_name = $_REQUEST['segundalinha'];
			$personalizado->username = $_REQUEST['terceiralinha'];
			$alunos->push($personalizado);
		} else {
			$alunos = Certificado::select(\DB::raw('CONCAT(mdl_user.firstname, " ", mdl_user.lastname) as nome'), 'mdl_user.id', 'mdl_user.firstname', 'mdl_user.username', 'mdl_user.lastname', \DB::raw('count(certificados.id) as n_certicados'))
				->join('mdl_user', 'mdl_user.id', '=', 'certificados.user_id')
				->groupBy('certificados.user_id')
				->orderBy('mdl_user.id', 'desc')
				->get();
		}

		//$mode = '', $format = 'A4', $default_font_size = 0, $default_font = '',
		// $mgl = 15, $mgr = 15, $mgt = 16, $mgb = 16, $mgh = 9, $mgf = 9, $orientation = 'P'

		if ($modelo == 1) {
			$mpdf = new \mPDF('UTF8', 'Letter', 14, 'Arial', 4, 4, 12, 12, 0, 0, 'P');
			$height_width = 'height: 25.3mm; width: 101.5mm;';
		} else {
			$mpdf = new \mPDF('UTF8', 'A4', 14, 'Arial', 4, 4, 9, 9, 0, 0, 'P');
			$height_width = 'height: 25mm; width: 99mm;';
		}
		ob_start();

		?>
		<html>
		<head>
			<style>

				* {
					margin: 0;
					padding: 0;
					border: 0;
				}

				#etiqueta {
					margin: 0;
					float: left;
				<?php echo $height_width;?> font-size: 12px;
					padding: 0;
					text-align: left;
					border: 1px solid #fff;
				}

				.texto {
					margin: 5mm 0 0 5mm;
				}
			</style>
		</head>
		<body>

		<?php
		foreach ($alunos as $indice => $aluno) {

			if ($indice % 2 == 0)
				$margin = '0';
			else {
				if ($modelo == 1) {
					$margin = '5';
				} else {
					$margin = '2';
				}
			}

			$style = null;
			/*if ($indice > 1)
				$style = 'display: none';*/
			?>
			<div id="etiqueta" style="margin-left: <?php echo $margin ?>mm; <?= $style ?>">
				<div class="texto">
					<?php
					if (isset($personalizado)) {
						?>
						<b style="font-size: 15px;">
							<?php echo $aluno->firstname; ?>
						</b>
						<br>
						<b>
							<?php echo $aluno->role_name; ?>
						</b>
						<br>
						<?php echo $aluno->username;
					} else {
						if (!empty($aluno->firstname)) { ?>
							<b style="font-size: 15px;"><?php echo $aluno->nome ? $aluno->nome : ($aluno->firstname . $aluno->lastname); ?></b>
							<br>
							<b>
								<?php if (empty($_REQUEST)): ?> <b> CPF:</b> <?php endif;
								echo $aluno->username;
								?>
							</b>
							<?php
							if (empty($_REQUEST)) { ?>
								<br> <b> Código:</b> <?php
								echo $aluno->n_certicados . '-' . $aluno->id;
							}
						}
					}

					?>
				</div>
			</div>
		<?php } ?>

		</body>
		</html>

		<?php

		$html = ob_get_contents();
		ob_end_clean();
		$mpdf->WriteHTML($html, 0);
		$mpdf->SetAutoPageBreak(true);
		$mpdf->Output();
		exit;


	}

	/**
	 * Exibir o formulário para criar um novo registro.
	 *
	 * @return Response
	 */
	public function create()
	{
		//$options_configuracoes_id = $this->configuracaoService->listBox();
		return view('gestor.' . $this->pastaView . '.form');
	}

	/**
	 * Armazenar o novo registro.
	 *
	 * @param ConfiguracaoRequest $configuracaoRequest
	 * @return Response
	 */
	public function store(ConfiguracaoRequest $configuracaoRequest)
	{
		$this->configuracaoService->store($configuracaoRequest);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
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
		//$options_configuracoes_id = $this->configuracaoService->listBox();
		$item = $this->configuracaoService->find($id);
		return view('gestor.' . $this->pastaView . '.form', compact('item'));
	}

	/**
	 * Atualizar um registro específico.
	 *
	 * @param ConfiguracaoRequest $configuracaoRequest
	 * @param int $id
	 * @return Response
	 */
	public function update(
		ConfiguracaoRequest $configuracaoRequest,
		$id)
	{
		$this->configuracaoService->update($configuracaoRequest, $id);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Atualizado com sucesso')
			->with('tipo_mensagem', 'success');
	}

	private function retornaAbreviacaoProfessor($professor_id, $string)
	{

		/*
		 $mdl_user = array(
			array( // row #1
				'id' => 43,
				'firstname' => 'Deys Araújo',
				'lastname' => 'Santana',
			),
			array( // row #2
				'id' => 44,
				'firstname' => 'Marioneide Vieira',
				'lastname' => 'Lima',
			),
			array( // row #3
				'id' => 45,
				'firstname' => 'Kate',
				'lastname' => 'Lis Varão Santos',
			),
			array( // row #4
				'id' => 46,
				'firstname' => 'Maria Eliane',
				'lastname' => 'Pereira',
			),
			array( // row #5
				'id' => 47,
				'firstname' => 'Samuel',
				'lastname' => 'Mendonça Fagundes',
			),
			array( // row #6
				'id' => 48,
				'firstname' => 'Heloísa',
				'lastname' => 'Cardoso Varão Santos',
			),
			array( // row #7
				'id' => 49,
				'firstname' => 'Ednardo',
				'lastname' => 'Monti',
			),
);

		 * */
		if ($professor_id == 43)
			return 'Prof. Esp. ' . $string;
		else if ($professor_id == 44)
			return 'Prof. Ma. ' . $string;
		else if ($professor_id == 45)
			return 'Prof. Esp. ' . $string;
		else if ($professor_id == 46)
			return 'Prof. Esp. ' . $string;
		else if ($professor_id == 47)
			return 'Prof. Me. ' . $string;
		else if ($professor_id == 48)
			return 'Prof. Ma. ' . $string;
		else if ($professor_id == 49)
			return 'Prof. Me. ' . $string;
		else die($professor_id . ' Não encontrado no método retornaAbreviacaoProfessor');
	}

	public function primeiroCertificado()
	{
		// DESAFIOS CURRICULARES E USO DE TECNOLOGIA - MA HELOISA CARDOSO VARAO SANTOS 10h
		// PSICOMOTRICIDADE E APRENDIZAGEM NA EDUCAÇÃO INFANTIL - MA ANTONIA MARCIA 10h
		// ROLE_ID = 3 / DESENVOLVIMENTO INFANTIL - DEYS ARAUJO 40h

		$presencasSemFormatacaoAbertura = $this->presencasPorCurso(10);
		$presencasFormatadasAbertura = $this->formataPresencasPorAula($presencasSemFormatacaoAbertura, 'abertura');

		$presencasSemFormatacaoDesenvolvimentoInfantil = $this->presencasPorCurso(3);
		$rendimentoSemFormatacaoDesenvolvimentoInfantil = $this->retornaRendimentoAluno(3);

		$presencasFormatadasDesenvolvimentoInfantil = $this->formataPresencasPorAula($presencasSemFormatacaoDesenvolvimentoInfantil);
		$rendimentoFormatadasDesenvolvimentoInfantil = $this->formataRendimentoPorAula($rendimentoSemFormatacaoDesenvolvimentoInfantil);

		$certificados[3] = [
			'informacao' => $this->retornaProfessorECurso(3),
			'frequencia' => $presencasFormatadasDesenvolvimentoInfantil,
			'rendimento' => $rendimentoFormatadasDesenvolvimentoInfantil
		];

		$alunos = $this->retornaAlunos();

		$array_alunos = array();

		foreach ($alunos as $aluno) {

			if (isset($certificados[3]['rendimento'][$aluno->user_id])) {
				$rendimento_3 = $certificados[3]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_3 = 0;
			}

			if (isset($certificados[3]['frequencia'][$aluno->user_id])) {
				$frequencia_3 = $certificados[3]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_3 = 0;
			}

			// SE ELE NÃO TIVER FREQUENCIA NA PRIMEIRA AULA DA DEYSE NÃO EMITE RELATORIO
			if (($rendimento_3 + $frequencia_3) == 0) {
				continue;
			}

			//abertura tudo estatico
			$rendimento_total =
				20 +
				($rendimento_3 + $frequencia_3);

			$array_alunos[] = [

				'nome' => $aluno->firstname . ' ' . $aluno->lastname,
				'user_id' => $aluno->user_id,
				'carga_horaria_total' => $rendimento_total,
				'cursos' => [

					[

						'curso' => 'Desafios Curriculares e Uso de Tecnologias',
						'prof' => 'Prof. Ma. Heloísa Cardoso Varão Santos',
						'horas' => 10

					],

					[

						'curso' => 'Psicomotricidade e Aprendizagem na Educação Infantil',
						'prof' => 'Prof. Ma. Antônia Márcia Sousa Torres',
						'horas' => 10

					],

					[

						'curso' => $certificados[3]['informacao']['curso'],
						'prof' => 'Prof. Esp. ' . $certificados[3]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[3]['informacao']['professor_segundo_nome'],
						'horas' =>

							($rendimento_3
								+
								$frequencia_3)

					]

				]
			];

		}

		return $array_alunos;

	}

	public function segundoCertificado()
	{

		// ROLE_ID = 4  EIXO CURRICULAR LINGUAGEM ORAL E ESCRITA 40H- MARIONEIDE
		// ROLE_ID = 5  A LUDICIDADE COMO PRINCIPIO ESTETICO 40H - KATE
		// ROLE_ID = 6  ARTES VISUAIS NA EDUCACAO INFATIL 40H- MAARIA ELLIANE

		$presencasSemFormatacaoEixoCurricular = $this->presencasPorCurso(4);
		$rendimentoSemFormatacaoEixoCurricular = $this->retornaRendimentoAluno(4);

		$presencasFormatadasEixoCurricular = $this->formataPresencasPorAula($presencasSemFormatacaoEixoCurricular);
		$rendimentoFormatadasEixoCurricular = $this->formataRendimentoPorAula($rendimentoSemFormatacaoEixoCurricular);

		$presencasSemFormatacaoLucidade = $this->presencasPorCurso(5);
		$rendimentoSemFormatacaoLucidade = $this->retornaRendimentoAluno(5);

		$presencasFormatadasLucidade = $this->formataPresencasPorAula($presencasSemFormatacaoLucidade);
		$rendimentoFormatadasLucidade = $this->formataRendimentoPorAula($rendimentoSemFormatacaoLucidade);

		$presencasSemFormatacaoArtesVisuais = $this->presencasPorCurso(6);
		$rendimentoSemFormatacaoArtesVisuais = $this->retornaRendimentoAluno(6);

		$presencasFormatadasArtesVisuais = $this->formataPresencasPorAula($presencasSemFormatacaoArtesVisuais);
		$rendimentoFormatadasArtesVisuais = $this->formataRendimentoPorAula($rendimentoSemFormatacaoArtesVisuais);

		$certificados['frequencia_eixo_curricular'] = $presencasFormatadasEixoCurricular;
		$certificados['rendimento_eixo_curricular'] = $rendimentoFormatadasEixoCurricular;

		$certificados['frequencia_lucidade'] = $presencasFormatadasLucidade;
		$certificados['rendimento_lucidade'] = $rendimentoFormatadasLucidade;

		$certificados['frequencia_artes_visuais'] = $presencasFormatadasArtesVisuais;
		$certificados['rendimento_artes_visuais'] = $rendimentoFormatadasArtesVisuais;

		$certificados[4] = [
			'informacao' => $this->retornaProfessorECurso(4),
			'frequencia' => $presencasFormatadasEixoCurricular,
			'rendimento' => $rendimentoFormatadasEixoCurricular
		];

		$certificados[5] = [
			'informacao' => $this->retornaProfessorECurso(5),
			'frequencia' => $presencasFormatadasLucidade,
			'rendimento' => $rendimentoFormatadasLucidade
		];

		$certificados[6] = [
			'informacao' => $this->retornaProfessorECurso(6),
			'frequencia' => $presencasFormatadasArtesVisuais,
			'rendimento' => $rendimentoFormatadasArtesVisuais
		];

		$alunos = $this->retornaAlunos();

		$array_alunos = array();

		foreach ($alunos as $aluno) {

			//gambi pq tinha q ser rapido
			if (isset($certificados[4]['rendimento'][$aluno->user_id])) {
				$rendimento_4 = (int)$certificados[4]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_4 = 0;
			}

			if (isset($certificados[4]['frequencia'][$aluno->user_id])) {
				$frequencia_4 = $certificados[4]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_4 = 0;
			}

			if (isset($certificados[5]['rendimento'][$aluno->user_id])) {
				$rendimento_5 = $certificados[5]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_5 = 0;
			}

			if (isset($certificados[5]['frequencia'][$aluno->user_id])) {
				$frequencia_5 = $certificados[5]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_5 = 0;
			}

			if (isset($certificados[6]['rendimento'][$aluno->user_id])) {
				$rendimento_6 = $certificados[6]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_6 = 0;
			}

			if (isset($certificados[6]['frequencia'][$aluno->user_id])) {
				$frequencia_6 = $certificados[6]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_6 = 0;
			}

			$rendimento_total =
				($rendimento_4 + $frequencia_4) +
				($rendimento_5 + $frequencia_5) +
				($rendimento_6 + $frequencia_6);

			$array_alunos[] = [

				'nome' => $aluno->firstname . ' ' . $aluno->lastname,
				'user_id' => $aluno->user_id,
				'carga_horaria_total' => $rendimento_total,
				'cursos' => [

					[

						'curso' => $certificados[4]['informacao']['curso'],
						'prof' => $this->retornaAbreviacaoProfessor($certificados[4]['informacao']['professor_id'], $certificados[4]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[4]['informacao']['professor_segundo_nome']),
						'horas' =>

							($rendimento_4
								+
								$frequencia_4)

					],

					[

						'curso' => $certificados[5]['informacao']['curso'],
						'prof' => $this->retornaAbreviacaoProfessor($certificados[5]['informacao']['professor_id'], $certificados[5]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[5]['informacao']['professor_segundo_nome']),
						'horas' =>

							($rendimento_5
								+
								$frequencia_5)

					],
					[

						'curso' => $certificados[6]['informacao']['curso'],
						'prof' => $this->retornaAbreviacaoProfessor($certificados[6]['informacao']['professor_id'], $certificados[6]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[6]['informacao']['professor_segundo_nome']),
						'horas' =>

							($rendimento_6
								+
								$frequencia_6)

					]

				]
			];

		}

		return $array_alunos;

	}

	public function terceiroCertificado()
	{
		// ROLE_ID = 7 MUSICALIZACAO NA EDUCACAO INFANTIL 40H- SAMUEL
		// ROLE_ID = 8 NATUREZA E SOCIEDADE NA EDUCAÇÃO INFANTIL 40H- HELOISA
		// ROLE_ID = 9 ORGANIZACAO DO TRABALHO PEDAGOGICO: SEQUENCIAS DIDATICAS E PROJETOS 40H- EDNARDO

		$presencasSemFormatacaoMusicalizacao = $this->presencasPorCurso(7);
		$rendimentoSemFormatacaoMusicalizacao = $this->retornaRendimentoAluno(7);

		$presencasFormatadasMusicalizacao = $this->formataPresencasPorAula($presencasSemFormatacaoMusicalizacao);
		$rendimentoFormatadasMusicalizacao = $this->formataRendimentoPorAula($rendimentoSemFormatacaoMusicalizacao);

		$presencasSemFormatacaoNaturezaESociedade = $this->presencasPorCurso(8);
		$rendimentoSemFormatacaoNaturezaESociedade = $this->retornaRendimentoAluno(8);

		$presencasFormatadasNaturezaESociedade = $this->formataPresencasPorAula($presencasSemFormatacaoNaturezaESociedade);
		$rendimentoFormatadasNaturezaESociedade = $this->formataRendimentoPorAula($rendimentoSemFormatacaoNaturezaESociedade);

		$presencasSemFormatacaoOrganizacaoDoTrabalho = $this->presencasPorCurso(9);
		$rendimentoSemFormatacaoOrganizacaoDoTrabalho = $this->retornaRendimentoAluno(9);

		$presencasFormatadasOrganizacaoDoTrabalho = $this->formataPresencasPorAula($presencasSemFormatacaoOrganizacaoDoTrabalho);
		$rendimentoFormatadasOrganizacaoDoTrabalho = $this->formataRendimentoPorAula($rendimentoSemFormatacaoOrganizacaoDoTrabalho);

		$certificados[7] = [
			'informacao' => $this->retornaProfessorECurso(7),
			'frequencia' => $presencasFormatadasMusicalizacao,
			'rendimento' => $rendimentoFormatadasMusicalizacao
		];

		$certificados[8] = [
			'informacao' => $this->retornaProfessorECurso(8),
			'frequencia' => $presencasFormatadasNaturezaESociedade,
			'rendimento' => $rendimentoFormatadasNaturezaESociedade
		];

		$certificados[9] = [
			'informacao' => $this->retornaProfessorECurso(9),
			'frequencia' => $presencasFormatadasOrganizacaoDoTrabalho,
			'rendimento' => $rendimentoFormatadasOrganizacaoDoTrabalho
		];

		$alunos = $this->retornaAlunos();

		$array_alunos = array();

		foreach ($alunos as $aluno) {

			//gambi pq tinha q ser rapido
			if (isset($certificados[7]['rendimento'][$aluno->user_id])) {
				$rendimento_7 = $certificados[7]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_7 = 0;
			}

			if (isset($certificados[7]['frequencia'][$aluno->user_id])) {
				$frequencia_7 = $certificados[7]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_7 = 0;
			}

			if (isset($certificados[8]['rendimento'][$aluno->user_id])) {
				$rendimento_8 = $certificados[8]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_8 = 0;
			}

			if (isset($certificados[8]['frequencia'][$aluno->user_id])) {
				$frequencia_8 = $certificados[8]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_8 = 0;
			}

			if (isset($certificados[9]['rendimento'][$aluno->user_id])) {
				$rendimento_9 = $certificados[9]['rendimento'][$aluno->user_id];
			} else {
				$rendimento_9 = 0;
			}

			if (isset($certificados[9]['frequencia'][$aluno->user_id])) {
				$frequencia_9 = $certificados[9]['frequencia'][$aluno->user_id];
			} else {
				$frequencia_9 = 0;
			}

			$rendimento_total =
				($rendimento_7 + $frequencia_7) +
				($rendimento_8 + $frequencia_8) +
				($rendimento_9 + $frequencia_9);

			$array_alunos[] = [

				'nome' => $aluno->firstname . ' ' . $aluno->lastname,
				'user_id' => $aluno->user_id,
				'carga_horaria_total' => $rendimento_total,
				'cursos' => [

					[

						'curso' => $certificados[7]['informacao']['curso'],
						'prof' => $this->retornaAbreviacaoProfessor($certificados[7]['informacao']['professor_id'], $certificados[7]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[7]['informacao']['professor_segundo_nome']),
						'horas' =>

							($rendimento_7
								+
								$frequencia_7)

					],

					[

						'curso' => $certificados[8]['informacao']['curso'],
						'prof' => $this->retornaAbreviacaoProfessor($certificados[8]['informacao']['professor_id'], $certificados[8]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[8]['informacao']['professor_segundo_nome']),
						'horas' =>

							($rendimento_8
								+
								$frequencia_8)

					],

					[

						'curso' => $certificados[9]['informacao']['curso'],
						'prof' => $this->retornaAbreviacaoProfessor($certificados[9]['informacao']['professor_id'], $certificados[9]['informacao']['professor_primeiro_nome'] . ' ' . $certificados[9]['informacao']['professor_segundo_nome']),
						'horas' =>

							($frequencia_9
								+
								$rendimento_9)

					],

				]
			];

		}

		return $array_alunos;


	}

	public function presencasPorCurso($course_id)
	{
		return Aula::select('frequencias.*')
			->join('frequencias', 'frequencias.aula_id', '=', 'aulas.id')
			->where('course_id', '=', $course_id)
			->whereNull('frequencias.deleted_at')
			->whereNull('aulas.deleted_at')
			->orderBy('aulas.id', 'asc')
			->get();
	}

	public function formataPresencasPorAula($presencas, $abertura = null)
	{

		$horario = 5;

		if ($abertura) {
			$horario = 10;
		}

		if ($presencas) {

			$array_de_presencas = array();

			foreach ($presencas as $key => $value) {

				$array_de_presencas[$value['user_id']] = 0;

				if ($value->presente_m == 'S') {
					$array_de_presencas[$value['user_id']] += $horario;
				}

				if ($value->presente_t == 'S') {
					$array_de_presencas[$value['user_id']] += $horario;
				}

			}

			return $array_de_presencas;

		}
	}

	public function retornaRendimentoAluno($course_id)
	{
		return RendimentoAlunoAva::where('course_id', '=', $course_id)->whereNull('deleted_at')->get();

	}

	public function formataRendimentoPorAula($rendimentos)
	{

		if ($rendimentos) {

			$array_de_rendimentos = array();

			foreach ($rendimentos as $key => $value) {

				$porcentagem = round($value->rendimento * 0.3);

				$array_de_rendimentos[$value['user_id']] = $porcentagem;

			}

			return $array_de_rendimentos;

		}
	}

	public function retornaProfessorECurso($course_id)
	{
		return Matricula::select('firstname as professor_primeiro_nome', 'lastname as professor_segundo_nome', 'course as curso', 'user_id as professor_id')->where('course_id', '=', $course_id)->where('archetype', '!=', 'student')->first()->toArray();

	}

	public function retornaAlunos()
	{
		return Matricula::where('archetype', '=', 'student')->groupBy('user_id')->get();
	}

	public function certificadosEmLote($certificado_tipo)
	{
		if ($certificado_tipo == 1)
			$alunos = $this->primeiroCertificado();
		else if ($certificado_tipo == 2)
			$alunos = $this->segundoCertificado();
		else if ($certificado_tipo == 3)
			$alunos = $this->terceiroCertificado();

		$mdl_courses = Course::lists('id', 'fullname')->all();
		//dd($mdl_courses);

		$pdf = new FPDF();

		$pdfMultiCell = new \PdfMulticell($pdf);
		$pdfMultiCell->SetStyle("b", "Arial", "B", 15, "0,0,0");
		$pdfMultiCell->SetStyle("b2", "Arial", "B", 13, "0,0,0");
		$pdfMultiCell->SetStyle("prof", "Arial", "", 10, "0,0,0");
		$pdfMultiCell->SetStyle("auth", "Arial", "", 13, "0,0,0");

		$i = 0;
		foreach ($alunos as $sequencial => $aluno) {
			if ($aluno['carga_horaria_total'] == 0)
				continue;

			$pdf->AddPage("L", "A4");
			$pdf->SetFont("Arial", "", 15);
			$pdf->Image('images/frente.jpg', 0, 0, -300);

			$pdf->SetY(90);

			$dadosPaginaUm = new \StdClass();
			$dadosPaginaUm->nome = $aluno["nome"];
			$dadosPaginaUm->curso = "CAPTEC - Desafios Curriculares e Uso de Tecnologias na Educação Infantil";
			$dadosPaginaUm->periodo = "03 de Novembro a 18 de Dezembro de 2016";
			$dadosPaginaUm->municipioRealizacao = "Caxias-MA";
			$dadosPaginaUm->horas = $aluno["carga_horaria_total"];;
			$dadosPaginaUm->municipioData = "Caxias-MA";
			$dadosPaginaUm->dia = "18";
			$dadosPaginaUm->mes = "Dezembro";
			$dadosPaginaUm->ano = "2016";

			$paginaUm = utf8_decode("Certificamos que <b>{$dadosPaginaUm->nome}</b> " .
				"participou com êxito do <b>{$dadosPaginaUm->curso}</b> " .
				"na Modalidade Presencial e EAD realizado no período de <b>{$dadosPaginaUm->periodo}</b>" .
				" na cidade de <b>{$dadosPaginaUm->municipioRealizacao}</b> com duração de <b>{$dadosPaginaUm->horas}</b> horas/aulas.\n\n" .
				"{$dadosPaginaUm->municipioData}, <b>{$dadosPaginaUm->dia}</b> de <b>{$dadosPaginaUm->mes}</b> de <b>{$dadosPaginaUm->ano}</b>");

			$pdfMultiCell->multiCell(0, 10, $paginaUm, 0, "J", 0, 40, 0, 40);

			$pdf->AddPage("L", "A4");
			$pdf->Image('images/fundo.jpg', 0, 0, -300);

			if (!isset($aluno["user_id"]))
				dd($aluno);
			$user_id = $aluno["user_id"];
			$certificado = Certificado::where('user_id', $user_id)
				->where('certificado_tipo', $certificado_tipo)
				->orderBy('id', 'desc')
				->first();

			if (!$certificado) {
				$versao_impressao = 1;
			} else {
				$versao_impressao = $certificado->versao + 1;
			}

			/*dd($aluno["cursos"]);
			dd($aluno["cursos"][0]['curso']);*/

			$certificado = new Certificado();
			$certificado->user_id = $user_id;
			$certificado->certificado_tipo = $certificado_tipo;
			$certificado->versao = $versao_impressao;
			$certificado->codigo = $certificado_tipo . str_pad($user_id, 4, '0', STR_PAD_LEFT) . $certificado->versao;
			$certificado->total_horas = $dadosPaginaUm->horas;
			$certificado->h1 = (isset($aluno["cursos"][0]) ? $aluno["cursos"][0]['horas'] : null);
			$certificado->h2 = (isset($aluno["cursos"][1]) ? $aluno["cursos"][1]['horas'] : null);
			$certificado->h3 = (isset($aluno["cursos"][2]) ? $aluno["cursos"][2]['horas'] : null);
			$certificado->role1_id = (isset($aluno["cursos"][0]) ? (isset($mdl_courses[$aluno["cursos"][0]['curso']]) ? $mdl_courses[$aluno["cursos"][0]['curso']] : null) : null);
			$certificado->role2_id = (isset($aluno["cursos"][1]) ? (isset($mdl_courses[$aluno["cursos"][1]['curso']]) ? $mdl_courses[$aluno["cursos"][1]['curso']] : null) : null);
			$certificado->role3_id = (isset($aluno["cursos"][2]) ? (isset($mdl_courses[$aluno["cursos"][2]['curso']]) ? $mdl_courses[$aluno["cursos"][2]['curso']] : null) : null);
			$certificado->save();

			$sequencial = $certificado->codigo;

			$paginaDois = [

				"cursos" => $aluno["cursos"],
				"codigo" => $sequencial
			];

			$pdf->SetY(45);

			$pdf->SetFont("Arial", "", 14);

			foreach ($paginaDois["cursos"] as $curso) {
				if ($curso['horas'] == 0)
					continue;
				$strCurso = utf8_decode("<b>-  " . $curso["curso"]) . " (" . $curso["horas"] . "h)</b>";
				$strProfessor = utf8_decode("  <prof>  " . $curso["prof"] . "</prof>\n\n");
				$pdfMultiCell->multiCell(0, 6, $strCurso, 0, "J", 0, 15, 0, 15);
				$pdfMultiCell->multiCell(0, 4, $strProfessor, 0, "J", 0, 15, 0, 15);
			}

			$pdf->SetY(160);
			$autenticidade = utf8_decode("<auth>Para verificar a autenticidade do certificado, acesse:\n" .
				"www.sistemacaptec.com.br/valida-certificado\n" .
				"Certificado registrado com nº: <b2>" . $paginaDois["codigo"] . "</b2></auth>");
			$pdfMultiCell->multiCell(0, 5, $autenticidade, 0, "C", 0, 15, 0, 15);

			$pdf->Image('images/qrcode.png', 210, 155, -300);

			//echo '<a target="_blank" href="' . url('/certificados/' . $sequencial . '.pdf') . '">' . $sequencial . ' - ' . $dadosPaginaUm->nome . '</a><br />';
			/*if ($i++ == 3)
				break;*/
		}
		$pdf->Output("certificados/certificados_do_lote_" . $certificado_tipo . ".pdf");

		////////////////////////////////////////
		$i = 0;
		foreach ($alunos as $sequencial => $aluno) {
			if ($aluno['carga_horaria_total'] == 0)
				continue;

			$pdf = new FPDF();

			$pdfMultiCell = new \PdfMulticell($pdf);
			$pdfMultiCell->SetStyle("b", "Arial", "B", 15, "0,0,0");
			$pdfMultiCell->SetStyle("b2", "Arial", "B", 13, "0,0,0");
			$pdfMultiCell->SetStyle("prof", "Arial", "", 10, "0,0,0");
			$pdfMultiCell->SetStyle("auth", "Arial", "", 13, "0,0,0");

			$pdf->AddPage("L", "A4");
			$pdf->SetFont("Arial", "", 15);
			$pdf->Image('images/frente.jpg', 0, 0, -300);

			$pdf->SetY(90);

			$dadosPaginaUm = new \StdClass();
			$dadosPaginaUm->nome = $aluno["nome"];
			$dadosPaginaUm->curso = "CAPTEC - Desafios Curriculares e Uso de Tecnologias na Educação Infantil";
			$dadosPaginaUm->periodo = "03 de Novembro a 18 de Dezembro de 2016";
			$dadosPaginaUm->municipioRealizacao = "Caxias-MA";
			$dadosPaginaUm->horas = $aluno["carga_horaria_total"];;
			$dadosPaginaUm->municipioData = "Caxias-MA";
			$dadosPaginaUm->dia = "18";
			$dadosPaginaUm->mes = "Dezembro";
			$dadosPaginaUm->ano = "2016";

			$paginaUm = utf8_decode("Certificamos que <b>{$dadosPaginaUm->nome}</b> " .
				"participou com êxito do <b>{$dadosPaginaUm->curso}</b> " .
				"na Modalidade Presencial e EAD realizado no período de <b>{$dadosPaginaUm->periodo}</b>" .
				" na cidade de <b>{$dadosPaginaUm->municipioRealizacao}</b> com duração de <b>{$dadosPaginaUm->horas}</b> horas/aulas.\n\n" .
				"{$dadosPaginaUm->municipioData}, <b>{$dadosPaginaUm->dia}</b> de <b>{$dadosPaginaUm->mes}</b> de <b>{$dadosPaginaUm->ano}</b>");

			$pdfMultiCell->multiCell(0, 10, $paginaUm, 0, "J", 0, 40, 0, 40);

			$pdf->AddPage("L", "A4");
			$pdf->Image('images/fundo.jpg', 0, 0, -300);

			if (!isset($aluno["user_id"]))
				dd($aluno);
			$user_id = $aluno["user_id"];
			$certificado = Certificado::where('user_id', $user_id)
				->where('certificado_tipo', $certificado_tipo)
				->orderBy('id', 'desc')
				->first();

			if (!$certificado) {
				$versao_impressao = 1;
			} else {
				$versao_impressao = $certificado->versao + 1;
			}

			/*dd($aluno["cursos"]);
			dd($aluno["cursos"][0]['curso']);*/

			/*$certificado = new Certificado();
			$certificado->user_id = $user_id;
			$certificado->certificado_tipo = $certificado_tipo;
			$certificado->versao = $versao_impressao;
			$certificado->codigo = $certificado_tipo . str_pad($user_id, 4, '0', STR_PAD_LEFT) . $certificado->versao;
			$certificado->total_horas = $dadosPaginaUm->horas;
			$certificado->h1 = (isset($aluno["cursos"][0]) ? $aluno["cursos"][0]['horas'] : null);
			$certificado->h2 = (isset($aluno["cursos"][1]) ? $aluno["cursos"][1]['horas'] : null);
			$certificado->h3 = (isset($aluno["cursos"][2]) ? $aluno["cursos"][2]['horas'] : null);
			$certificado->role1_id = (isset($aluno["cursos"][0]) ? (isset($mdl_courses[$aluno["cursos"][0]['curso']]) ? $mdl_courses[$aluno["cursos"][0]['curso']] : null) : null);
			$certificado->role2_id = (isset($aluno["cursos"][1]) ? (isset($mdl_courses[$aluno["cursos"][1]['curso']]) ? $mdl_courses[$aluno["cursos"][1]['curso']] : null) : null);
			$certificado->role3_id = (isset($aluno["cursos"][2]) ? (isset($mdl_courses[$aluno["cursos"][2]['curso']]) ? $mdl_courses[$aluno["cursos"][2]['curso']] : null) : null);
			$certificado->save();*/

			$sequencial = $certificado->codigo;

			$paginaDois = [

				"cursos" => $aluno["cursos"],
				"codigo" => $sequencial
			];

			$pdf->SetY(45);

			$pdf->SetFont("Arial", "", 14);

			foreach ($paginaDois["cursos"] as $curso) {
				if ($curso['horas'] == 0)
					continue;
				$strCurso = utf8_decode("<b>-  " . $curso["curso"]) . " (" . $curso["horas"] . "h)</b>";
				$strProfessor = utf8_decode("  <prof>  " . $curso["prof"] . "</prof>\n\n");
				$pdfMultiCell->multiCell(0, 6, $strCurso, 0, "J", 0, 15, 0, 15);
				$pdfMultiCell->multiCell(0, 4, $strProfessor, 0, "J", 0, 15, 0, 15);
			}

			$pdf->SetY(160);
			$autenticidade = utf8_decode("<auth>Para verificar a autenticidade do certificado, acesse:\n" .
				"www.sistemacaptec.com.br/valida-certificado\n" .
				"Certificado registrado com nº: <b2>" . $paginaDois["codigo"] . "</b2></auth>");
			$pdfMultiCell->multiCell(0, 5, $autenticidade, 0, "C", 0, 15, 0, 15);

			$pdf->Image('images/qrcode.png', 210, 155, -300);

			//echo '<a target="_blank" href="' . url('/certificados/' . $sequencial . '.pdf') . '">' . $sequencial . ' - ' . $dadosPaginaUm->nome . '</a><br />';
			/*if ($i++ == 3)
				break;*/
			$pdf->Output("certificados/" . $paginaDois["codigo"] . ".pdf");
		}
	}

	public function excluirCertificados()
	{
		$csvFile = 'CERTIFICADOS PARA EXCLUIR.csv';

		$csv = $this->readCSVInstituicao($csvFile);

		$encontrados = $nao_encontrados = [];
		$total = 0;

		foreach ($csv as $item) {
			$total++;
			$aluno = Matricula::select('matriculas.user_id',
				'matriculas.nome',
				'matriculas.firstname',
				'matriculas.lastname'
			)
				->join('certificados', 'matriculas.user_id', '=', 'certificados.user_id')
				->groupBy('certificados.user_id')
				->where('matriculas.nome', $item)
				->first();

			if ($aluno) {
				$encontrados[] = $aluno;
				Certificado::whereUserId($aluno->user_id)->delete();
			} else {
				$nao_encontrados[] = $item;
			}
		}

		echo '$total = ' . $total;
		echo '<br />$encontrados = ' . count($encontrados);
		echo '<br />$nao_encontrados = ' . count($nao_encontrados);
		dd($nao_encontrados);
		dd($encontrados);
	}


	private function readCSVInstituicao($csvFile)
	{
		$line_of_text = [];
		$file_handle = fopen($csvFile, 'r');
		while (!feof($file_handle)) {
			$dados = fgetcsv($file_handle, 1024);
			$line_of_text[] = (trim($dados[0]));
		}
		fclose($file_handle);
		return $line_of_text;
	}
}