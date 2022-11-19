<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSmsMensagemLoteTable extends Migration
{

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sms_mensagem_lote', function (Blueprint $table) {
			$table->increments('id');
			$table->enum('destinatario', array('Aluno', 'Professor', 'Todos'));
			$table->string('mensagem');
			$table->timestamps();
			$table->softDeletes();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('sms_mensagem_lote');
	}

}
