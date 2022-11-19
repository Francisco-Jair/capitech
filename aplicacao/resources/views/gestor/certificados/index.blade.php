<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 16-11-2015
 * Time: 02:01:11
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="{{ URL::route('gestor.certificados.etiquetas_em_lotes',[2]) }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Etiquetas em lotes"
                   target="_blank"

                   class="btn btn-success">
                    <i class="fa fa-print"></i>&nbsp; ETIQUETAS EM LOTE (A4 99,0 X 25,4)
                </a>

                <a href="{{ URL::route('gestor.certificados.etiquetas_em_lotes',[1]) }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Etiquetas em lotes"
                   target="_blank"

                   class="btn btn-success">
                    <i class="fa fa-print"></i>&nbsp; ETIQUETAS EM LOTE (CARTA 25,4 X 101,6)
                </a>

                <!--a href="{{ URL::route('gestor.certificados.certificados_em_lotes',[1]) }}"

                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Certificados em lotes"
                   target="_blank"

                   class="btn btn-success">
                    <i class="fa fa-print"></i>&nbsp; CERTIFICADOS EM LOTE
                </a-->
            </div>
            <h3>Certificados</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem
                {{--@for($x = 1; $x <= 3; $x++)--}}
                    {{--<a href="{{ URL::route('gestor.certificados.impressao_modelo',[$x]) }}"--}}
                       {{--onclick="if(confirm('Deseja gerar os certificados do lote {{ $x }}?')) return true; else return false;"--}}
                       {{--id="link-create"--}}
                       {{--data-toggle="tooltip" data-placement="top"--}}
                       {{--title="Gerar Certificados do lote {{ $x }}"--}}
                       {{--target="_blank"--}}
                       {{--class="">--}}
                        {{--<i class="fa fa-print"></i>--}}{{--&nbsp; {{ $x }} &nbsp;--}}
                    {{--</a>--}}
                {{--@endfor--}}
            </h3>
        </div>

        <div class="panel-body">

            <div class="well">
                <div class="row">

                    <form name="frm_search_alunos"
                          id="frm_search_alunos"
                          method="get"
                          action="{{ URL::route('gestor.certificados.index') }}"
                          role="form">

                        <div class="col-sm-1">
                            <div class="form-group">
                                <label for="id" class="col-sm-1 control-label">ID </label>

                                {!! Form::text('id', ( \Request::query('id') ? \Request::query('id') : null),
                                    [
                                        'class'=>'form-control',
                                        'id' => 'id',
                                        'placeholder'=>'ID',
                                        'value'=>Input::old('id')
                                    ]
                                ) !!}
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="termo" class="col-sm-2 control-label">Termo </label>

                                {!! Form::text('termo', ( \Request::query('termo') ? \Request::query('termo') : null),
                                    [
                                        'class'=>'form-control',
                                        'id' => 'termo',
                                        'placeholder'=>'',
                                        'value'=>Input::old('termo')
                                    ]
                                ) !!}
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">

                            </div>
                        </div>
                </div>

                <div class="row">
                    <div class="col-sm-12 text-right">
                        <a href="{{ URL::route('gestor.alunos.index') }}"
                           id="link-entrar-pagina"
                           data-toggle="tooltip" data-placement="top"
                           title="Limpar Filtros"
                           class="btn btn-danger"
                           style="margin-right: 5px">
                            <i class="glyphicon glyphicon-home"></i> Limpar Filtros
                        </a>

                        <button type="submit"
                                id="button-filter"
                                data-toggle="tooltip" data-placement="top"
                                title="Filtrar"
                                class="btn btn-primary pull-right">
                            <i class="fa fa-search"></i> Filtrar
                        </button>
                    </div>
                </div>
            </div>
            </form>


            @if ($dados->count())
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'id', '#ID') !!}</th>
                        <th>CPF</th>
                        <th>Primeiro nome</th>
                        <th>Último nome</th>
                        <th>E-mail</th>
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'created_at', 'Data de criação') !!}</th>
                        <th width="150" class="text-center">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->username}}</td>
                            <td>{{$item->firstname}}</td>
                            <td>{{$item->lastname}}</td>
                            <td>{{$item->email}}</td>
                            <td>{{$item->created_at}}</td>
                            <td class="text-center">

                                <a href="{{ URL::route('gestor.certificados.show', [$item->id]) }}?read=true"
                                   id="link-show-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Certificado"
                                   class="link-show btn btn-info">
                                    <i class="fa fa-file-word-o"></i>
                                </a>

                                <a href="{{ URL::route('gestor.certificados.etiqueta', [2, $item->id, 1]) }}"
                                   id="link-show-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Etiqueta A4. Para mudar a posição da impressão, altere o último número para um valor entre 1 e 22"
                                   class="link-show btn btn-info"
                                   target="_blank">
                                    <i class="fa fa-barcode"></i>
                                </a>

                                <a href="{{ URL::route('gestor.certificados.etiqueta', [1, $item->id, 1]) }}"
                                   id="link-show-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Etiqueta Carta. Para mudar a posição da impressão, altere o último número para um valor entre 1 e 20"
                                   class="link-show btn btn-info"
                                   target="_blank">
                                    <i class="fa fa-barcode"></i>
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