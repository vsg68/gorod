$(document).ready(function() {

    if( $('.ad-gallery').length ) {
        $('.ad-gallery').adGallery({ thumb_opacity: 0.5,
                                     slideshow: { enable: false},
                                     effect: 'fade',
                                     loader_image: '/assets/site/images/loader.gif'
//                                     afterImageVisible: function(){ $('.ad-image-description').show('fast');}
                                  });
    };

    $("#calendar td a").live('click',function(){

        $.post('/15',{ ddate: $(this).attr('rel')}, function(response){
                                                    $('#calendar').empty().append(response);  });
    });

    if( $('.selected-item-project').length ) {
        $('.topmenu  a').filter( function(){
                                    return $(this).attr('href') === 'projects';})
                         .closest('li').addClass('selected-item');
    };
});