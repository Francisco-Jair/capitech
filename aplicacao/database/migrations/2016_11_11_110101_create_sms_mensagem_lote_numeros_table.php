<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSmsMensagemLoteNumerosTable extends Migration
{

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('sms_mensagem_lote_numeros', function (Blueprint $table) {
			$table->increments('id');
			$table->integer('sms_mensagem_lote_id')->unsigned();
			$table->foreign('sms_mensagem_lote_id')->references('id')->on('sms_mensagem_lote')->onDelete('restrict');
			$table->bigInteger('user_id');
			$table->foreign('user_id')->references('id')->on('mdl_user')->onDelete('restrict');
			$table->string('numero');
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
		Schema::drop('sms_mensagem_lote_numeros');
	}

}
