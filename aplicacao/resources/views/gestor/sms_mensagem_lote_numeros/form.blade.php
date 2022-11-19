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

                @if(isset($item->id))
                    <a href="{{{ URL::route('gestor.sms_mensagem_lote_numeros.delete', [$item->id]) }}}"
                        id="link-delete"
                        data-toggle="tooltip" data-placement="top"
                        title="Remover"
                        class="btn btn-danger">
                        <i class="fa fa-trash-o"></i>
                    </a>
                @endif

                @if  (\Request::query('read'))
                    <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.edit', [$item->id]) }}"
                        id="link-enable-edit"
                        data-toggle="tooltip" data-placement="top"
                        title="Editar esse registro"
                        class="btn btn-primary">
                        <i class="glyphicon glyphicon-edit"></i>
                    </a>
                @elseif(isset($item->id))
                    <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.edit', [$item->id]) }}?read=true"
                        id="link-cancel-edit"
                        data-toggle="tooltip" data-placement="top"
                        title="Visualizar esse registro"
                        class="btn btn-info">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </a>
                @endif

                <a href="{{ URL::route('gestor.sms_mensagem_lote_numeros.index') }}"
                    id="link-index"
                    data-toggle="tooltip" data-placement="top"
                    title="Listar tudo"
                    class="btn btn-primary">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>Numeros para Envio de Sms</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> {{ \Request::query('read') ? 'Visualização' : (isset($item->id) ? 'Edição' : 'Cadastro') }}
            </h3>
        </div>

        <div class="panel-body">
            @if (isset($item->id))
                {!! Form::open(
                [
                    'route' => ['gestor.sms_mensagem_lote_numeros.update', $item->id],
                    'method' => 'put',
                    'id' => 'form-update',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}
            @else
                {!! Form::open(
                [
                    'route' => 'gestor.sms_mensagem_lote_numeros.store',
                    'id' => 'form-store',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}
            @endif

            @if($errors->any())

                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            @if($errors->count() == 1)
                                Verifique o erro abaixo:
                            @else
                                Verifique os {{ $errors->count() }} erros abaixo:
                            @endif
                        </div>
                    </div>
                </div>

                <!--ul class="alert">
                    <li>Verifique os erros abaixo!</li>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul-->
            @endif



                <div class="form-group {{ $errors->has('sms_mensagem_lote_id') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Mensagem <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->sms_mensagem_lote_id) ? $item->sms_mensagem_lote_id : null) !!}</p>
                        @else
                            {!! Form::select('sms_mensagem_lote_id',
                                ( isset($options_sms_mensagem_lote_id) ? $options_sms_mensagem_lote_id : ['0'=>'Implemente $options_sms_mensagem_lote_id']),
                                ( isset($item->sms_mensagem_lote_id) ? $item->sms_mensagem_lote_id : null),
                                [
                                    'data-placeholder' => 'Selecione um registro',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'sms_mensagem_lote_id',
                                    'value'=>Input::old('sms_mensagem_lote_id')
                                ]
                            ) !!}
                            
                            {!! $errors->first('sms_mensagem_lote_id','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                            <span class="help-block"><small>:message</small></span>') !!}
                        @endif
                    </div>
                </div>
    

                <div class="form-group {{ $errors->has('user_id') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Usuario <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->user_id) ? $item->user_id : null) !!}</p>
                        @else
                            {!! Form::select('user_id',
                                ( isset($options_user_id) ? $options_user_id : ['0'=>'Implemente $options_user_id']),
                                ( isset($item->user_id) ? $item->user_id : null),
                                [
                                    'data-placeholder' => 'Selecione um registro',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'user_id',
                                    'value'=>Input::old('user_id')
                                ]
                            ) !!}
                            
                            {!! $errors->first('user_id','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                            <span class="help-block"><small>:message</small></span>') !!}
                        @endif
                    </div>
                </div>
    

                <div class="form-group {{ $errors->has('numero') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Numero <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->numero) ? $item->numero : null) !!}</p>
                        @else
                            {!! Form::text('numero', ( isset($item->numero) ? $item->numero : null),
                            [
                                'placeholder'=>'',
                                'class'=>'form-control',
                                'id' => 'numero',
                                'value'=>Input::old('numero')
                            ]
                            ) !!}
            
                            {!! $errors->first('numero','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                            <span class="help-block"><small>:message</small></span>') !!}
                        @endif
                    </div>
                </div>
    

            <div class="text-right">
                @if  (!\Request::query('read'))
                    <button type="submit"
                            id="button-store"
                            class="btn btn-info"
                            data-loading-text="Aguarde...">
                        <span class="glyphicon glyphicon-floppy-disk"></span> {{ (isset($item->id) ? 'Salvar' : 'Adicionar') }}
                    </button>
                @endif
            </div>

            {!! Form::close() !!}
        </div>
    </div>
@endsection

@section('scripts')
    <!-- Laravel Javascript Validation -->
    <script type="text/javascript" src="{{ url('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
    {!! JsValidator::formRequest('App\Http\Requests\SmsMensagemLoteNumeroRequest') !!}

    <script src="{{ url('/') }}/ckeditor/ckeditor.js"></script>
    <script src="{{ url('/') }}/admin/assets/js/rlustosa-ckeditor.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
        /*
        $(\'textarea#IdDeAlgumCampo\').maxlength({
            alwaysShow: true,
            threshold: 30,
            warningClass: "label label-info",
            limitReachedClass: "label label-warning",
            placement: \'bottom\',
            message: \'Utilizado %charsTyped% de %charsTotal% caracteres.\'
        });
        // Não esquecer de acrescentar no campo: 'maxlength' => '999',
        */
        console.info('Jquery Ready');
        });
    </script>
@endsection