<?php 

abstract class PSS_Abstract_Controller {
     
    protected $ph = array();
    protected $modx = null;  
    protected $tplFolder;
    protected $langsFolder; 
    protected $theme;

    public function __construct() {    
    } 

    public function setModx($modx) {
        $this->modx = $modx;
    }

    public function setTplFolder($tplFolder) {
        $this->tplFolder = $tplFolder;
    }

    public function setLangsFolder($langsFolder) {
        $this->langsFolder = $langsFolder;
    } 

    public function loadLangs() {
        if(isset($this->langsFolder)) {
            $this->addPh($this->getLangs($this->modx,$this->langsFolder));
        }
    }
    
    public function handleRequest() {
        $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'index';
         
        if(method_exists($this,$action)) { 
            $this->$action();
            return true;
        }
    } 
    
    protected function addPh($ph) {
        if(is_array($ph)) { 
            $this->ph = $ph + $this->ph;
        } else {  
            $this->ph[] = $ph;
        }
    } 
    
    protected function renderView($tpl) { 
        $tplFile = $this->tplFolder.$tpl.".php";  
        
        if(file_exists($tplFile)) { 
            ob_start();
                $ph = $this->ph;
                include $tplFile; 
                $content = ob_get_contents();
            ob_end_clean();  
            $content = $this->parseTemplateContent($content,$this->ph);
            echo $content; 
        }
    }
    
    private function parseTemplateContent($tpl, $values = array()) {
    	if($tpl) {
            foreach ($values as $key => $value) {
                $tpl = str_replace('[+'.$key.'+]', $value, $tpl); 
            }
            $tpl = preg_replace('/(\[\+.*?\+\])/' ,'', $tpl);
            return $tpl;
    	} else {
    		return '';
    	}
    }
    
    protected function getLangs($modx,$lngFolder) {
    	$managerLanguage = $modx->config['manager_language'];
        $langsFile = $lngFolder.$managerLanguage.'.inc.php';
        if(file_exists($langsFile)) { 
            include $langsFile;
            if(!isset($_lang)) {
                return array("");
            }
            foreach ($_lang as $key => $value) {
                    $ph['lang.'.$key] = $value;
            }
            return $ph;
        } else {
            return array("");
        }
    }
    
    protected function getTheme() {
        $theme = $this->modx->db->select('setting_value', $this->modx->getFullTableName('system_settings'), 'setting_name=\'manager_theme\'', '');
        if ($this->modx->db->getRecordCount($theme)) {
            $theme = $this->modx->db->getRow($theme);
            $theme = ($theme['setting_value'] <> '') ? '/' . $theme['setting_value'] : '';
            return $theme;
        } else {
            return '';
        }
    }
    
    protected function parse_mysql_dump($url, $ignoreerrors = false) {
        $file_content = file($url);
        //print_r($file_content);
        $query = "";
        foreach ($file_content as $sql_line) {
            $tsl = trim($sql_line);
            if (($sql_line != "") && (substr($tsl, 0, 2) != "--") && (substr($tsl, 0, 1) != "#")) {
                $query .= $sql_line;
                if (preg_match("/;\s*$/", $sql_line)) {
                    $query = str_replace(";", "", "$query");
                    $result = mysql_query($query);
                    if (!$result && !$ignoreerrors)
                        die(mysql_error());
                    $query = "";
                }
            }
        }
    }
} 