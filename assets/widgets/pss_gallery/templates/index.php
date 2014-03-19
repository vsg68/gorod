<link rel="stylesheet" type="text/css" href="/assets/widgets/pss_gallery/res/gallery.css" />
<script type="text/javascript" src="/assets/widgets/pss_gallery/res/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/assets/widgets/pss_gallery/res/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="/assets/widgets/pss_gallery/res/jquery.scrollTo-min.js"></script>
<script type="text/javascript" src="/assets/widgets/pss_gallery/res/jquery.form.js"></script> 
<script type="text/javascript" src="/assets/widgets/pss_gallery/res/gallery.js"></script>   

<div id="pss_gallery">
    <div class="sectionHeader">[+lang.title.images+]
        <input id="viewUpload"  type="button" value="[+lang.upload+]"/>
    </div>
    <div class="sectionBody">    
        <table>
            <tr>
                <td>
                    <div class="wrapper_images">
                        <?  include 'images.php';?>
                    </div>
                </td>
                <td class="form_container"> 
                    <div class="wrapper_form_edit">
                        <? include 'from_edit.php';?>
                    </div>
                    <div class="wrapper_form_upload">
                        <? include 'form_upload.php';?>
                    </div> 
                </td>    
            </tr>    
        </table>    
    </div>   
    <div class="pss_gallery_waiter">
        <img src="/assets/widgets/pss_gallery/res/images/loading.gif"/>
    </div>
</div>
