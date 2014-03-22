<?if(count($ph['images']) > 0):?>
    <? foreach($ph['images'] as $image): ?> 
         <div class="gallery_image" id="<?=$image['id']?>" style="background-image:url('<?=$image['url_min_image']?>')" alt="<?=$image['alt']?>" visible="<?=$image['visible']?>" title="<?=$image['title']?>"></div>  
    <? endforeach; ?>    
<? endif;?>