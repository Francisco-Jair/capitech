@extends('gestor._layouts.base')
@section('main')

    <div class="page-header">
        <h1>Bem vindo  {{ Session::get('_nome_') }}
            <small></small>
        </h1>
    </div>

    <div class="warper container-fluid">

        <div class="col-md-12">

            <div class="panel panel-default">
                <div class="panel-heading">Últimos alunos matriculados</div>
                <div class="panel-body">

                    <table class="table no-margn">
                        <thead>
                        <tr>

                            <th>Nome</th>
                            <th>E-mail</th>
                            <th>Curso</th>
                            <th>Criado em:</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($ultimos_alunos_cadastrados as $item)
                            <tr class="active">
                                <td><?=$item->firstname . ' ' . $item->lastname?></td>
                                <td><?=$item->email?></td>
                                <td><?=$item->course?></td>
                                <td><?=Carbon\Carbon::parse($item->created_at)->format('d/m/Y');?></td>

                            </tr>
                        @endforeach

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="col-md-6">

            <div class="panel panel-default">
                <div class="panel-heading">Professores por turma</div>
                <div class="panel-body">

                    <table class="table no-margn">
                        <thead>
                        <tr>

                            <th>Nome</th>
                            <th>Curso</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($professores as $item)
                            <tr class="active">
                                <td><?=$item->firstname . ' ' . $item->lastname?></td>
                                <td><?=$item->course?></td>

                            </tr>
                        @endforeach

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <div class="col-md-6">

            <div class="panel panel-default">
                <div class="panel-heading">Últimos alunos Faltosos</div>
                <div class="panel-body">

                    <table class="table no-margn">
                        <thead>
                        <tr>

                            <th>Curso</th>
                            <th>Aluno</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if(!empty($faltas))
                            @foreach($faltas as $item)
                                <tr class="active">
                                    <td><?= $item->aula->course->shortname ?></td>
                                    <td><?= $item->usuario->firstname?></td>

                                </tr>
                            @endforeach
                        @else
                            <tr class="active">
                                <td>Não existe resultados</td>
                                <td></td>

                            </tr>
                        @endif

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
@stop