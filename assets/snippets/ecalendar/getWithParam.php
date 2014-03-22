<?php
//define('MODX_API_MODE', true);
//include_once(MODX_MANAGER_PATH.'/includes/document.parser.class.inc.php');
//$modx = new DocumentParser();
//
//$modx->db->connect();
//$modx->getSettings();

$params = array('id' => 2,
                'ddate' => $_POST['ddate']
                );

print  $modx->runSnippet('eCalendar',$params);
?>