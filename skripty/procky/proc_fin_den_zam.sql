--https://stackoverflow.com/questions/5817395/how-can-i-loop-through-all-rows-of-a-table-mysql
--https://www.mysqltutorial.org/mysql-cursor/

#----------------------------
#--procka dostane ako parametre udaje z trigra, ktore boli vlozene do tabulky schvalene_vykazy_zamestnanci
CREATE PROCEDURE fin_den_zam(cislo_zamestnanca INT)
BEGIN
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
        
End;
;;


DELIMITER ;

CALL fin_den_zam();