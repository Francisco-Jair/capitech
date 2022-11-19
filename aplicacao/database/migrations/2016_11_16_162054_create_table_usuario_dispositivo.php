<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableUsuarioDispositivo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuario_dispositivo', function (Blueprint $table) {
            $table->increments('id');

            $table->bigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('mdl_user')->onDelete('restrict');

            $table->string('device_id');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('usuario_dispositivo');
    }
}
