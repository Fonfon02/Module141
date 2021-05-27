-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 13 Juin 2019 à 15:59
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

-- Recreate
-- DROP DATABASE IF EXISTS db104;
-- CREATE DATABASE IF NOT EXISTS db104;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `fontanellaz_colin_sondes_bd_104`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_associer`
--

CREATE TABLE `t_associer` (
  `id_associer` int(11) NOT NULL,
  `fk_fonction` int(11) NOT NULL,
  `fk_sonde` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_choix_fonct`
--

CREATE TABLE `t_choix_fonct` (
  `id_choix_fonct` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL,
  `fk_fonction` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_client`
--

CREATE TABLE `t_client` (
  `id_client` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prénom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_client`
--

INSERT INTO `t_client` (`id_client`, `Nom`, `Prénom`) VALUES
(3, 'Thierry', 'Leblanc'),
(10, 'Jean', 'Naimarre');

-- --------------------------------------------------------

--
-- Structure de la table `t_desassocier`
--

CREATE TABLE `t_desassocier` (
  `id_desassocier` int(11) NOT NULL,
  `fk_fonction` int(11) NOT NULL,
  `fk_sonde` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_entreprise`
--

CREATE TABLE `t_entreprise` (
  `id_entreprise` int(11) NOT NULL,
  `Entreprise` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_entreprise`
--

INSERT INTO `t_entreprise` (`id_entreprise`, `Entreprise`) VALUES
(18, 'AutreEntreprise'),
(15, 'Entreprise');

-- --------------------------------------------------------

--
-- Structure de la table `t_faire_partie`
--

CREATE TABLE `t_faire_partie` (
  `id_faire_partie` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL,
  `fk_entreprise` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_fonction`
--

CREATE TABLE `t_fonction` (
  `id_fonction` int(11) NOT NULL,
  `Fonction` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_fonction`
--

INSERT INTO `t_fonction` (`id_fonction`, `Fonction`) VALUES
(8, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `t_sonde`
--

CREATE TABLE `t_sonde` (
  `id_sonde` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `NrItem` double NOT NULL,
  `Prix` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_sonde`
--

INSERT INTO `t_sonde` (`id_sonde`, `Nom`, `NrItem`, `Prix`) VALUES
(15, 'AB-CD', 5804008029, '481');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_associer`
--
ALTER TABLE `t_associer`
  ADD PRIMARY KEY (`id_associer`),
  ADD KEY `fk_fonction` (`fk_fonction`),
  ADD KEY `fk_fonction_2` (`fk_fonction`,`fk_sonde`),
  ADD KEY `fk_sonde` (`fk_sonde`);

--
-- Index pour la table `t_choix_fonct`
--
ALTER TABLE `t_choix_fonct`
  ADD PRIMARY KEY (`id_choix_fonct`),
  ADD KEY `fk_client` (`fk_client`,`fk_fonction`),
  ADD KEY `fk_fonction` (`fk_fonction`);

--
-- Index pour la table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `t_desassocier`
--
ALTER TABLE `t_desassocier`
  ADD PRIMARY KEY (`id_desassocier`),
  ADD KEY `fk_fonction` (`fk_fonction`,`fk_sonde`),
  ADD KEY `fk_sonde` (`fk_sonde`);

--
-- Index pour la table `t_entreprise`
--
ALTER TABLE `t_entreprise`
  ADD PRIMARY KEY (`id_entreprise`),
  ADD UNIQUE KEY `Entreprise` (`Entreprise`);

--
-- Index pour la table `t_faire_partie`
--
ALTER TABLE `t_faire_partie`
  ADD PRIMARY KEY (`id_faire_partie`),
  ADD KEY `fk_client` (`fk_client`,`fk_entreprise`),
  ADD KEY `fk_entreprise` (`fk_entreprise`);

--
-- Index pour la table `t_fonction`
--
ALTER TABLE `t_fonction`
  ADD PRIMARY KEY (`id_fonction`),
  ADD UNIQUE KEY `Fonction` (`Fonction`);

--
-- Index pour la table `t_sonde`
--
ALTER TABLE `t_sonde`
  ADD PRIMARY KEY (`id_sonde`),
  ADD UNIQUE KEY `Nom` (`Nom`),
  ADD UNIQUE KEY `NrItem` (`NrItem`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_associer`
--
ALTER TABLE `t_associer`
  MODIFY `id_associer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_choix_fonct`
--
ALTER TABLE `t_choix_fonct`
  MODIFY `id_choix_fonct` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_client`
--
ALTER TABLE `t_client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `t_desassocier`
--
ALTER TABLE `t_desassocier`
  MODIFY `id_desassocier` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_entreprise`
--
ALTER TABLE `t_entreprise`
  MODIFY `id_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `t_faire_partie`
--
ALTER TABLE `t_faire_partie`
  MODIFY `id_faire_partie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_fonction`
--
ALTER TABLE `t_fonction`
  MODIFY `id_fonction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `t_sonde`
--
ALTER TABLE `t_sonde`
  MODIFY `id_sonde` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_associer`
--
ALTER TABLE `t_associer`
  ADD CONSTRAINT `t_associer_ibfk_1` FOREIGN KEY (`fk_fonction`) REFERENCES `t_fonction` (`id_fonction`),
  ADD CONSTRAINT `t_associer_ibfk_2` FOREIGN KEY (`fk_sonde`) REFERENCES `t_sonde` (`id_sonde`);

--
-- Contraintes pour la table `t_choix_fonct`
--
ALTER TABLE `t_choix_fonct`
  ADD CONSTRAINT `t_choix_fonct_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`),
  ADD CONSTRAINT `t_choix_fonct_ibfk_2` FOREIGN KEY (`fk_fonction`) REFERENCES `t_fonction` (`id_fonction`);

--
-- Contraintes pour la table `t_desassocier`
--
ALTER TABLE `t_desassocier`
  ADD CONSTRAINT `t_desassocier_ibfk_1` FOREIGN KEY (`fk_fonction`) REFERENCES `t_fonction` (`id_fonction`),
  ADD CONSTRAINT `t_desassocier_ibfk_2` FOREIGN KEY (`fk_sonde`) REFERENCES `t_sonde` (`id_sonde`);

--
-- Contraintes pour la table `t_faire_partie`
--
ALTER TABLE `t_faire_partie`
  ADD CONSTRAINT `t_faire_partie_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`),
  ADD CONSTRAINT `t_faire_partie_ibfk_2` FOREIGN KEY (`fk_entreprise`) REFERENCES `t_entreprise` (`id_entreprise`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
