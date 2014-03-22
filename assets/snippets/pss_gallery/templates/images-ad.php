<? foreach($ph['images'] as $image): ?>
<li>
    <a href="<?=$image['url_gallery_image']?>" ><img <?=$ph['imgAttr']?>src="<?=$image['url_thumbnail_image']?>" alt="<?=$image['title']?>" class="image<?=$image['id']?>"/></a>
</li>
<? endforeach; ?>
