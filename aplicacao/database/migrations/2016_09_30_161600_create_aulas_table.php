<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAulasTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('aulas', function(Blueprint $table)
		{
			$table->increments('id');

			$table->bigInteger('role_id');
			$table->foreign('role_id')->references('id')->on('mdl_role')->onDelete('restrict');

			$table->bigInteger('user_id');
			$table->foreign('user_id')->references('id')->on('mdl_user')->onDelete('restrict');

			$table->bigInteger('course_id');
			$table->foreign('course_id')->references('id')->on('mdl_course')->onDelete('restrict');

			$table->date('data_aula');

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
		Schema::drop('aulas');
	}

}
