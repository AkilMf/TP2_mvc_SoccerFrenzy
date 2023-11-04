{{ include('header.php', {title: 'Liste des Joueur'}) }}

<body>
<a href="{{path}}joueur/create"><button class="add-button">Nouveau Joueur</button></a>
<div class="player-list">

    {% for joueur in joueurs %}

        <div class="player-card">
            <h2> {{ joueur.prenom }} {{ joueur.nom }}</h2>
            <p>Addresse: <strong>{{ joueur.adresse }}</strong></p>
            </p>
            
            <p>Né(e) le :<strong> {{ joueur.date_naissance }}</strong></p>
            <a href="{{path}}joueur/show/{{ joueur.id }}"><p>Voir plus..</p></a>

            <form action="{{path}}joueur/destroy" method="post">
                <input type="hidden" name="id" value="{{joueur.id}}">
                <input type="submit" value="Supprimer" class="delete-button">
            </form>
        </div>
    {% endfor %}

</div>