novy mysql workbench pouzivam

zamestnanci
SELECT * FROM cms.zamestnanci;

drop table zamestnanci;
drop table wait_zamestnanci;


delete from wait_zamestnanci where 1=1;

SELECT DISTINCT
        koef_platu, priplatok_sobota, priplatok_nedela, priplatok_noc, priplatok_sviatok, koef_km
    FROM 
        zamestnanci Z
    WHERE 
        Z.cislo_zamestnanca = 111; 




wait zamestnanci
SELECT * FROM cms.wait_zamestnanci;

show triggers from cms;

drop table cms.wait_zamestnanci;

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


wait vykazy
SELECT * FROM cms.wait_vykazy;

delete from cms.wait_vykazy where 1=1;


SELECT W.wait_vykazy_id ID_vykazu, W.nazov_akcie, W.akcia_dat, F.nazov_firmy 
                    FROM wait_vykazy W
                    INNER JOIN firmy F
                    ON W.firmy_id = F.firmy_id;
                    
                    

SELECT * FROM wait_vykazy WHERE wait_vykazy_id = 28;




SELECT * FROM cms.firmy;


schvalene_vykazy
CREATE TABLE schvalene_vykazy (
    schvalene_vykazy_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazov_akcie varchar(100),
    akcia_dat DATE,
    firmy_id int NOT NULL,
    ine_naklady DECIMAL(6,3),
    FOREIGN KEY (firmy_id) REFERENCES firmy(firmy_id)
);




SELECT * FROM cms.schvalene_vykazy;



schvallene vykazy zamestnancidelimiter //

DROP TRIGGER IF EXISTS fin_den_zam_insert;

CREATE TRIGGER fin_den_zam_insert
AFTER INSERT
   ON schvalene_vykazy_zamestnanci FOR EACH ROW

BEGIN

    DECLARE koef_platu DECIMAL(6,3);
    DECLARE prip_sobota DECIMAL(6,3);
    DECLARE prip_nedela DECIMAL(6,3);
    DECLARE prip_noc DECIMAL(6,3);
    DECLARE prip_sviatok DECIMAL(6,3);
    DECLARE koef_km DECIMAL(6,3);
    DECLARE suma DECIMAL(6,3);
    DECLARE dat_ins DATETIME;


    SELECT 
        koef_platu, priplatok_sobota, priplatok_nedela, priplatok_noc, priplatok_sviatok, koef_km
    INTO 
        koef_platu, prip_sobota, prip_nedela, prip_noc, prip_sviatok, koef_km
    FROM 
        zamestnanci Z
    WHERE 
        Z.cislo_zamestnanca = NEW.cislo_zamestnanca_id;


    #--tu si vypocitam
    SET dat_ins := DATE(NOW());
    SET suma := 53.35;
   


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
                    'MIRO',
                    'SAVEL',
                    suma,
                    true,
                    dat_ins, 
                    'TEST'
                    ); 

END; 

//

DELIMITER ;




select * from cms.schvalene_vykazy_zamestnanci;




#a01

SELECT * FROM cms.a01_wait_zamestnanci;

drop table cms.a01_wait_zamestnanci;


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



#fin_den_zam
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



call proc1();


SELECT * FROM cms.fin_den_zam;

select * from cms.zamestnanci;

delete from cms.fin_den_zam
where 1=1;





SHOW TRIGGERS;




#trig_fin_den_zam

delimiter //

DROP TRIGGER IF EXISTS fin_den_zam_insert;

CREATE TRIGGER fin_den_zam_insert
AFTER INSERT
   ON schvalene_vykazy_zamestnanci FOR EACH ROW

BEGIN

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

END; 

//

DELIMITER ;




INSERT INTO schvalene_vykazy_zamestnanci
                (
                    schvalene_vykazy_zamestnanci_id,
                    schvalene_vykazy_id,
                    meno, 
                    priezvisko, 
                    cislo_zamestnanca_id, 
                    fixna_odmena,
                    fakturovana_suma,
                    cas_od,
                    cas_do,
                    pocet_hodin,
                    hod_noc,
                    hod_sobota,
                    hod_nedela,
                    hod_sviatok,
                    hod_sobota_noc,
                    hod_nedela_noc,
                    hod_sviatok_noc,
                    hod_sobota_sviatok,
                    hod_nedela_sviatok,
                    hod_sobota_sviatok_noc,
                    hod_nedela_sviatok_noc
                     ) 
         VALUES 
                (
                    NULL,
                    17,
                    "miro",
                    "savel",
                    111,
                    0,
                    0,
                    "2020-09-01 19:00:00",
                    "2020-09-02 04:00:00",
                    9.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000
                    ); 




INSERT INTO oopphp.users
                (
                users_id,
                    users_firstname,
                    users_lastname, 
                    users_dateofbirth
                     ) 
         VALUES 
                (	
                0,
                    "Doktor",
                    "Hyde",
					current_date() + 10
                    ); 
                    
                    
users_idINSERT INTO oopphp.users (users_firstname,users_lastname,users_dateofbirth) VALUES
    ('dog','cat',current_date());


    SELECT * FROM oopphp.users;

