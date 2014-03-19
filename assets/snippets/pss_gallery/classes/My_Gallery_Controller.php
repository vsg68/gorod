<?php

class My_Gallery_Controller  extends PSS_Gallery_Controller {

	private $pss_gallery_config;

	function My_Gallery_Controller($pss_gallery_config) {
        $this->pss_gallery_config = $pss_gallery_config;
    }




    private function buildGallery() {

        $twidth  = $this->pss_gallery_config['thumbnailWidth'];
        $theight = $this->pss_gallery_config['thumbnailHeight'];

        $gwidth  = $this->pss_gallery_config['galleryWidth'];
        $gheight = $this->pss_gallery_config['galleryHeight'];

        if(empty($twidth) && empty($theight)) {
            $twidth = 200;
            $theight = null;
        }

        $options = $twidth."-".$theight."-".$gwidth."-".$gheight;

        //$docid = $this->modx->documentIdentifier;
        $docid = empty($this->pss_gallery_config['docId']) ? $this->modx->documentIdentifier : $this->pss_gallery_config['docId'];

		if(!empty($this->pss_gallery_config['countImages'])) {
            $limit = $this->pss_gallery_config['countImages'];
        }



        $order = $this->pss_gallery_config['order'];
        if($order != "asc" && $order != "desc") {
            $order = "asc";
        }

        $sortBy = $this->pss_gallery_config['sortBy'];
        if(in_array($sortBy,array("position","name","date"))) {
            if($sortBy == "position") {
                $sortBy = "position";
            } else
            if($sortBy == "name") {
                $sortBy = "file_name";
            } else {
                $sortBy = "id";
            }
        }

        $sortStr = $sortBy." ".$order;

        //echo $sortStr;
        if( empty($this->pss_gallery_config['randPreview']) ) {

			$rs = $this->modx->db->select('*', $this->modx->getFullTableName('pss_gallery'),"document_id='$docid' AND visible=1",$sortStr,$limit);
        }
        else {
            // нужно выдать какую-то ошибку
            if( ! $startID = $this->pss_gallery_config['startID'] ) {
                return false;
            }

            if( $galleryDocs = $this->modx->getDocumentChildren($startID,1,0,'id') ){

                $arrayIDs = array();

                foreach($galleryDocs as $doc) {
                    $arrayIDs[] = $doc['id'];
                }

                $rs = $this->modx->db->select('*', $this->modx->getFullTableName('pss_gallery'),"visible=1 AND document_id IN (". implode(',', $arrayIDs). ")");
            }
        }
//@TODO продумать работу с превьюшками
        if ($this->modx->db->getRecordCount($rs) > 0) {
            while ($row = $this->modx->db->getRow($rs)) {
                $image = $row;

                if($row['options'] != $options) {

                    $docid =  basename(dirname($image['url_original_image']));
                    $folder = MODX_BASE_PATH."assets/images/gallery/". $docid ."/";
                    $short_folder = "/assets/images/gallery/". $docid ."/";

                    $timage = MODX_BASE_PATH.substr($image['url_thumbnail_image'],1);
                    if(!empty($image['url_thumbnail_image']) && file_exists($timage)) {
                        unlink($timage);
                    }

                    $gimage = MODX_BASE_PATH.substr($image['url_gallery_image'],1);
                    if(!empty($image['url_gallery_image']) && file_exists($gimage)) {
                        unlink($gimage);
                    }
//print_r($image); exit;
                    $file_name = $image['file_name'];
                    $original_file_path = $folder."original_".$file_name;

                    PSS_Utils_Image::resizeImage($original_file_path,$folder.$file_name,$gwidth,$gheight);
                    PSS_Utils_Image::resizeImage($original_file_path,$folder."thumbnail_".$file_name,$twidth,$theight);

                    $image['url_thumbnail_image'] = $short_folder."thumbnail_".$file_name;
                    $image['url_gallery_image'] = $short_folder.$file_name;

                    $fields = array (
                        'url_thumbnail_image' => $image['url_thumbnail_image'],
                        'url_gallery_image'   => $image['url_gallery_image'],
                        'options'             => $options
                    );
                    $this->modx->db->update($fields, $this->modx->getFullTableName('pss_gallery'),"id='{$image['id']}'");
                }
                $images[] = $image;
            }
        }

		return  empty($this->pss_gallery_config['randPreview']) ? $images : $this->randArray($images) ;

    }

