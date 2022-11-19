<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestionarioQuestoesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questionario_questoes', function (Blueprint $table) {

            $table->increments('id');

            $table->integer('questionario_id')->unsigned();
            $table->foreign('questionario_id')->references('id')->on('questionarios')->onDelete('restrict');
            $table->string('questao');
            $table->enum('tipo', array('curso', 'objetiva'))->default('objetiva');

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
        Schema::drop('questionario_questoes');
    }
}
