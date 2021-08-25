--https://stackoverflow.com/questions/5817395/how-can-i-loop-through-all-rows-of-a-table-mysql
--https://www.mysqltutorial.org/mysql-cursor/

CREATE PROCEDURE ROWPERROW()
BEGIN
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;

    SELECT COUNT(*) FROM zamestnanci INTO n;

    SET i=0;
    WHILE i<n DO 
        INSERT INTO fin_den_zam(id_fin_den_zam,cislo_zamestnanca, schvalene_vykazy_id, meno, priezvisko, suma, typ_zaznamu,dat_ins, pozn) VALUES (NULL,111, 1, 'MIRO', 'SAVEL', 100, true, TODAY, 'TEST'); 
        SET i = i + 1;
    END WHILE;
End;
;;


DELIMITER ;

CALL ROWPERROW();