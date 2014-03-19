<?php
 

class PSS_Utils_String {

    public static function rusABC() {
        return 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя
        АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
    }
    
    public static function cut($str,$length = 255){
        if (strlen($str) > $length) { 
            return utf8_substr($str,0,$length).'...';
        } else {
            return $str;
        }
    }

    public static function  buildRequestString($requestValues,$exceptionParamArray=null) {
        $req   = "";
        $index = 0;

        if(isset($exceptionParamArray) && !is_array($exceptionParamArray)) {
            $exceptionParamArray = array($exceptionParamArray);
        }
        foreach($requestValues as $key => $value) {
            if(!isset($exceptionParamArray) || !in_array($key,$exceptionParamArray)){
                if($index > 0) {
                    $req = $req.'&';
                }
                $req = $req.$key.'='.$value;
            }
            $index++;
        }
        return $req;
    }

    public static function bundlesString($string,$params) {   
        if(!isset($string)) {
            return $string;
        }
 
        if(!is_array($params)) {
            $params = array($params);
        }   

        if(isset ($string) && isset($params) && is_array($params) && count($params)>0) {
            $searchArray = '';
            for($i = 0; $i<count($params); $i++) {  
                $searchArray[] = '{'.$i.'}';
            }

            return str_replace($searchArray,$params,$string);
        }
 
        return $string;
    }
    
    public static function utf8_str_split($str) {
        // place each character of the string into and array
        $split = 1;
        $array = array();
        for ($i = 0; $i < strlen($str);) {
            $value = ord($str[$i]);
            if ($value > 127) {
                if ($value >= 192 && $value <= 223)
                    $split = 2;
                elseif ($value >= 224 && $value <= 239)
                    $split = 3;
                elseif ($value >= 240 && $value <= 247)
                    $split = 4;
            }else {
                $split = 1;
            }
            $key = NULL;
            for ($j = 0; $j < $split; $j++, $i++) {
                $key .= $str[$i];
            }
            array_push($array, $key);
        }
        return $array;
    } 
    
    public static function html2txt($document){ 
          $search = array('@<script[^>]*?>.*?</script>@si',  // Strip out javascript 
                   '@<[\/\!]*?[^<>]*?>@si',            // Strip out HTML tags 
                   '@<style[^>]*?>.*?</style>@siU',    // Strip style tags properly 
                   '@<![\s\S]*?--[ \t\n\r]*>@'         // Strip multi-line comments including CDATA 
          );
          $text = preg_replace($search, '', $document); 

          return $text;
    }

    public static function removeEmptyLines($string)
    {
        return preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", $string);
    }
}