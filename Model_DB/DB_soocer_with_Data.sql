-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 04 nov. 2023 à 03:12
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `soocer`
--

-- --------------------------------------------------------

--
-- Structure de la table `competition`
--

CREATE TABLE `competition` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `competition`
--

INSERT INTO `competition` (`id`, `nom`) VALUES
(1, 'Golden Ligue'),
(2, 'Coupe du Trone'),
(3, 'North Cup'),
(4, 'Glory Tournament'),
(5, 'FaRey Ligue'),
(6, 'Western Chamiopn');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `categorie` varchar(45) NOT NULL,
  `Etablissement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`id`, `nom`, `categorie`, `Etablissement_id`) VALUES
(1, 'Silver leopards', 'Junior', 1),
(2, 'Red Foxes', 'Senior', 2),
(3, 'Les Lions du Nord', 'Senior', 4),
(4, 'Les Aigles C', 'Junior', 6),
(5, 'Toronto Panthers', 'Cade', 5),
(6, 'Ahunstic club', '', 3);

-- --------------------------------------------------------

--
-- Structure de la table `equipe_participation`
--

CREATE TABLE `equipe_participation` (
  `Equipe_id` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id` int(11) NOT NULL,
  `nom_etablissement` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id`, `nom_etablissement`) VALUES
(1, 'College Maisonneuve'),
(2, 'Laval University'),
(3, 'cegep Ahunstic'),
(4, 'Univ Sherbrook'),
(5, 'Toronto University'),
(6, 'Cegep Gatineau');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` varchar(150) DEFAULT NULL,
  `Equipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`id`, `nom`, `prenom`, `date_naissance`, `adresse`, `Equipe_id`) VALUES
(2, 'Beckam', 'David Junior', '2002-06-20', '178 Wellimgton', 4),
(3, 'Hadji', 'George', '1983-06-17', '78 Niy street Sidney', 4),
(4, 'elBahja', 'Khalid', '1977-01-18', '485 rue nahda Tangier', 1),
(12, 'Vieri', 'Patrick', '1999-10-25', 'angrignion hg7 5d8', 1),
(13, 'adebayor', 'samuel', '2001-10-03', 'quartier des pommes 78', 2),
(49, 'akil', 'mostafa', '1993-06-11', ' 7850 rue glory', 5);

-- --------------------------------------------------------

--
-- Structure de la table `matche`
--

CREATE TABLE `matche` (
  `id` int(11) NOT NULL,
  `match_date` date NOT NULL,
  `equipe_exterieur` int(11) NOT NULL,
  `equipe_Domicile` int(11) NOT NULL,
  `score_domicile` int(11) DEFAULT NULL,
  `score_exterieur` int(11) DEFAULT NULL,
  `Competition_id` int(11) NOT NULL,
  `commentaire` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `matche`
--

INSERT INTO `matche` (`id`, `match_date`, `equipe_exterieur`, `equipe_Domicile`, `score_domicile`, `score_exterieur`, `Competition_id`, `commentaire`) VALUES
(16, '2023-11-14', 6, 4, 0, 8, 5, ' Final'),
(22, '2023-11-15', 1, 3, 0, 0, 4, 'Semi final');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Equipe_Etablissement1_idx` (`Etablissement_id`);

--
-- Index pour la table `equipe_participation`
--
ALTER TABLE `equipe_participation`
  ADD PRIMARY KEY (`Equipe_id`,`competition_id`),
  ADD UNIQUE KEY `competition_id_UNIQUE` (`competition_id`),
  ADD KEY `fk_Equipe_has_Ligue_Ligue1_idx` (`competition_id`),
  ADD KEY `fk_Equipe_has_Ligue_Equipe1_idx` (`Equipe_id`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Joueur_Equipe1_idx` (`Equipe_id`);

--
-- Index pour la table `matche`
--
ALTER TABLE `matche`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_match_Equipe1_idx` (`equipe_Domicile`),
  ADD KEY `fk_match_Equipe2_idx` (`equipe_exterieur`),
  ADD KEY `fk_match_Competition1_idx` (`Competition_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `competition`
--
ALTER TABLE `competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `matche`
--
ALTER TABLE `matche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `fk_Equipe_Etablissement1` FOREIGN KEY (`Etablissement_id`) REFERENCES `etablissement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `equipe_participation`
--
ALTER TABLE `equipe_participation`
  ADD CONSTRAINT `fk_Equipe_has_Ligue_Equipe1` FOREIGN KEY (`Equipe_id`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Equipe_has_Ligue_Ligue1` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD CONSTRAINT `fk_Joueur_Equipe1` FOREIGN KEY (`Equipe_id`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `matche`
--
ALTER TABLE `matche`
  ADD CONSTRAINT `fk_match_Competition1` FOREIGN KEY (`Competition_id`) REFERENCES `competition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_match_Equipe1` FOREIGN KEY (`equipe_Domicile`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_match_Equipe2` FOREIGN KEY (`equipe_exterieur`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
