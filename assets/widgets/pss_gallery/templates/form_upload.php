<h1>[+lang.image.upload+]</h1>
<table class="gallery_form_data"> 
    <tr>
        <td>
        [+lang.image.alt+]
        <input name="alt" type="text">
        </td>
    </tr>
    <tr>
        <td>
            [+lang.image.title+]
            <textarea name="title"></textarea>
        </td>
    </tr> 
    <tr>
        <td>
            <table border="0" style="width:200px;" class="table_upload">  
                <tr>
                    <td>[+lang.image.visible+]</td>
                    <td class="visible_lang">[+lang.yes+]</td> 
                    <td class="visible_radio"><input type="radio" name="visible" value="1" checked="checked"></td> 
                    <td class="visible_lang">[+lang.no+]</td> 
                    <td class="visible_radio"><input type="radio" name="visible" value="0"></td>
                </tr> 
            </table>
        </td>
    </tr>
    <tr>
        <td> 
            <input type="file" name="image"/>
        </td>
    </tr>  
    <tr>
        <td style="padding-bottom: 5px;"><div class="split"></div>
        </td>
    </tr>    
    <tr> 
        <td style="padding-bottom: 0px;">
            <input type="button" id="gallery_button_upload" value="[+lang.upload+]"/> 
        </td>
    </tr>        
</table>  