	/*
	 * В предположении, что входит ассоциированный массив
	 * Ключом делаем предопределенное поле
	 */
    protected function randArray($rows, $key='document_id') {

        $oldkey = '';
        $tmp    = array();

		foreach($rows as $row) {

            $newkey = $row[$key];

            if( $oldkey != $newkey ) {

                if( $tmp ) {
                    $images[] = $this->getRandomItem($tmp);
                    $tmp = array();
                }

                $oldkey = $newkey;
            }

            $tmp[] = $row;
		}
        // Последний проход не попадает в обработку
        $images[] = $this->getRandomItem($tmp);

		return $images;
	}

    protected function getRandomItem($arr) {
        $index = rand(0, count($arr)-1);
        return $arr[$index];
    }

    private function buildResources() {
        $type= $this->pss_gallery_config['type'];

        switch ($type) {
            case "fancybox":
                $this->modx->regClientCSS("/assets/snippets/pss_gallery/res/gallireis/fancybox/jquery.fancybox-1.3.4.css");
                $this->modx->regClientStartupScript("/assets/widgets/pss_gallery/res/jquery-1.6.2.min.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/fancybox/jquery.fancybox-1.3.4.pack.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/fancybox/fancybox.settings.js");
                break;
            case "lightbox":
                $this->modx->regClientCSS("/assets/snippets/pss_gallery/res/gallireis/lightbox/css/lightbox.css");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/lightbox/js/jquery-1.8.0.min.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/lightbox/js/jquery-ui-1.8.23.custom.min.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/lightbox/js/lightbox_lang_en.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/lightbox/js/lightbox.js");

                break;
            case "visuallightbox":
                $this->modx->regClientCSS("/assets/snippets/pss_gallery/res/gallireis/visuallightbox/css/visuallightbox.css");
                $this->modx->regClientCSS("/assets/snippets/pss_gallery/res/gallireis/visuallightbox/css/vlightbox1.css");
                $this->modx->regClientStartupScript("/assets/widgets/pss_gallery/res/jquery-1.6.2.min.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/visuallightbox/js/visuallightbox.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/visuallightbox/js/vlbdata.js");
                break;
        }
    }

    private function buildAttr() {
        $type= $this->pss_gallery_config['type'];
        $imgClass = $this->pss_gallery_config['imgClass'];
        $hrefClass = $this->pss_gallery_config['hrefClass'];

        $attributes = "";

        switch ($type) {
            case "fancybox":
                $attributes.= "rel=\"fancybox\"";
                $attributes.= !empty($hrefClass) ? " class=\"$hrefClass\" " : "";
                break;
            case "lightbox":
                $attributes.= "rel=\"lightbox[lightbox]\"";
                $attributes.= !empty($hrefClass) ? " class=\"$hrefClass\" " : "";
                break;
            case "visuallightbox":
                $attributes.= "class=\"vlightbox";
                $attributes.= !empty($hrefClass) ? " $hrefClass\"" : "\"";
                break;
            case "custom":
                $attributes.= !empty($hrefClass) ? "class=\"$hrefClass\" " : "";
                break;
        }

        $this->ph['hrefAttr'] = $attributes;
        $this->ph['imgAttr'] = !empty($imgClass) ? " class=\"$imgClass\" " : "";

        //echo "ATTRIBUTES ".$attributes;
    }

    function draw() {

        $images = $this->buildGallery();

        if(count($images) > 0) {
            $this->ph["images"] = $images;
            $this->ph["image_attributes"] =  "";
            $this->ph["href_attributes"]  =  "";

            $this->buildResources();
            $this->buildAttr();

            if($this->pss_gallery_config['type'] == "custom" && isset($this->pss_gallery_config['itemTpl'])) {
                foreach($images as $image) {
                    $this->ph["itemTpls"][]= $this->modx->parseChunk($this->pss_gallery_config['itemTpl'],$image, '[+', '+]');
                }
                $this->renderView("custom");
            } else {
                $this->renderView("images");
            }
        } else
            if($this->pss_gallery_config['emptyShow']) {
                if(isset($this->pss_gallery_config['emptyTpl'])) {
                    echo $this->modx->getChunk($this->pss_gallery_config['emptyTpl']);
                } else {
                    $this->renderView("empty");
                }
            }
    }
}

