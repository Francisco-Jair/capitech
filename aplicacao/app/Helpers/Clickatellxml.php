<?php


namespace App\Helpers;


class Clickatellxml
{

	private $api_id = "3505833";
	private $user = "Infatec";
	private $password = "fODKNDOPVYeKNM";
	private $session_id;
    public $templateMsg = "Formacao CAPTEC E Infantil: \"Desafios curriculares e uso de tecnologias\" data 12/11/2016, credenc 7:30, Inicio 8:00 Escola Antonio R. Bayma";
	private $batch_id;
	private $contatos;

	/**
	 * @return mixed
	 */
	public function getContatos()
	{
		return $this->contatos;
	}

	/**
	 * @param mixed $contatos
	 */
	public function setContatos($contatos)
	{
		$this->contatos = $contatos;
	}

	/**
	 * @return string
	 */
	private function getApiId()
	{
		return $this->api_id;
	}

	/**
	 * @return mixed
	 */
	private function getBatchId()
	{
		return $this->batch_id;
	}

	/**
	 * @param mixed $batch_id
	 */
	private function setBatchId($batch_id)
	{
		$this->batch_id = $batch_id;
	}


	/**
	 * @return string
	 */
	private function getPassword()
	{
		return $this->password;
	}


	/**
	 * @return mixed
	 */
	private function getSessionId()
	{
		return $this->session_id;
	}

	/**
	 * @param mixed $session_id
	 */
	private function setSessionId($session_id)
	{
		$this->session_id = $session_id;
	}

	/**
	 * @return string
	 */
	private function getTemplateMsg()
	{
		return $this->templateMsg;
	}


	/**
	 * @return string
	 */
	private function getUser()
	{
		return $this->user;
	}


	/*Retorno:
	<clickAPI>
			<authResp>
				<session_id>06b6d36a70adcc2dd90700e4bb3c745f</session_id>
				<sequence_no></sequence_no>
			</authResp>
		</clickAPI>
	*/
	private function processaXmlAuth()
	{
		$xml = "
        <clickAPI>
          <auth>
            <api_id>" . $this->getApiId() . "</api_id>
            <user>" . $this->getUser() . "</user>
            <password>" . $this->getPassword() . "</password>
          </auth>
        </clickAPI>";

		$resultadoEnvio = $this->enviarDados($xml);
		$clickAPI = new \SimpleXMLElement($resultadoEnvio);
		$this->session_id = $clickAPI->authResp->session_id;
	}

	/*
	 * Retorno:
	 *
	<?xml version="1.0"?>
	<clickAPI>
		<startBatchResp>
			<batch_id>8fd4815abd14534cd673b3fef8162204</batch_id>
			<sequence_no></sequence_no>
		</startBatchResp>
	</clickAPI>
	 * */

	private function processaXmlStartBatch()
	{
		date_default_timezone_set('America/Sao_Paulo');
		$delayEmMinutos = 0;
		/*if(\Config::get('app.desabilitaDelayEnvioSms')){

		}
		else {
			if (date('His') > 190000 and date('His') < 235959) {
				$inicio = date('Y-m-d H:i:s');
				$fim = date('Y-m-d') . ' 23:59:59';
				$somarCom = 481;
			} else if (date('His') > 0 and date('His') < 80000) {
				$inicio = date('H:i:s');
				$fim = date('Y-m-d') . ' 08:00:00';
				$somarCom = 1;
			}

			if (isset($somarCom)) {
				$inicioDateTime = new \DateTime($inicio);
				$intervalo = $inicioDateTime->diff(new \DateTime($fim));
				//print $intervalo->format('%H:%I:%S');
				$delayEmMinutos = $intervalo->format('%H') * 60 + $intervalo->format('%I') + $somarCom;
			}
		}*/

		$xml = '
        <clickAPI>
          <startBatch>
            <session_id>' . $this->getSessionId() . '</session_id>
            <template>' . $this->getTemplateMsg() . '</template>
            <deliv_time>' . $delayEmMinutos . '</deliv_time>
          </startBatch>
        </clickAPI>
        ';

		$resultadoEnvio = $this->enviarDados($xml);
		$clickAPI = new \SimpleXMLElement($resultadoEnvio);
		$this->batch_id = $clickAPI->startBatchResp->batch_id;
	}

	private function processaXmlSendMsg()
	{
		$conteudo = '
        <clickAPI>';

		foreach ($this->getContatos() as $valores) {
			$conteudo .= '
            <sendItem>
                <session_id>' . $this->getSessionId() . '</session_id>
                <batch_id>' . $this->getBatchId() . '</batch_id>
                <to>+55' . $valores->telefone . '</to>
            </sendItem>';
		}
		$conteudo .= '</clickAPI>
        ';
		//echo $conteudo;

		$resultadoEnvio = $this->enviarDados($conteudo);
		echo $resultadoEnvio;
	}

	private function enviarDados($postData)
	{
		$postData = '?data=' . trim(urlencode($postData));
		$url = 'https://api.clickatell.com/xml/xml' . $postData;

		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HEADER, false);
		/*curl_setopt($ch, CURLOPT_POST, false);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);*/

		$output = curl_exec($ch);

		curl_close($ch);
		return $output;
	}

	public function enviaSms($contatos)
	{
		$this->contatos = $contatos;
		$this->processaXmlAuth();
		$this->processaXmlStartBatch();
		$this->processaXmlSendMsg();
	}
}