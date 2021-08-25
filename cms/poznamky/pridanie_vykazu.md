# vykazy na schvalenie
otvori mi vykazy.php
tu je zavolana funkcia
<?php findAllVykazyNaSchvalenie(); ?>


# schvalenie vykazu
kliknes na edit
> vykazy_edit.php
dopises do cervenych stlcov ID
po kliknuti na schvalit vykaz
>functions_vykazy.php
    insert_permanent_vykaz()
        fnc_schvalenie_vykazu();
            fnc_insert_schvalene_vykazy();
                INSERT INTO schvalene_vykazy
                INSERT INTO schvalene_vykazy_zamestnanci
