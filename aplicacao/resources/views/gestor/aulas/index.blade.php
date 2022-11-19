<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="{{ URL::route('gestor.aulas.create') }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Adicionar Novo"
                   class="btn btn-primary">
                    <i class="fa fa-plus"></i>
                </a>
            </div>
            <h3>Aulas</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem</h3>
        </div>

        <div class="panel-body">

            <form name="frm_search_aulas"
                  id="frm_search_aulas"
                  method="get"
                  action="{{ URL::route('gestor.aulas.index') }}"
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

                        {{--<div class="col-sm-4">
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
                        </div>--}}


                        <div class="col-sm-3">
                            <div class="form-group">
                                <label for="role_id" class="col-sm-2 control-label">Turma </label>

                                {!! Form::select('role_id',
                                $options_role_id,
                                ( \Request::query('role_id') ? \Request::query('role_id') : null),
                                [
                                    'data-placeholder' => 'Todas as Turmas',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'role_id',
                                    'value'=>Input::old('role_id')
                                ]
                            )  !!}
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="form-group">
                                <label for="data_aula" class="col-sm-2 control-label">Data </label>

                                {!! Form::text('data_aula', ( \Request::query('data_aula') ? \Request::query('data_aula') : null),
                                [
                                    'placeholder'=>'dd/mm/yyyy',
                                    'data-date-format' => 'DD/MM/YYYY',
                                    'data-inputmask' => "'alias': 'dd/mm/yyyy'",
                                    'class'=>'form-control inputmask',
                                    'id' => 'data_aula'
                                ]
                                ) !!}

                            </div>
                        </div>

                        <div class="col-sm-5">

                            <div class="form-group">
                                <label for="course_id" class="col-sm-2 control-label">Curso </label>

                                {!! Form::select('course_id',
                                $options_course_id,
                                ( \Request::query('course_id') ? \Request::query('course_id') : null),
                                [
                                    'data-placeholder' => 'Todos os Cursos',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'course_id',
                                    'value'=>Input::old('course_id')
                                ]
                            ) !!}

                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="user_id" class="col-sm-2 control-label">Professor </label>

                                {!! Form::select('user_id',
                                $options_user_id,
                                ( \Request::query('user_id') ? \Request::query('user_id') : null),
                                [
                                    'data-placeholder' => 'Todos os Professores',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'user_id',
                                    'value'=>Input::old('user_id')
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
                            <a href="{{ URL::route('gestor.aulas.index') }}"
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
                        <th style="min-width: 150px">Turma</th>
                        <th>Professor / Curso</th>
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'data_aula', 'Data da Aula') !!}</th>
                    <!--th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'created_at', 'Data de criação') !!}</th>
                            <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'updated_at', 'Data de atualização') !!}</th-->
                        <th width="200" class="text-center">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->turma}}</td>
                            <td>{{$item->professor}}<br/>
                                <small>{{$item->curso}}</small>
                            </td>
                            <td>{{$item->data_aula}}</td>
                        <!--td>{{$item->created_at}}</td>
                                <td>{{$item->updated_at}}</td-->
                            <td class="text-center">
                            <!--a href="{{ URL::route('gestor.aulas.show', [$item->id]) }}?read=true"
                                    id="link-show-{{ $item->id }}"
                                    data-id="{{ $item->id }}"
                                    data-toggle="tooltip" data-placement="top"
                                    title="Visualizar"
                                    class="link-show btn btn-info">
                                    <i class="fa fa-eye"></i>
                                </a-->

                                <a href="{{ URL::route('gestor.aulas.edit', [$item->id]) }}"
                                   id="link-edit-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Editar"
                                   class="link-edit btn btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>


                                <a href="{{ URL::route('gestor.relatorios.relatorios_frequencia_aula', [$item->id]) }}"
                                   id="link-edit-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Relatório"
                                   target="_blank"
                                   class="link-edit btn btn-primary">
                                    <i class="fa fa-file-word-o"></i>
                                </a>

                                <a href="{{ URL::route('gestor.aulas.frequencia', [$item->id]) }}"
                                   id="link-edit-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Frequência"
                                   class="link-edit btn btn-warning">
                                    <i class="fa fa-check-square-o"></i>
                                </a>



                                <a href="{{ URL::route('gestor.aulas.delete', [$item->id]) }}"
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
                {!! $dados->appends(Input::all())->render() !!}
            @else
                @include('gestor._layouts.naoExistemRegistros')
            @endif
        </div>
    </div>
@endsection

@section('scripts')

@endsection