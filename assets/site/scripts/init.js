$(document).ready(function() {

    if( $('.ad-gallery').length ) {
        $('.ad-gallery').adGallery({ thumb_opacity: 0.5,
                                     slideshow: { enable: false},
                                     effect: 'fade'
                                  });
    };

    $("#calendar td a").live('click',function(){

        $.post('/15',{ ddate: $(this).attr('rel')}, function(response){
                                                    $('#calendar').empty().append(response);  });
    });
});