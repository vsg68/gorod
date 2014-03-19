<?php

class PSS_Utils_File {

    public static function copy($source,$target )
    {
        if ( is_dir( $source ) )
        {
            @mkdir($target,0777,true);
          
            $d = dir( $source );
          
            while ( FALSE !== ( $entry = $d->read() ) )
            {
                if ( $entry == '.' || $entry == '..' )
                {
                    continue;
                }
              
                $Entry = $source . '/' . $entry;          
                if ( is_dir( $Entry ) )
                {
                    self::copy( $Entry, $target . '/' . $entry );
                    continue;
                }
                copy( $Entry, $target . '/' . $entry );
                chmod($target . '/' . $entry, 0777);
            }
          
            $d->close();
        }else
        {
            copy($source, $target );
            chmod($target,0777);
        }
    }
    
    public static function deleteDirectory($dir) {
        if (!file_exists($dir)) return true;
        if (!is_dir($dir)) return unlink($dir);
        foreach (scandir($dir) as $item) {
            if ($item == '.' || $item == '..') continue;
            if (!PSS_Utils_File::deleteDirectory($dir.DIRECTORY_SEPARATOR.$item)) return false;
        }
        return rmdir($dir);
    }

    public static function deleteFile($filename) {
        if(file_exists($filename)) {
            unlink($filename);
        }
    }
    
    public static function buildFileName($dir,$new_file_name) {
        //$new_file_name = preg_replace('/[^a-zA-Z0-9_.'.PSS_Utils_String::rusABC().']/','',$new_file_name);
        //echo "nf - ".$new_file_name;
        //$new_file_name = PSS_Translit::toTranslit($new_file_name);
        $new_file_name = str_replace(' ','_',$new_file_name);
        $new_file = $dir.'/'.$new_file_name; 
        
        if(file_exists($new_file)) { 
           //$dir_items = scandir($dir);

           $index =  strripos($new_file_name,'.');

           if($index != '') {
               $name = substr($new_file_name,0,$index);
               $type = substr($new_file_name,$index + 1);
           } else {
               $name = $new_file_name;
           }

//           if($type != '') {
//               $pattern = '/'.$name.'.*\..*/';
//           } else {
//               $pattern = '/'.$name.'.*/';
//           }
//           
//
//           foreach ($dir_items as $dir_item) {
//                if(is_file($dir.'/'.$dir_item)) {
//                    if(preg_match($pattern,$dir_item)) {
//                        echo "<br>ITEM :: " . $dir_item;
//                        
//                        $max_index++;
//                    }
//                }
//           }
//           
//           $max_index +=1;

           $max_index = 0; 
           
           while(file_exists($dir."/".$new_file_name)) {
               $new_file_name = $name.'('.($max_index).')';
               if($type != '') {
                   $new_file_name = $new_file_name.'.'.$type;
               }
               $max_index ++;
           }
           
           //echo "<br>NAME :: $name";

           $new_file = $dir.'/'.$new_file_name;
        }

        return array(
            'path' => $new_file,
            'name' => $new_file_name
        );
    }

    public static function fileList($dir,$ext = null) {
        if($dh = opendir($dir)) {
            $files = Array();
            $inner_files = Array();

            while($file = readdir($dh)) {
                if($file != "." && $file != ".." && $file[0] != '.') {
                    if(is_dir($dir . "/" . $file)) {
                        $inner_files = self::fileList($dir . "/" . $file,$ext);
                        if(is_array($inner_files)) {
                            $files = array_merge($files, $inner_files);
                        }    
                    } else {  
                        if($ext && in_array(strtolower(pathinfo($file, PATHINFO_EXTENSION)),$ext)) {  
                            array_push($files, $dir . "/" . $file);
                        } 
                        if(!$ext){    
                            array_push($files, $dir . "/" . $file);
                        }    
                    }
                }
            }

            closedir($dh);
            return $files;
        }
    }
    
//    public static function filePathList($dir,$type='jpg') {
//        $fileList = array();
//        if (!file_exists($dir)) return  $fileList;
//        foreach (scandir($dir) as $item) {
//            if ($item == '.' || $item == '..') continue;
//            if(strtolower(pathinfo($item, PATHINFO_EXTENSION)) == $type) {
//                $fileList[] = $dir.'/'.$item;
//            }
//        }
//        return $fileList;
//    }
//
//
//    public static function fileNameList($dir,$type='jpg') {
//        $fileList = array();
//        if (!file_exists($dir)) return  $fileList;
//        foreach (scandir($dir) as $item) {
//            if ($item == '.' || $item == '..') continue;
//            if(strtolower(pathinfo($item, PATHINFO_EXTENSION)) == $type) {
//                $fileList[] = $item;
//            }
//        }
//        return $fileList;
//    }

