$(document).ready(function($) { 
    var waiter = $(".pss_gallery_waiter");
    waiter.hide();
    
     var form = $("<form/>");
     form.attr("id","gallery_form_upload")
     .attr("action","/assets/widgets/pss_gallery/ajax.index.php?action=upload&docid=" + $("input[name=id]").val())
     .attr("method","post")
     .attr("enctype","multipart/form-data");    
     
     form.hide();
     form.appendTo($("body"));
     form.hide();
     
     $.clearFormEdit = function() {
         $("#edit_id").val("");
         $("#edit_alt").val("");
         $("#edit_title").val("");
         //$(".gallery_form_edit input[type='radio'][checked]").val()
     }
     
     $(".wrapper_form_edit").hide();
     
     $("#viewUpload,#gallery_button_cancel").click(function() {
         $(".wrapper_form_edit").hide();
         $(".wrapper_form_upload").find("input[type='radio'][value='1']").attr("checked","");
         $(".wrapper_form_upload").show("slide",{},500);
     });
     
     $(".wrapper_images div").live("click",function() { 
         $.clearFormEdit();
         $(".wrapper_images div").removeClass("image_selected");
         $(this).addClass("image_selected");
         
         $(".wrapper_form_edit").show("slide",{},500);
         $(".wrapper_form_upload").hide();
     
         
         var formEdit =$(".wrapper_form_edit");
         formEdit.show();   
         
         $("#edit_alt").val($(this).attr("alt"));
         $("#edit_title").val($(this).attr("title"));
         
         if($(this).attr("visible") == true) {
             formEdit.find("input[type='radio'][value='1']").attr("checked","");
         } else {
             formEdit.find("input[type='radio'][value='0']").attr("checked",""); 
         } 
         $("#edit_id").val($(this).attr("id"));
         
     });
     
     $("#gallery_button_upload").live("click",function() { 
        waiter.show();
        var options = {
            success: function(responce) {
                var success = $(responce).find("success"); 
                if(success.length == 1) {
                    var image = $("<div/>");
                    image.attr({
                       "id"    :  success.find("id").text(),
                       "alt"   :  success.find("alt").text(),
                       "visible"  :  success.find("visible").text(),
                       "title" :  success.find("title").text(),
                       "class" : "gallery_image",
                       "style" : "background-image:url('"+success.find("src").text() + "') !important"
                    }); 
                    
                    $(".wrapper_images").append(image);
                    
                    $(".gallery_form_data").find("input[type='text'],input[type='file'],textarea").val("");
//                    $(".gallery_form_data").find("input[type='radio']")
                    
                    $(".wrapper_images div").removeClass("image_selected");
                    image.addClass("image_selected");
                    $(".wrapper_images").scrollTo(image);
                    alert(success.find("message").text());
                    waiter.hide();
                } 
                var error = $(responce).find("error");
                if(error.length == 1) {
                    alert(error.find("message").text());
                    waiter.hide();
                }
            } 
        };   
        
        form.empty();
        
        var cloneForm = $(".wrapper_form_upload .gallery_form_data").clone();
        var value = $(".wrapper_form_upload  .gallery_form_data textarea").val();
        
        cloneForm.find("textarea").text(value);
        form.append($(".wrapper_form_upload .gallery_form_data"));
        cloneForm.appendTo($(".wrapper_form_upload"));
         
        form.ajaxSubmit(options);
        return false;
     });   
     
     $("#gallery_button_delete").click(function() {
         var data = {
           imageId : $("#edit_id").val() 
        };  
        waiter.show(); 
        
        $.post("/assets/widgets/pss_gallery/ajax.index.php?action=delete",data,function(responce) {
            $("#"+data.imageId).remove();
            alert(responce); 
            waiter.hide();
            $(".wrapper_form_edit").hide();
            $(".wrapper_form_upload").find("input[type='radio'][value='1']").attr("checked","");
            $(".wrapper_form_upload").show("slide",{},500);
        });
     });
     
     $("#gallery_button_save").click(function() {
        var data = {
           imageId : $("#edit_id").val(),
           alt: $("#edit_alt").val(),
           title: $("#edit_title").val(),
           visible: $(".gallery_form_edit input[name='visible']:checked").val()
        };  
        waiter.show();
        //alert($(".gallery_form_edit input[name='visible']:checked").toArray());
        //alert(data.visible);
        
        $.post("/assets/widgets/pss_gallery/ajax.index.php?action=update",data,function(responce) {
            
            $("#"+data.imageId).attr({ 
                       "alt"   :  data.alt, 
                       "visible"  :  data.visible,
                       "title" :  data.title
            });
            alert(responce); 
            
            waiter.hide();
        });
     });
     
    $(".wrapper_images" ).sortable({
        revert: true,
        cursor: "crosshair",
        stop: function(event,ui){
            waiter.show();
            var data = {
                docid: $("input[name=id]").val(),
                imageId: ui.item.attr("id"),
                prevId : ui.item.prev().attr("id")
            };   
            $.post("/assets/widgets/pss_gallery/ajax.index.php?action=position",data,function(responce) { 
                waiter.hide();
            });
        }
    });
//    $( "#draggable" ).draggable({
//        connectToSortable: "#sortable",
//        helper: "clone",
//        revert: "invalid"
//    });
//    $( "ul, li" ).disableSelection();
});