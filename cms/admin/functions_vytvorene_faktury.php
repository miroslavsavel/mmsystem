<?php
    function findAllVytvoreneFaktury()
    {
        global $connection;

        //toto mozno neskor vyriesit cez zlozeny select nakolko nie celkom presne vyberie asi cas od do faktury
        //tiez je tu dobre zadat limit 100 - lebo co ak tu bude najebanych uz 200 faktur aby sa v tom dalo vyhladavat
        $query = "SELECT F.id_faktury, F.firmy_id, DATE(FZ.cas_od) as cas_od, DATE(FZ.cas_do) as cas_do
                FROM faktury F
                INNER JOIN faktury_zamestnanci FZ ON FZ.id_faktury = F.id_faktury
                GROUP BY F.id_faktury
                ORDER BY FZ.cas_od DESC
                LIMIT 100";
        $select_faktury = mysqli_query($connection, $query);
        //hlavicka tabulky
        echo "<tr>";
        echo "<th> Názov firmy </th>";
        echo "<th> Dátum od </th>";
        echo "<th> Dátum do </th>";
        echo "<tr>";
        //nacitam udaje z tabule faktury
        while($row = mysqli_fetch_assoc($select_faktury))
        {
            $id_faktury = $row['id_faktury'];
            $firmy_id = $row['firmy_id'];
            $cas_od = $row['cas_od'];
            $cas_do = $row['cas_do'];
            //nacitam nazov firmy
            $query_nazov_firmy = "SELECT nazov_firmy
            FROM firmy
            WHERE firmy_id = {$firmy_id}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_nazov_firmy = mysqli_query($connection, $query_nazov_firmy);
            while($row = mysqli_fetch_assoc($select_nazov_firmy))
            {
                $nazov_firmy = $row['nazov_firmy'];
            }
            echo "<tr>";
            echo "<td> {$nazov_firmy} </td>";
            echo "<td> {$cas_od} </td>";
            echo "<td> {$cas_do} </td>";
            echo "<td><a href='export_faktura_pdf.php?detail={$id_faktury}'>Export do PDF</a></td>";
            echo "<tr>";
        }
    }
?>