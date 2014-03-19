<? 
function in($values) {
    $in = '(';
    foreach($values as $index => $value) {
        if($index > 0) {
            $in = $in.',';
        }
        $in = $in."'".$value."'"; 
    }
    $in = $in.')';
    return $in;
}

function deleteDirectory($dir) {
    if (!file_exists($dir)) return true;
    if (!is_dir($dir)) return unlink($dir);
    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') continue;
        if (!deleteDirectory($dir.DIRECTORY_SEPARATOR.$item)) return false;
    }
    return rmdir($dir);
}

$ids = $modx->Event->params['ids'];

if(count($ids) > 0) {
    $modx->db->delete($modx->getFullTableName('pss_gallery'),"document_id in".in($ids));
        
    foreach($ids as $index=>$docid) {
        deleteDirectory(MODX_BASE_PATH."assets/images/gallery/".$docid."/");
    }
}