    public static function resizeImage ($from, $to, $maxwidth, $maxheight, $quality = 80) {
         // защита от Null-байт уязвимости PHP
        $from = preg_replace('/\0/uis', '', $from);
        $to = preg_replace('/\0/uis', '', $to);

          // информация об изображении
          $imageinfo = @getimagesize($from);
          // если получить информацию не удалось - ошибка
          if (!$imageinfo) return false;
          // получаем параметры изображения
          $width = $imageinfo[0];     // ширина
          $height = $imageinfo[1];    // высота
          $format = $imageinfo[2];    // ID формата (число)
          $mime = $imageinfo['mime']; // mime-тип

          // определяем формат и создаём изображения
          switch ($format) {
              case 2: $img = imagecreatefromjpeg($from); break;   // jpg
              case 3: $img = imagecreatefrompng($from); break;    // png
              case 1: $img = imagecreatefromgif($from); break;    // gif
              default: return false; break;
          }
          // если создать изображение не удалось - ошибка
          if (!$img) return false;

          // меняем размеры изображения
          $newwidth = $newheight = 0;
          // требуется квадратная картинка
          if ($maxwidth == $maxheight) {
              // размеры картинки больше по X и по Y
              if ($width > $maxwidth && $height > $maxheight) {
                  // пропорции картинки одинаковы
                  if ($width == $height) {
                      $newwidth = $maxwidth;
                      $newheight = $maxheight;
                  }
                  // ширина больше
                  elseif ($width > $height) {
                      $newwidth = $maxwidth;
                      $newheight = intval(((float)$newwidth / (float)$width) * $height);
                  }
                  // высота больше
                  else {
                      $newheight = $maxheight;
                      $newwidth = intval(((float)$newheight / (float)$height) * $width);
                  }
              }
              // размеры картинки больше только по X
              elseif ($width > $maxwidth) {
                  $newwidth = $maxwidth;
                  $newheight = intval(((float)$newwidth / (float)$width) * $height);
              }
              // размеры картинки больше только по Y
              elseif ($height > $maxheight) {
                  $newheight = $maxheight;
                  $newwidth = intval(((float)$newheight / (float)$height) * $width);
              }
              // в остальных случаях ничего менять не надо
              else {
                  $newwidth = $width;
                  $newheight = $height;
              }
          }
          // требуется горизонтальная картинка
          elseif ($maxwidth > $maxheight) {
              // размеры картинки больше по X и по Y
              if ($width > $maxwidth && $height > $maxheight) {
                  // ширина больше
                  if ($width > $height) {
                      $newwidth = $maxwidth;
                      $newheight = intval(((float)$newwidth / (float)$width) * $height);
                  }
                  // высота больше или равна ширине
                  else {
                      $newheight = $maxheight;
                      $newwidth = intval(((float)$newheight / (float)$height) * $width);
                  }
              }
              // размеры картинки больше только по X
              elseif ($width > $maxwidth) {
                  $newwidth = $maxwidth;
                  $newheight = intval(((float)$newwidth / (float)$width) * $height);
              }
              // размеры картинки больше только по Y
              elseif ($height > $maxheight) {
                  $newheight = $maxheight;
                  $newwidth = intval(((float)$newheight / (float)$height) * $width);
              }
              // в остальных случаях ничего менять не надо
              else {
                  $newwidth = $width;
                  $newheight = $height;
              }
          }
          // требуется вертикальная картинка
          elseif ($maxwidth < $maxheight) {
              // размеры картинки больше по X и по Y
              if ($width > $maxwidth && $height > $maxheight) {
                  // ширина больше или равна высоте
                  if ($width >= $height) {
                      $newwidth = $maxwidth;
                      $newheight = intval(((float)$newwidth / (float)$width) * $height);
                  }
                  // высота больше
                  else {
                      $newheight = $maxheight;
                      $newwidth = intval(((float)$newheight / (float)$height) * $width);
                  }
              }
              // размеры картинки больше только по X
              elseif ($width > $maxwidth) {
                  $newwidth = $maxwidth;
                  $newheight = intval(((float)$newwidth / (float)$width) * $height);
              }
              // размеры картинки больше только по Y
              elseif ($height > $maxheight) {
                  $newheight = $maxheight;
                  $newwidth = intval(((float)$newheight / (float)$height) * $width);
              }
              // в остальных случаях ничего менять не надо
              else {
                  $newwidth = $width;
                  $newheight = $height;
              }
          }

          // если изменений над картинкой производить не надо - просто копируем её
          if ($newwidth == $width && $newheight == $height && $quality == 80) {
              if($from == $to) {
                  return true;
              } else
              if (copy($from, $to)) {
                  return true;
              } else {
                return false;
              }
          }

          // создаём новое изображение
          $new = imagecreatetruecolor($newwidth, $newheight);
          $black = imagecolorallocate($new, 0, 0, 0);
          $white = imagecolorallocate($new, 255, 255, 255);
          // копируем старое в новое с учётом новых размеров
          imagefilledrectangle($new, 0, 0, $newwidth - 1, $newheight - 1, $white);
          //imagecolortransparent($new, $white);
          imagecopyresampled($new, $img, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
          // создаём файл с новым изображением
          switch ($format) {
              case 2: // jpg
                  if ($quality < 0) $quality = 0;
                  if ($quality > 100) $quality = 100;
                  imagejpeg($new, $to, $quality);
              break;
              case 3: // png
                  $quality = intval($quality * 9 / 100);
                  if ($quality < 0) $quality = 0;
                  if ($quality > 9) $quality = 9;
                  imagepng($new, $to, $quality);
              break;
              case 1: // gif
                  imagegif($new, $to);
              break;
          }
          return true;
    }

}
