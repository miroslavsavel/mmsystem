delimiter //

DROP TRIGGER IF EXISTS fin_den_zam_insert;

CREATE TRIGGER fin_den_zam_insert
AFTER INSERT
   ON schvalene_vykazy_zamestnanci FOR EACH ROW

BEGIN

      CALL fin_den_zam(   111
                        );

END; 

//

DELIMITER ;