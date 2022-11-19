<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestionarioQuestaoRespostasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questionario_questao_respostas', function (Blueprint $table) {

            $table->increments('id');

            $table->integer('questionario_questao_id')->unsigned();
            $table->foreign('questionario_questao_id')->references('id')->on('questionario_questoes')->onDelete('restrict');

            $table->integer('questionario_alternativa_id')->unsigned()->nullable();
            $table->foreign('questionario_alternativa_id', 'q_q_r_q_alternativa_id_foreign')->references('id')->on('questionario_questao_alternativas')->onDelete('restrict');

            $table->bigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('mdl_user')->onDelete('restrict');

            $table->text('resposta_dissertativa');

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
        Schema::drop('questionario_questao_respostas');
    }
}
