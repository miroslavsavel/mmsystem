-- skript pre vytvorenie tabulky pracovnych vykazov
/* CREATE TABLE v01_vykazy (
    v01_vykazy_ic int NOT NULL,
    v01_dat_od int NOT NULL,

    z01_zamestnanci_ic int,
    f01_firmy_ic int,
    PRIMARY KEY (v01_vykazy_ic),
    FOREIGN KEY (z01_zamestnanci_ic) REFERENCES z01_zamestnanci(z01_zamestnanci_ic)
    FOREIGN KEY (f01_firmy_ic) REFERENCES f01_firmy(f01_firmy_ic)
); */

-- tabulky
    -- a01_akcie         //tu definuje akciu ako entitu s prislusnym nazvom
    -- v01_vykazy        //vykazy za zamestnancov pre jednotlive akcie
    -- z01_zamestnanci  //tu su uvedene udaje o zamestnancovi 
    -- f01_firmy         //nazov firmy ktora


-- tu sa ulozi nazov akcie, na zaklade ktoreho je vygenerovany vykaz pre zamestnancov
CREATE TABLE akcie (
    akcie_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    akcie_dat_od DATE,
    akcie_dat_do DATE,
    nazov_akcie varchar(100)
);

-- tu sa budu ukladat udaje o zamestnancoch
CREATE TABLE zamestnanci (
    zamestnanci_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cislo_zamestnanca int,  --aby dano vedel ze staly zamestnanci mali
    meno varchar(100),
    priezvisko varchar(100),
    tel varchar(20),
    mail varchar(100),

    koef_platu int,
    priplatok_sobota int,   --majky ma iny priplatok za sobotu napr. 1euro
    priplatok_nedela int,
    priplatok_noc int,

    koef_km int, --eura za kilometer
    rodne_cislo varchar(20),
    cislo_op varchar(20),
    dat_ins DATE,
    dat_upd DATE
);

-- tu sa budu ukladat udaje o firmach
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



-- tu sa budu ukladat jednotlive pracovne vykazy pre jednotlivych zamestnacov
CREATE TABLE vykazy (
    vykazy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dat_od DATE,
    dat_do DATE,
    pausalny_vykaz ENUM('false', 'true') NOT NULL DEFAULT 'false',
    pocet_hodin int,
    
    priplatok_sviatok int,
    vodic ENUM('false', 'true') NOT NULL DEFAULT 'false',
    vodic_hodiny int,
    vodic_km int,
    celkova_suma int NOT NULL,
    suma_taxik int,
    suma_obcerstvenie int,
    vedlajsie_naklady int,
    poznamka varchar(100),
    akcie_id int,
    zamestnanci_id int,
    firmy_id int,
    v01_dat_ins DATE,
    v01_dat_upd DATE,
    FOREIGN KEY (akcie_id) REFERENCES akcie(akcie_id),
    FOREIGN KEY (zamestnanci_id) REFERENCES zamestnanci(zamestnanci_id),
    FOREIGN KEY (firmy_id) REFERENCES firmy(f01_firmy_id)
);


-- tu sa budu ukladat vykazy cakajuce na schvalenie
CREATE TABLE wait_vykazy (
    wait_vykazy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazov_akcie varchar(100),
    akcia_dat DATE,
    firmy_id int,
    ine_naklady int,
    FOREIGN KEY (firmy_id) REFERENCES firmy(firmy_id)
);


CREATE TABLE wait_zamestnanci (
    wait_vykazy_id int,
    zamestnanci_id int,
    fixna_odmena int,
    fakturovana_suma int,
    cas_od DATE,
    cas_do DATE,
    pocet_hodin int,
    hod_noc int,
    hod_sobota int,
    hod_nedela int,
    hod_sviatok int,
    hod_sobota_noc int,
    hod_nedela_noc int,
    hod_sviatok_noc int,
    hod_sobota_sviatok int,
    hod_nedela_sviatok int,
    hod_sobota_sviatok_noc int,
    hod_nedela_sviatok_noc int,
    FOREIGN KEY (wait_vykazy_id) REFERENCES wait_vykazy(wait_vykazy_id),
    FOREIGN KEY (zamestnanci_id) REFERENCES zamestnanci(zamestnanci_id)
);

