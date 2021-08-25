--PK nie je autoinkrement 
CREATE TABLE zamestnanci (
    cislo_zamestnanca int NOT NULL PRIMARY KEY,  
    meno varchar(100),
    priezvisko varchar(100),
    tel varchar(20),
    mail varchar(100),
    dat_narodenia varchar(20),
    adresa_tr_pobyt varchar(250),
    adresa_pr_pobyt varchar(250),

    koef_platu DECIMAL(6,3),
    priplatok_sobota DECIMAL(6,3),   
    priplatok_nedela DECIMAL(6,3),
    priplatok_noc DECIMAL(6,3),
    priplatok_sviatok DECIMAL(6,3),

    koef_km DECIMAL(6,3), 
    rodne_cislo varchar(20),
    cislo_op varchar(20),
    dat_ins DATE,
    dat_upd DATE
);






-- login + register table---------------------------------
CREATE TABLE IF NOT EXISTS `accounts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  	`username` varchar(50) NOT NULL,
  	`password` varchar(255) NOT NULL,
  	`email` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES (1, 'test', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', 'test@test.com');




--tabulka pre firmy (klienti)----------------------------------
CREATE TABLE firmy (
    firmy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazov_firmy varchar(200),
    ico varchar(50),
    dic varchar(50),
    bezna_taxa int,
    priplatok_noc int,
    priplatok_sobota int,
    priplatok_nedela int,
    priplatok_sviatok int
);


-- tu sa budu ukladat vykazy cakajuce na schvalenie
CREATE TABLE wait_vykazy (
    wait_vykazy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazov_akcie varchar(100),
    akcia_dat DATE,
    firmy_id int NOT NULL,
    ine_naklady DECIMAL(6,3),
    FOREIGN KEY (firmy_id) REFERENCES firmy(firmy_id)
);

--tu sa uklada zoznam zamestnancov na jednotlivych vykazoch cakajucich na schvalenie
--https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal
CREATE TABLE wait_zamestnanci (
    wait_zamestnanci_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    wait_vykazy_id int,
    meno varchar(50),
    priezvisko varchar(50),
    fixna_odmena int,
    fakturovana_suma int,
    cas_od DATETIME,
    cas_do DATETIME,
    pocet_hodin DECIMAL(6,3),
    hod_noc DECIMAL(6,3),
    hod_sobota DECIMAL(6,3),
    hod_nedela DECIMAL(6,3),
    hod_sviatok DECIMAL(6,3),
    hod_sobota_noc DECIMAL(6,3),
    hod_nedela_noc DECIMAL(6,3),
    hod_sviatok_noc DECIMAL(6,3),
    hod_sobota_sviatok DECIMAL(6,3),
    hod_nedela_sviatok DECIMAL(6,3),
    hod_sobota_sviatok_noc DECIMAL(6,3),
    hod_nedela_sviatok_noc DECIMAL(6,3),
    FOREIGN KEY (wait_vykazy_id) REFERENCES wait_vykazy(wait_vykazy_id)
);



------------------------------------------
--tu sa ukladaju schvalene vykazy
-- tu sa budu ukladat schvalene vykazy
CREATE TABLE schvalene_vykazy (
    schvalene_vykazy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazov_akcie varchar(100),
    akcia_dat DATE,
    firmy_id int NOT NULL,
    ine_naklady DECIMAL(6,3),
    FOREIGN KEY (firmy_id) REFERENCES firmy(firmy_id)
);


--tu sa uklada zoznam zamestnancov na schvalenych vykazoch
--ide o zachytenie vykazu aky bol schvaleny, jednotlive sumy sa ukladaju do fin_den
--https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal
CREATE TABLE schvalene_vykazy_zamestnanci (
    schvalene_vykazy_zamestnanci_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    schvalene_vykazy_id int,
    meno varchar(50),
    priezvisko varchar(50),
    cislo_zamestnanca_id int,
    fixna_odmena int,
    fakturovana_suma int,
    cas_od DATETIME,
    cas_do DATETIME,
    pocet_hodin DECIMAL(6,3),
    hod_noc DECIMAL(6,3),
    hod_sobota DECIMAL(6,3),
    hod_nedela DECIMAL(6,3),
    hod_sviatok DECIMAL(6,3),
    hod_sobota_noc DECIMAL(6,3),
    hod_nedela_noc DECIMAL(6,3),
    hod_sviatok_noc DECIMAL(6,3),
    hod_sobota_sviatok DECIMAL(6,3),
    hod_nedela_sviatok DECIMAL(6,3),
    hod_sobota_sviatok_noc DECIMAL(6,3),
    hod_nedela_sviatok_noc DECIMAL(6,3),
    FOREIGN KEY (schvalene_vykazy_id) REFERENCES schvalene_vykazy(schvalene_vykazy_id),
    FOREIGN KEY (cislo_zamestnanca_id) REFERENCES zamestnanci(cislo_zamestnanca)
);


--Trigger pre audit-----------------------------------------------------------------------
--https://www.techonthenet.com/mysql/triggers/drop.php
--https://dev.mysql.com/doc/refman/8.0/en/show-triggers.html
--trigers a ich tajomstva
DELIMITER //

CREATE TRIGGER wait_zamestnanci_after_insert
AFTER INSERT
   ON wait_zamestnanci FOR EACH ROW

BEGIN
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

END; //

DELIMITER ;
------------------------------------------------------------------------
SHOW TRIGGERS;
DROP TRIGGER wait_zamestnanci_after_insert;
-------------------------------------------------------------------


--archiv pre sledovanie vlozenych vykazov
--naplna ho trigger
CREATE TABLE a01_wait_zamestnanci (
    a01_wait_zamestnanci_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    a01_wait_vykazy_id int,
    a01_meno varchar(50),
    a01_priezvisko varchar(50),
    a01_fixna_odmena int,
    a01_fakturovana_suma int,
    a01_cas_od DATETIME,
    a01_cas_do DATETIME,
    a01_pocet_hodin DECIMAL(6,3),
    a01_hod_noc DECIMAL(6,3),
    a01_hod_sobota DECIMAL(6,3),
    a01_hod_nedela DECIMAL(6,3),
    a01_hod_sviatok DECIMAL(6,3),
    a01_hod_sobota_noc DECIMAL(6,3),
    a01_hod_nedela_noc DECIMAL(6,3),
    a01_hod_sviatok_noc DECIMAL(6,3),
    a01_hod_sobota_sviatok DECIMAL(6,3),
    a01_hod_nedela_sviatok DECIMAL(6,3),
    a01_hod_sobota_sviatok_noc DECIMAL(6,3),
    a01_hod_nedela_sviatok_noc DECIMAL(6,3),
    a01_who varchar(50),
    a01_dat_ins DATETIME
);



CREATE TABLE fin_den_zam (
    id_fin_den_zam int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cislo_zamestnanca int,
    schvalene_vykazy_id int,
    meno varchar(50),
    priezvisko varchar(50),
    suma DECIMAL(6,3),
    typ_zaznamu ENUM('false', 'true') NOT NULL DEFAULT 'false',
    dat_ins DATETIME,
    pozn varchar(200),
    FOREIGN KEY (cislo_zamestnanca) REFERENCES zamestnanci(cislo_zamestnanca),
    FOREIGN KEY (schvalene_vykazy_id) REFERENCES schvalene_vykazy(schvalene_vykazy_id)
);