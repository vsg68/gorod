<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PSS_Translit
 *
 * @author Женя
 */
class PSS_Translit {
    //put your code here
    
    public static function rusABC() {
        return 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя
        АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
    }

    public static function toTranslit($string) {
        $rusSmall = array('а','б','в','г','д','е','ё','ж' ,'з','и','й','к','л','м','н','о','п','р','с','т','у','ф','х','ц','ч' ,'ш' ,'щ'  ,'ь','ы','ъ','э','ю' ,'я');
        $engSmall = array('a','b','v','g','d','e','e','zh','z','i','y','k','l','m','n','o','p','r','s','t','u','f','h','c','ch','sh','sch','' ,'y','' ,'e','yu','ya');
        
        $rusBig = array('А','Б','В','Г','Д','Е','Ё','Ж' ,'З','И','Й','К','Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш'  ,'Щ'  ,'Ь','Ы','Ъ','Э','Ю' ,'Я');
        $engBig = array('A','B','V','G','D','E','E','Zh','Z','I','Y','K','L','M','N','O','P','R','S','T','U','F','H','C','Ch','Sh','Sch','' ,'Y','' ,'E','Yu','Ya'); 
         
        
        $long = array(
            'Ж' => 'ZH',
            'Ш' => 'SH',
            'Щ' => 'SCH',
            'Ю' => 'Yu',
            'Я' => 'Ya' 
        );  
        
        $chars = PSS_Utils_String::utf8_str_split($string);
        $result = array(); 
        
        foreach($chars as $index => $char) {  
            if(in_array($char,$rusSmall)) { 
                $index = array_search($char,$rusSmall); 
                $result[] = $engSmall[$index];
            } else 
            if(in_array($char,$rusBig)) {
                $nextChar = $chars[$index + 1]; 
                if(in_array($nextChar,$rusBig) && $long[$char]) {
                    $result[] = $long[$char];
                } else {
                    $index = array_search($char,$rusBig); 
                    $result[] = $engBig[$index];  
                }
            } else {
                $result[] = $char;   
            }
        } 
        return implode('',$result);
    }
    
    
    public static function fromTranslit($string) {
        
    } 
    
} 
