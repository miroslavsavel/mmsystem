-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2021 at 04:42 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `fin_den_zam`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `fin_den_zam` (`cislo_zamestnanca` INT)  BEGIN
    DECLARE koef_platu DECIMAL(6,3);
    DECLARE prip_sobota DECIMAL(6,3);
    DECLARE prip_nedela DECIMAL(6,3);
    DECLARE prip_noc DECIMAL(6,3);
    DECLARE prip_sviatok DECIMAL(6,3);
    DECLARE koef_km DECIMAL(6,3);
    DECLARE suma DECIMAL(6,3);



    SELECT DISTINCT
        koef_platu, priplatok_sobota, priplatok_nedela, priplatok_noc, priplatok_sviatok, koef_km
    INTO 
        koef_platu, prip_sobota, prip_nedela, prip_noc, prip_sviatok, koef_km
    FROM 
        zamestnanci Z
    WHERE 
        #--Z.cislo_zamestnanca = NEW.cislo_zamestnanca_id;   #--tuto je chyba!!!!! ma problem s tymto nacitanim do obsahu premennych
        #--vyskusaj to s napevno zadanym 111 ako select
        Z.cislo_zamestnanca = cislo_zamestnanca; 

    SET suma := koef_platu + prip_sobota;

    INSERT INTO fin_den_zam(id_fin_den_zam,cislo_zamestnanca, schvalene_vykazy_id, meno, priezvisko, suma, typ_zaznamu,dat_ins, pozn) VALUES (NULL,cislo_zamestnanca, 1, 'MIRO', 'SAVEL', suma, true, current_timestamp(), 'TEST'); 
        
End$$

DROP PROCEDURE IF EXISTS `proc1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc1` ()  BEGIN
	DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;

    SELECT COUNT(*) FROM zamestnanci INTO n;

    SET i=0;
    WHILE i<n DO 
        INSERT INTO fin_den_zam(id_fin_den_zam,cislo_zamestnanca, schvalene_vykazy_id, meno, priezvisko, suma, typ_zaznamu,dat_ins, pozn) VALUES (NULL,111, 1, 'MIRO', 'SAVEL', -103.56, true, NOW(), 'TEST'); 
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `a01_wait_zamestnanci`
--

