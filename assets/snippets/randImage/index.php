<?
include 'classes/libs/mb_utf8.inc.php';
include 'classes/libs/PSS_Abstract_Controller.php';
include 'classes/PSS_Gallery_Controller.php';
include 'classes/libs/PSS_Translit.php';
include 'classes/libs/PSS_Utils_File.php';
include 'classes/libs/PSS_Utils_String.php';
include 'classes/libs/PSS_Utils_Image.php';

$controller = new PSS_Gallery_Controller($modx);
$controller->setModx($modx);
$controller->setTplFolder(MODX_BASE_PATH."assets/widgets/pss_gallery/templates/");
$controller->setLangsFolder(MODX_BASE_PATH."assets/widgets/pss_gallery/lang/");
$controller->loadLangs();
$controller->handleRequest();
