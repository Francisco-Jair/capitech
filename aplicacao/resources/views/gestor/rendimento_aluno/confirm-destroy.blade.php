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

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                @if  (\Request::query('read'))
                    <a href="{{ URL::route('gestor.rendimento_aluno.edit', [$item->id]) }}"
                       id="link-enable-edit"
                       data-toggle="tooltip" data-placement="top"
                       title="Editar esse registro"
                       class="btn btn-primary">
                        <i class="glyphicon glyphicon-edit"></i>
                    </a>
                @elseif(isset($item->id))
                    <a href="{{ URL::route('gestor.rendimento_aluno.edit', [$item->id]) }}?read=true"
                       id="link-cancel-edit"
                       data-toggle="tooltip" data-placement="top"
                       title="Visualizar esse registro"
                       class="btn btn-info">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </a>
                @endif

                <a href="{{ URL::route('gestor.rendimento_aluno.index') }}"
                   id="link-index"
                   data-toggle="tooltip" data-placement="top"
                   title="Listar tudo"
                   class="btn btn-primary link-index">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>rendimento_aluno</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-trash-o"></i> Remoção do registro #{{ $item->id }}
            </h3>
        </div>

        <div class="panel-body">
            @if  ( count($verificacao) == 0 )
                {!! Form::open( [
                    'route' => ['gestor.rendimento_aluno.destroy', $item->id],
                    'method' => 'delete',
                    'id' => 'form-destroy',
                    'class' => 'form-horizontal',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}
                <h4>
                    <strong>Deseja realmente remover o registro #{{ $item->id  }}?</strong>
                </h4>
                <br />
                <div class="form-group">
                    <label class="col-sm-2 control-label">Identificação: </label>

                    <div class="col-sm-7">
                        <p class="form-control-static">{!! $item->id !!}</p>
                    </div>
                </div>
                <br />
                <div class="text-right">
                    <button type="submit" class="btn btn-danger"
                            id="button-confirm-destroy"
                            data-loading-text="Aguarde...">
                        <span class="fa fa-trash-o"></span> Confirmar Remoção
                    </button>
                </div>
                {!! Form::close() !!}
            @else

                <h5 class="text-danger">
                    <strong>Não é possível remover esse registro devido ao(s) seguinte(s) motivo(s):</strong>
                </h5>
                <h6>Se você está vendo essa mensagem é porque a exclusão não foi implementada!</h6>
                <hr>

                <ul>
                    @foreach($verificacao as $modelRelacionado)
                        <li>{{ $modelRelacionado['mensagem'] }}</li>
                        <ul>
                            @foreach($modelRelacionado['registros'] as $registro)
                                <li>{{ $registro->id }}</li>
                            @endforeach
                        </ul>
                    @endforeach
                </ul>
                <div class="text-right">

                    <a href="{{ URL::route('gestor.rendimento_aluno.index') }}"
                        id="link-index-2"
                        data-toggle="tooltip" data-placement="top"
                        title="Listar tudo"
                        class="btn btn-primary link-index">
                        <i class="glyphicon glyphicon-th-list"></i> Listar Tudo
                    </a>
                </div>
            @endif
        </div>
    </div>

@endsection

@section('scripts')
    
@endsection