CREATE TABLE zamestnanci (
    zamestnanci_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cislo_zamestnanca int,  
    meno varchar(100),
    priezvisko varchar(100),
    tel varchar(20),
    mail varchar(100),
    dat_narodenia varchar(20),
    adresa_tr_pobyt varchar(250),
    adresa_pr_pobyt varchar(250),

    koef_platu int,
    priplatok_sobota int,   
    priplatok_nedela int,
    priplatok_noc int,
    priplatok_sviatok int,

    koef_km int, 
    rodne_cislo varchar(20),
    cislo_op varchar(20),
    dat_ins DATE,
    dat_upd DATE
);

    pausalny_vykaz ENUM('false', 'true') NOT NULL DEFAULT 'false',
    pocet_hodin int,
    
    priplatok_sviatok int,
    vodic ENUM('false', 'true') NOT NULL DEFAULT 'false',
    vodic_hodiny int,
    vodic_km int,
    celkova_suma int NOT NULL,
    suma_taxik int,
    suma_obcerstvenie int,
    vedlajsie_naklady int,
    poznamka varchar(100),
    akcie_id int,
    
    
    v01_dat_ins DATE,
    v01_dat_upd DATE,
    FOREIGN KEY (akcie_id) REFERENCES akcie(akcie_id),
    FOREIGN KEY (zamestnanci_id) REFERENCES zamestnanci(zamestnanci_id),
    FOREIGN KEY (firmy_id) REFERENCES firmy(f01_firmy_id)
);


-- login + register table
CREATE TABLE IF NOT EXISTS `accounts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  	`username` varchar(50) NOT NULL,
  	`password` varchar(255) NOT NULL,
  	`email` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES (1, 'test', '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa', 'test@test.com');




--------------altery
--takto pridam stlpec za urcity stlpec
ALTER TABLE zamestnanci
ADD COLUMN priplatok_sviatok int AFTER priplatok_noc;

ALTER TABLE zamestnanci
ADD COLUMN adresa_tr_pobyt varchar(250) AFTER mail;

ALTER TABLE zamestnanci
ADD COLUMN adresa_pr_pobyt varchar(250) AFTER adresa_tr_pobyt;

ALTER TABLE zamestnanci
ADD COLUMN dat_narodenia varchar(20) AFTER mail;


--po starom som tu mal cislo zamestnanca
--tu sa uklada zoznam zamestnancov na jednotlivych vykazoch cakajucich na schvalenie
--https://stackoverflow.com/questions/4834390/how-to-use-mysql-decimal
CREATE TABLE wait_zamestnanci (
    wait_zamestnanci_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    wait_vykazy_id int,
    cislo_zamestnanca int,
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
    FOREIGN KEY (wait_vykazy_id) REFERENCES wait_vykazy(wait_vykazy_id),
    FOREIGN KEY (cislo_zamestnanca) REFERENCES zamestnanci(cislo_zamestnanca)
);


-- tu sa budu ukladat schvalene vykazy
CREATE TABLE schvalene_vykazy (
    schvalene_vykazy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazov_akcie varchar(100),
    akcia_dat DATE,
    firmy_id int NOT NULL,
    ine_naklady DECIMAL(6,3),
    FOREIGN KEY (firmy_id) REFERENCES firmy(firmy_id)
);


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

--TRIGGER
CREATE TRIGGER after_wait_zamestnanci_ins
    BEFORE INSERT ON wait_zamestnanci
    FOR EACH ROW 
 INSERT INTO a01_wait_zamestnanci
 SET action = 'insert',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();





CREATE TRIGGER wait_zamestnanci_after_insert
AFTER INSERT
   ON wait_zamestnanci FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO contacts_audit
   ( contact_id,
     created_date,
     created_by)
   VALUES
   ( NEW.contact_id,
     SYSDATE(),
     vUser );

END;



CREATE TRIGGER wait_zamestnanci_after_insert
AFTER INSERT
   ON wait_zamestnanci FOR EACH ROW

BEGIN
    DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO a01_wait_zamestnanci
   ( a01_wait_zamestnanaci_id,
     a01_dat_ins,
     a01_who)
   VALUES
   ( NEW.wait_zamestnanci_id,
     SYSDATE(),
     vUser );

END;




