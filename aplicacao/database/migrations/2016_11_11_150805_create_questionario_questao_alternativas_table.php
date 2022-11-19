<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestionarioQuestaoAlternativasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questionario_questao_alternativas', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('questionario_questao_id')->unsigned();
            $table->foreign('questionario_questao_id', 'q_q_a_q_q_id_foreign')->references('id')->on('questionario_questoes')->onDelete('restrict');

            $table->string('alternativa');
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
        Schema::drop('questionario_questao_alternativas');
    }
}
