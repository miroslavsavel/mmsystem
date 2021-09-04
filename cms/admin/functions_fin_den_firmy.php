<?php
        function LoadFinDenFirmy()
        {
            global $connection;
    
            $firmy_id = $_REQUEST['firmy_id'];

            //id transakcie, nazov akcie, datum akcie, suma, vyfakturovana praca
            $query = "SELECT F.id_fin_den_firmy, S.nazov_akcie, S.akcia_dat, F.suma, F.typ_zaznamu 
            FROM fin_den_firmy F
            INNER JOIN schvalene_vykazy S ON S.schvalene_vykazy_id = F.schvalene_vykazy_id
            INNER JOIN firmy Fi ON S.firmy_id = Fi.firmy_id
            WHERE F.firmy_id = {$firmy_id}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_fin_den_firmy = mysqli_query($connection, $query);
            
            //select meno zamestnanca
            //fin_den_firmy join schvalene_vykazy_id join schvalene_vykazy_zamestnanci
    
            echo "<tr>";
            echo "<th> ID transakcie </th>";
            echo "<th> Názov akcie </th>";        //double bracket is because of double quotes, single quotes wont work
            echo "<th> Dátum akcie </th>";          
            echo "<th> Suma </th>";
            echo "<th> Vyfakturovaná práca </th>";
            echo "<th> Pridať na faktúru </th>";
            echo "</tr>";

            while($row = mysqli_fetch_assoc($select_fin_den_firmy))
            {

                $id_transakcie = $row['id_fin_den_firmy'];
                $nazov_akcie = $row['nazov_akcie'];
                $dat_akcie = $row['akcia_dat'];
                $suma = $row['suma'];
                $typ_zaznamu = $row['typ_zaznamu'];
    
                echo "<tr>";
                echo "<td> {$id_transakcie} </td>";        
                echo "<td> {$nazov_akcie} </td>";

                echo "<td> {$dat_akcie} </td>";
                echo "<td> {$suma} </td>";
                if($typ_zaznamu == "false")
                {
                    echo "<td> Nie </td>";
                    $checkbox_zobraz = true;
                }
                else{
                    echo "<td> Áno </td>";
                    $checkbox_zobraz = false;
                }
                //checkbox poslat na fakturu
                //ak nie je praca vyfakturovana tak zobraz checkbox
                if($checkbox_zobraz)
                {
                    echo '<td><input name="TransakcieList[]" type="checkbox" value="'.$id_transakcie.'"'.'/></td>';
                }
                else{
                    echo '<td><input class="form-check-input" type="checkbox" value="" id="defaultCheck2" disabled></td>';
                }
                echo "<td><a href='categories.php?delete={$id_transakcie}'>Delete</a></td>";
                echo "<td><a href='categories.php?edit={$id_transakcie}'>Edit</a></td>";
                
                echo "</tr>";
            }
        }

        // funkcia zobrazi sumarizacnu tabulku pre aktualny stav zamestnanca
        function LoadSumFirmy()
        {
            global $connection;
    
            $firmy_id = $_REQUEST['firmy_id'];

            echo "<tr>";
            echo "<th> Celková nevyfakturovaná suma </th>";
            // echo "<th> Doposiaľ vyplatená suma </th>"; 
            echo "</tr>";

            $query = "SELECT SUM(F.suma) AS value_sum
            FROM fin_den_firmy F
            WHERE firmy_id = {$firmy_id}
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
            // $query = "SELECT SUM(F.suma) AS value_sum
            // FROM fin_den_zam F
            // WHERE cislo_zamestnanca = {$id_zamestnanca}
            // AND typ_zaznamu = 'true'";

            // $select_fin_den = mysqli_query($connection, $query);

            // while($row = mysqli_fetch_assoc($select_fin_den))
            // {
            //     $suma = $row['value_sum'];
                
            //     if($suma == 0)
            //     {
            //         echo "<td> 0 </td>";
            //     }
            //     else{
            //         echo "<td> {$suma} </td>";
            //     }

            // }
            // echo "<tr>";
        }

        // Nacitanie mena zamestnanca v nadpise financneho denniku
        function LoadNazovFirmy()
        {
            global $connection;
    
            $id_firmy = $_REQUEST['firmy_id'];

            $query = "SELECT nazov_firmy
            FROM firmy
            WHERE firmy_id = {$id_firmy}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_meno_zam = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_meno_zam))
            {

                $nazov_firmy = $row['nazov_firmy'];

                echo "{$nazov_firmy}";
            }
        }
?>