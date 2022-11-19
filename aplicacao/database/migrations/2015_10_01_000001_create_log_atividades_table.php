<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLogAtividadesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('log_atividades', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('gestor_id')->unsigned();
            $table->foreign('gestor_id')->references('id')->on('gestores')->onDelete('restrict');
            $table->string('operacao');
            $table->string('modulo');
            $table->text('pagina');
            $table->text('dados');
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
        Schema::drop('log_atividades');
    }

}