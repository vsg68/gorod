$(document).ready(function() {

    if( $('#galleryC').length ) {
//        firstHref = $('a.galleryC').get(0).href;
//        $('#content img').wrap('<a href="' + firstHref+'"></a>');

        $('#content .imgpad img').css('cursor', 'pointer')
                         .click( function(){$('a.galleryC').click()});

        $('a.galleryC').colorbox({rel:'galleryC'});
    };

    $("#calendar td a").live('click',function(){

        $.post('/15',{ ddate: $(this).attr('rel')}, function(response){
                                                    $('#calendar').empty().append(response);  });
    });
//
//    if( $('.selected-item-project').length ) {
//        $('.topmenu  a').filter( function(){
//                                    return $(this).attr('href') === 'projects';})
//                         .closest('li').addClass('selected-item');
//    };
});