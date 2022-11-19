<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 16-11-2015
 * Time: 02:48:34
 */

namespace App\Http\Controllers\Gestor;

use App\Models\Aluno;
use App\Models\Aula;
use App\Models\Role;
use App\Relatorios\RelatorioAnaliticoAluno;
use App\Relatorios\RelatorioAnaliticoAlunoCertificado;
use App\Relatorios\RelatorioAnaliticoAlunoFaltosoPorDia;
use App\Relatorios\RelatorioAnaliticoAlunoInformacoesPendentes;
use App\Relatorios\RelatorioAnaliticoAlunoMatriculadoPorDia;
use App\Relatorios\RelatorioAnaliticoAlunoPorInstituicao;
use App\Relatorios\RelatorioAnaliticoAlunoPorTurma;
use App\Relatorios\RelatorioAnaliticoAlunoPorTurmaComMatriculaECpf;
use App\Relatorios\RelatorioAnaliticoAlunoPresentePorDia;
use App\Relatorios\RelatorioAnaliticoAlunoSemCPF;
use App\Relatorios\RelatorioAnaliticoAlunoSemTelefone;
use App\Relatorios\RelatorioAnaliticoAulaPorTurma;
use App\Relatorios\RelatorioAnaliticoAulaPorTurmaTurnoModulo;
use App\Relatorios\RelatorioAnaliticoCalendarioProfessor;
use App\Relatorios\RelatorioAnaliticoFaltosos;
use App\Relatorios\RelatorioAnaliticoFaltososPorFimDeSemana;
use App\Relatorios\RelatorioAnaliticoPresentes;
use App\Relatorios\RelatorioAnaliticoProfessor;
use App\Relatorios\RelatorioAnaliticoSmsEnviado;
use App\Relatorios\FichaDeAtualizacaoDoAluno;
use App\Relatorios\RelatorioCertificadoAnaliticoAlunoPorInstituicao;
use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use Illuminate\Support\Facades\DB;


class RelatorioController extends BaseController
{
	use LogAtividades;

	public function __construct()
	{
		$this->log('acessou', __CLASS__, '');
		$this->pastaView = 'relatorios';
	}


	public function viewDeAlunosPorTurma()
	{

		$dados = Role::where('archetype', '=', 'student')
			->where('name', 'like', '%Turma%')->get();

		return view('gestor.relatorios.alunos-por-turma', ['turmas' => $dados]);
	}

