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

    DECLARE pocet_noc_hod DECIMAL(6,3);
    DECLARE suma_prip_noc DECIMAL(6,3);

    DECLARE pocet_sobota_hod DECIMAL(6,3);
    DECLARE suma_prip_sobota DECIMAL(6,3);

    DECLARE pocet_nedela_hod DECIMAL(6,3);
    DECLARE suma_prip_nedela DECIMAL(6,3);

    DECLARE pocet_sviatok_hod DECIMAL(6,3);
    DECLARE suma_prip_sviatok DECIMAL(6,3);

    DECLARE pocet_sobota_noc_hod DECIMAL(6,3);
    DECLARE suma_prip_sobota_noc DECIMAL(6,3);

    #--tu si vyberiem koeficienty pre daneho zamestnanca
    SELECT 
        koef_platu, priplatok_sobota, priplatok_nedela, priplatok_noc, priplatok_sviatok, koef_km
    INTO 
        koef_platu, prip_sobota, prip_nedela, prip_noc, prip_sviatok, koef_km
    FROM 
        zamestnanci Z
    WHERE 
        Z.cislo_zamestnanca = NEW.cislo_zamestnanca_id;


    #--tu si vypocitam aka suma ma byt pripasana na ucet zamestnancovi
    SET dat_ins := DATE(NOW());
    #--z poctu hodin najprv odratat priplatkove a dostanem hodiny ktore nasobim iba standardnou sadzbou
    SET pocet_std_hod := NEW.pocet_hodin - (NEW.hod_noc + NEW.hod_sobota + NEW.hod_nedela + NEW.hod_sviatok +
                                            NEW.hod_sobota_noc + NEW.hod_nedela_noc + NEW.hod_sviatok_noc +
                                            NEW.hod_sobota_sviatok + NEW.hod_nedela_sviatok + NEW.hod_sobota_sviatok_noc +
                                            NEW.hod_nedela_sviatok_noc);
    SET suma_std_hod = pocet_std_hod * koef_platu;

    #--hodiny ktore sa nasobia iba prip_noc
    SET pocet_noc_hod = NEW.hod_noc - (NEW.hod_sobota_noc + NEW.hod_nedela_noc + NEW.hod_sviatok_noc + NEW.hod_sobota_sviatok_noc +
                                            NEW.hod_nedela_sviatok_noc);
    SET suma_prip_noc = pocet_noc_hod * priplatok_noc;

    #--priplatok za pracu iba v sobotu
    SET pocet_sobota_hod = NEW.hod_sobota - (NEW.hod_sobota_noc + NEW.hod_sobota_sviatok + NEW.hod_sobota_sviatok_noc);
    SET suma_prip_sobota =  pocet_sobota_hod * prip_sobota

    #--priplatok iba za pracu v nedelu
    SET pocet_nedela_hod = NEW.hod_nedela - (NEW.hod_nedela_noc + NEW.hod_nedela_sviatok + NEW.hod_nedela_sviatok_noc);
    SET suma_prip_nedela = pocet_nedela_hod * prip_nedela;

    #--priplatok iba za pracu v sviatok
    SET pocet_sviatok_hod = NEW.hod_sviatok - (NEW.hod_sviatok_noc + NEW.hod_sobota_sviatok + NEW.hod_nedela_sviatok + NEW.hod_sobota_sviatok_noc +
                                            NEW.hod_nedela_sviatok_noc);
    SET suma_prip_sviatok =  pocet_sviatok_hod * prip_sviatok;

    #--priplatok za pracu v sobota + noc
    SET pocet_sobota_noc_hod =                                       

    SET suma := 53.35;
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