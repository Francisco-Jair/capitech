@extends('site._layouts.master')
@section('content')



    <section class="header-course">
        <div class="container">

            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li><a href="{{ url('/eventos') }}">Eventos</a></li>
                <li class="active">CAPtec de Senador Alexandre Costa - MA</li>
            </ol>

            <div class="row">
                <div class="col-sm-12">
                    <h1><strong style="font-size: 50px;">CAPtec</strong><br> de Senador Alexandre Costa - MA</h1>
                </div>
            </div>

        </div>
    </section>

    <section class="content">
        <div class="container">

            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-4"><img src="{{ asset('site/photos/senador/CapaEventoSite.jpg') }}" style="width: 100%;"></div>
                        <div class="col-sm-8">
                            <p>A Prefeitura Municipal de Senador Alexandre Costa por meio da Secretaria Municipal de Educação - SEMEDUC apresenta a Formação em Educação Infantil - CAPTEC, objetivando o aprimoramento das práticas pedagógicas de leitura e escrita de forma lúdica, explorando as múltiplas linguagens da Educação Infantil.</p>
                        </div>
                    </div>

                    <hr>

                    <div id="event-carousel">
                        <a href="{{ asset('site/photos/senador/senador-2.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-2-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/senador/senador-3.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-3-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/senador/senador-4.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-4-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/senador/senador-5.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-5-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/senador/senador-6.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-6-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/senador/senador-7.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-7-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/senador/senador-8.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/senador/senador-8-thumb.jpg') }}"></a>
                    </div>

                    <hr>

                    <div class="row">

                        <div class="col-sm-12 box-course timeline text-center">
                            <h2 class="box-title-course">Módulos de formadores</h2>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-sm-12 table-responsive">
                            <table class="table table-modules table-striped">
                                <tr class="title">
                                    <th width="100"></th>
                                    <th><strong>Módulo I</strong></th>
                                    <th><strong>Módulo II</strong></th>
                                    <th><strong>Módulo III</strong></th>
                                    <th><strong>Módulo IV</strong></th>
                                </tr>

                                <tr>
                                    <th>Educação Infantil</th>
                                    <td><p>Linguagem Oral e Escrita</p>
                                        <i>Heloisa Varão</i>
                                    </td>
                                    <td><p>Desenvolvimento Infantil</p>
                                        <i>Deys Santana</i>
                                    </td>
                                    <td><p>Corpo, Gestos e Movimento</p>
                                        <i>Deys Santana</i>
                                    </td>
                                    <td><p>Organização do Trabalho Pedagógico</p>
                                        <i>Heloisa Varão</i>
                                    </td>
                                </tr>

                                <tr>
                                    <th>Ensino Fundamental 4º ao 5º ano</th>
                                    <td><p>Prática Pedagógica</p>
                                        <i>Angelica Frazão</i>
                                    </td>
                                    <td><p>Avaliação Externa</p>
                                        <i>Angelica Frazão</i>
                                    </td>
                                    <td><p>Matriz de Referências e Elaboração de Ítens</p>
                                        <i>Angelica Frazão</i>
                                    </td>
                                    <td><p>Organização do Trabalho Pedagógico</p>
                                        <i>Angelica Frazão</i>
                                    </td>
                                </tr>

                                <tr>
                                    <th>Ensino Fundamental 1º ao 3º ano</th>
                                    <td><p>Alfabetização e Letramento</p>
                                        <i>Lina de Kassia de Mattos Menezes</i>
                                    </td>
                                    <td><p>Avaliação Externa</p>
                                        <i>Heloisa Varão</i>
                                    </td>
                                    <td><p>Matriz de Referências e Elaboração de Ítens</p>
                                        <i>Heloisa Varão</i>
                                    </td>
                                    <td><p>Organização do Trabalho Pedagógico</p>
                                        <i>Lina de Kassia de Mattos Menezes</i>
                                    </td>
                                </tr>

                                <tr>
                                    <th>Língua Portuguesa 6º ao 9º ano</th>
                                    <td><p>Prática Pedagógica</p>
                                        <i>Deys Santana</i>
                                    </td>
                                    <td><p>Avaliação Externa</p>
                                        <i>Maria Laetitia Araújo</i>
                                    </td>
                                    <td><p>Matriz de Referências e Elaboração de Ítens</p>
                                        <i>Maria Laetitia Araújo</i>
                                    </td>
                                    <td><p>Organização do Trabalho Pedagógico</p>
                                        <i>Maria Laetitia Araújo</i>
                                    </td>
                                </tr>

                                <tr>
                                    <th>Matemática 6º ao 9º ano</th>
                                    <td><p>Prática Pedagógica</p>
                                        <i>Alvimar dos Santos Araújo</i>
                                    </td>
                                    <td><p>Avaliação Externa</p>
                                        <i>Alvimar dos Santos Araújo</i>
                                    </td>
                                    <td><p>Matriz de Referências e Elaboração de Ítens</p>
                                        <i>Alvimar dos Santos Araújo</i>
                                    </td>
                                    <td><p>Organização do Trabalho Pedagógico</p>
                                        <i>Alvimar dos Santos Araújo</i>
                                    </td>
                                </tr>

                            </table>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <a href="http://ava.sistemacaptec.com.br/" class="btn btn-block btn-custom">Acesse o AMBIENTE VIRTUAL</a>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>

@endsection
