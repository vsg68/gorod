<?
define("PSS_GALLERY_WIDGET_PATH",MODX_BASE_PATH."assets/widgets/pss_gallery/");
define("PSS_BASE_PATH",MODX_BASE_PATH."assets/snippets/pss_gallery/");
include PSS_GALLERY_WIDGET_PATH.'classes/libs/PSS_Abstract_Controller.php';
include PSS_GALLERY_WIDGET_PATH.'classes/libs/PSS_Utils_Image.php';
include PSS_BASE_PATH.'classes/PSS_Gallery_Controller.php';
include PSS_BASE_PATH.'classes/My_Gallery_Controller.php';

$pss_gallery_config['type'] = (isset($type)) ? $type : "lightbox";
$pss_gallery_config['itemTpl'] = (isset($itemTpl)) ? $itemTpl : null;
$pss_gallery_config['emptyShow'] = (isset($emptyShow)) ? $emptyShow : true;
$pss_gallery_config['countImages'] = (isset($countImages)) ? $countImages : null;
$pss_gallery_config['emptyTpl'] = (isset($emptyTpl)) ? $emptyTpl : null;
$pss_gallery_config['imgClass'] = (isset($imgClass)) ? $imgClass : "";
$pss_gallery_config['hrefClass'] = (isset($hrefClass)) ? $hrefClass : "";
$pss_gallery_config["sortBy"] = (isset($sortBy)) ? $sortBy : "position"; //name,position,dateUpload
$pss_gallery_config["order"] = (isset($order)) ? $order : "asc"; //asc,desc
$pss_gallery_config["thumbnailWidth"]  = (isset($thumbnailWidth)) ? $thumbnailWidth : null;
$pss_gallery_config["thumbnailHeight"] = (isset($thumbnailHeight)) ? $thumbnailHeight : null;
$pss_gallery_config["galleryWidth"]  = (isset($galleryWidth)) ? $galleryWidth : 800;
$pss_gallery_config["galleryHeight"] = (isset($galleryHeight)) ? $galleryHeight : 600;
$pss_gallery_config["docId"] = (isset($docId)) ? $docId : null;
$pss_gallery_config["startID"] = (isset($startID)) ? $startID : null;
$pss_gallery_config["randPreview"] = (isset($randPreview)) ? $randPreview : null;


$controller = new My_Gallery_Controller($pss_gallery_config);
$controller->setModx($modx);
$controller->setTplFolder(MODX_BASE_PATH."assets/snippets/pss_gallery/templates/");
$controller->setLangsFolder(MODX_BASE_PATH."assets/snippets/pss_gallery/lang/");
$controller->loadLangs();
$controller->draw();
