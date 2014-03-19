<?php
 
class PSS_Utils_Image { 
    
    static function ImageIntelligentResize($imagePath, $maxWidth, $maxHeight, $alwaysUpscale) {
        // garbage in, garbage out
//        if (IsNullOrEmpty($imagePath) || !is_file($imagePath) || IsNullOrEmpty($maxWidth) || IsNullOrEmpty($maxHeight)) {
//            return array("width" => "", "height" => "");
//        }

        // if our thumbnail size is too big, adjust it via HTML
        $size = getimagesize($imagePath);
        $origWidth = $size[0];
        $origHeight = $size[1];

        // Check if the image we're grabbing is larger than the max width or height or if we always want it resized
        if ($alwaysUpscale || $origWidth > $maxWidth || $origHeight > $maxHeight) {
            // it is so let's resize the image intelligently
            // check if our image is landscape or portrait
            if ($origWidth > $origHeight) {
                // target image is landscape/wide (ex: 4x3)
                $newWidth = $maxWidth;
                $ratio = $maxWidth / $origWidth;
                $newHeight = floor($origHeight * $ratio);
                // make sure the image wasn't heigher than expected
                if ($newHeight > $maxHeight) {
                    // it is so limit by the height
                    $newHeight = $maxHeight;
                    $ratio = $maxHeight / $origHeight;
                    $newWidth = floor($origWidth * $ratio);
                }
            } else {
                // target image is portrait/tall (ex: 3x4)
                $newHeight = $maxHeight;
                $ratio = $maxHeight / $origHeight;
                $newWidth = floor($origWidth * $ratio);
                // make sure the image wasn't wider than expected
                if ($newWidth > $maxWidth) {
                    // it is so limit by the width
                    $newWidth = $maxWidth;
                    $ratio = $maxWidth / $origWidth;
                    $newHeight = floor($origHeight * $ratio);
                }
            }
        }
        // it's not, so just use the current height and width
        else {
            $newWidth = $origWidth;
            $newHeight = $origHeight;
        }

        return array("width" => $newWidth, "height" => $newHeight);
    }
    
    
    # /** Универсальный ресайз картинок
    #   *
    #   * Функция позволяет копировать изображение,
    #   * оставляя его исходные характеристики или
    #   * изменяя его размер и/или качество.
    #   * При изменении размера сохраняются пропорции.
    #   *
    #   * Функция умеет работать с изображениями
    #   * следующих форматов: JPG, PNG, GIF.
    #   *
    #   * Параметры:
    #   * @ $from     - путь к изображению, над которым будут выполняться операции
    #   * @ $to       - путь к результирующему изображению
    #   * @ $maxwidth - максимальная ширина изображения
    #   * @ $maxheight    - максимальная высота изображения
    #   * @ $quality  - качество картинки (0..100) (для JPG и PNG)
    #   *
    #   * Возвращаемые значения:
    #   * false   - во время выполнения произошла ошибка
    #   * true    - функция выполнилась успешно и без ошибок
    #   

