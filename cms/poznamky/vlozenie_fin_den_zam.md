# najprv sa prida novy NEschvaleny vykaz
pridaj_vykaz.php
functions_vykazy.php
    insert_temp_vykaz()
        INSERT INTO wait_vykazy
        INSERT INTO wait_zamestnanci


# ked klikne na schvalit vykaz
php/schvalenie_vykazu/fnc_schvalenie_vykazu.php
    INSERT INTO schvalene_vykazy
    INSERT INTO schvalene_vykazy_zamestnanci
    CREATE TRIGGER fin_den_zam_insert
AFTER INSERT
   ON schvalene_vykazy_zamestnanci FOR EACH ROW