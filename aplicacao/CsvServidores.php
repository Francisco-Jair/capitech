<?php

function readCSV($csvFile)
{
	$file_handle = fopen($csvFile, 'r');
	while (!feof($file_handle)) {
		$line_of_text[] = fgetcsv($file_handle, 1024)[0];
	}
	fclose($file_handle);
	return $line_of_text;
}

function listaServidores()
{
	$csvFile = base_path('servidores.csv');

	$csv = readCSV($csvFile);
	/*
	echo '<pre>';
	print_r($csv);
	echo '</pre>';

	\DB::connection()->getConfig('host'),
	\DB::connection()->getConfig('username'),
	\DB::connection()->getConfig('password'),
	\DB::connection()->getConfig('database')
	*/

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
			$username = 'root';
			$password = 'kA1eh6kaM4ba@2016#';
			$host = '96.126.126.211';
		}
	} else {
		dd('Erro na configuracao da conexão com o banco');
	}

	$conexao = new mysqli(
		$host,
		$username,
		$password,
		'pege_caxias'
	);

	$servidores = array();
	$nao_encontrados = array();
	foreach ($csv as $servidor) {
		$servidor_busca = utf8_decode(trim($servidor));
		if (!empty($servidor)) {
			$sql = "select id, nome, cpf, email, celular, telefone from pege_caxias.servidor where nome like '" . $servidor_busca . "';";
			$query = $conexao->query($sql);

			$s = $query->fetch_object();
			do {
				if ($s) {
					$servidores[$servidor][] = $s;
				} else {
					$nao_encontrados[] = $servidor;
				}
			} while ($s = $query->fetch_object());
		}
	}

	echo ' Total de Encontrados - ' . count($servidores);
	echo '<hr />';
	echo ' Total de Não Encontrados - ' . count($nao_encontrados);
	echo '<hr />';
	echo ' Total  - ' . (count($nao_encontrados) + count($servidores));
	echo '<hr />';

	$dados_inserir = array();
	$i = 1;
	foreach ($servidores as $nome => $servidor) {

		//if($i <= 5) {
		$nome_array = explode(' ', $nome);

		$telefone = trim($servidor[0]->telefone);
		$celular = trim($servidor[0]->celular);
		$email = trim($servidor[0]->email);
		$cpf = trim($servidor[0]->cpf);
		if (empty($cpf)) {
			dd($servidor[0]);
		}

		$dados_inserir[] = array(
			'username' => $servidor[0]->cpf,
			'password' => 'captec@321',
			'firstname' => $nome_array[0],
			'lastname' => implode(' ', array_slice($nome_array, 1, null, true)),
			'email' => !empty($email) ? $email : $cpf . '@sem.email',
			'phone1' => $telefone,
			'phone2' => $celular
		);
		$i++;
		//}else{
		//break;
		//}
	}

	/*echo '<pre>';
	print_r($dados_inserir);
	$dados_inserir = [];*/

	$i = 1;
	foreach ($nao_encontrados as $key => $nao_encontrado) {

		//if($i <= 5) {
		$nome_array = explode(' ', $nao_encontrado);
		$chave = str_pad($i, 11, '0', STR_PAD_LEFT);
		$dados_inserir[] = array(
			'username' => $chave,
			'password' => 'captec@321',
			'firstname' => $nome_array[0],
			'lastname' => implode(' ', array_slice($nome_array, 1, null, true)),
			'email' => $chave . '@sem.email',
			'phone1' => '',
			'phone2' => ''
		);
		$i++;
		//}else{
		//break;
		//}
	}

	//print_r($dados_inserir);
	//exit;
	return $dados_inserir;
}

function readCSVInstituicao($csvFile)
{
	$file_handle = fopen($csvFile, 'r');
	while (!feof($file_handle)) {
		$dados = fgetcsv($file_handle, 1024);
		$line_of_text[] = array(
			'nome' => utf8_decode(trim($dados[0])),
			'instituicao' => utf8_decode($dados[1])
		);
	}
	fclose($file_handle);
	return $line_of_text;
}

function listaServidoresInstituicao()
{
	$csvFile = base_path('servidores_instituicao.csv');

	$csv = readCSVInstituicao($csvFile);

//	echo '<pre>';
//	print_r($csv);
//	die;

	$host = \DB::connection()->getConfig('host');
	$username = null;
	$password = null;
	$banco_captec = 'captec_caxias';

	if (\DB::connection()->getConfig('host') == '10.0.0.1') {
		$username = 'root';
		$password = 'infatec2014';
		$banco_captec = 'capacitacoes';
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
		$banco_captec
	);

	$retorno = array();
	$nao_localizados = array();
	foreach($csv as $lotacao){
		$nome = strtolower($lotacao['nome']);
		$sql = "SELECT
					id, nome
				FROM alunos
				WHERE LOWER(nome) LIKE '".$nome."' LIMIT 1;";

		$query = $conexao->query($sql);

		if($query) {
			$s = $query->fetch_object();
			if ($s) {
				$retorno[] = array(
					'id' => $s->id,
					'nome' => $s->nome,
					'instituicao' => $lotacao['instituicao']
				);
			}else{
				$nao_localizados[] = $lotacao;
			}
		}else{
			$nao_localizados[] = $lotacao;
		}
	}

	echo '<pre>ENCONTRADOS<hr/>';
	print_r($retorno);

	echo '<pre>NÃO ENCONTRADOS<hr/>';
	print_r($nao_localizados);

	return $retorno;
}