    public static function resizeImage ($from, $to, $maxwidth, $maxheight = null, $quality = 100) {
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
          
          if(!isset($maxheight) || !isset($maxwidth)) {
              if(!$maxheight) {
                  $newwidth = $maxwidth;
                  $newheight = intval(((float)$newwidth / (float)$width) * $height);
              } else {
                  $newheight = $maxheight;
                  $newwidth = intval(((float)$newheight / (float)$height) * $width);
              }
          } elseif ($maxwidth == $maxheight) {// требуется квадратная картинка
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
                      
                      //echo "MAx[]".$newwidth."--".$width."---".$maxheight;
                      
                      $newheight = intval(((float)$newwidth / (float)$width) * $height);
                      //echo "--".$newheight;
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
    
    static function resizeThumbnailImage($thumb_image_name, $image, $width, $height, $start_width, $start_height, $scale = 1){
            list($imagewidth, $imageheight, $imageType) = getimagesize($image);
            $imageType = image_type_to_mime_type($imageType);

            $newImageWidth =  $start_width + $width  > $imagewidth ? $imagewidth - $start_width : $width; 
            $newImageHeight = $start_height + $height  > $imageheight ? $imageheight - $start_height : $height; 
            $newImage = imagecreatetruecolor($newImageWidth,$newImageHeight);
            switch($imageType) {
                    case "image/gif":
                            $source=imagecreatefromgif($image); 
                            break;
                case "image/pjpeg":
                    case "image/jpeg":
                    case "image/jpg":
                            $source=imagecreatefromjpeg($image); 
                            break;
                case "image/png":
                    case "image/x-png":
                            $source=imagecreatefrompng($image); 
                            break;
            }
            imagecopyresampled($newImage,$source,0,0,$start_width,$start_height,$width,$height,$width,$height);
            switch($imageType) {
                    case "image/gif":
                            imagegif($newImage,$thumb_image_name); 
                            break;
            case "image/pjpeg":
                    case "image/jpeg":
                    case "image/jpg":
                            imagejpeg($newImage,$thumb_image_name,90); 
                            break;
                    case "image/png":
                    case "image/x-png":
                            imagepng($newImage,$thumb_image_name);  
                            break;
        }
            chmod($thumb_image_name, 0777);
            return $thumb_image_name;
    } 
    
    static function getHeight($image) {
            $size = getimagesize($image);
            $height = $size[1];
            return $height;
    } 
    
    static function getWidth($image) {
            $size = getimagesize($image);
            $width = $size[0];
            return $width;
    }
    
    static function iptc_make_tag($rec, $data, $value) {
        $length = strlen($value);
        $retval = chr(0x1C) . chr($rec) . chr($data);

        if ($length < 0x8000) {
            $retval .= chr($length >> 8) . chr($length & 0xFF);
        } else {
            $retval .= chr(0x80) .
                    chr(0x04) .
                    chr(($length >> 24) & 0xFF) .
                    chr(($length >> 16) & 0xFF) .
                    chr(($length >> 8) & 0xFF) .
                    chr($length & 0xFF);
        }

        return $retval . $value;
    }

    static function METATAGS($path) { 
        // We need to check if theres any IPTC data in the jpeg image. If there is then 
        // bail out because we cannot embed any image that already has some IPTC data!
        $image = getimagesize($path, $info);

        if (isset($info['APP13'])) {
            die('Error: IPTC data found in source image, cannot continue');
        }

        // Set the IPTC tags
        $iptc = array(
            '2#005' => '', // названеи файла
            '2#007' => '', // статус редактирования
            '2#010' => '', // приоритет
            '2#015' => '', // категория
            '2#020' => '', // дополнительна категория 
            '2#022' => '', // идентификация
            '2#025' => '', // ключевые слова
            '2#030' => '', // дата выпуска
            '2#035' => '', // время выпуска
            '2#040' => '', // специальные инструкции
            '2#045' => '', // справочная служба
            '2#047' => '', // отчетную дату
            '2#050' => '', // номер
            '2#055' => '', // дата создания
            '2#064' => '', // программа
            '2#070' => '', // версия программы
            '2#075' => '', // объект цикла
            '2#080' => '', // подписью автора
            '2#085' => '', // имя автора названия
            '2#090' => '', // город
            '2#095' => '', // область государственного
            '2#100' => '', // код страны
            '2#101' => '', // страна
            '2#103' => '', // оригинал ссылка передачи
            '2#105' => '', // заголовок
            '2#110' => '', // кредит
            '2#115' => '', // источник
            '2#116' => '', // копирайты 
            '2#120' => '', // подпись
            '2#121' => '', // местных подпись
        );

        // Convert the IPTC tags into binary code
        $data = '';

        foreach ($iptc as $tag => $string) {
            $tag = substr($tag, 2);
            $data .= self::iptc_make_tag(2, $tag, $string);
        }

        // Embed the IPTC data
        $content = iptcembed($data, $path);

        // Write the new image data out to the file.
        $fp = fopen("_" . $path, "wb");
        fwrite($fp, $content);
        fclose($fp);
    }
}
 