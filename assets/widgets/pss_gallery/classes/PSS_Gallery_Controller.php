<?php

class PSS_Gallery_Controller extends PSS_Abstract_Controller {
	
    function PSS_Gallery_Controller(&$modx) {
        parent::__construct($modx); 
    }
    
    public function handleRequest() { 
        $this->install();
        parent::handleRequest(); 
    }
    
    public function install() { 
        if (mysql_num_rows(mysql_query("show tables from {$this->modx->db->config['dbase']} like '%pss_gallery'")) == 0) {  
            $content = file_get_contents(MODX_BASE_PATH."assets/widgets/pss_gallery/sql/pss_gallery.sql");
            $content = str_replace("{TABLE_NAME}",$this->modx->getFullTableName('pss_gallery'),$content);
            $this->modx->db->query($content); 
        }
    } 
    
    public function upload() { 
        include 'pss_gallery_config.php';
        $file = $_FILES["image"]; 
        
        //print_r($file); 
        
        $typesStr = explode(",",$pss_gallery_config["types"]); 

        foreach($typesStr as $type) {
            $supportedImagesFormats[] = "image/".$type;
        } 

        if($file['size'] > 0) {
            if($file['size'] > 1024*$pss_gallery_config["max_image_size"]*1024){
                $error = $this->ph['lang.error.max'];
            } else
            if(!in_array($file['type'],$supportedImagesFormats)) {
                $error = $this->ph['lang.error.format'];
            }
        } else {
              $error = $this->ph['lang.error.min'];
        } 
        
        if(!$error) { 
            $docid = $_REQUEST['docid'];
            
            $file_name = $file['name']; 
            
            if($pss_gallery_config["use_alt_like_file_name"] && $_REQUEST['alt'] && !empty($_REQUEST['alt'])) {
                $path_info = pathinfo($file_name);
                $file_name = PSS_Translit::toTranslit($_REQUEST['alt']); 
                $file_name = $file_name.".".$path_info['extension'];
            } 
            
            $folder = MODX_BASE_PATH."assets/images/gallery/".$docid."/";
            $short_folder = "/assets/images/gallery/".$docid."/";
            if(!file_exists($folder)) {
                mkdir($folder, 0777, true);
                chmod($folder, 0777);
            }
            
            $opts = PSS_Utils_File::buildFileName($folder,$file_name);
            $file_name = $opts["name"];  
        
            $original_file_path = $folder."original_".$file_name;
            
            if (!move_uploaded_file($file['tmp_name'],$original_file_path)) {
                $error = $this->ph['lang.error'];
            } else {
                chmod($original_file_path, 0777); 
                
                PSS_Utils_Image::resizeImage($original_file_path,$folder."min_".$file_name,120,null);
                
                $alt = $this->modx->db->escape($_REQUEST['alt']);
                $title = $this->modx->db->escape($_REQUEST['title']);
                $visible = $this->modx->db->escape($_REQUEST['visible']);
                
                $maxPosition = $this->modx->db->query("SELECT MAX(position) as max_position FROM {$this->modx->getFullTableName('pss_gallery')} WHERE document_id='{$docid}'");
                $maxPosition = $this->modx->db->getRow($maxPosition);  
                $maxPosition = $maxPosition["max_position"];
                
                $fields = array (
                    'alt'     => $alt,
                    'title'   => $title,
                    'position' => $maxPosition + 1,
                    'document_id'   => $this->modx->db->escape($docid),
                    'visible'       => $visible,
                    'file_name'     => $file_name,
                    'url_original_image'  => $short_folder."original_".$file_name,
                    'url_min_image'       => $short_folder."min_".$file_name,
                );   
                
                $id =  $this->modx->db->insert($fields, $this->modx->getFullTableName('pss_gallery'));
                
                $this->ph["data.result"] = "success";
                $this->ph["data.id"] = $id;
                $this->ph["data.src"] = $short_folder."min_".$file_name;
                $this->ph["data.title"] = $id;
                $this->ph["data.alt"] = $alt;
                $this->ph["data.title"] = $title;
                $this->ph["data.visible"] = $visible;
                
                $this->ph["data.message"] = $this->ph["lang.success"]; 
            } 
        } 
        
        if($error) {
            $this->ph["data.result"] = "error";
            $this->ph["data.message"] = $error;
        }
        $this->renderView("xml/file");
    }
    
    public function update() { 
        $imageId = $_POST['imageId'];
        $fields = array (
            'alt'     => htmlspecialchars(stripslashes($_POST['alt'])),
            'title'   => htmlspecialchars(stripslashes($_POST['title'])),
            'visible' => $_POST['visible']
        );
	$this->modx->db->update($fields, $this->modx->getFullTableName('pss_gallery'),"id='$imageId'");
        echo $this->ph['lang.saved'];
    }
    
    public function position() {
        $docid = $_REQUEST['docid'];
        $imageId = $_REQUEST['imageId'];
        $prevId = $_REQUEST['prevId'];
        
        if(!isset($prevId)) {
            $this->modx->db->query("UPDATE {$this->modx->getFullTableName('pss_gallery')} SET position = position + 1 WHERE document_id = $docid");
            $this->modx->db->query("UPDATE {$this->modx->getFullTableName('pss_gallery')} SET position = 1 WHERE document_id = $docid AND id = $imageId");
        } else {
            $prevPosition = $this->modx->db->query("SELECT position FROM {$this->modx->getFullTableName('pss_gallery')} WHERE id='{$prevId}'");
            $prevPosition = $this->modx->db->getRow($prevPosition);  
            $prevPosition = $prevPosition["position"];
            
            $newPosition = $prevPosition + 1;
            
            $this->modx->db->query("
                UPDATE {$this->modx->getFullTableName('pss_gallery')}
                SET position = position + 1 WHERE document_id = $docid AND position > $prevPosition");
            $this->modx->db->query("UPDATE {$this->modx->getFullTableName('pss_gallery')} SET position = {$newPosition} WHERE document_id = $docid AND id = $imageId");
        } 
    }
    
    public function index() { 
        $docid = $_REQUEST['id'];
        if($docid) {
            $rs = $this->modx->db->select('*', $this->modx->getFullTableName('pss_gallery'),"document_id='$docid'","position ASC");
            if ($this->modx->db->getRecordCount($rs) > 0) {
                while ($row = $this->modx->db->getRow($rs)) {
                    $images[] = $row;
                }
            }
            $this->ph["images"] = $images; 
            $this->renderView("index");
        } else {
            $this->renderView("disabled");
        }
    }
    
    public function delete() {
        $imageId = $_REQUEST['imageId'];
        
        if($imageId) {
            $image = $this->modx->db->select('*',$this->modx->getFullTableName('pss_gallery'),"id='$imageId'");
            $image = $this->modx->db->getRow($image);    
            
            //print_r($image);
            
            unlink(MODX_BASE_PATH.substr($image['url_original_image'],1));
            
            if(!empty($image['url_thumbnail_image']) && file_exists(MODX_BASE_PATH.substr($image['url_thumbnail_image'],1))) {
                unlink(MODX_BASE_PATH.substr($image['url_thumbnail_image'],1));
            }
            if(!empty($image['url_gallery_image']) && file_exists(MODX_BASE_PATH.substr($image['url_gallery_image'],1))) {
                unlink(MODX_BASE_PATH.substr($image['url_gallery_image'],1));
            }
            
            unlink(MODX_BASE_PATH.substr($image['url_min_image'],1));
            
            $this->modx->db->delete($this->modx->getFullTableName('pss_gallery'),"id='$imageId'"); 
            echo $this->ph['lang.deleted'];
        }
    }
}