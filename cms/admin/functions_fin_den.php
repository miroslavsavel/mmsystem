<?php
        function LoadFinDen()
        {
            global $connection;
    
            $id_zamestnanca = $_REQUEST['id_zamestnanca'];

            //lecture 100
            //find all categories query
            // $query = "SELECT * FROM fin_den_zam WHERE cislo_zamestnanca = {$id_zamestnanca}";

            // $query = "  SELECT F.id_fin_den_zam, S.nazov_akcie, S.akcia_dat, S.firmy_id, F.suma, F.typ_zaznamu 
            //         FROM fin_den_zam F
            //         WHERE cislo_zamestnanca = {$id_zamestnanca}
            //         INNER JOIN schvalene_vykazy S
            //         ON S.schvalene_vykazy_id = F.schvalene_vykazy_id
            //         ";


            $query = "SELECT F.id_fin_den_zam, S.nazov_akcie, S.akcia_dat, Fi.nazov_firmy, F.suma, F.typ_zaznamu 
            FROM fin_den_zam F
            INNER JOIN schvalene_vykazy S ON S.schvalene_vykazy_id = F.schvalene_vykazy_id
            INNER JOIN firmy Fi ON S.firmy_id = Fi.firmy_id
            WHERE cislo_zamestnanca = {$id_zamestnanca}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_fin_den = mysqli_query($connection, $query);
    
    
            echo "<tr>";
            echo "<th> ID transakcie </th>";
            echo "<th> Názov akcie </th>";        //double bracket is because of double quotes, single quotes wont work
            echo "<th> Dátum akcie </th>";          
            echo "<th> Názov firmy </th>";
            echo "<th> Suma </th>";
            echo "<th> Vyplatená práca </th>";
            echo "</tr>";

            //lecture 100
            while($row = mysqli_fetch_assoc($select_fin_den))
            {

                $id_transakcie = $row['id_fin_den_zam'];
                $nazov_akcie = $row['nazov_akcie'];
                $dat_akcie = $row['akcia_dat'];
                $nazov_firmy = $row['nazov_firmy'];
                $suma = $row['suma'];
                $typ_zaznamu = $row['typ_zaznamu'];
    
                echo "<tr>";
                echo "<td> {$id_transakcie} </td>";        
                echo "<td> {$nazov_akcie} </td>";

                echo "<td> {$dat_akcie} </td>";
                echo "<td> {$nazov_firmy} </td>";
                echo "<td> {$suma} </td>";
                if($typ_zaznamu == "false")
                {
                    echo "<td> Nie </td>";
                }
                else{
                    echo "<td> Áno </td>";
                }
                // echo "<td> {$typ_zaznamu} </td>";
                //lecture 103 deleting categories
                //!!! passing parameter to browser after click
                echo "<td><a href='categories.php?delete={$id_transakcie}'>Delete</a></td>";
                echo "<td><a href='categories.php?edit={$id_transakcie}'>Edit</a></td>";
                echo "</tr>";
            }
        }

        // funkcia zobrazi sumarizacnu tabulku pre aktualny stav zamestnanca
        function LoadSum()
        {
            global $connection;
    
            $id_zamestnanca = $_REQUEST['id_zamestnanca'];

            echo "<tr>";
            echo "<th> Celková neuhradená suma </th>";
            echo "<th> Doposiaľ vyplatená suma </th>"; 
            echo "</tr>";

            $query = "SELECT SUM(F.suma) AS value_sum
            FROM fin_den_zam F
            WHERE cislo_zamestnanca = {$id_zamestnanca}
            AND typ_zaznamu = 'false'";

            $select_fin_den = mysqli_query($connection, $query);

            echo "<tr>";
            // NEVYPLATENA SUMA
            while($row = mysqli_fetch_assoc($select_fin_den))
            {
                $suma = $row['value_sum'];
                if($suma == 0)
                {
                    echo "<td> 0 </td>";
                }
                else{
                    echo "<td> {$suma} </td>";
                }
                
            }

            // VYPLATENE PRACHY
            $query = "SELECT SUM(F.suma) AS value_sum
            FROM fin_den_zam F
            WHERE cislo_zamestnanca = {$id_zamestnanca}
            AND typ_zaznamu = 'true'";

            $select_fin_den = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_fin_den))
            {
                $suma = $row['value_sum'];
                
                if($suma == 0)
                {
                    echo "<td> 0 </td>";
                }
                else{
                    echo "<td> {$suma} </td>";
                }

            }
            echo "<tr>";
        }

        // Nacitanie mena zamestnanca v nadpise financneho denniku
        function LoadMenoZamestnanca()
        {
            global $connection;
    
            $id_zamestnanca = $_REQUEST['id_zamestnanca'];

            $query = "SELECT meno, priezvisko
            FROM zamestnanci
            WHERE cislo_zamestnanca = {$id_zamestnanca}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_meno_zam = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_meno_zam))
            {

                $meno = $row['meno'];
                $priezvisko = $row['priezvisko'];

                echo "{$meno} {$priezvisko}";
            }
        }
?>