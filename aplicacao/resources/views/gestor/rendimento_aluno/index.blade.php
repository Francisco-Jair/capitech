<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 19-12-2016
 * Time: 09:40:37
 */

?>
@extends('gestor._layouts.base')

@section('main')


    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem</h3>
        </div>

        <div class="panel-body">

            <form name="frm_search_rendimento_aluno"
                  id="frm_search_rendimento_aluno"
                  method="get"
                  action="{{ URL::route('gestor.rendimento_aluno.index') }}"
                  role="form">

                <div class="well">
                    <div class="row">

                       &nbsp;&nbsp;&nbsp; Inserir rendimento dos alunos por turma

                    </div>
                </div>
            </form>

            @if ($dados->count())
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                            <th width="50">{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'id', '#ID') !!}</th>
                            <th>Turma</th>

                        <th width="150" class="text-center">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                                <td>{{$item->id}}</td>
                                <td>{{$item->name}}</td>

                            <td class="text-center">
                                <a href="{{ URL::route('gestor.rendimento_aluno.show', [$item->id]) }}?read=true"
                                    id="link-show-{{ $item->id }}"
                                    data-id="{{ $item->id }}"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Inserir Rendimento"
                                    class="link-show btn btn-info">
                                    <i class="fa fa-eye"></i>
                                </a>

                            </td>
                        </tr>
                    @endforeach

                    </tbody>
                </table>
                {!! $dados->render() !!}
            @else
                @include('gestor._layouts.naoExistemRegistros')
            @endif
        </div>
    </div>
@endsection

@section('scripts')

@endsection