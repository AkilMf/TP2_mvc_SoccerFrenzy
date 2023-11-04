<?php
RequirePage::model('CRUD');
RequirePage::model('Joueur');
RequirePage::model('Equipe');
require_once('controller/ControllerHome.php');

class ControllerJoueur extends Controller {
    public function index() {
        $joueur = new Joueur();
        $select = $joueur->select();
        
        return Twig::render('joueur-index.php',['joueurs'=>$select]);
        
    }

    public function create(){

        $equipe = new Equipe;
        $selectEquipes = $equipe->select('nom');
        return Twig::render('joueur-create.php', ['equipes'=>$selectEquipes]);
    }

    // lien pour la methode store n aura pas accessible directment
    public function store(){
        try {
            if(empty(!$_POST)){
                $joueur = new Joueur;
                $insert = $joueur->insert($_POST);
                RequirePage::url('joueur/show/'.$insert);
            }
            else{
                
                $controller = new ControllerHome;
                //echo $controller->error('404');
                echo  $controller->index();
            }

        } catch (PDOException $e) {
            // foreign key exception
            echo " Vous devez Remplir les informations du joueur au moins son équipe !  <br>"; //. $e->getMessage();
                $controller = new ControllerHome;
                echo $controller->error('404');
        } 
     }

     public function show($id=null){
        if(isset($id) && is_numeric($id)){
            $joueur = new Joueur;
            $joueurToShow = $joueur->selectId($id);

            if($joueurToShow['id'] == $id ){
                $age = $joueur->calculAge($joueurToShow['date_naissance']);
                $equipe = new Equipe;
                $selectEquipe = $equipe->selectId($joueurToShow['Equipe_id']);
                return Twig::render('joueur-show.php', ['joueur'=>$joueurToShow, 'nom'=>  $selectEquipe['nom'], 'age'=> $age]);
            }
        }else{
            $controller = new ControllerHome;
            echo $controller->error();
        }
    }
    public function edit($id=null){
        // si je recois un "id" : gestion d'erreur ( Uncaught ArgumentCountError )
        if(isset($id) && is_numeric($id)){
            $joueur = new Joueur;
            $selectId = $joueur->selectId($id);
            if($selectId['id'] == $id ){
                $equipe = new Equipe;
                $selectEquipes = $equipe->select('nom');
                return Twig::render('joueur-edit.php', ['joueur'=>$selectId, 'equipes'=>$selectEquipes]);
            }
            else{
                $controller = new ControllerHome;
                echo  $controller->error();
            }
        }else{
            $controller = new ControllerHome;
            echo  $controller->error();
        }
    }

    public function destroy(){
        if(isset($_POST['id'])){
            $joueur = new Joueur;
            $joueurToDelete = $joueur->selectId($_POST['id']);
            // si le joueur existe
            if($joueurToDelete['id'] == $_POST['id'] ){

                $update = $joueur->delete($_POST['id']);
                $select = $joueur->select();
                return Twig::render('joueur-index.php',['joueurs'=>$select]);
            }
            // id n'existe pas dans ma table joueur
            else{ 
                $controller = new ControllerHome;
                echo  $controller->error();
            }             
        }
        else{
            echo '<br> Aucun Joueur à Supprimer n a été selectionné !';
            $controller = new ControllerHome;
            echo  $controller->error();
        }
    }
 
    public function update(){


        // lien pour la methode update n aura pas accessible directment
        try {
            if(empty(!$_POST)){
                $joueur = new Joueur;
                $update = $joueur->update($_POST);
                $this->show($_POST['id']);
            }
            else{
                
                $controller = new ControllerHome;
                echo $controller->error();
                //echo  $controller->index();
            }

        } catch (PDOException $e) {
            // foreign key exception
            
            $controller = new ControllerHome;
            echo $controller->error();
            echo " Vous devez Remplir les informations du joueur à Modifier au moins son équipe !  <br>"; //. $e->getMessage();                
        } 
    }   
}
?>