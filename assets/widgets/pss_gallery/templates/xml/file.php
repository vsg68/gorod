<?header("Content-Type:text/xml;charset=UTF-8");?>
<?print '<?xml version="1.0" encoding="UTF-8"?>';?> 
<result>
    <?if($ph["data.result"] == "error"):?>
        <error>
            <message><?=$ph["data.message"]?></message>
        </error>
    <? elseif($ph["data.result"] == "success"):?>
        <success>
            <id><?=$ph["data.id"]?></id>
            <src><?=$ph["data.src"]?></src>
            <alt><?=$ph["data.alt"]?></alt>
            <title><?=$ph["data.title"]?></title>
            <visible><?=$ph["data.visible"]?></visible>
            <message><?=$ph["data.message"]?></message>
        </success>
    <?endif;?>
</result>