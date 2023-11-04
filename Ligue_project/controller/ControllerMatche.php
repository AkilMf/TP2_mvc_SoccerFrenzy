<?php
RequirePage::model('CRUD');
RequirePage::model('Matche');
RequirePage::model('Equipe');
RequirePage::model('Competition');
require_once('controller/ControllerHome.php');

class ControllerMatche extends Controller{

    public function index(){
        $matche = new Matche();
        $equipe = new Equipe;
        $competition = new Competition;
        $selectMatches = $matche->select();
        $selectEquipes = $equipe->select();
        $selectCompetition = $competition->select();
        return Twig::render('matches-liste.php',['matches'=>$selectMatches, 'equipes'=>$selectEquipes, 'competitions'=>$selectCompetition]);
    }

    public function create(){

        $equipe = new Equipe;
        $selectEquipes = $equipe->select('nom');
        $competition = new Competition;
        $selectCompetitions = $competition->select('nom');
        return Twig::render('matche-create.php', ['equipes'=>$selectEquipes,'competitions'=> $selectCompetitions]);
    }

    public function store(){
        try {
            if(empty(!$_POST)){
                $matche = new Matche();
                $insert = $matche->insert($_POST);
                $this->index();
            }
            else{
                
                $controller = new ControllerHome;
                echo $controller->error();
            }

        } catch (PDOException $e) {
            // foreign key exception
            echo " Vous devez au moins selectionner la competition et les deux equipes !  <br>"; //. $e->getMessage();
                $controller = new ControllerHome;
                echo $controller->error();
        }



    }
}

?>