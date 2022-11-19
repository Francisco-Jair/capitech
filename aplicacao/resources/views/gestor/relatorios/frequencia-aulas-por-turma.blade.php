@extends('gestor._layouts.base')
@section('main')

    <div class="warper container-fluid">

        <div class="col-md-12">

            <div class="panel panel-default">
                <div class="panel-heading">{{ strtoupper('RELATÓRIO DE FREQUÊNCIA DA ' . $aula->role->name
                    . ' NO ' . $aula->course->fullname . ' em ' . $aula->data_aula) }} </div>
                <div class="panel-body">

                    <table class="table no-margin">
                        <tbody>
                        <tr>

                            <td>
                                <a href="{{ route('gestor.relatorios.relatorios_turma_turno_modulo', [$aula->id, 'completo']) }}" class="" target="_blank">Relatório de presenças e faltas</a>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <a href="{{ route('gestor.relatorios.relatorios_turma_turno_modulo', [$aula->id, 'faltas']) }}" class="" target="_blank">Relatório de 100% Faltas </a>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <a href="{{ route('gestor.relatorios.relatorios_turma_turno_modulo', [$aula->id, 'presenca_completo']) }}" class="" target="_blank">Relatório de 100% Presença </a>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <a href="{{ route('gestor.relatorios.relatorios_turma_turno_modulo', [$aula->id, 'presenca_meia']) }}" class="" target="_blank">Relatório de 50% Presença </a>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <a href="{{ route('gestor.relatorios.relatorio_assinatura_alunos', ['turma' => $aula->role->id, 'aula' => $aula->id ]) }}" class="" target="_blank"> Relatório de frequência </a>
                            </td>
                        </tr>



                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
@stop