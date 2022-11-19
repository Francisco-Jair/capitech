@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <h3>Etiqueta Personalizada</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> Cadastro
            </h3>
        </div>

        <div class="panel-body">
            {!! Form::open(
            [
                'route' => ['gestor.certificados.etiqueta',2,'0',1],
                'id' => 'form-store',
                'method' => 'get',
                'class' => 'form-horizontal form-save',
                'autocomplete' => 'off',
                'role' => 'form'
            ]) !!}

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


            <div class="form-group">
                <label class="col-sm-2 control-label">Primeira linha <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    {!! Form::text('primeiralinha',null,
                    [
                        'placeholder'=>'',
                        'class'=>'form-control',
                        'id' => 'primeiralinha',
                        'required' => 'required',
                        'value'=>Input::old('primeiralinha')
                    ]
                    ) !!}

                    {!! $errors->first('primeiralinha','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                    <span class="help-block"><small>:message</small></span>') !!}
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">Segunda linha <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    {!! Form::text('segundalinha',null,
                        [
                        'placeholder'=>'',
                        'class'=>'form-control',
                        'id' => 'segundalinha',
                        'required' => 'required',
                        'value'=>Input::old('segundalinha')
                        ]
                    ) !!}

                    {!! $errors->first('segundalinha','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                    <span class="help-block"><small>:message</small></span>') !!}
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">Terceira linha <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    {!! Form::text('terceiralinha',null,
                        [
                        'placeholder'=>'',
                        'class'=>'form-control',
                        'id' => 'segundalinha',
                        'required' => 'required',
                        'value'=>Input::old('terceiralinha')
                        ]
                    ) !!}

                    {!! $errors->first('terceiralinha','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                    <span class="help-block"><small>:message</small></span>') !!}
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">Posição da Etiqueta <span class="obrigatorio">*</span></label>

                <div class="col-sm-1">
                    {!! Form::text('posicao',1,
                        [
                        'placeholder'=>'',
                        'class'=>'form-control',
                        'id' => 'posicao',
                        'required' => 'required',
                        'value'=>Input::old('posicao')
                        ]
                    ) !!}

                    {!! $errors->first('posicao','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                    <span class="help-block"><small>:message</small></span>') !!}
                </div>
            </div>

            <div class="text-right">
                @if  (!\Request::query('read'))
                    <button type="submit"
                            id="button-store"
                            class="btn btn-info"
                            formtarget="_blank"
                            data-loading-text="Aguarde...">
                        <span class="glyphicon glyphicon-floppy-disk"></span> Criar
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