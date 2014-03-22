<?
header("Content-Type: text/html; charset=utf-8");

define('MODX_MANAGER_PATH', $_SERVER['DOCUMENT_ROOT'].'/manager/');//relative path for manager folder
define('IN_MANAGER_MODE', true);
define('MODX_API_MODE', true); 

require_once(MODX_MANAGER_PATH . 'includes/config.inc.php');//config

startCMSSession();

require_once(MODX_MANAGER_PATH .'/includes/protect.inc.php'); 
include_once(MODX_MANAGER_PATH.'/includes/document.parser.class.inc.php'); 

global $modx;

$modx = new DocumentParser;
$modx->db->connect();  
$modx->getSettings(); 

$info = $modx->userLoggedIn();
 
if($info['loggedIn']) {
    include 'index.php';
} else {
    echo "NOT LOGIN";
}