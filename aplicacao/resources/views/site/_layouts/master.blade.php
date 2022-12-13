<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>CAPTEC - Capacitações e Treinamentos</title>
    <meta name="keywords"
          content="CAPTEC, solução Online e Offline, INFATEC, Capacitações e Treinamentos, EAD, ambiente AVA, Ambiente Virtual de Aprendizado, Educação de Ensino à Distância, Rupert Brasil Lustosa">
    <meta name="description"
          content="CAPTEC – Capacitações e Treinamentos, é uma plataforma tecnológica de EAD (Educação de Ensino à Distância) em um ambiente AVA (Ambiente Virtual de Aprendizado) que contém material didático de ensino, controle de frequência através de uma solução que funciona Online e Offline e emissão de certificado digital para modalidade de ensino a distância e também presencial.">
    <meta name="robots" content="index, follow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Rupert Brasil Lustosa">
    <meta name="csrf-token" content="{{ csrf_token() }}"/>

    <meta http-equiv="pragma" content="no-cache">
    <meta content="1" name="revisit-after">
    <meta content="General" name="rating">

    <!--link rel="alternate" type="application/rss+xml" title="RSS - Zero" href="http://sistemacaptec.com.br/feed.rss"-->
    <link rel="shortcut icon" href="{{  asset('site/img/favicon.ico') }}">
    <link rel="stylesheet" type="text/css" href="{{  asset('site/css/responsive.css') }}">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="{{  asset('site/js/html5shiv.min.js') }}"></script>
    <script src="{{  asset('site/js/respond.min.js') }}"></script>

    <!-- InputMask -->
    <script src="{{ url('/') }}/admin/assets/js/plugins/inputmask/jquery.inputmask.bundle.js"></script>


    <script src="{{ url('/') }}/admin/assets/js/plugins/jquery.maskedinput.js" type="text/javascript"></script>


    <![endif]-->
</head>

<body>

<header id="header">
    <div class="container">
        <div class="row navbar">
            <div class="col-sm-5 col-logo">
                <a href="" id="logo">
                    <img src="{{  asset('site/img/logo.png') }}">
                </a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false" aria-controls="menu">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="col-sm-7">
                <nav id="menu" class="collapse navbar-collapse">
                    <a href="{{ url('/') }}" class="item">Home</a>
                    <a href="{{ url('/eventos') }}" class="item">Eventos</a>
                    <span class="separator hidden-xs"></span>
                    <a href="{{ url('gestor') }}" class="login"><span
                                class="glyphicon glyphicon-cog"></span> Gestor</a>
                    <a href="http://www.captecmoodle.com.br" class="login"><span
                                class="glyphicon glyphicon-user"></span> Login</a>

                    <a href="{{ route('site.duvidas') }}" class="login"><span
                                class="glyphicon glyphicon-exclamation-sign"></span> Dúvidas</a>
                </nav>
            </div>
        </div>
    </div>
</header><!-- end #header -->

@yield('content')

<section id="footer">
    <div class="container">

        <div class="row">
            <div class="col-sm-12 text-center">
                Desenvolvido por <a href="http://www.infatec.net.br/" target="_blank">INFATEC - Soluções Tecnológicas</a>
            </div>
        </div>

    </div>
</section>

<script src="{{  asset('site/js/plugins.js') }}"></script>
<script src="{{  asset('site/js/scripts.js') }}"></script>


<script>

    $('.mascara_telefone').focusout(function () {
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if (phone.length > 10) {
            element.mask("(99) 99999-999?9", {placeholder: " "});
        } else {
            element.mask("(99) 9999-9999?9", {placeholder: " "});
        }
    }).trigger('focusout');

    $(".mascara_cpf").mask("999.999.999-99", {placeholder: " "});


</script>

</body>

</html>