<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:29:55
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.create') }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Adicionar Novo"
                   class="btn btn-primary">
                   <i class="fa fa-plus"></i>
                </a>
            </div>
            <h3>Numeros para Envio de Sms</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem</h3>
        </div>

        <div class="panel-body">

            <form name="frm_search_sms_mensagem_lote_numeros"
                  id="frm_search_sms_mensagem_lote_numeros"
                  method="get"
                  action="{{ URL::route('gestor.sms_mensagem_lote_numeros.index') }}"
                  role="form">

                <div class="well">
                    <div class="row">
                        
                        {{--<div class="form-group">
                            <label for="id" class="col-sm-2 control-label">#ID </label>

                            {!! Form::text('id', ( \Request::query('id') ? \Request::query('id') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'id',
                                    'placeholder'=>'',
                                    'value'=>Input::old('id')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="sms_mensagem_lote_id" class="col-sm-2 control-label">Mensagem </label>

                            {!! Form::text('sms_mensagem_lote_id', ( \Request::query('sms_mensagem_lote_id') ? \Request::query('sms_mensagem_lote_id') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'sms_mensagem_lote_id',
                                    'placeholder'=>'',
                                    'value'=>Input::old('sms_mensagem_lote_id')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="user_id" class="col-sm-2 control-label">Usuario </label>

                            {!! Form::text('user_id', ( \Request::query('user_id') ? \Request::query('user_id') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'user_id',
                                    'placeholder'=>'',
                                    'value'=>Input::old('user_id')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="numero" class="col-sm-2 control-label">Numero </label>

                            {!! Form::text('numero', ( \Request::query('numero') ? \Request::query('numero') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'numero',
                                    'placeholder'=>'',
                                    'value'=>Input::old('numero')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="created_at" class="col-sm-2 control-label">Data de cria????o </label>

                            {!! Form::text('created_at', ( \Request::query('created_at') ? \Request::query('created_at') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'created_at',
                                    'placeholder'=>'',
                                    'value'=>Input::old('created_at')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="updated_at" class="col-sm-2 control-label">Data de atualiza????o </label>

                            {!! Form::text('updated_at', ( \Request::query('updated_at') ? \Request::query('updated_at') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'updated_at',
                                    'placeholder'=>'',
                                    'value'=>Input::old('updated_at')
                                ]
                            ) !!}
                        </div>--}}
                        

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
                            <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.index') }}"
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
                            <th>Mensagem</th>
                            <th>Usuario</th>
                            <th>Numero</th>
                            <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'created_at', 'Data de cria????o') !!}</th>
                            <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'updated_at', 'Data de atualiza????o') !!}</th>
                        <th width="150" class="text-center">A????es</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                                <td>{{$item->id}}</td>
                                <td>{{$item->sms_mensagem_lote_id}}</td>
                                <td>{{$item->user_id}}</td>
                                <td>{{$item->numero}}</td>
                                <td>{{$item->created_at}}</td>
                                <td>{{$item->updated_at}}</td>
                            <td class="text-center">
                                <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.show', [$item->id]) }}?read=true"
                                    id="link-show-{{ $item->id }}"
                                    data-id="{{ $item->id }}"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Visualizar"
                                    class="link-show btn btn-info">
                                    <i class="fa fa-eye"></i>
                                </a>

                                <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.edit', [$item->id]) }}"
                                    id="link-edit-{{ $item->id }}"
                                    data-id="{{ $item->id }}"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Editar"
                                    class="link-edit btn btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>

                                <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.delete', [$item->id]) }}"
                                   id="link-delete-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Remover"
                                   class="link-delete btn btn-danger">
                                    <i class="fa fa-trash-o"></i>
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