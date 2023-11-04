<?php

class Twig{
    // $template est la page à charger
    // $data est les données envoyées au format tableau
    static public function render($template, $data = array()){
        $loader = new \Twig\Loader\FilesystemLoader('view');
        $twig = new  \Twig\Environment($loader, array('auto_reload' => true));
        
        $twig->addGlobal('path', PATH_DIR);        
        echo $twig->render($template, $data);
    }

}


?>


