-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: care_db_v1
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ardoise`
--

DROP TABLE IF EXISTS `ardoise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ardoise` (
  `id_ardoise` int NOT NULL,
  `id_membres` int DEFAULT NULL,
  `type` enum('Consommation','Avance_repas','Paiement') DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `montant` decimal(8,2) NOT NULL,
  `date` date NOT NULL,
  `id_sceance` int DEFAULT NULL,
  PRIMARY KEY (`id_ardoise`),
  KEY `id_membres` (`id_membres`),
  KEY `id_produit` (`id_produit`),
  KEY `id_sceance` (`id_sceance`),
  CONSTRAINT `ardoise_ibfk_1` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`),
  CONSTRAINT `ardoise_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  CONSTRAINT `ardoise_ibfk_3` FOREIGN KEY (`id_sceance`) REFERENCES `sceance` (`id_sceance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ardoise`
--

LOCK TABLES `ardoise` WRITE;
/*!40000 ALTER TABLE `ardoise` DISABLE KEYS */;
/*!40000 ALTER TABLE `ardoise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comites`
--

DROP TABLE IF EXISTS `comites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comites` (
  `id_comite` int NOT NULL,
  `id_membres` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  `annee` int NOT NULL DEFAULT (50),
  `mj` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_comite`),
  KEY `id_membres` (`id_membres`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `comites_ibfk_1` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`),
  CONSTRAINT `comites_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role_comites` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comites`
--

LOCK TABLES `comites` WRITE;
/*!40000 ALTER TABLE `comites` DISABLE KEYS */;
/*!40000 ALTER TABLE `comites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotisations`
--

DROP TABLE IF EXISTS `cotisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotisations` (
  `id_cotisations` int NOT NULL,
  `id_membres` int DEFAULT NULL,
  `annee` int NOT NULL,
  `montant` decimal(8,2) NOT NULL DEFAULT (50),
  `date_paiement` date DEFAULT NULL,
  PRIMARY KEY (`id_cotisations`),
  KEY `id_membres` (`id_membres`),
  CONSTRAINT `cotisations_ibfk_1` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotisations`
--

LOCK TABLES `cotisations` WRITE;
/*!40000 ALTER TABLE `cotisations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membres`
--

DROP TABLE IF EXISTS `membres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membres` (
  `id_membres` int NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `statut` enum('ordinaire','invite','accompagnant') NOT NULL,
  `date_exclu` date DEFAULT NULL,
  `motif_exclu` enum('comportement','absences','impaye') DEFAULT NULL,
  `genre` enum('F','H','X') DEFAULT NULL,
  `pseudo` varchar(50) DEFAULT NULL,
  `adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`id_membres`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membres`
--

LOCK TABLES `membres` WRITE;
/*!40000 ALTER TABLE `membres` DISABLE KEYS */;
/*!40000 ALTER TABLE `membres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mj`
--

DROP TABLE IF EXISTS `mj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mj` (
  `id_mj` int NOT NULL,
  `id_membres` int DEFAULT NULL,
  `id_sceance` int DEFAULT NULL,
  PRIMARY KEY (`id_mj`),
  KEY `id_membres` (`id_membres`),
  KEY `id_sceance` (`id_sceance`),
  CONSTRAINT `mj_ibfk_1` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`),
  CONSTRAINT `mj_ibfk_2` FOREIGN KEY (`id_sceance`) REFERENCES `sceance` (`id_sceance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mj`
--

LOCK TABLES `mj` WRITE;
/*!40000 ALTER TABLE `mj` DISABLE KEYS */;
/*!40000 ALTER TABLE `mj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participation`
--

DROP TABLE IF EXISTS `participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participation` (
  `id_participation` int NOT NULL,
  `id_tafel` int DEFAULT NULL,
  `id_membres` int DEFAULT NULL,
  `role_j` enum('Joueur','MJ') DEFAULT NULL,
  `absent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_participation`),
  KEY `id_tafel` (`id_tafel`),
  KEY `id_membres` (`id_membres`),
  CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`id_tafel`) REFERENCES `tafel_de_jeu` (`id_tafel`),
  CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participation`
--

LOCK TABLES `participation` WRITE;
/*!40000 ALTER TABLE `participation` DISABLE KEYS */;
/*!40000 ALTER TABLE `participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `id_produit` int NOT NULL,
  `nom_produit` varchar(50) NOT NULL,
  `prix_achat` decimal(6,2) NOT NULL,
  `prix_vente` decimal(6,2) NOT NULL,
  `quantite` int NOT NULL,
  `peremption` date DEFAULT NULL,
  `date_entree` date NOT NULL,
  `date_sortie` date DEFAULT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_comites`
--

DROP TABLE IF EXISTS `role_comites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_comites` (
  `id_role` int NOT NULL,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_comites`
--

LOCK TABLES `role_comites` WRITE;
/*!40000 ALTER TABLE `role_comites` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_comites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sceance`
--

DROP TABLE IF EXISTS `sceance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sceance` (
  `id_sceance` int NOT NULL,
  `id_jeu` int DEFAULT NULL,
  `date` date NOT NULL,
  `creaneau` enum('Après-midi','Soir') DEFAULT NULL,
  `statut` enum('Prévu','Annulé') DEFAULT NULL,
  PRIMARY KEY (`id_sceance`),
  KEY `id_jeu` (`id_jeu`),
  CONSTRAINT `sceance_ibfk_1` FOREIGN KEY (`id_jeu`) REFERENCES `type_jeu` (`id_jeu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sceance`
--

LOCK TABLES `sceance` WRITE;
/*!40000 ALTER TABLE `sceance` DISABLE KEYS */;
/*!40000 ALTER TABLE `sceance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tafel_de_jeu`
--

DROP TABLE IF EXISTS `tafel_de_jeu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tafel_de_jeu` (
  `id_tafel` int NOT NULL,
  `id_sceance` int DEFAULT NULL,
  `local` enum('Couture','Oenologie','Cour') DEFAULT NULL,
  PRIMARY KEY (`id_tafel`),
  KEY `id_sceance` (`id_sceance`),
  CONSTRAINT `tafel_de_jeu_ibfk_1` FOREIGN KEY (`id_sceance`) REFERENCES `sceance` (`id_sceance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tafel_de_jeu`
--

LOCK TABLES `tafel_de_jeu` WRITE;
/*!40000 ALTER TABLE `tafel_de_jeu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tafel_de_jeu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id_transactions` int NOT NULL,
  `sens` enum('Entrée','Sortie') DEFAULT NULL,
  `type` enum('Subvention','Cotisation','Vente','Achats_stock','Fourniture') DEFAULT NULL,
  `montant` decimal(8,2) NOT NULL,
  `date` date DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_transactions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_jeu`
--

DROP TABLE IF EXISTS `type_jeu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_jeu` (
  `id_jeu` int NOT NULL,
  `titre` varchar(100) NOT NULL,
  `type` enum('Scenario','Campagne') DEFAULT 'Scenario',
  `jdr` tinyint(1) NOT NULL,
  `statut` enum('Prévu','En cours','Terminer') DEFAULT NULL,
  PRIMARY KEY (`id_jeu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_jeu`
--

LOCK TABLES `type_jeu` WRITE;
/*!40000 ALTER TABLE `type_jeu` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_jeu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-15 19:19:19
