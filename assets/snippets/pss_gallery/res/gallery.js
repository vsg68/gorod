$(document).ready(function($) { 
    $(".gallery img").load(function(){
        var top = ($(this).height() - 150) / 2;
        if(top > 0 ) { 
            $(this).css({
                "top" : "-" + top + "px"
            })   
        } 
    });
});