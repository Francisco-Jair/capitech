<?php


namespace App\Classes;


use App\Models\Configuracao;
use GuzzleHttp\Client;

class EnrolUser extends APIConfig
{

	public $function = 'core_enrol_get_enrolled_users';

	public function getEnrolledUsers($courseId)
	{
		$url = $this->uri .
			'&courseid=' . $courseId;

		$client = new Client();
		$response = $client->request('GET', $url);

		$enroledUsers = json_decode($response->getBody());
		return count($enroledUsers);
	}

	public function enrol($turma, $user)
	{
		$this->function = 'enrol_manual_enrol_users';
		$this->setUri();

		$courseids = Configuracao::where('chave', 'codigo_dos_cursos')
			->orderBy('id', 'DESC')
			->first();

		if ($courseids) {
			$courseids = explode(',', $courseids->valor);

			foreach ($courseids as $courseid) {
				$response = $this->client->request('POST', $this->uri, [
					'form_params' => [
						'enrolments' => [
							0 => [
								'roleid' => ($courseid == 10 ? 21 : $turma), // Se o $cursoid for ABERTURA matricular ele na turma ABERTURA
								'userid' => $user,
								'courseid' => $courseid,
							]
						]
					]
				]);
				$resposta = $response->getBody()->getContents();
			}
		}
	}

	public function unenrolUsers($user)
	{
		$this->function = 'enrol_manual_unenrol_users';
		$this->setUri();

		$courseids = Configuracao::where('chave', 'codigo_dos_cursos')
			->orderBy('id', 'DESC')
			->first();

		$resposta = null;

		if ($courseids) {
			$courseids = explode(',', $courseids->valor);

			foreach ($courseids as $courseid) {
				$enrolments[] = [
					'userid' => $user,
					'courseid' => $courseid,
				];
			}
			if (isset($enrolments)) {
				$response = $this->client->request('POST', $this->uri, [
					'form_params' => [
						'enrolments' => $enrolments
					]
				]);
				$resposta = $response->getBody()->getContents();

			}
		}
		return $resposta;
	}

}