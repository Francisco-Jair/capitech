<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFrequenciasTable extends Migration
{

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('frequencias', function (Blueprint $table) {
			$table->increments('id');

			$table->integer('aula_id')->unsigned();
			$table->foreign('aula_id')->references('id')->on('aulas')->onDelete('restrict');

			$table->bigInteger('user_id');
			$table->foreign('user_id')->references('id')->on('mdl_user')->onDelete('restrict');

			$table->enum('presente', array('S', 'N'));

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
		Schema::drop('frequencias');
	}

}
