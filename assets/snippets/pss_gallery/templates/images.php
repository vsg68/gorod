<? foreach($ph['images'] as $image): ?>
    <a <?=$ph['hrefAttr']?> href="<?=$image['url_gallery_image']?>" title="<?=$image['title']?>"><img <?=$ph['imgAttr']?>src="<?=$image['url_thumbnail_image']?>" alt="<?=$image['alt']?>"/></a>
<? endforeach; ?>
