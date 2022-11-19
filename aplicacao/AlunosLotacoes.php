<?php

function listaAlunosAtualizar()
{
	$host = \DB::connection()->getConfig('host');
	$username = null;
	$password = null;

	if (\DB::connection()->getConfig('host') == '10.0.0.1') {
		$username = 'root';
		$password = 'infatec2014';
	} else if (\DB::connection()->getConfig('host') == '127.0.0.1' or \DB::connection()->getConfig('host') == 'localhost') {
		if (env('APP_ENV') == 'local') {
			$username = \DB::connection()->getConfig('username');
			$password = \DB::connection()->getConfig('password');
		} else if (env('APP_ENV') == 'web') {
			$username = \DB::connection()->getConfig('username');
			$password = \DB::connection()->getConfig('password');
			$host = 'localhost';
		}
	} else {
		dd('Erro na configuracao da conexão com o banco');
	}

	$conexao = new mysqli(
		$host,
		$username,
		$password,
		'captec_pege'
	);

	$sql = "SELECT distinct
			CASE
			 WHEN escola.nome is null or escola.nome='' THEN 'SEMEDUC'
			 WHEN escola.nome <> '' THEN concat(escola.inep, ' - ', escola.nome)
			 ELSE ''
			END as lotacao, servidor.nome as servidor,
			(SELECT DISTINCT id FROM captec_caxias.alunos ca WHERE ca.nome = servidor.nome LIMIT 1) as aluno_id
			FROM servidor
			JOIN servidor_cargo_escola ON servidor.id = servidor_cargo_escola.servidor_id AND servidor_cargo_escola.`status`=1
			LEFT JOIN escola ON escola.id = servidor_cargo_escola.escola_id
			WHERE servidor.nome
			in(SELECT DISTINCT(nome) FROM captec_caxias.alunos)
			order by servidor_cargo_escola.data_admissao DESC, servidor.nome, lotacao;";
	$query = $conexao->query($sql);

	$alunos = array();
	$s = $query->fetch_object();
	do {
		if ($s) {
			$alunos[$s->aluno_id] = $s;
		}
	} while ($s = $query->fetch_object());

	echo count($alunos);
	echo '<pre>';
	print_r($alunos);

	return $alunos;
}