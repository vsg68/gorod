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

        $docid = $this->modx->documentIdentifier;

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

       	$rs = $this->modx->db->select('*', $this->modx->getFullTableName('pss_gallery'),"document_id='$docid' AND visible=1",$sortStr,$limit);

        if ($this->modx->db->getRecordCount($rs) > 0) {
            while ($row = $this->modx->db->getRow($rs)) {
                $image = $row;

                if($row['options'] != $options) {

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

		return  $images;

    }

    private function makePrview() {

        $twidth  = $this->pss_gallery_config['thumbnailWidth'];
        $theight = $this->pss_gallery_config['thumbnailHeight'];

        if(empty($twidth) && empty($theight)) {
            $twidth = 215;
            $theight = 315;
        }

        $limit = empty($this->pss_gallery_config['countImages']) ? 4 : $this->pss_gallery_config['countImages'];

        // нужно выдать какую-то ошибку
        if( ! $startID = $this->pss_gallery_config['startID'] ) {
            return array();
        }

        if( ! $galleryDocs = $this->modx->getDocumentChildren($startID,1,0,'id,pagetitle') ){
            return array();
        }

        $arrayIDs = array();
        $titles = array();

        foreach($galleryDocs as $doc) {
            $arrayIDs[] = $doc['id'];
            $titles[ $doc['id'] ] =  $doc['pagetitle'];
        }

        $rs = $this->modx->db->select('*', $this->modx->getFullTableName('pss_gallery'),"visible=1 AND document_id IN (". implode(',', $arrayIDs). ") ORDER BY document_id");

        if( ! $rows = $this->modx->db->makeArray($rs) ) {
            return array();
        }

        $randomImgs = $this->randArray($rows); // В массиве находится по 1 фото с каждой галереи

        if( empty($documentsId) ) {
            shuffle($randomImgs);  //отрезаем нужное число
        }
        else{
            $randomImgs = $this->sortArrayByDocId($randomImgs, $documentsId);
        }

        array_splice( $randomImgs, $limit);  //отрезаем нужное число

        $link       = "/assets/images/gallery";
        $basepath   = rtrim(MODX_BASE_PATH, "/");
        $folder     = $basepath.$link;

        @unlink($folder."/preview_*");

        foreach( $randomImgs as $indx => $img ) {

            $file_ext = array_reverse( explode(".",$img["file_name"]) );
            $filename = "preview_".$indx.".".$file_ext[0];

            PSS_Utils_Image::resizeImage( $basepath.$img["url_original_image"], $folder."/".$filename, $twidth, $theight);

            $docid = basename( dirname($img['url_original_image']) );

            $img["title"]               = $titles[$docid];
            $img["url_thumbnail_image"] = $link."/".$filename;
            $img["lastClass"]           = ($indx == $limit-1) ? "lastbox" : "";

            $images[] = $img;
        }

        return $images;
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

    /*
    * вынимаем из массива элементы по определенному признаку
    */
    protected function sortArrayByDocId($rows, $documentsId){

        $ids = preg_split('/\s*,\s*/',$documentsId);

        if( !count($ids) )
            return;

        $tmpYes = $tmpNo = array();

        foreach($rows as $row){
            if( in_array( $row['document_id'], $ids) ){
                $tmpYes[] = $row;
            }
            else {
                $tmpNo[] = $row;
            }
        }

        return array_merge($tmpYes,$tmpNo);
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
            case "colorbox":
                $this->modx->regClientCSS("/assets/snippets/pss_gallery/res/gallireis/colorbox/css/colorbox.css");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/colorbox/js/jquery-1.8.0.min.js");
                $this->modx->regClientStartupScript("/assets/snippets/pss_gallery/res/gallireis/colorbox/js/jquery.colorbox.min.js");
                $this->modx->regClientStartupScript("/assets/site/scripts/init.js");
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
//            case "ad-gallery":
//                $attributes.= "class=\"ad-gallery";
//                $attributes.= !empty($hrefClass) ? " $hrefClass\"" : "\"";
//                break;
            case "custom":
                $attributes.= !empty($hrefClass) ? "class=\"$hrefClass\" " : "";
                break;
        }

        $this->ph['hrefAttr'] = $attributes;
        $this->ph['imgAttr'] = !empty($imgClass) ? " class=\"$imgClass\" " : "";

        //echo "ATTRIBUTES ".$attributes;
    }

    function draw() {

        if( empty($this->pss_gallery_config['randPreview']) ) {
            $images = $this->buildGallery();
        }
        else {
            $images = $this->makePrview();
        }

        if(count($images) > 0) {
            $this->ph["images"] = $images;
            $this->ph["image_attributes"] =  "";
            $this->ph["href_attributes"]  =  "";

            if( empty($this->pss_gallery_config['randPreview']) ) {
                $this->buildResources();
            }
            $this->buildAttr();

            if( $this->pss_gallery_config['type'] == "custom" && isset($this->pss_gallery_config['itemTpl']) ){
                foreach($images as $image) {
                    $this->ph["itemTpls"][]= $this->modx->parseChunk($this->pss_gallery_config['itemTpl'],$image, '[+', '+]');
                }
                $this->renderView("custom");

            }elseif( $this->pss_gallery_config['type'] == "colorbox") {
                $this->renderView("images-color");
            }
            else {
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

