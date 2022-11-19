<?php
session_start();
error_reporting(-1);
ini_set("display_errors", 1);

class gitpull
{
	public function __construct()
	{
		if (!isset($_SESSION['login_ativo'])) {
			$this->montaLogin();
			$this->verificaSeLogar();
		} else if ($_SESSION['login_ativo'] == true) {
			$output = shell_exec("git pull");

			echo "<pre>";
			print_r( $output );

		}
	}

	private function montaLogin()
	{
		?>
		<form method="post" action="" autocomplete="off">
			<input name="login" id="login">
			<input name="senha" id="senha" type="password">
			<input type="submit">
		</form>
		<?
	}

	private function verificaSeLogar()
	{
		if (isset($_POST['login']) and $_POST['login'] == 'rupert.lustosa' and $_POST['senha'] == 'CentrinoCore2Duo') {
			$_SESSION['login_ativo'] = true;
			@header('location:gitpull.php');
		}
	}

	private function initHtml()
	{
		return '<!DOCTYPE html>
        <html>
        <head>
            <meta charset="iso-8859-1">
            <title>UPDATE</title>
        </head>

        <body>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">';
	}

	private function endHtml()
	{
		return '</body>

        </html>';
	}
}

new gitpull();