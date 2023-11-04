{{ include('header.php', {title: 'Nouveau Joueur'}) }}

<div class="c-form">
    <form action="{{path}}matche/store" method="POST">
        <label for="ligue"> Ligue (Compétition)</label>
        <select name="Competition_id" id="ligue">
            <option value="">---- Veuillez Selectionner une Competition (Ligue) ----</option>
            {% for competition in competitions %}
            <option value="{{ competition.id }}">{{ competition.nom }}</option>
            {% endfor %}
        </select>
        <label for="date_matche"> Date du Matche :</label>
        <input type="date" id="date_matche" name="match_date"> 

        <label for="equipe_Domicile">Équipe à domicile  :</label>
        <select name="equipe_Domicile" id="equipe_Domicile">
        <option value="">---- Veuillez Selectionner une Equipe ----</option>
            {%  for equipe in equipes %}
            <option value="{{ equipe.id }}">{{ equipe.nom }}</option>
            {% endfor %}
        </select>

        <label for="equipe_exterieur">Équipe à Exterieur :  :</label>
        <select name="equipe_exterieur" id="equipe_exterieur">
            <option value="">---- Veuillez Selectionner une Equipe ----</option>
            {%  for equipe in equipes %}
            <option value="{{ equipe.id }}">{{ equipe.nom }}</option>
            {% endfor %}

        </select>
        <label for="sore_domicile">Score Domicile :</label>
        <input type="number" id="score_domicile" name="score_domicile">
        <label for="score_exterieur">Score Exterieur :</label>
        <input type="number" id="score_exterieur" name="score_exterieur">
        <label for="commentaire"> Commentaire :</label>
        <textarea cols="30" rows="3" id="commentaire" name="commentaire"> </textarea>
        
        
        <input type="submit" value="Ajouter">

    </form>
</div>