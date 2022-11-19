@extends('gestor._layouts.base')
@section('main')

    <div class="warper container-fluid">

        <div class="col-md-12">

            <div class="panel panel-default">
                <div class="panel-heading">Relatório de certificados de alunos por instituiçao</div>
                <div class="panel-body">

                    <table class="table no-margn">
                        <tbody>
                        <tr>
                            <td>
                                <a href="{{ route('gestor.relatorios.relatorios_certificado_de_aluno_por_instituicao') }}"
                                   class="" target="_blank">Todas</a>
                            </td>
                            <td>

                            </td>
                        </tr>
                        @foreach($instituicoes as $instituicao)
                            <tr>
                                <td>
                                    <a href="{{ route('gestor.relatorios.relatorios_certificado_de_aluno_por_instituicao', ['instituicao' => empty($instituicao->institution) ? 0 : $instituicao->institution]) }}"
                                       class="" target="_blank">
                                        {{ empty($instituicao->institution) ? 'Não Localizados' : $instituicao->institution }}
                                    </a>
                                </td>
                                <td class="text-right">
                                    {{ $instituicao->qtd }}
                                </td>
                            </tr>
                        @endforeach

                        <tr>
                            <td>
                                Total de instituições: {{ count($instituicoes) }}
                            </td>
                            <td class="text-right">
                                Total de alunos: {{ $total }}
                            </td>
                        </tr>

                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </div>
@stop