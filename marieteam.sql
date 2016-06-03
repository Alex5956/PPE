-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 22 Janvier 2016 à 08:41
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `marieteam`
--
CREATE DATABASE IF NOT EXISTS `marieteam` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `marieteam`;

-- --------------------------------------------------------

--
-- Structure de la table `bateau`
--

CREATE TABLE IF NOT EXISTS `bateau` (
  `IdBateau` int(10) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Longueur` int(10) NOT NULL,
  `Largeur` int(10) NOT NULL,
  `Image` text NOT NULL,
  `Equip` text NOT NULL,
  `Vitesse` int(11) NOT NULL,
  PRIMARY KEY (`IdBateau`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `bateau`
--

INSERT INTO `bateau` (`IdBateau`, `Nom`, `Longueur`, `Largeur`, `Image`, `Equip`, `Vitesse`) VALUES
(1, 'a', 2, 3, 'bat1.jpg', '-Acces bar\r\n-Bar\r\n-Pont', 26),
(2, 'b', 2, 3, 'bat2.jpg', '-Acces handicape\r\n-Pont', 0);

-- --------------------------------------------------------

--
-- Structure de la table `bateaufret`
--

CREATE TABLE IF NOT EXISTS `bateaufret` (
  `PoidMaxBateauFret` int(10) NOT NULL,
  `IdBateau` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bateauvoyageur`
--

CREATE TABLE IF NOT EXISTS `bateauvoyageur` (
  `VitesseBateauVoyageur` int(3) NOT NULL,
  `ImageBateauVoyageur` varchar(500) NOT NULL,
  `NbPlacePassager` int(5) NOT NULL,
  `NbPlacePassagerPlus2M` int(5) NOT NULL,
  `NbPlacePassagerMoins2M` int(5) NOT NULL,
  `IdBateau` int(11) NOT NULL,
  PRIMARY KEY (`IdBateau`),
  UNIQUE KEY `IdBateau` (`IdBateau`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `bateauvoyageur`
--

INSERT INTO `bateauvoyageur` (`VitesseBateauVoyageur`, `ImageBateauVoyageur`, `NbPlacePassager`, `NbPlacePassagerPlus2M`, `NbPlacePassagerMoins2M`, `IdBateau`) VALUES
(5, 'InsererLienImage', 2, 3, 4, 1),
(4, 'InsererLienImage', 3, 4, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `Lettre` int(10) NOT NULL,
  `Libéllé` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `CapacitéMax` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `enregistrer`
--

CREATE TABLE IF NOT EXISTS `enregistrer` (
  `Quantité` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE IF NOT EXISTS `equipement` (
  `iDEquipement` int(10) NOT NULL AUTO_INCREMENT,
  `LibelleEquipement` varchar(50) NOT NULL,
  PRIMARY KEY (`iDEquipement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `liaison`
--

CREATE TABLE IF NOT EXISTS `liaison` (
  `CodeLiaison` int(10) NOT NULL AUTO_INCREMENT,
  `Distance` int(10) NOT NULL,
  `CodeSecteur` int(11) NOT NULL,
  `NomLiaison` text NOT NULL,
  PRIMARY KEY (`CodeLiaison`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `liaison`
--

INSERT INTO `liaison` (`CodeLiaison`, `Distance`, `CodeSecteur`, `NomLiaison`) VALUES
(1, 1, 1, 'Hambourg-Dunkerque'),
(2, 2, 2, 'Dunkerque-Ramsgate'),
(3, 2, 3, 'Ramsgate-Hamburg');

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE IF NOT EXISTS `periode` (
  `DateDeb` date NOT NULL,
  `DateFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `port`
--

CREATE TABLE IF NOT EXISTS `port` (
  `idPort` int(10) NOT NULL AUTO_INCREMENT,
  `NomPort` varchar(50) NOT NULL,
  `CodeLiaison` int(11) NOT NULL,
  PRIMARY KEY (`idPort`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `port`
--

INSERT INTO `port` (`idPort`, `NomPort`, `CodeLiaison`) VALUES
(1, 'Hamburg', 1),
(2, 'Dunkerque', 2),
(3, 'Ramsgate', 3);

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE IF NOT EXISTS `possede` (
  `bateau` int(11) NOT NULL,
  `equipement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `numReservation` int(10) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `CodePostal` int(5) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  `NumTraverse` int(11) NOT NULL,
  `Adulte` int(11) NOT NULL,
  `Junior` int(11) NOT NULL,
  `Enfant` int(11) NOT NULL,
  `Voit4m` int(11) NOT NULL,
  `Voit5m` int(11) NOT NULL,
  `Fourgon` int(11) NOT NULL,
  `Camping` int(11) NOT NULL,
  `Camion` int(11) NOT NULL,
  PRIMARY KEY (`numReservation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`numReservation`, `Nom`, `Adresse`, `CodePostal`, `Ville`, `NumTraverse`, `Adulte`, `Junior`, `Enfant`, `Voit4m`, `Voit5m`, `Fourgon`, `Camping`, `Camion`) VALUES
(1, 'Non', '5 aze', 11111, 'pu', 6, 1, 0, 0, 0, 0, 0, 0, 0),
(2, '', '', 0, '', 5, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE IF NOT EXISTS `secteur` (
  `idSecteur` int(10) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`idSecteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `secteur`
--

INSERT INTO `secteur` (`idSecteur`, `Nom`) VALUES
(1, 'Flandres Interieurs'),
(2, 'Flandres Maritimes'),
(3, 'Flandres totales');

-- --------------------------------------------------------

--
-- Structure de la table `tarifer`
--

CREATE TABLE IF NOT EXISTS `tarifer` (
  `Tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `traverse`
--

CREATE TABLE IF NOT EXISTS `traverse` (
  `numTraverse` int(10) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Heure` varchar(5) NOT NULL,
  `CodeLiaison` int(10) NOT NULL,
  `IdBateau` int(10) NOT NULL,
  `NbPlacePassagerRestant` int(11) NOT NULL,
  `NbPlacePassagerMoins2MRestant` int(11) NOT NULL,
  `NbPlacePassagerPlus2MRestant` int(11) NOT NULL,
  PRIMARY KEY (`numTraverse`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `traverse`
--

INSERT INTO `traverse` (`numTraverse`, `Date`, `Heure`, `CodeLiaison`, `IdBateau`, `NbPlacePassagerRestant`, `NbPlacePassagerMoins2MRestant`, `NbPlacePassagerPlus2MRestant`) VALUES
(1, '2016-07-27', '8:00', 1, 1, 0, 0, 0),
(2, '2016-07-27', '8:00', 2, 1, 0, 0, 0),
(3, '2016-07-27', '8:00', 3, 1, 0, 0, 0),
(4, '2016-07-27', '10:00', 1, 2, 0, 0, 0),
(5, '2016-07-27', '10:00', 2, 2, 0, 0, 0),
(6, '2016-07-27', '10:00', 3, 2, 0, 0, 0),
(7, '2016-07-28', '8:00', 1, 1, 0, 0, 0),
(8, '2016-07-28', '8:00', 2, 1, 0, 0, 0),
(9, '2016-07-28', '8:00', 3, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `numType` int(10) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`numType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
