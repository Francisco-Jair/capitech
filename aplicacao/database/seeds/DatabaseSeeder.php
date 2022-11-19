<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class DatabaseSeeder extends Seeder
{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
		Model::unguard();

		// $this->call(UserTableSeeder::class);
		$this->call(ConfiguracaoTableSeeder::class);
		//$this->call(ContatoContatoConfiguracaoTableSeeder::class);
		$this->call(GestorTableSeeder::class);
		DB::insert('insert into configuracoes (titulo, chave, valor) values (?, ?, ?)', ['Código dos cursos', 'codigo_dos_cursos', '3,4,5,6,7,8,9']);
		DB::insert('insert into configuracoes (titulo, chave, valor) values (?, ?, ?)', ['Turmas', 'roles_de_turmas', '9,10,11,12,13,14,15']);
		DB::insert('insert into configuracoes (titulo, chave, valor) values (?, ?, ?)', ['Alunos por turma', 'alunos_por_turma', '40']);
		DB::insert('insert into configuracoes (titulo, chave, valor) values (?, ?, ?)', ['Códigos dos professores', 'codigo_dos_professores', '43,44,45,46,47,48,49']);

		Model::reguard();
	}
}
