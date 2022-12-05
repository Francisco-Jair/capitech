<?php // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost = 'localhost';
$CFG->dbname = 'capacitacoes';
$CFG->dbuser = 'root';
$CFG->dbpass = '123456';
#$CFG->dbname = 'captec_caxias';
#$CFG->dbuser = 'captec_caxias';
#$CFG->dbpass = '5iN?=Z(yuO.M';
$CFG->prefix = 'mdl_';
$CFG->dboptions = array(
	'dbpersist' => 0,
	'dbport' => '',
	'dbsocket' => '',
);


$CFG->wwwroot = 'http://www.captecmoodle.com.br';

$CFG->dataroot = __DIR__ . '/../moodledata/';
$CFG->admin = 'admin';

$CFG->directorypermissions = 0777;

require_once(dirname(__FILE__) . '/lib/setup.php');


// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