	public function relatoriosDeAlunoPorTurma(Request $request)
	{

		$relatorio = new RelatorioAnaliticoAlunoPorTurma();
		$dados = $request->has('turma') ? ['turma' => $request->get('turma')] : [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosDeAlunoPorTurmaMatricula(Request $request)
	{

		$relatorio = new RelatorioAnaliticoAlunoPorTurmaComMatriculaECpf();
		$dados = $request->has('turma') ? ['turma' => $request->get('turma')] : [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosDeProfessores()
	{

		$relatorio = new RelatorioAnaliticoProfessor();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function viewFrequenciaAula($aula_id)
	{

		$aula = Aula::where('aulas.id', '=', $aula_id)
			->first();
		return view('gestor.relatorios.frequencia-aulas-por-turma', compact('aula'));
	}

	public function relatoriosDeAulasPorTurmaTurnoModulo($aula_id, $tipo)
	{

		$relatorio = new RelatorioAnaliticoAulaPorTurmaTurnoModulo();
		$dados = ['aula_id' => $aula_id, 'tipo' => $tipo];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosDeAulaPorTurma()
	{
		$relatorio = new RelatorioAnaliticoAulaPorTurma();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosCalendarioProfessor()
	{
		$relatorio = new RelatorioAnaliticoCalendarioProfessor();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}


	public function viewAssinaturaAlunos()
	{
		$dados = Role::where('archetype', '=', 'student')
			->where('name', 'like', '%Turma%')->get();

		return view('gestor.relatorios.alunos-assinatura', ['turmas' => $dados]);
	}

	public function assinaturaDeAlunos(Request $request)
	{
		$relatorio = new RelatorioAnaliticoAluno();

		$dados = [];
		if ($request->has('turma'))
			$dados['turma'] = $request->get('turma');

		if ($request->has('aula'))
			$dados['aula'] = $request->get('aula');


		$relatorio->processaRelatorio($dados);
	}


	public function viewAssinaturaAlunosCertificado()
	{
		// Proposital para não aparecer
		$dados = Role::where('archetype', '=', 'student')
			->where('name', 'like', '%TurmaXXXXXXXXX%')->get();

		return view('gestor.relatorios.alunos-assinatura-certificado', ['turmas' => $dados]);
	}

	public function assinaturaDeAlunosCertificado(Request $request)
	{
		$relatorio = new RelatorioAnaliticoAlunoCertificado();

		$dados = [];
		if ($request->has('turma'))
			$dados['turma'] = $request->get('turma');

		if ($request->has('aula'))
			$dados['aula'] = $request->get('aula');


		$relatorio->processaRelatorio($dados);
	}

	public function viewDeAlunoInformacoesPendentes()
	{
		$dados = Role::where('archetype', '=', 'student')
			->where('name', 'like', '%Turma%')->get();

		return view('gestor.relatorios.pendentes-por-turma', ['turmas' => $dados]);
	}

	public function relatoriosDeAlunoInformacoesPendentes(Request $request)
	{
		$relatorio = new RelatorioAnaliticoAlunoInformacoesPendentes();
		$dados = $request->has('turma') ? ['turma' => $request->get('turma')] : [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosDeAlunoSemTelefone()
	{
		$relatorio = new RelatorioAnaliticoAlunoSemTelefone();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosDeAlunoSemCPF()
	{
		$relatorio = new RelatorioAnaliticoAlunoSemCPF();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function viewDeMatriculasPorDia()
	{
		return view('gestor.relatorios.matriculas-por-dia');
	}

	public function viewDeAlunosFaltososPorDia()
	{
		return view('gestor.relatorios.faltas-por-dia');
	}

	public function viewCalendarioProfessor()
	{
		return view('gestor.relatorios.calendario-professor-por-dia');
	}


	public function viewDeAlunosPresentesPorDia()
	{
		return view('gestor.relatorios.presentes-por-dia');
	}

	public function relatorioAlunosMatriculadosPorDia()
	{
		$relatorio = new RelatorioAnaliticoAlunoMatriculadoPorDia();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}


	public function relatorioAlunosPresentesPorDia()
	{
		$relatorio = new RelatorioAnaliticoAlunoPresentePorDia();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatorioAlunosFaltososPorDia()
	{
		$relatorio = new RelatorioAnaliticoAlunoFaltosoPorDia();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}


	public function relatorioFaltosos()
	{
		$relatorio = new RelatorioAnaliticoFaltosos();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatorioPresentes()
	{
		$relatorio = new RelatorioAnaliticoAlunoPresentePorDia();
		$dados = [];
		$relatorio->processaRelatorio($dados);
	}

	public function relatorioFaltososPorFimSemana($id)
	{

		$relatorio = new RelatorioAnaliticoFaltososPorFimDeSemana();
		$dados = ['id' => $id];
		$relatorio->processaRelatorio($dados);
	}

	public function relatoriosDeSmsEnviado($smsId)
	{
		$relatorio = new RelatorioAnaliticoSmsEnviado();
		$dados = [];
		$dados['id'] = $smsId;
		$relatorio->processaRelatorio($dados);
	}

	public function fichaDeAtualizacao()
	{
		$relatorio = new FichaDeAtualizacaoDoAluno();
		$relatorio->processaRelatorio();
	}

	public function viewDeAlunosPorInstituicao()
	{
		$dados = Aluno::select(DB::raw('institution, count(DISTINCT id) as qtd'))
			->groupBy('institution')
			->orderBy('institution', 'asc')->get();

		$total = 0;
		foreach ($dados as $instituicao) {
			$total += $instituicao->qtd;
		}

		return view('gestor.relatorios.alunos-por-instituicao', ['instituicoes' => $dados, 'total' => $total]);
	}

	public function relatoriosDeAlunoPorInstituicao(Request $request)
	{
		$relatorio = new RelatorioAnaliticoAlunoPorInstituicao();
		$dados = $request->has('instituicao') ? ['instituicao' => $request->get('instituicao')] : [];
		$relatorio->processaRelatorio($dados);
	}

	public function viewDeCertificadosDeAlunosPorInstituicao()
	{
		$dados = Aluno::select(DB::raw('institution, count(DISTINCT id) as qtd'))
			->groupBy('institution')
			->orderBy('institution', 'asc')->get();

		$total = 0;
		foreach ($dados as $instituicao) {
			$total += $instituicao->qtd;
		}

		return view('gestor.relatorios.alunos-certificados-por-instituicao', ['instituicoes' => $dados, 'total' => $total]);
	}

	public function relatoriosDeCertificadosDeAlunoPorInstituicao(Request $request)
	{
		$relatorio = new RelatorioCertificadoAnaliticoAlunoPorInstituicao();
		$dados = $request->has('instituicao') ? ['instituicao' => $request->get('instituicao')] : [];
		$relatorio->processaRelatorio($dados);
	}

}