DROP TABLE IF EXISTS `a01_wait_zamestnanci`;
CREATE TABLE `a01_wait_zamestnanci` (
  `a01_wait_zamestnanci_id` int(11) NOT NULL,
  `a01_wait_vykazy_id` int(11) DEFAULT NULL,
  `a01_meno` varchar(50) DEFAULT NULL,
  `a01_priezvisko` varchar(50) DEFAULT NULL,
  `a01_fixna_odmena` int(11) DEFAULT NULL,
  `a01_fakturovana_suma` int(11) DEFAULT NULL,
  `a01_cas_od` datetime DEFAULT NULL,
  `a01_cas_do` datetime DEFAULT NULL,
  `a01_pocet_hodin` decimal(6,3) DEFAULT NULL,
  `a01_hod_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela` decimal(6,3) DEFAULT NULL,
  `a01_hod_sviatok` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota_sviatok` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela_sviatok` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `a01_who` varchar(50) DEFAULT NULL,
  `a01_dat_ins` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `a01_wait_zamestnanci`
--

INSERT INTO `a01_wait_zamestnanci` (`a01_wait_zamestnanci_id`, `a01_wait_vykazy_id`, `a01_meno`, `a01_priezvisko`, `a01_fixna_odmena`, `a01_fakturovana_suma`, `a01_cas_od`, `a01_cas_do`, `a01_pocet_hodin`, `a01_hod_noc`, `a01_hod_sobota`, `a01_hod_nedela`, `a01_hod_sviatok`, `a01_hod_sobota_noc`, `a01_hod_nedela_noc`, `a01_hod_sviatok_noc`, `a01_hod_sobota_sviatok`, `a01_hod_nedela_sviatok`, `a01_hod_sobota_sviatok_noc`, `a01_hod_nedela_sviatok_noc`, `a01_who`, `a01_dat_ins`) VALUES
(5, 55, 'miro', 'savel', 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', 'root@localhost', '2020-10-11 18:38:57'),
(6, 55, 'marian', 'kondricik', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', 'root@localhost', '2020-10-11 18:38:57'),
(7, 56, 'miro', 'savel', 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', 'root@localhost', '2020-10-16 11:41:46'),
(8, 57, 'miro', 'savel', 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', 'root@localhost', '2020-10-24 21:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', 'test@test.com'),
(2, 'prvy', '$2y$10$xR.PBOj.ZxZSP7CXtnlQ.uYICKTHMqS11brRxn1uah3DTpS2NvGYu', 'prvy@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(48, 'PHP'),
(52, 'Javascript');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(1, 155, 'EDWIN DIAZ', 'edwin@gmail.com', 'sfdgsdfg', 'approved', '2015-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `fin_den_zam`
--

DROP TABLE IF EXISTS `fin_den_zam`;
CREATE TABLE `fin_den_zam` (
  `id_fin_den_zam` int(11) NOT NULL,
  `cislo_zamestnanca` int(11) DEFAULT NULL,
  `schvalene_vykazy_id` int(11) DEFAULT NULL,
  `meno` varchar(50) DEFAULT NULL,
  `priezvisko` varchar(50) DEFAULT NULL,
  `suma` decimal(6,3) DEFAULT NULL,
  `typ_zaznamu` enum('false','true') NOT NULL DEFAULT 'false',
  `dat_ins` datetime DEFAULT NULL,
  `pozn` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fin_den_zam`
--

INSERT INTO `fin_den_zam` (`id_fin_den_zam`, `cislo_zamestnanca`, `schvalene_vykazy_id`, `meno`, `priezvisko`, `suma`, `typ_zaznamu`, `dat_ins`, `pozn`) VALUES
(27, 111, 17, 'miro', 'savel', '31.500', 'false', '2020-10-29 21:32:37', 'Vygenerované zo schváleného výkazu');

-- --------------------------------------------------------

--
-- Table structure for table `firmy`
--

DROP TABLE IF EXISTS `firmy`;
CREATE TABLE `firmy` (
  `firmy_id` int(11) NOT NULL,
  `nazov_firmy` varchar(200) DEFAULT NULL,
  `ico` varchar(50) DEFAULT NULL,
  `dic` varchar(50) DEFAULT NULL,
  `bezna_taxa` int(11) DEFAULT NULL,
  `priplatok_noc` int(11) DEFAULT NULL,
  `priplatok_sobota` int(11) DEFAULT NULL,
  `priplatok_nedela` int(11) DEFAULT NULL,
  `priplatok_sviatok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firmy`
--

INSERT INTO `firmy` (`firmy_id`, `nazov_firmy`, `ico`, `dic`, `bezna_taxa`, `priplatok_noc`, `priplatok_sobota`, `priplatok_nedela`, `priplatok_sviatok`) VALUES
(1, '4sports media', '123859', '569878', 7, 2, 3, 2, 5),
(3, 'Backline', '564987', '452565', 1, 1, 2, 3, 4),
(4, '5media', '1265987', '563287', 7, 3, 2, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` varchar(255) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(113, 48, 'PHP', 'Edwin Diaz', 'rico', '2017-01-30', 'image_5.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'php', '', 'published', 134),
(114, 48, 'Javascript', 'Miguel', '', '2015-07-24', 'image_4.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'javascript', '', 'published', 16),
(115, 48, 'Javascript', 'Edwin Diaz', '', '2015-07-24', 'image_4.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'javascript', '', 'published', 0),
(116, 48, 'Bootstrap', 'George', '', '2015-07-24', 'image_3.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'Bootstrap', '', 'published', 4),
(118, 48, 'Javascript', 'Edwin Diaz', '', '2015-07-24', 'image_4.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'javascript', '', 'published', 4),
(119, 48, 'Javascript', 'Miguel', 'suave', '2017-07-12', 'image_2.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'javascript', '', 'draft', 1),
(121, 48, 'PHP', 'Edwin Diaz', 'suave', '2017-07-12', 'image_2.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'php', '', 'draft', 0),
(122, 48, 'Javascript', 'Miguel', 'rico', '2017-01-30', 'image_1.jpg', '<p style=\"text-align: justify; line-height: 14px; margin: 0px 0px 14px; padding: 0px; font-family: Arial, Helvetica, sans;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</p>\r\n<p>&nbsp;</p>', 'javascript', '', 'draft', 0),
(135, 48, 'Javascript', 'Edwin Diaz', '', '2016-12-10', 'lambo_1.jpg', '<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fermentum fermentum pretium. Ut nec purus at est consequat pretium vitae at tortor. Morbi pulvinar lacinia arcu, non elementum leo commodo id. Mauris congue volutpat feugiat. Praesent quis ligula vel neque consectetur mollis. Mauris a ipsum a elit pharetra sodales vitae non diam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae diam in diam malesuada gravida a sit amet arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nunc et urna eu justo ullamcorper tempus.</strong></p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>&nbsp;</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>=</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\\\\\r\\\\\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>\\\\r\\\\n</p>\r\n<p>\\r\\n</p>\r\n<p>&nbsp;</p>', 'javascript', '', 'draft', 72);

-- --------------------------------------------------------

--
-- Table structure for table `schvalene_vykazy`
--

DROP TABLE IF EXISTS `schvalene_vykazy`;
CREATE TABLE `schvalene_vykazy` (
  `schvalene_vykazy_id` int(11) NOT NULL,
  `nazov_akcie` varchar(100) DEFAULT NULL,
  `akcia_dat` date DEFAULT NULL,
  `firmy_id` int(11) NOT NULL,
  `ine_naklady` decimal(6,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schvalene_vykazy`
--

INSERT INTO `schvalene_vykazy` (`schvalene_vykazy_id`, `nazov_akcie`, `akcia_dat`, `firmy_id`, `ine_naklady`) VALUES
(1, 'zly_vstup', '2020-08-01', 4, '0.000'),
(5, 'pokus', '2020-09-01', 1, '0.000'),
(6, 'pokus2', '2020-09-01', 1, '0.000'),
(7, 'pokus3', '2020-09-01', 1, '0.000'),
(12, 'pokus', '2020-09-01', 1, '0.000'),
(13, 'pokus', '2020-09-01', 1, '0.000'),
(16, 'Magorina', '2020-09-01', 3, '0.000'),
(17, 'Magorina', '2020-09-01', 3, '0.000');

-- --------------------------------------------------------

--
-- Table structure for table `schvalene_vykazy_zamestnanci`
--

DROP TABLE IF EXISTS `schvalene_vykazy_zamestnanci`;
CREATE TABLE `schvalene_vykazy_zamestnanci` (
  `schvalene_vykazy_zamestnanci_id` int(11) NOT NULL,
  `schvalene_vykazy_id` int(11) DEFAULT NULL,
  `meno` varchar(50) DEFAULT NULL,
  `priezvisko` varchar(50) DEFAULT NULL,
  `cislo_zamestnanca_id` int(11) DEFAULT NULL,
  `fixna_odmena` int(11) DEFAULT NULL,
  `fakturovana_suma` int(11) DEFAULT NULL,
  `cas_od` datetime DEFAULT NULL,
  `cas_do` datetime DEFAULT NULL,
  `pocet_hodin` decimal(6,3) DEFAULT NULL,
  `hod_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota` decimal(6,3) DEFAULT NULL,
  `hod_nedela` decimal(6,3) DEFAULT NULL,
  `hod_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_noc` decimal(6,3) DEFAULT NULL,
  `hod_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok_noc` decimal(6,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schvalene_vykazy_zamestnanci`
--

INSERT INTO `schvalene_vykazy_zamestnanci` (`schvalene_vykazy_zamestnanci_id`, `schvalene_vykazy_id`, `meno`, `priezvisko`, `cislo_zamestnanca_id`, `fixna_odmena`, `fakturovana_suma`, `cas_od`, `cas_do`, `pocet_hodin`, `hod_noc`, `hod_sobota`, `hod_nedela`, `hod_sviatok`, `hod_sobota_noc`, `hod_nedela_noc`, `hod_sviatok_noc`, `hod_sobota_sviatok`, `hod_nedela_sviatok`, `hod_sobota_sviatok_noc`, `hod_nedela_sviatok_noc`) VALUES
(2, 5, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(3, 6, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(4, 7, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(9, 12, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(10, 13, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(12, 16, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(13, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(14, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(15, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(16, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(17, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(18, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(19, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(20, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(22, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(24, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(25, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(26, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(27, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(28, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(29, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(30, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(31, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(32, 17, 'miro', 'savel', 111, 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000');

--
-- Triggers `schvalene_vykazy_zamestnanci`
--
DROP TRIGGER IF EXISTS `fin_den_zam_insert`;
DELIMITER $$
CREATE TRIGGER `fin_den_zam_insert` AFTER INSERT ON `schvalene_vykazy_zamestnanci` FOR EACH ROW BEGIN

    DECLARE koef_platu DECIMAL(6,3);
    DECLARE prip_sobota DECIMAL(6,3);
    DECLARE prip_nedela DECIMAL(6,3);
    DECLARE prip_noc DECIMAL(6,3);
    DECLARE prip_sviatok DECIMAL(6,3);
    DECLARE koef_km DECIMAL(6,3);
    DECLARE suma DECIMAL(6,3);
    DECLARE dat_ins DATETIME;
    DECLARE pozn VARCHAR(200);
    #--tu si zadefinujem premenne do ktorych vlozim INSERTOVANE hodnoty
    DECLARE pocet_std_hod DECIMAL(6,3);
    DECLARE suma_std_hod DECIMAL(6,3);
    DECLARE suma_prip_noc DECIMAL(6,3);
    DECLARE suma_prip_sobota DECIMAL(6,3);
    DECLARE suma_prip_nedela DECIMAL(6,3);
    DECLARE suma_prip_sviatok DECIMAL(6,3);
    DECLARE suma_prip_sobota_noc DECIMAL(6,3);
    DECLARE suma_prip_nedela_noc DECIMAL(6,3);
    DECLARE suma_prip_sviatok_noc DECIMAL(6,3);
    DECLARE suma_prip_sobota_sviatok DECIMAL(6,3);
    DECLARE suma_prip_nedela_sviatok DECIMAL(6,3);
    DECLARE suma_prip_sobota_sviatok_noc DECIMAL(6,3);
    DECLARE suma_prip_nedela_sviatok_noc DECIMAL(6,3);

    #--tu si vyberiem koeficienty pre daneho zamestnanca
    SELECT DISTINCT
        Z.koef_platu, Z.priplatok_sobota, Z.priplatok_nedela, Z.priplatok_noc, Z.priplatok_sviatok, Z.koef_km
    INTO 
        koef_platu, prip_sobota, prip_nedela, prip_noc, prip_sviatok, koef_km
    FROM 
        zamestnanci Z
    WHERE  
        Z.cislo_zamestnanca = NEW.cislo_zamestnanca_id;   #--tuto je chyba!!!!! ma problem s tymto nacitanim do obsahu premennych
        #--vyskusaj to s napevno zadanym 111 ako select
        

    #--test
    #--SET koef_platu := 3.000;
    #--SET prip_sobota := 1.000;
    #--SET prip_nedela := 2.000;
    #--SET prip_noc := 4.000;
    #--SET prip_sviatok := 5.000;

    SET suma := 0;
    #--tu si vypocitam aka suma ma byt pripasana na ucet zamestnancovi
    SET dat_ins := current_timestamp(); #--toto uklada iba date ale ja potrebujem datetime
    #--z poctu hodin najprv odratat priplatkove a dostanem hodiny ktore nasobim iba standardnou sadzbou
    SET pocet_std_hod := NEW.pocet_hodin - (NEW.hod_noc + NEW.hod_sobota + NEW.hod_nedela + NEW.hod_sviatok +
                                            NEW.hod_sobota_noc + NEW.hod_nedela_noc + NEW.hod_sviatok_noc +
                                            NEW.hod_sobota_sviatok + NEW.hod_nedela_sviatok + NEW.hod_sobota_sviatok_noc +
                                            NEW.hod_nedela_sviatok_noc);
    SET suma_std_hod := pocet_std_hod * koef_platu;
    #--hodiny ktore sa nasobia iba prip_noc
    SET suma_prip_noc := NEW.hod_noc * prip_noc;
    #--priplatok za pracu iba v sobot
    SET suma_prip_sobota :=  NEW.hod_sobota * prip_sobota;
    #--priplatok iba za pracu v nedelu
    SET suma_prip_nedela := NEW.hod_nedela * prip_nedela;
    #--priplatok iba za pracu v sviatok
    SET suma_prip_sviatok :=  NEW.hod_sviatok * prip_sviatok;
    #--priplatok za pracu v sobota + noc
    SET suma_prip_sobota_noc :=  NEW.hod_sobota_noc * (prip_sobota + prip_noc);
    #--priplatok za pracu v nedela + noc
    SET suma_prip_nedela_noc :=   NEW.hod_nedela_noc * (prip_nedela + prip_noc);
    #--priplatok za pracu v sviatok + noc
    SET suma_prip_sviatok_noc :=   NEW.hod_sviatok_noc * (prip_sviatok + prip_noc); 
    #--priplatok za pracu v sobota + sviatok 
    SET suma_prip_sobota_sviatok  := NEW.hod_sobota_sviatok * (prip_sobota + prip_sviatok);
    #--priplatok za pracu v nedela + sviatok
    SET suma_prip_nedela_sviatok  :=  NEW.hod_nedela_sviatok * (prip_nedela + prip_sviatok);
    #--priplatok za pracu v sobota + sviatok + noc
    SET suma_prip_sobota_sviatok_noc :=  NEW.hod_sobota_sviatok_noc * (prip_sobota + prip_sviatok + prip_noc);
    #--priplatok za pracu v nedela + sviatok + noc 
    SET suma_prip_nedela_sviatok_noc := NEW.hod_nedela_sviatok_noc * (prip_nedela + prip_sviatok + prip_noc);                            

    SET suma := suma_std_hod + suma_prip_noc + suma_prip_sobota + suma_prip_nedela + suma_prip_sviatok + 
                    suma_prip_sobota_noc + suma_prip_nedela_noc + suma_prip_sviatok_noc + suma_prip_sobota_sviatok +
                    suma_prip_nedela_sviatok + suma_prip_sobota_sviatok_noc + suma_prip_nedela_sviatok_noc;
    SET pozn := 'Vygenerované zo schváleného výkazu';
   


  INSERT INTO fin_den_zam
                (
                    id_fin_den_zam,
                    cislo_zamestnanca, 
                    schvalene_vykazy_id, 
                    meno, 
                    priezvisko, 
                    suma, 
                    typ_zaznamu,
                    dat_ins,
                     pozn
                     ) 
         VALUES 
                (
                    NULL,
                    NEW.cislo_zamestnanca_id, 
                    NEW.schvalene_vykazy_id, 
                    NEW.meno,
                    NEW.priezvisko,
                    suma,
                    true,
                    dat_ins, 
                    pozn
                    ); 

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `wait_vykazy`
--

DROP TABLE IF EXISTS `wait_vykazy`;
CREATE TABLE `wait_vykazy` (
  `wait_vykazy_id` int(11) NOT NULL,
  `nazov_akcie` varchar(100) DEFAULT NULL,
  `akcia_dat` date DEFAULT NULL,
  `firmy_id` int(11) NOT NULL,
  `ine_naklady` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wait_vykazy`
--

INSERT INTO `wait_vykazy` (`wait_vykazy_id`, `nazov_akcie`, `akcia_dat`, `firmy_id`, `ine_naklady`) VALUES
(31, 'slopanica', '2020-09-01', 1, 10),
(33, 'Vykladanie tovaru', '2020-09-03', 3, 0),
(45, 'zly_vstup', '2020-08-01', 4, 0),
(52, 'zly_vstup2', '2020-09-01', 3, 0),
(54, 'zly_vstup_3', '2020-09-01', 4, 0),
(55, 'zly_vstup_4', '2020-09-01', 4, 0),
(56, 'pokus', '2020-09-01', 1, 0),
(57, 'Magorina', '2020-09-01', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wait_zamestnanci`
--

DROP TABLE IF EXISTS `wait_zamestnanci`;
CREATE TABLE `wait_zamestnanci` (
  `wait_zamestnanci_id` int(11) NOT NULL,
  `wait_vykazy_id` int(11) DEFAULT NULL,
  `meno` varchar(50) DEFAULT NULL,
  `priezvisko` varchar(50) DEFAULT NULL,
  `fixna_odmena` int(11) DEFAULT NULL,
  `fakturovana_suma` int(11) DEFAULT NULL,
  `cas_od` datetime DEFAULT NULL,
  `cas_do` datetime DEFAULT NULL,
  `pocet_hodin` decimal(6,3) DEFAULT NULL,
  `hod_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota` decimal(6,3) DEFAULT NULL,
  `hod_nedela` decimal(6,3) DEFAULT NULL,
  `hod_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_noc` decimal(6,3) DEFAULT NULL,
  `hod_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok_noc` decimal(6,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wait_zamestnanci`
--

INSERT INTO `wait_zamestnanci` (`wait_zamestnanci_id`, `wait_vykazy_id`, `meno`, `priezvisko`, `fixna_odmena`, `fakturovana_suma`, `cas_od`, `cas_do`, `pocet_hodin`, `hod_noc`, `hod_sobota`, `hod_nedela`, `hod_sviatok`, `hod_sobota_noc`, `hod_nedela_noc`, `hod_sviatok_noc`, `hod_sobota_sviatok`, `hod_nedela_sviatok`, `hod_sobota_sviatok_noc`, `hod_nedela_sviatok_noc`) VALUES
(2, 52, 'miro', 'savel', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(4, 54, 'miro', 'savel', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(5, 55, 'miro', 'savel', 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(6, 55, 'marian', 'kondricik', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(7, 56, 'miro', 'savel', 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000'),
(8, 57, 'miro', 'savel', 0, 0, '2020-09-01 19:00:00', '2020-09-02 04:00:00', '9.000', '6.000', '3.000', '0.000', '0.000', '3.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000');

--
-- Triggers `wait_zamestnanci`
--
DROP TRIGGER IF EXISTS `wait_zamestnanci_after_insert`;
DELIMITER $$
CREATE TRIGGER `wait_zamestnanci_after_insert` AFTER INSERT ON `wait_zamestnanci` FOR EACH ROW BEGIN
    DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO a01_wait_zamestnanci
   ( a01_wait_zamestnanci_id,
     a01_wait_vykazy_id,
    a01_meno,
    a01_priezvisko,
    a01_fixna_odmena,
    a01_fakturovana_suma,
    a01_cas_od,
    a01_cas_do,
    a01_pocet_hodin,
    a01_hod_noc,
    a01_hod_sobota,
    a01_hod_nedela,
    a01_hod_sviatok,
    a01_hod_sobota_noc,
    a01_hod_nedela_noc,
    a01_hod_sviatok_noc,
    a01_hod_sobota_sviatok,
    a01_hod_nedela_sviatok,
    a01_hod_sobota_sviatok_noc,
    a01_hod_nedela_sviatok_noc,
     a01_dat_ins,
     a01_who)
   VALUES
   ( NEW.wait_zamestnanci_id,
     NEW.wait_vykazy_id,
    NEW.meno,
    NEW.priezvisko,
    NEW.fixna_odmena,
    NEW.fakturovana_suma,
    NEW.cas_od,
    NEW.cas_do,
    NEW.pocet_hodin,
    NEW.hod_noc,
    NEW.hod_sobota,
    NEW.hod_nedela,
    NEW.hod_sviatok,
    NEW.hod_sobota_noc,
    NEW.hod_nedela_noc,
    NEW.hod_sviatok_noc,
    NEW.hod_sobota_sviatok,
    NEW.hod_nedela_sviatok,
    NEW.hod_sobota_sviatok_noc,
    NEW.hod_nedela_sviatok_noc,
     SYSDATE(),
     vUser );

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `zamestnanci`
--

DROP TABLE IF EXISTS `zamestnanci`;
CREATE TABLE `zamestnanci` (
  `cislo_zamestnanca` int(11) NOT NULL,
  `meno` varchar(100) DEFAULT NULL,
  `priezvisko` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `dat_narodenia` varchar(20) DEFAULT NULL,
  `adresa_tr_pobyt` varchar(250) DEFAULT NULL,
  `adresa_pr_pobyt` varchar(250) DEFAULT NULL,
  `koef_platu` decimal(6,3) DEFAULT NULL,
  `priplatok_sobota` decimal(6,3) DEFAULT NULL,
  `priplatok_nedela` decimal(6,3) DEFAULT NULL,
  `priplatok_noc` decimal(6,3) DEFAULT NULL,
  `priplatok_sviatok` decimal(6,3) DEFAULT NULL,
  `koef_km` decimal(6,3) DEFAULT NULL,
  `rodne_cislo` varchar(20) DEFAULT NULL,
  `cislo_op` varchar(20) DEFAULT NULL,
  `dat_ins` date DEFAULT NULL,
  `dat_upd` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zamestnanci`
--

INSERT INTO `zamestnanci` (`cislo_zamestnanca`, `meno`, `priezvisko`, `tel`, `mail`, `dat_narodenia`, `adresa_tr_pobyt`, `adresa_pr_pobyt`, `koef_platu`, `priplatok_sobota`, `priplatok_nedela`, `priplatok_noc`, `priplatok_sviatok`, `koef_km`, `rodne_cislo`, `cislo_op`, `dat_ins`, `dat_upd`) VALUES
(111, 'Miro', 'Savel', '+421911653256', 'test@test.sk', '20.1.2001', 'Jegeho 13, 82108 Bratislava', 'Jasikova 13, 82108 Bratislava', '3.500', '1.230', '2.370', '2.500', '1.850', '0.500', 'gl15324698', 'hl456123', NULL, NULL),
(112, 'jozo', 'jomo', '1254', 'jozo@jozo.sk', '1.1.2011', 'niekde', 'tam', '1.250', '2.500', '6.200', '0.250', '1.250', '1.250', '646464', '2123', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a01_wait_zamestnanci`
--
ALTER TABLE `a01_wait_zamestnanci`
  ADD PRIMARY KEY (`a01_wait_zamestnanci_id`);

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fin_den_zam`
--
ALTER TABLE `fin_den_zam`
  ADD PRIMARY KEY (`id_fin_den_zam`),
  ADD KEY `cislo_zamestnanca` (`cislo_zamestnanca`),
  ADD KEY `schvalene_vykazy_id` (`schvalene_vykazy_id`);

--
-- Indexes for table `firmy`
--
ALTER TABLE `firmy`
  ADD PRIMARY KEY (`firmy_id`);

--
-- Indexes for table `schvalene_vykazy`
--
ALTER TABLE `schvalene_vykazy`
  ADD PRIMARY KEY (`schvalene_vykazy_id`),
  ADD KEY `firmy_id` (`firmy_id`);

--
-- Indexes for table `schvalene_vykazy_zamestnanci`
--
ALTER TABLE `schvalene_vykazy_zamestnanci`
  ADD PRIMARY KEY (`schvalene_vykazy_zamestnanci_id`),
  ADD KEY `schvalene_vykazy_id` (`schvalene_vykazy_id`),
  ADD KEY `cislo_zamestnanca_id` (`cislo_zamestnanca_id`);

--
-- Indexes for table `wait_vykazy`
--
ALTER TABLE `wait_vykazy`
  ADD PRIMARY KEY (`wait_vykazy_id`),
  ADD KEY `firmy_id` (`firmy_id`);

--
-- Indexes for table `wait_zamestnanci`
--
ALTER TABLE `wait_zamestnanci`
  ADD PRIMARY KEY (`wait_zamestnanci_id`),
  ADD KEY `wait_vykazy_id` (`wait_vykazy_id`);

--
-- Indexes for table `zamestnanci`
--
ALTER TABLE `zamestnanci`
  ADD PRIMARY KEY (`cislo_zamestnanca`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a01_wait_zamestnanci`
--
ALTER TABLE `a01_wait_zamestnanci`
  MODIFY `a01_wait_zamestnanci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fin_den_zam`
--
ALTER TABLE `fin_den_zam`
  MODIFY `id_fin_den_zam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `firmy`
--
ALTER TABLE `firmy`
  MODIFY `firmy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schvalene_vykazy`
--
ALTER TABLE `schvalene_vykazy`
  MODIFY `schvalene_vykazy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `schvalene_vykazy_zamestnanci`
--
ALTER TABLE `schvalene_vykazy_zamestnanci`
  MODIFY `schvalene_vykazy_zamestnanci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `wait_vykazy`
--
ALTER TABLE `wait_vykazy`
  MODIFY `wait_vykazy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `wait_zamestnanci`
--
ALTER TABLE `wait_zamestnanci`
  MODIFY `wait_zamestnanci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fin_den_zam`
--
ALTER TABLE `fin_den_zam`
  ADD CONSTRAINT `fin_den_zam_ibfk_1` FOREIGN KEY (`cislo_zamestnanca`) REFERENCES `zamestnanci` (`cislo_zamestnanca`),
  ADD CONSTRAINT `fin_den_zam_ibfk_2` FOREIGN KEY (`schvalene_vykazy_id`) REFERENCES `schvalene_vykazy` (`schvalene_vykazy_id`);

--
-- Constraints for table `schvalene_vykazy`
--
ALTER TABLE `schvalene_vykazy`
  ADD CONSTRAINT `schvalene_vykazy_ibfk_1` FOREIGN KEY (`firmy_id`) REFERENCES `firmy` (`firmy_id`);

--
-- Constraints for table `schvalene_vykazy_zamestnanci`
--
ALTER TABLE `schvalene_vykazy_zamestnanci`
  ADD CONSTRAINT `schvalene_vykazy_zamestnanci_ibfk_1` FOREIGN KEY (`schvalene_vykazy_id`) REFERENCES `schvalene_vykazy` (`schvalene_vykazy_id`),
  ADD CONSTRAINT `schvalene_vykazy_zamestnanci_ibfk_2` FOREIGN KEY (`cislo_zamestnanca_id`) REFERENCES `zamestnanci` (`cislo_zamestnanca`);

--
-- Constraints for table `wait_vykazy`
--
ALTER TABLE `wait_vykazy`
  ADD CONSTRAINT `wait_vykazy_ibfk_1` FOREIGN KEY (`firmy_id`) REFERENCES `firmy` (`firmy_id`);

--
-- Constraints for table `wait_zamestnanci`
--
ALTER TABLE `wait_zamestnanci`
  ADD CONSTRAINT `wait_zamestnanci_ibfk_1` FOREIGN KEY (`wait_vykazy_id`) REFERENCES `wait_vykazy` (`wait_vykazy_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
