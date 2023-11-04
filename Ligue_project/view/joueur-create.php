{{ include('header.php', {title: 'Nouveau Joueur'}) }}
<div class="c-form">
    <form action="{{path}}joueur/store" method="POST">

        <label for="prenom"> Prenom :</label>
        <input type="text" id="prenom" name="prenom"> 
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom"> 
        <label for="dateNaiss"> Date de Naissance :</label>
        <input type="date" id="dateNaiss" name="date_naissance"> 
        <label for="adresse"> Addresse :</label>
        <textarea cols="30" rows="3" id="adresse" name="adresse"> </textarea>
        <label for="equipe">Equipe :</label>
        <select name="Equipe_id" id="equipe">
            <option value="">---- Veuillez Selectionner une Equipe ----</option>
            {%  for equipe in equipes %}
            <option value="{{ equipe.id }}">{{ equipe.nom }}</option>
            {% endfor %}

        </select>
        
        <input type="submit" value="Ajouter">

    </form>
</div>