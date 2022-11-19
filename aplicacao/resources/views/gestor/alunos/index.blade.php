<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="{{ URL::route('gestor.alunos.create') }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Adicionar Novo"
                   class="btn btn-primary">
                    <i class="fa fa-plus"></i>
                </a>
            </div>
            <h3>Alunos</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem</h3>
        </div>

        <div class="panel-body">

            <form name="frm_search_alunos"
                  id="frm_search_alunos"
                  method="get"
                  action="{{ URL::route('gestor.alunos.index') }}"
                  role="form">

                <div class="well">
                    <div class="row">

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
                                        'placeholder'=>'Nome, CPF ou e-mail',
                                        'value'=>Input::old('termo')
                                    ]
                                ) !!}
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="termo" class="col-sm-2 control-label">Turma </label>

                                {!! Form::select('role_id',
                                ( isset($options_role_id) ? $options_role_id : ['0'=>'Selecione um registro']),
                                ( \Request::query('role_id') ? \Request::query('role_id') : null),
                                [
                                    'data-placeholder' => 'Todas as Turmas',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'role_id',
                                    'value'=>Input::old('role_id')
                                ]
                            ) !!}
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
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'nome', 'Nome') !!}</th>
                        <th>Contatos</th>
                        <th>Turma</th>
                        <!--th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'created_at', 'Data de criação') !!}</th-->
                        <th width="150" class="text-center">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>
                                {{$item->username}}
                            </td>
                            <td>
                                {{$item->firstname}} {{$item->lastname}}<br />
                                <small>&raquo; {{$item->institution}}</small>
                            </td>
                            <td>
                                {{$item->email}}<br/>
                                <small>
                                    Telefone: {{$item->phone1}}<br/>
                                    Celular: {{$item->phone2}}
                                </small>
                            </td>
                            <td>{{$item->name}}</td>
                            <!--td>{{$item->created_at}}</td-->
                            <td class="text-center">
                                <a href="{{ URL::route('gestor.alunos.show', [$item->id]) }}?read=true"
                                   id="link-show-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Visualizar"
                                   class="link-show btn btn-info">
                                    <i class="fa fa-eye"></i>
                                </a>

                                <a href="{{ URL::route('gestor.alunos.edit', [$item->id]) }}"
                                   id="link-edit-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Editar"
                                   class="link-edit btn btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>

                                <!--a href="{{ URL::route('gestor.alunos.delete', [$item->id]) }}"
                                   id="link-delete-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Remover"
                                   class="link-delete btn btn-danger">
                                    <i class="fa fa-trash-o"></i>
                                </a-->

                                <!--a href="{{ URL::route('gestor.alunos.unenrolUsers', [$item->id]) }}"
                                   id="link-unenrolUsers-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Remover Matrículas desse Aluno"
                                   class="link-unenrolUsers btn btn-danger">
                                    <i class="fa fa-remove"></i>
                                </a-->
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