@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="{{ URL::route('gestor.rendimento_aluno.index') }}"
                   id="link-index"
                   data-toggle="tooltip" data-placement="top"
                   title="Listar tudo"
                   class="btn btn-primary">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>Rendimento da turma {{ $matricula_dos_alunos[0]->role_name }}</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> Edição
            </h3>
        </div>

        <div class="panel-body">
            {!! Form::open(
            [
                'route' => 'gestor.rendimento_aluno.store',
                'id' => 'form-store',
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

                <ul class="alert">
                    <li>Verifique os erros abaixo!</li>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            @endif
            <div class="col-xs-12">
                <div class="panel panel-default">

                    <div class="panel-body">
                        <div class="table-responsive">
                            <span id="erroCheck" class="help-block" style="color: red;text-align: center;font-weight: bold;"></span>
                            <table class="table table-striped tabela-full-middle">
                                <thead>
                                <tr>
                                    <th class="text-left" width="131">Rendimento em %</th>
                                    <th>Nome</th>
                                </tr>
                                </thead>
                                <tbody class="hover-tr-danger">
                                @foreach($matricula_dos_alunos as $aluno)

                                    <tr>
                                        <td>
                                            <input type="text" name="rendimento[{{$aluno->user_id }}]" value="{{ $rendimento_dos_alunos[$aluno->user_id] or '' }}" class="percent" />
                                        </td>
                                        <td>
                                            {{ $aluno->firstname . ' ' . $aluno->lastname }}
                                        </td>


                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-right">

                <input type="hidden" name="role_id" value="{{ $matricula_dos_alunos['0']->role_id }}">
                <input type="hidden" name="course_id" value="{{ $matricula_dos_alunos['0']->course_id }}">
                <button type="submit"
                        id="button-store"
                        class="btn btn-info"
                        data-loading-text="Aguarde...">
                    <span class="glyphicon glyphicon-floppy-disk"></span> Salvar
                </button>
            </div>

            {!! Form::close() !!}
        </div>
    </div>
@endsection

<script src="http://cloud.github.com/downloads/digitalBush/jquery.maskedinput/jquery.maskedinput-1.3.js" type="text/javascript"></script>

@section('scripts')

    <script type="text/javascript">
        $(".percent").mask("9?99");
        $(".percent").on("change", function(){
           valor = parseInt($(this).val());
           if(valor > 100) {
              alert('O valor não pode ser maior que 100')
              $(this).focus().val('');
           }

        });

    </script>
@endsection