{{ include('header.php', {title: 'Profile du Joueur'}) }}
<body>
    <div class="container">
        <h1>Profile du joueur</h1>

        <p><strong>Nom:</strong> {{ joueur.nom }}</p>
        <p><strong>Prénom:</strong> {{ joueur.prenom }}</p>
        <p><strong>Age:</strong> {{ age }} ans</p>
        <p><strong>Addresse:</strong> {{ joueur.adresse }}</p>
        <p><strong>Equipe:</strong> {{ nom }}</p>
        <a href="{{path}}joueur/edit/{{ joueur.id }}" class="edit-button">Modifier</a>
    </div>
</body>
</html>