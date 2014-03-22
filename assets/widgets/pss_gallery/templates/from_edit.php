<h1>[+lang.image.edit+]</h1>
<table class="gallery_form_edit"> 
    <tr>
        <td>
            [+lang.image.alt+]
            <input id="edit_alt"></td>
    </tr>
    <tr>
        <td>[+lang.image.title+]
            <textarea id="edit_title"></textarea></td>
    </tr>  
    <tr>
        <td style="padding-bottom: 5px;">
            <table border="0" style="width:130px;">  
                <tr>
                    <td>[+lang.image.visible+]</td>
                    <td class="visible_lang">[+lang.yes+]</td> 
                    <td class="visible_radio"><input type="radio" name="visible" value="1"></td> 
                    <td class="visible_lang">[+lang.no+]</td> 
                    <td class="visible_radio"><input type="radio" name="visible" value="0"></td>
                </tr> 
            </table>
            <div class="split"></div></td>
    </tr>    
    <tr>
        <td style="padding-bottom: 0px;">
            <input type="hidden" id="edit_id"/>
            <input type="button" id="gallery_button_save" value="[+lang.save+]"/>
            <input type="button" id="gallery_button_cancel" value="[+lang.cancel+]"/>
            <input type="button" id="gallery_button_delete" value="[+lang.delete+]"/> 
        </td>
    </tr>        
</table>  

 