@extends('gestor._layouts.base')
@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <h3>Relatório de faltas por dia</h3>
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> Filtros
            </h3>
        </div>

        <div class="panel-body">

                {!! Form::open(
                [
                    'route' => ['gestor.relatorios.alunos_faltosos_por_dia'],
                    'method' => 'get',
                    'id' => 'form-update',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}

            <div class="form-group">
                <label class="col-sm-2 control-label">Tipo de faltas <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    <input type="radio" name="tipo_falta" value="falta_completa"checked> 100% falta </br>
                    <input type="radio" name="tipo_falta" value="alguma_falta" > Alguma falta


                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">Data de início <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                        <div class="input-group date" id="datepicker">
                            <!-- datepicker timepicker datetimepicker datetimerangepicker1 datetimerangepicker2-->
                            {!! Form::text('data_inicio',null,
                            [
                                'placeholder'=>'dd/mm/yyyy',
                                'data-date-format' => 'DD/MM/YYYY',
                                'data-inputmask' => "'alias': 'dd/mm/yyyy'",
                                'class'=>'form-control inputmask',
                                'id' => 'data_inicio',
                                'required' => 'required',
                                'value'=>Input::old('data_inicio')
                            ]
                            ) !!}
                            <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Data de término <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                        <div class="input-group date" id="datetimerangepicker1">
                            <!-- datepicker timepicker datetimepicker datetimerangepicker1 datetimerangepicker2-->
                            {!! Form::text('data_termino',null,
                            [
                                'placeholder'=>'dd/mm/yyyy',
                                'data-date-format' => 'DD/MM/YYYY',
                                'data-inputmask' => "'alias': 'dd/mm/yyyy'",
                                'class'=>'form-control inputmask',
                                'id' => 'data_aula',
                                'required' => 'required',
                                'value'=>Input::old('data_termino')
                            ]
                            ) !!}
                            <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                </div>
            </div>

            <div class="text-right">
                @if  (!\Request::query('read'))
                    <button type="submit"
                            id="button-store"
                            class="btn btn-info"
                            data-loading-text="Aguarde...">
                        <i class="fa fa fa-file-word-o"></i> Gerar relatório
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