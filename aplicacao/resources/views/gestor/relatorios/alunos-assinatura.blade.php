@extends('gestor._layouts.base')
@section('main')

    <div class="warper container-fluid">

        <div class="col-md-12">

            <div class="panel panel-default">
                <div class="panel-heading">Relatório de alunos para assinatura</div>
                <div class="panel-body">

                    <table class="table no-margn">
                        <tbody>
                        <tr>
                            <td>
                                <a href="{{ route('gestor.relatorios.relatorio_assinatura_alunos') }}" class="" target="_blank">Todas</a>
                            </td>
                        </tr>
                        @foreach($turmas as $turma)
                            <tr>
                                <td>
                                    <a href="{{ route('gestor.relatorios.relatorio_assinatura_alunos', ['turma' => $turma->id]) }}" class="" target="_blank">{{ $turma->name }}</a>
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
@stop