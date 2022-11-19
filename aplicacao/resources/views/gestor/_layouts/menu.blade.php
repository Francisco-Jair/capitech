<?php

$_mdl_user_id_ = \Session::get('_mdl_user_id_');

if ($_mdl_user_id_ == 0) {
    $menusDeConfiguracoes = collect([
                    ['url' => 'gestor.configuracoes.index', 'label' => 'Configurações Gerais'],
                    ['url' => 'gestor.contato_configuracoes.index', 'label' => 'Configurações de Contato'],
                    ['url' => 'gestor.assuntos.index', 'label' => 'Assuntos do Contato'],
                    ['url' => 'gestor.gestores.index', 'label' => 'Gestores'],
                    ['url' => 'gestor.log_atividades.index', 'label' => 'Log de Atividades'],
                    ['url' => 'gestor.log_login.index', 'label' => 'Log de Login'],
                    ['url' => 'gestor.log_login_errado.index', 'label' => 'Log de Falhas de Login'],
            ]
    );
    $menus[] = ['label' => 'Configurações', 'icone' => 'fa fa-wrench fa-fw', 'menus' => $menusDeConfiguracoes];

    $menusDoSite = collect([
                    ['url' => 'gestor.alunos.index', 'label' => 'Alunos'],
                    ['url' => 'gestor.certificados.index', 'label' => 'Certificados e Etiquetas'],
                    ['url' => 'gestor.etiquetas.index', 'label' => 'Etiquetas Personalizadas'],
                    ['url' => 'gestor.aulas.index', 'label' => 'Aulas'],
                    ['url' => 'gestor.sms_mensagem_lote.index', 'label' => 'SMS em Lote'],
                    ['url' => 'gestor.contatos.index', 'label' => 'Contatos'],
                    ['url' => 'gestor.relatorios.ficha_de_atualizacao_do_aluno', 'label' => 'Ficha de Atualização'],

            ]
    );

    $menus[] = ['label' => 'Site', 'icone' => 'fa fa-puzzle-piece fa-fw', 'menus' => $menusDoSite];

    $menus[] = ['label' => 'Relatórios', 'icone' => 'fa fa-file-word-o', 'menus' => collect([
            ['url' => 'gestor.relatorios.alunos_por_turma', 'label' => 'Alunos por Turma'],
            ['url' => 'gestor.relatorios.alunos_com_informacoes_pendentes', 'label' => 'Alunos com pendências', 'target' => '_blank'],
            ['url' => 'gestor.relatorios.relatorios_de_aluno_sem_telefone', 'label' => 'Alunos sem telefone', 'target' => '_blank'],
            ['url' => 'gestor.relatorios.relatorios_de_aluno_sem_cpf', 'label' => 'Alunos sem CPF', 'target' => '_blank'],
            ['url' => 'gestor.relatorios.relatorios_de_professores', 'label' => 'Relação de Professores', 'target' => '_blank'],

            ['url' => 'gestor.relatorios.view_calendario_professor', 'label' => 'Calendário dos professores'],

            ['url' => 'gestor.relatorios.relatorios_de_aulas_por_turma', 'label' => 'Relação de Aulas', 'target' => '_blank'],
            ['url' => 'gestor.relatorios.matriculas_por_dia', 'label' => 'Matriculas por dia'],
            ['url' => 'gestor.relatorios.view_alunos_faltosos_por_dia', 'label' => 'Faltas por dia'],
            ['url' => 'gestor.relatorios.view_alunos_presentes_por_dia', 'label' => 'Presentes por dia', 'target' => '_blank'],
            ['url' => 'gestor.relatorios.assinatura_alunos', 'label' => 'Assinatura de Alunos'],
            ['url' => 'gestor.relatorios.alunos_por_instituicao', 'label' => 'Alunos por Instituição'],
            ['url' => 'gestor.relatorios.assinatura_alunos_certificado', 'label' => 'Assinatura de Alunos para Certificado'],
            ['url' => 'gestor.relatorios.certificado_alunos_por_instituicao', 'label' => 'Certificados de Alunos por Instituição'],

            //['url' => 'gestor.relatorios.faltosos_por_fim_semana', 'parametros' => [1], 'label' => 'Faltosos - 1º Fim de Semana', 'target' => '_blank'],

    ])];
} else {
    $menusDoSite = collect([
                    ['url' => 'gestor.rendimento_aluno.index', 'label' => 'Rendimento do Aluno'],
            ]
    );

    $menus[] = ['label' => 'Avaliação', 'icone' => 'fa fa-puzzle-piece fa-fw', 'menus' => $menusDoSite];
}

//['url' => 'gestor.relatorios.presentes', 'label' => 'Alunos Presentes por Aula', 'target' => '_blank'],
function substituiUrlDaCollection($value)
{
    $url = str_replace('.', '/', $value['url']);
    return str_replace('/index', '', $url);
}

function converteParaUrl($value)
{
    $link = null;
    $explode = explode("/", $value);
    if (count($explode) >= 2) {
        $link = $explode[0] . "/" . $explode[1];
    }

    return $link;
}

?>

@foreach($menus as $menu)
    <li class="has-submenu
        @if(in_array(converteParaUrl(Route::getCurrentRoute()->getPath()), $menu['menus']->map(function($value) {
            return substituiUrlDaCollection($value);
        })->toArray()) )
            active
        @endif
            ">
        <a href="#"><i class="fa {{ $menu['icone'] }}"></i> <span
                    class="nav-label">{{ $menu['label'] }}</span></a>
        <ul class="list-unstyled">

            @foreach($menu['menus'] as $item)
                <li>
                    <a href="{{ isset($item['parametros']) ? (URL::route($item['url'],$item['parametros'])) : URL::route($item['url']) }}"
                       target="@if(isset($item['target'])) {{ $item['target'] }} @endif"> &raquo; {{--<i class="glyphicon glyphicon-chevron-right">--}}</i> {{ $item['label'] }}</a>
                </li>
            @endforeach
        </ul>
    </li>
@endforeach