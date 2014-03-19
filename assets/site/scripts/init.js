$(document).ready(function() {
    var galleries = $('.ad-gallery').adGallery({ thumb_opacity: 0.5,
												 //~ width: '960px',
												 //~ height: '500px',
												 slideshow: { enable: false,},
												 effect: 'fade',
												});
//~
    //~ $('.ad-image-wrapper,.ad-next,.ad-prev').hover(
						//~ function(){
							//~ x=galleries[0].current_description;
								//~ if( galleries[0].current_description.length )
									//~ $(galleries[0].current_description[0]).fadeIn( 100 );
						//~ },
						//~ function(){
								//~ if( galleries[0].current_description.length )
									//~ $(galleries[0].current_description[0]).fadeOut( 500 );
						//~ });

});
