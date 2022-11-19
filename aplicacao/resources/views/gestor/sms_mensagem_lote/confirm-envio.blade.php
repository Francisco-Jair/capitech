<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:27:51
 */

?>

@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                @if  (\Request::query('read'))
                    <a href="{{ URL::route('gestor.sms_mensagem_lote.edit', [$item->id]) }}"
                       id="link-enable-edit"
                       data-toggle="tooltip" data-placement="top"
                       title="Editar esse registro"
                       class="btn btn-primary">
                        <i class="glyphicon glyphicon-edit"></i>
                    </a>
                @elseif(isset($item->id))
                    <a href="{{ URL::route('gestor.sms_mensagem_lote.edit', [$item->id]) }}?read=true"
                       id="link-cancel-edit"
                       data-toggle="tooltip" data-placement="top"
                       title="Visualizar esse registro"
                       class="btn btn-info">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </a>
                @endif

                <a href="{{ URL::route('gestor.sms_mensagem_lote.index') }}"
                   id="link-index"
                   data-toggle="tooltip" data-placement="top"
                   title="Listar tudo"
                   class="btn btn-primary link-index">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>Mensagens em Lote</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">

            </h3>
        </div>

        <div class="panel-body">

                {!! Form::open( [
                    'route' => ['gestor.sms_mensagem_lote.enviar_sms'],
                    'method' => 'post',
                    'id' => 'form-destroy',
                    'class' => 'form-horizontal',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}



                <h4>
                    <strong>Tem certeza que deseja enviar esta mensagem?  </strong></br>  <br />

                    {{ $item->mensagem  }}
                </h4>
                <br />



                    <h4>Digite a senha de envio: </h4>
            <div class="form-group">
                    <div class="col-sm-7">
                        <p class="form-control-static">
                            <input type="password" name="senha">
                        </p>
                    </div>
                </div>
                <br />
                <div class="text-right">
                    <input type="hidden" name="id" value="{{ $item->id }}">
                    <button type="submit" class="btn btn-primary pull-left"
                            id="button-confirm-destroy"
                            data-loading-text="Aguarde...">
                        <span class="fa fa-trash-o"></span> Confirmar Envio
                    </button>
                </div>
                {!! Form::close() !!}

    </div>

@endsection

@section('scripts')
    
@endsection