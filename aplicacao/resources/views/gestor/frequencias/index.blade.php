<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:16:44
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="{{ URL::route('gestor.frequencias.create') }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Adicionar Novo"
                   class="btn btn-primary">
                   <i class="fa fa-plus"></i>
                </a>
            </div>
            <h3>Frequência das Aulas</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem</h3>
        </div>

        <div class="panel-body">

            <form name="frm_search_frequencias"
                  id="frm_search_frequencias"
                  method="get"
                  action="{{ URL::route('gestor.frequencias.index') }}"
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
                            <label for="aula_id" class="col-sm-2 control-label">Aula </label>

                            {!! Form::text('aula_id', ( \Request::query('aula_id') ? \Request::query('aula_id') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'aula_id',
                                    'placeholder'=>'',
                                    'value'=>Input::old('aula_id')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="user_id" class="col-sm-2 control-label">Aluno </label>

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
                            <label for="presente" class="col-sm-2 control-label">Presente? </label>

                            {!! Form::text('presente', ( \Request::query('presente') ? \Request::query('presente') : null),
                                [
                                    'class'=>'form-control',
                                    'id' => 'presente',
                                    'placeholder'=>'',
                                    'value'=>Input::old('presente')
                                ]
                            ) !!}
                        </div>--}}
                        
                        {{--<div class="form-group">
                            <label for="created_at" class="col-sm-2 control-label">Data de criação </label>

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
                            <label for="updated_at" class="col-sm-2 control-label">Data de atualização </label>

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
                            <a href="{{ URL::route('gestor.frequencias.index') }}"
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
                            <th>Aula</th>
                            <th>Aluno</th>
                            <th>Presente?</th>
                            <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'created_at', 'Data de criação') !!}</th>
                            <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'updated_at', 'Data de atualização') !!}</th>
                        <th width="150" class="text-center">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                                <td>{{$item->id}}</td>
                                <td>{{$item->aula_id}}</td>
                                <td>{{$item->user_id}}</td>
                                <td>{{$item->presente}}</td>
                                <td>{{$item->created_at}}</td>
                                <td>{{$item->updated_at}}</td>
                            <td class="text-center">
                                <a href="{{ URL::route('gestor.frequencias.show', [$item->id]) }}?read=true"
                                    id="link-show-{{ $item->id }}"
                                    data-id="{{ $item->id }}"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Visualizar"
                                    class="link-show btn btn-info">
                                    <i class="fa fa-eye"></i>
                                </a>

                                <a href="{{ URL::route('gestor.frequencias.edit', [$item->id]) }}"
                                    id="link-edit-{{ $item->id }}"
                                    data-id="{{ $item->id }}"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Editar"
                                    class="link-edit btn btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>

                                <a href="{{ URL::route('gestor.frequencias.delete', [$item->id]) }}"
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