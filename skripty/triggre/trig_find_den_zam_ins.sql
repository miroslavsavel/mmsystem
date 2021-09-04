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

    #--1.9.2021 pridane pocitanie koef * pocet hodin nakolko mi pri alexandrovi hadzalo kktinu ked robil sviatok 8 hod
    SET suma := NEW.pocet_hodin*koef_platu + suma_std_hod + suma_prip_noc + suma_prip_sobota + suma_prip_nedela + suma_prip_sviatok + 
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