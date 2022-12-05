<?php


namespace App\Classes;


use GuzzleHttp\Client;

abstract class APIConfig
{

	public $baseUrl = '/webservice/rest/server.php';
	public $token = '?wstoken=f490ba2efd3087bfb3d089f5f9be5f08';
	public $format = '&moodlewsrestformat=json';
	public $function = '';

	public $client = null;

	public $uri = '';

	public function __construct()
	{
		$this->client = new Client();

		$file = __DIR__ . '/../../moodle/config.php';
		$url = preg_replace('/[\s\S]+?wwwroot\s+=\s+\'([\s\S]+?)\'\s*;\s*\n[\s\S]+/', '$1', file_get_contents($file));
		$this->baseUrl = $url . $this->baseUrl;
		$this->setUri();

	}

	public function setUri()
	{
		$this->uri = $this->baseUrl . $this->token . $this->format . '&wsfunction=' . $this->function;
	}

}