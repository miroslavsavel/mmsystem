<?php
        //vykreslenie koeficientov firmy
        function LoadFakturaNazovFirmy()
        {
            global $connection;
    
            $transakcie_list = $_REQUEST['TransakcieList'];
            //https://stackoverflow.com/questions/907806/passing-an-array-to-a-query-using-a-where-clause
            $in = implode(',', $transakcie_list);
            //zoberiem iba prvu
            $id_fin_den_firmy = $in[0];
            
            $query = "SELECT firmy_id
                        FROM fin_den_firmy F
                        WHERE F.id_fin_den_firmy = {$id_fin_den_firmy}";
            $select_fin_den_firmy = mysqli_query($connection, $query);
            while($row = mysqli_fetch_assoc($select_fin_den_firmy))
            {
                $firmy_id = $row['firmy_id'];
            }

            $query = "SELECT nazov_firmy
            FROM firmy
            WHERE firmy_id = {$firmy_id}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_nazov_firmy = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_nazov_firmy))
            {

                $nazov_firmy = $row['nazov_firmy'];

                $_POST['nazov_firmy'] = $nazov_firmy;
                echo "{$nazov_firmy}";
            }
        }

        //vykreslenie koeficientov firmy
        function LoadFakturaSumarKoefFirmy()
        {
            global $connection;
    
            $transakcie_list = $_REQUEST['TransakcieList'];
            //https://stackoverflow.com/questions/907806/passing-an-array-to-a-query-using-a-where-clause
            $in = implode(',', $transakcie_list);
            //zoberiem iba prvu
            $id_fin_den_firmy = $in[0];
            
            $query = "SELECT firmy_id
                        FROM fin_den_firmy F
                        WHERE F.id_fin_den_firmy = {$id_fin_den_firmy}";
            $select_fin_den_firmy = mysqli_query($connection, $query);
            while($row = mysqli_fetch_assoc($select_fin_den_firmy))
            {
                $firmy_id = $row['firmy_id'];
            }

            $query = "SELECT bezna_taxa, priplatok_noc, priplatok_sobota, priplatok_nedela, priplatok_sviatok
            FROM firmy
            WHERE firmy_id = {$firmy_id}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_nazov_firmy = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_nazov_firmy))
            {

                $bezna_taxa = $row['bezna_taxa'];
                $prip_noc = $row['priplatok_noc'];
                $prip_sobota = $row['priplatok_sobota'];
                $prip_nedela = $row['priplatok_nedela'];
                $prip_sviatok = $row['priplatok_sviatok'];

                $praca_noc = $bezna_taxa + $prip_noc;
                $praca_sob = $bezna_taxa + $prip_sobota;
                $praca_ned = $bezna_taxa + $prip_nedela;
                $praca_svia = $bezna_taxa + $prip_sviatok;

                $praca_sob_noc = $bezna_taxa + $prip_noc + $prip_sobota;
                $praca_ned_noc = $bezna_taxa + $prip_noc + $prip_nedela;
                $praca_svia_noc = $bezna_taxa + $prip_noc + $prip_sviatok;

                $praca_sob_svia = $bezna_taxa + $prip_sobota + $prip_sviatok;
                $praca_ned_svia = $bezna_taxa + $prip_nedela + $prip_sviatok;

                $praca_sob_svia_noc = $bezna_taxa + $prip_sobota + $prip_sviatok + $prip_noc;
                $praca_ned_svia_noc = $bezna_taxa + $prip_nedela + $prip_sviatok + $prip_noc;

                //echo "{$bezna_taxa}" . "<br>";
                echo "Štandardná taxa: " . "{$bezna_taxa}" . " eur/hod"."<br>";
                echo "Práca v noci: " . "{$praca_noc}" . " eur/hod"."<br>";
                echo "Práca v sobotu: " . "{$praca_sob}" . " eur/hod"."<br>";
                echo "Práca v nedeľu: " . "{$praca_ned}" . " eur/hod"."<br>";
                echo "Práca cez sviatok: " . "{$praca_svia}" . " eur/hod"."<br>";
                echo "Práca v sobotu v noci: " . "{$praca_sob_noc}" . " eur/hod"."<br>";
                echo "Práca v nedeľu v noci: " . "{$praca_ned_noc}" . " eur/hod"."<br>";
                echo "Práca cez sviatok v noci: " . "{$praca_svia_noc}" . " eur/hod"."<br>";
                echo "Práca v sobotu cez sviatok: " . "{$praca_sob_svia}" . " eur/hod"."<br>";
                echo "Práca v nedeľu cez sviatok: " . "{$praca_ned_svia}" . " eur/hod"."<br>";
                echo "Práca v sobotu cez sviatok v noci: " . "{$praca_sob_svia_noc}" . " eur/hod"."<br>";
                echo "Práca v nedeľu cez sviatok v noci: " . "{$praca_ned_svia_noc}" . " eur/hod"."<br>";
            }
        }


        //vykreslenie zaznamov pre kazdeho zamestnanca
        function LoadNewFaktura()
        {
                global $connection;

                $transakcie_list = $_REQUEST['TransakcieList'];
                //https://stackoverflow.com/questions/907806/passing-an-array-to-a-query-using-a-where-clause
                $in = implode(',', $transakcie_list);

                
                $query = "SELECT *
                FROM fin_den_firmy F
                WHERE F.id_fin_den_firmy IN ($in)";
                //join schvalene_vykazy tam je aj datum akcie
                //join na firmy
                $select_fin_den_firmy = mysqli_query($connection, $query);
                //hlavicka tabulky
                echo "<tr>";
                echo "<th> Dátum akcie </th>";
                echo "<th> Názov akcie </th>";
                echo "<th> Meno </th>";
                echo "<th> Priezvisko </th>";
                //echo "<th> ID transakcie </th>";
                echo "<th> Od </th>";
                echo "<th> Do </th>";
                echo "<th> Počet hodín </th>";
                

                echo "<th> Noc </th>";
                echo "<th> Sobota </th>";
                echo "<th> Nedeľa </th>";
                echo "<th> Sviatok </th>";

                echo "<th> Sobota v noci </th>";
                echo "<th> Nedela v noci </th>";
                echo "<th> Sviatok v noci </th>";

                echo "<th> Sobota cez sviatok </th>";
                echo "<th> Nedeľa cez sviatok </th>";

                echo "<th> Sobota cez sviatok v noci </th>";
                echo "<th> Nedeľa cez sviatok v noci </th>";

                echo "<th> Km </th>";
                echo "<th> Paušál </th>";
                echo "<th> Taxi-vlak-iné </th>";
                echo "</tr>";
    
                while($row = mysqli_fetch_assoc($select_fin_den_firmy))
                {
    
                    $id_transakcie = $row['id_fin_den_firmy'];
                    //$nazov_akcie 
                    $id_schvalene_vykazy = $row['schvalene_vykazy_id'];
                    $query_nazov_akcie = "SELECT nazov_akcie FROM schvalene_vykazy WHERE schvalene_vykazy_id = {$id_schvalene_vykazy}";
                    $select_nazov_akcie = mysqli_query($connection, $query_nazov_akcie);
                    while($riadok = mysqli_fetch_assoc($select_nazov_akcie))
                    {
                        $nazov_akcie = $riadok['nazov_akcie'];
                    }

                    $dat_akcie = $row['akcia_dat'];
                    $cislo_zamestnanca = $row['cislo_zamestnanca_id'];
                    //select meno zamestnanca
                    $query_meno = "SELECT Z.meno, Z.priezvisko 
                    FROM zamestnanci Z
                    WHERE Z.cislo_zamestnanca = {$cislo_zamestnanca}";
                    $select_meno = mysqli_query($connection, $query_meno);
                    while($riadok = mysqli_fetch_assoc($select_meno))
                    {
                        $meno = $riadok['meno'];
                        $priezvisko = $riadok['priezvisko'];
                    }
                    $cas_od = $row['cas_od'];
                    $cas_do = $row['cas_do'];
                    $pocet_hod = $row['pocet_hodin'];
                    $km = $row['km'];

                    $h_noc = $row['hod_noc'];
                    $h_sob = $row['hod_sobota'];
                    $h_ned = $row['hod_nedela'];
                    $h_svia = $row['hod_sviatok'];
                    $h_sob_noc = $row['hod_sobota_noc'];
                    $h_ned_noc = $row['hod_nedela_noc'];
                    $h_svia_noc = $row['hod_sviatok_noc'];
                    $h_sob_svia = $row['hod_sobota_sviatok'];
                    $h_ned_svia = $row['hod_nedela_sviatok'];
                    $h_sob_svia_noc = $row['hod_sobota_sviatok_noc'];
                    $h_ned_svia_noc = $row['hod_nedela_sviatok_noc'];

                    $pausal = $row['fixna_odmena'];
                    $tax_vlak = $row['taxi_vlak_ine'];
    
        
                    echo "<tr>";
                    echo "<td> {$dat_akcie} </td>";
                    echo "<td> {$nazov_akcie} </td>";
                    echo "<td> {$meno} </td>";
                    echo "<td> {$priezvisko} </td>";
                    //toto ID si poslem pri schvaleni faktury a na ich zaklade budem robit insert a vyber!!!!!!!
                    //https://www.w3schools.com/tags/att_input_type_hidden.asp
                    //echo "<td> {$id_transakcie} </td>";
                    echo "<input type='hidden' id='custId' name='TransakcieList[]' value={$id_transakcie}>";
                    echo "<td> {$cas_od } </td>"; 
                    echo "<td> {$cas_do} </td>"; 
                    echo "<td> {$pocet_hod} </td>"; 
                     
                    
                    echo "<td> {$h_noc} </td>";
                    echo "<td> {$h_sob} </td>";
                    echo "<td> {$h_ned} </td>";
                    echo "<td> {$h_svia} </td>";
                    echo "<td> {$h_sob_noc} </td>";
                    echo "<td> {$h_ned_noc} </td>";
                    echo "<td> {$h_svia_noc} </td>";
                    echo "<td> {$h_sob_svia} </td>";
                    echo "<td> {$h_ned_svia} </td>";
                    echo "<td> {$h_sob_svia_noc} </td>";
                    echo "<td> {$h_ned_svia_noc} </td>";

                    echo "<td> {$km} </td>";
                    echo "<td> {$pausal} </td>";
                    echo "<td> {$tax_vlak} </td>";
                    
                    echo "</tr>";
                }
        }

        function LoadFakturaCelkovySucet()
        {
            global $connection;

            $transakcie_list = $_REQUEST['TransakcieList'];
            $in = implode(',', $transakcie_list);

            
            $query = "SELECT SUM(F.pocet_hodin) AS sum_hod,
                            SUM(F.hod_noc) AS sum_hod_noc,
                            SUM(F.hod_sobota) AS sum_hod_sobota,
                            SUM(F.hod_nedela) AS sum_hod_nedela,
                            SUM(F.hod_sviatok) AS sum_hod_sviatok,
                            SUM(F.hod_sobota_noc) AS sum_hod_sobota_noc,
                            SUM(F.hod_nedela_noc) AS sum_hod_nedela_noc,
                            SUM(F.hod_sviatok_noc) AS sum_hod_sviatok_noc,
                            SUM(F.hod_sobota_sviatok) AS sum_hod_sobota_sviatok,
                            SUM(F.hod_nedela_sviatok) AS sum_hod_nedela_sviatok,
                            SUM(F.hod_sobota_sviatok_noc) AS sum_hod_sobota_sviatok_noc,
                            SUM(F.hod_nedela_sviatok_noc) AS sum_hod_nedela_sviatok_noc,
                            SUM(F.km) AS sum_km,
                            SUM(F.fixna_odmena) AS sum_fixna_odmena,
                            SUM(F.taxi_vlak_ine) AS sum_taxi_vlak_ine
                        FROM fin_den_firmy F
                        WHERE F.id_fin_den_firmy IN ($in)";
            
            $select_fin_den_firmy = mysqli_query($connection, $query);
            echo "<tr>";
            echo "<th> Celkový počet hodín </th>";
            
            echo "<th> Noc </th>";
            echo "<th> Sobota </th>";
            echo "<th> Nedeľa </th>";
            echo "<th> Sviatok </th>";

            echo "<th> Sobota v noci </th>";
            echo "<th> Nedela v noci </th>";
            echo "<th> Sviatok v noci </th>";

            echo "<th> Sobota cez sviatok </th>";
            echo "<th> Nedeľa cez sviatok </th>";

            echo "<th> Sobota cez sviatok v noci </th>";
            echo "<th> Nedeľa cez sviatok v noci </th>";

            echo "<th> Celkový počet najazdených km </th>";
            echo "<th> Paušál spolu </th>";
            echo "<th> Taxi-vlak-iné </th>";
            echo "</tr>";

            
            while($riadok = mysqli_fetch_assoc($select_fin_den_firmy))
            {
                $sum_hod = $riadok['sum_hod'];
                $sum_hod_noc = $riadok['sum_hod_noc'];
                $sum_hod_sobota = $riadok['sum_hod_sobota'];
                $sum_hod_nedela = $riadok['sum_hod_nedela'];
                $sum_hod_sviatok = $riadok['sum_hod_sviatok'];

                $sum_hod_sobota_noc = $riadok['sum_hod_sobota_noc'];
                $sum_hod_nedela_noc = $riadok['sum_hod_nedela_noc'];
                $sum_hod_sviatok_noc = $riadok['sum_hod_sviatok_noc'];

                $sum_hod_sobota_sviatok = $riadok['sum_hod_sobota_sviatok'];
                $sum_hod_nedela_sviatok = $riadok['sum_hod_nedela_sviatok'];

                $sum_hod_sobota_sviatok_noc = $riadok['sum_hod_sobota_sviatok_noc'];
                $sum_hod_nedela_sviatok_noc = $riadok['sum_hod_nedela_sviatok_noc'];

                $sum_km = $riadok['sum_km'];
                $sum_fixna_odmena = $riadok['sum_fixna_odmena'];
                $sum_taxi_vlak_ine = $riadok['sum_taxi_vlak_ine'];
                echo "<tr>";
                echo "<td> {$sum_hod} </td>";
                echo "<td> {$sum_hod_noc} </td>";
                echo "<td> {$sum_hod_sobota} </td>";
                echo "<td> {$sum_hod_nedela} </td>";
                echo "<td> {$sum_hod_sviatok} </td>";
                echo "<td> {$sum_hod_sobota_noc} </td>";
                echo "<td> {$sum_hod_nedela_noc} </td>";
                echo "<td> {$sum_hod_sviatok_noc} </td>";
                echo "<td> {$sum_hod_sobota_sviatok} </td>";
                echo "<td> {$sum_hod_nedela_sviatok} </td>";
                echo "<td> {$sum_hod_sobota_sviatok_noc} </td>";
                echo "<td> {$sum_hod_nedela_sviatok_noc} </td>";
                echo "<td> {$sum_km} </td>";
                echo "<td> {$sum_fixna_odmena} </td>";
                echo "<td> {$sum_taxi_vlak_ine} </td>";
                echo "</tr>";
            }
            
            

        }

        //vysledna suma
        function LoadVyslednaSuma()
        {
            global $connection;
            $transakcie_list = $_REQUEST['TransakcieList'];
            $in = implode(',', $transakcie_list);
            //zoberiem iba prvu
            $id_fin_den_firmy = $in[0];
            
            $query = "SELECT firmy_id
                        FROM fin_den_firmy F
                        WHERE F.id_fin_den_firmy = {$id_fin_den_firmy}";
            $select_fin_den_firmy = mysqli_query($connection, $query);
            while($row = mysqli_fetch_assoc($select_fin_den_firmy))
            {
                $firmy_id = $row['firmy_id'];
            }

            $query = "SELECT bezna_taxa, priplatok_noc, priplatok_sobota, priplatok_nedela, priplatok_sviatok
            FROM firmy
            WHERE firmy_id = {$firmy_id}";
            //join schvalene_vykazy tam je aj datum akcie
            //join na firmy
            $select_nazov_firmy = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_nazov_firmy))
            {

                $bezna_taxa = $row['bezna_taxa'];
                $prip_noc = $row['priplatok_noc'];
                $prip_sobota = $row['priplatok_sobota'];
                $prip_nedela = $row['priplatok_nedela'];
                $prip_sviatok = $row['priplatok_sviatok'];
            }
            

            //nacitam celkove pocty odpracovanych hodin
            $query = "SELECT SUM(F.pocet_hodin) AS sum_hod,
                            SUM(F.hod_noc) AS sum_hod_noc,
                            SUM(F.hod_sobota) AS sum_hod_sobota,
                            SUM(F.hod_nedela) AS sum_hod_nedela,
                            SUM(F.hod_sviatok) AS sum_hod_sviatok,
                            SUM(F.hod_sobota_noc) AS sum_hod_sobota_noc,
                            SUM(F.hod_nedela_noc) AS sum_hod_nedela_noc,
                            SUM(F.hod_sviatok_noc) AS sum_hod_sviatok_noc,
                            SUM(F.hod_sobota_sviatok) AS sum_hod_sobota_sviatok,
                            SUM(F.hod_nedela_sviatok) AS sum_hod_nedela_sviatok,
                            SUM(F.hod_sobota_sviatok_noc) AS sum_hod_sobota_sviatok_noc,
                            SUM(F.hod_nedela_sviatok_noc) AS sum_hod_nedela_sviatok_noc,
                            SUM(F.km) AS sum_km,
                            SUM(F.fixna_odmena) AS sum_fixna_odmena,
                            SUM(F.taxi_vlak_ine) AS sum_taxi_vlak_ine
                        FROM fin_den_firmy F
                        WHERE F.id_fin_den_firmy IN ($in)";
            
            $select_fin_den_firmy = mysqli_query($connection, $query);
            while($riadok = mysqli_fetch_assoc($select_fin_den_firmy))
            {
                $sum_hod = $riadok['sum_hod'];
                $sum_hod_noc = $riadok['sum_hod_noc'];
                $sum_hod_sobota = $riadok['sum_hod_sobota'];
                $sum_hod_nedela = $riadok['sum_hod_nedela'];
                $sum_hod_sviatok = $riadok['sum_hod_sviatok'];

                $sum_hod_sobota_noc = $riadok['sum_hod_sobota_noc'];
                $sum_hod_nedela_noc = $riadok['sum_hod_nedela_noc'];
                $sum_hod_sviatok_noc = $riadok['sum_hod_sviatok_noc'];

                $sum_hod_sobota_sviatok = $riadok['sum_hod_sobota_sviatok'];
                $sum_hod_nedela_sviatok = $riadok['sum_hod_nedela_sviatok'];

                $sum_hod_sobota_sviatok_noc = $riadok['sum_hod_sobota_sviatok_noc'];
                $sum_hod_nedela_sviatok_noc = $riadok['sum_hod_nedela_sviatok_noc'];

                $sum_km = $riadok['sum_km'];
                $sum_fixna_odmena = $riadok['sum_fixna_odmena'];
                $sum_taxi_vlak_ine = $riadok['sum_taxi_vlak_ine'];
            }

            //vypocet celkovej sumy za hodiny
            $eur_hod = $sum_hod * $bezna_taxa;
            $eur_noc = $sum_hod_noc * $prip_noc;
            $eur_sob = $sum_hod_sobota * $prip_sobota;
            $eur_ned = $sum_hod_nedela * $prip_nedela;
            $eur_svia = $sum_hod_sviatok * $prip_sviatok;
            $eur_sob_noc = $sum_hod_sobota_noc * ($prip_sobota + $prip_noc);
            $eur_ned_noc = $sum_hod_nedela_noc * ($prip_nedela + $prip_noc);
            $eur_svia_noc = $sum_hod_sviatok_noc * ($prip_sviatok + $prip_noc);
            $eur_sob_svia = $sum_hod_sobota_sviatok * ($prip_sobota + $prip_sviatok);
            $eur_ned_svia = $sum_hod_nedela_sviatok * ($prip_nedela + $prip_sviatok);
            $eur_sobota_sviatok_noc = $sum_hod_sobota_sviatok_noc * ($prip_sobota + $prip_sviatok + $prip_noc);
            $eur_nedela_sviatok_noc = $sum_hod_nedela_sviatok_noc * ($prip_nedela + $prip_sviatok + $prip_noc);

            $eur_za_hodiny_celkom = $eur_hod + $eur_noc + $eur_sob + $eur_ned + $eur_svia + $eur_sob_noc +
                                    $eur_ned_noc + $eur_svia_noc + $eur_sob_svia + $eur_ned_svia + $eur_sobota_sviatok_noc + $eur_nedela_sviatok_noc;

            $eur_bez_dph = $eur_za_hodiny_celkom + $sum_fixna_odmena;
            $eur_DPH = $eur_bez_dph * 0.20;
            $eur_s_dph = $eur_bez_dph * 1.20;
            echo "Za hodiny celkom: " . $eur_za_hodiny_celkom . " eur"."<br>";
            echo "Za paušál celkom: " . $sum_fixna_odmena . " eur"."<br>";
            echo "Suma bez DPH: " . $eur_bez_dph . " eur"."<br>";
            echo "DPH: " . $eur_DPH . " eur"."<br>";
            echo "Suma s DPH: " . $eur_s_dph . " eur"."<br>";
        }

        //--------------------------------------------------------------------------------------------------
        //hlavna funkcia ktora sa vola ked je stlaceny button potvrit fakturu
        function InsertFaktura()
        {
            global $connection;
            if(isset($_POST['schval_fakturu']))
            {
                //stlacil potvrdit
                //$mpdf = new \Mpdf\Mpdf(['orientation' => 'L']);

                $transakcie_list = $_REQUEST['TransakcieList'];
                //https://stackoverflow.com/questions/907806/passing-an-array-to-a-query-using-a-where-clause
                $in = implode(',', $transakcie_list);

                echo var_dump($_POST);
                //todo - find if it is not dangerous use asterisk
                $query = "SELECT *
                FROM fin_den_firmy F
                WHERE F.id_fin_den_firmy IN ($in)";
                $select_fin_den_firmy = mysqli_query($connection, $query);



                //--------------------------------------------------------------------------
                //to co vyberiem z fin_den_firmy nacitam do premennych a pre kazdy riadok urobim insert
                while($row = mysqli_fetch_assoc($select_fin_den_firmy))
                {

                    //$id_fin_den_firmy = $row['id_fin_den_firmy'];
                    $firmy_id = $row['firmy_id'];


                    //tu si nacitam koeficienty pre firmu
                    $query_koef = "SELECT *
                    FROM firmy F
                    WHERE F.firmy_id = {$firmy_id}";
                    $select_fin_den_firmy_koef = mysqli_query($connection, $query_koef);
                    while($row = mysqli_fetch_assoc($select_fin_den_firmy_koef))
                    {
                        $bezna_taxa = $row['bezna_taxa'];
                        $prip_noc = $row['priplatok_noc'];
                        $prip_sob = $row['priplatok_sobota'];
                        $prip_ned = $row['priplatok_nedela'];
                        $prip_svia = $row['priplatok_sviatok'];     
                    }
                    //vypocitam ake su jednotlive marze za pracu
                    $praca_noc = $bezna_taxa + $prip_noc;
                    $praca_sob = $bezna_taxa + $prip_sob;
                    $praca_ned = $bezna_taxa + $prip_ned;
                    $praca_svia = $bezna_taxa + $prip_svia;
    
                    $praca_sob_noc = $bezna_taxa + $prip_noc + $prip_sob;
                    $praca_ned_noc = $bezna_taxa + $prip_noc + $prip_ned;
                    $praca_svia_noc = $bezna_taxa + $prip_noc + $prip_svia;
    
                    $praca_sob_svia = $bezna_taxa + $prip_sob + $prip_svia;
                    $praca_ned_svia = $bezna_taxa + $prip_ned + $prip_svia;
    
                    $praca_sob_svia_noc = $bezna_taxa + $prip_sob + $prip_svia + $prip_noc;
                    $praca_ned_svia_noc = $bezna_taxa + $prip_ned + $prip_svia + $prip_noc;
                }
                $query_sum = "SELECT SUM(F.pocet_hodin) AS sum_hod,
                                    SUM(F.hod_noc) AS sum_hod_noc,
                                    SUM(F.hod_sobota) AS sum_hod_sobota,
                                    SUM(F.hod_nedela) AS sum_hod_nedela,
                                    SUM(F.hod_sviatok) AS sum_hod_sviatok,
                                    SUM(F.hod_sobota_noc) AS sum_hod_sobota_noc,
                                    SUM(F.hod_nedela_noc) AS sum_hod_nedela_noc,
                                    SUM(F.hod_sviatok_noc) AS sum_hod_sviatok_noc,
                                    SUM(F.hod_sobota_sviatok) AS sum_hod_sobota_sviatok,
                                    SUM(F.hod_nedela_sviatok) AS sum_hod_nedela_sviatok,
                                    SUM(F.hod_sobota_sviatok_noc) AS sum_hod_sobota_sviatok_noc,
                                    SUM(F.hod_nedela_sviatok_noc) AS sum_hod_nedela_sviatok_noc,
                                    SUM(F.km) AS sum_km,
                                    SUM(F.fixna_odmena) AS sum_fixna_odmena,
                                    SUM(F.taxi_vlak_ine) AS sum_taxi_vlak_ine
                                FROM fin_den_firmy F
                                WHERE F.id_fin_den_firmy IN ($in)";
                    $select_fin_den_firmy_sum = mysqli_query($connection, $query_sum);
                    while($riadok = mysqli_fetch_assoc($select_fin_den_firmy_sum))
                    {
                        $sum_hod = $riadok['sum_hod'];
                        $sum_hod_noc = $riadok['sum_hod_noc'];
                        $sum_hod_sobota = $riadok['sum_hod_sobota'];
                        $sum_hod_nedela = $riadok['sum_hod_nedela'];
                        $sum_hod_sviatok = $riadok['sum_hod_sviatok'];

                        $sum_hod_sobota_noc = $riadok['sum_hod_sobota_noc'];
                        $sum_hod_nedela_noc = $riadok['sum_hod_nedela_noc'];
                        $sum_hod_sviatok_noc = $riadok['sum_hod_sviatok_noc'];

                        $sum_hod_sobota_sviatok = $riadok['sum_hod_sobota_sviatok'];
                        $sum_hod_nedela_sviatok = $riadok['sum_hod_nedela_sviatok'];

                        $sum_hod_sobota_sviatok_noc = $riadok['sum_hod_sobota_sviatok_noc'];
                        $sum_hod_nedela_sviatok_noc = $riadok['sum_hod_nedela_sviatok_noc'];

                        $sum_km = $riadok['sum_km'];
                        $sum_fixna_odmena = $riadok['sum_fixna_odmena'];
                        $sum_taxi_vlak_ine = $riadok['sum_taxi_vlak_ine'];
                    }
                //vypocitam eur_hod celkom, eur_pausal, eur_bez_dph, eur_dph, eur_s_dph
                //vypocet celkovej sumy za hodiny
                $eur_hod = $sum_hod * $bezna_taxa;
                $eur_noc = $sum_hod_noc * $prip_noc;
                $eur_sob = $sum_hod_sobota * $prip_sob;
                $eur_ned = $sum_hod_nedela * $prip_ned;
                $eur_svia = $sum_hod_sviatok * $prip_svia;
                $eur_sob_noc = $sum_hod_sobota_noc * ($prip_sob + $prip_noc);
                $eur_ned_noc = $sum_hod_nedela_noc * ($prip_ned + $prip_noc);
                $eur_svia_noc = $sum_hod_sviatok_noc * ($prip_svia + $prip_noc);
                $eur_sob_svia = $sum_hod_sobota_sviatok * ($prip_sob + $prip_svia);
                $eur_ned_svia = $sum_hod_nedela_sviatok * ($prip_ned + $prip_svia);
                $eur_sobota_sviatok_noc = $sum_hod_sobota_sviatok_noc * ($prip_sob + $prip_svia + $prip_noc);
                $eur_nedela_sviatok_noc = $sum_hod_nedela_sviatok_noc * ($prip_ned + $prip_svia + $prip_noc);

                $eur_za_hodiny_celkom = $eur_hod + $eur_noc + $eur_sob + $eur_ned + $eur_svia + $eur_sob_noc +
                                        $eur_ned_noc + $eur_svia_noc + $eur_sob_svia + $eur_ned_svia + $eur_sobota_sviatok_noc + $eur_nedela_sviatok_noc;

                $eur_bez_dph = $eur_za_hodiny_celkom + $sum_fixna_odmena;
                $eur_DPH = $eur_bez_dph * 0.20;
                $eur_s_dph = $eur_bez_dph * 1.20;
                //insert do tabule faktury
                $insert_faktury = "INSERT INTO faktury(
                    id_faktury, 
                    firmy_id,
                    zakl_taxa,
                    praca_noc,
                    praca_sob,
                    praca_ned,
                    praca_svia,
                    praca_sob_noc,
                    praca_ned_noc,
                    praca_svia_noc,
                    praca_sob_svia,
                    praca_ned_svia,
                    praca_sob_svia_noc,
                    praca_ned_svia_noc,
                    sum_pocet_hod,
                    sum_noc,
                    sum_sob,
                    sum_ned,
                    sum_svia,
                    sum_sob_noc,
                    sum_ned_noc,
                    sum_svia_noc,
                    sum_sob_svia,
                    sum_ned_svia,
                    sum_sob_svia_noc,
                    sum_ned_svia_noc,
                    sum_pocet_km,
                    sum_pausal,
                    sum_taxi_vlak_ine,
                    eur_hod_celkom,
                    eur_pausal,
                    eur_bez_dph,
                    eur_dph,
                    eur_s_dph
                    )";
                    $insert_faktury .= "VALUE( NULL,
                    '{$firmy_id}',
                    '{$bezna_taxa}',
                    '{$praca_noc}',
                    '{$praca_sob}',
                    '{$praca_ned}',
                    '{$praca_svia}',
                    '{$praca_sob_noc}',
                    '{$praca_ned_noc}',
                    '{$praca_svia_noc}',
                    '{$praca_sob_svia}',
                    '{$praca_ned_svia}',
                    '{$praca_sob_svia_noc}',
                    '{$praca_ned_svia_noc}',
                    '{$sum_hod}',
                    '{$sum_hod_noc}',
                    '{$sum_hod_sobota}',
                    '{$sum_hod_nedela}',
                    '{$sum_hod_sviatok}',
                    '{$sum_hod_sobota_noc}',
                    '{$sum_hod_nedela_noc}',
                    '{$sum_hod_sviatok_noc}',
                    '{$sum_hod_sobota_sviatok}',
                    '{$sum_hod_nedela_sviatok}',
                    '{$sum_hod_sobota_sviatok_noc}',
                    '{$sum_hod_nedela_sviatok_noc}',
                    '{$sum_km}',
                    '{$sum_fixna_odmena}',
                    '{$sum_taxi_vlak_ine}',
                    '{$eur_za_hodiny_celkom}',
                    '{$sum_fixna_odmena}',
                    '{$eur_bez_dph}',
                    '{$eur_DPH}',
                    '{$eur_s_dph}'
                    )";
                //Spustim INSERT                                   
                $insert_faktury = mysqli_query($connection, $insert_faktury);
                 
                if(!$insert_faktury)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
                {
                        die('QUERY INSERT FAKTURY FAILED' . mysqli_error($connection));
                }
                else{
                       //INSERT prebehol OK
                       //ak bol insert do faktury uspesny tak rob
                        //insert do tabule faktury_zamestnanci
                        //potrebujem vybrat posledne pouzite id faktury
                        $query_max_id_faktury = "SELECT MAX(id_faktury) FROM faktury";
                        $select_max_id_faktury = mysqli_query($connection, $query_max_id_faktury);
                        $row = mysqli_fetch_assoc($select_max_id_faktury);
                        //tu mam ulozene ID aktualne vlozeneho wait_vykazu
                        $id_faktury = $row['MAX(id_faktury)'];
                        //echo $id_faktury;

                        //----------------------INSERT_FAKTURY_zamestnanci
                        //urobim druhykrat select lebo ten horny tam to uz nebudem spagetovat
                        $query = "SELECT *
                        FROM fin_den_firmy F
                        WHERE F.id_fin_den_firmy IN ($in)";
                        $select_fin_den_firmy = mysqli_query($connection, $query);
                        while($row = mysqli_fetch_assoc($select_fin_den_firmy))
                        {
                            $id_fin_den_firmy = $row['id_fin_den_firmy'];
                            //$nazov_akcie 
                            $id_schvalene_vykazy = $row['schvalene_vykazy_id'];
                            $query_nazov_akcie = "SELECT nazov_akcie FROM schvalene_vykazy WHERE schvalene_vykazy_id = {$id_schvalene_vykazy}";
                            $select_nazov_akcie = mysqli_query($connection, $query_nazov_akcie);
                            while($riadok = mysqli_fetch_assoc($select_nazov_akcie))
                            {
                                $nazov_akcie = $riadok['nazov_akcie'];
                            }

                            //$dat_akcie = $row['akcia_dat']; //netreba to zatial
                            $cislo_zamestnanca = $row['cislo_zamestnanca_id'];
                            //select meno zamestnanca
                            $query_meno = "SELECT Z.meno, Z.priezvisko 
                            FROM zamestnanci Z
                            WHERE Z.cislo_zamestnanca = {$cislo_zamestnanca}";
                            $select_meno = mysqli_query($connection, $query_meno);
                            while($riadok = mysqli_fetch_assoc($select_meno))
                            {
                                $meno = $riadok['meno'];
                                $priezvisko = $riadok['priezvisko'];
                            }
                            $cas_od = $row['cas_od'];
                            $cas_do = $row['cas_do'];
                            $pocet_hod = $row['pocet_hodin'];
                            $km = $row['km'];

                            $h_noc = $row['hod_noc'];
                            $h_sob = $row['hod_sobota'];
                            $h_ned = $row['hod_nedela'];
                            $h_svia = $row['hod_sviatok'];
                            $h_sob_noc = $row['hod_sobota_noc'];
                            $h_ned_noc = $row['hod_nedela_noc'];
                            $h_svia_noc = $row['hod_sviatok_noc'];
                            $h_sob_svia = $row['hod_sobota_sviatok'];
                            $h_ned_svia = $row['hod_nedela_sviatok'];
                            $h_sob_svia_noc = $row['hod_sobota_sviatok_noc'];
                            $h_ned_svia_noc = $row['hod_nedela_sviatok_noc'];

                            $pausal = $row['fixna_odmena'];
                            $taxi_vlak_ine = $row['taxi_vlak_ine'];
                            $insert_faktury_zamestnanci = "INSERT INTO faktury_zamestnanci(
                                                    id_faktury_zamestnanci, 
                                                    id_fin_den_firmy,
                                                    id_faktury,
                                                    nazov_akcie,
                                                    meno,
                                                    priezvisko,
                                                    cas_od,
                                                    cas_do,
                                                    pocet_hodin,
                                                    hod_noc,
                                                    hod_sob,
                                                    hod_ned,
                                                    hod_svia,
                                                    hod_sob_noc,
                                                    hod_ned_noc,
                                                    hod_svia_noc,
                                                    hod_sob_svia,
                                                    hod_ned_svia,
                                                    hod_sob_svia_noc,
                                                    hod_ned_svia_noc,
                                                    km,
                                                    pausal,
                                                    taxi_vlak_ine
                                                    )";
                            $insert_faktury_zamestnanci .= "VALUE( 
                                                NULL,
                                            '{$id_fin_den_firmy}',
                                            '{$id_faktury}',
                                            '{$nazov_akcie}',
                                            '{$meno}',
                                            '{$priezvisko}',
                                            '{$cas_od}',
                                            '{$cas_do}',
                                            '{$pocet_hod}',
                                            '{$h_noc}',
                                            '{$h_sob}',
                                            '{$h_ned}',
                                            '{$h_svia}',
                                            '{$h_sob_noc}',
                                            '{$h_ned_noc}',
                                            '{$h_svia_noc}',
                                            '{$h_sob_svia}',
                                            '{$h_ned_svia}',
                                            '{$h_sob_svia_noc}',
                                            '{$h_ned_svia_noc}',
                                            '{$km}',
                                            '{$pausal}',
                                            '{$taxi_vlak_ine}'
                                            )";
                            //Spustim INSERT                                   
                            $insert_faktury_zamestnanci = mysqli_query($connection, $insert_faktury_zamestnanci);
                        }

                 
                        if(!$insert_faktury_zamestnanci)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
                        {
                                die('QUERY INSERT FAKTURY FAILED' . mysqli_error($connection));
                        }
                        else{
                             //update stlpec typ_zaznamu vo fin_den_firmy na TRUE => je to vyfakturovane
                             $query_upd_fin_den_firmy = "UPDATE fin_den_firmy 
                                                         SET typ_zaznamu = 'true'
                                                        WHERE id_fin_den_firmy IN ($in)";
                             $upd_fin_den_firmy = mysqli_query($connection, $query_upd_fin_den_firmy);
                            //redirect na faktury.php
                            //tu urob showAllFaktury()
                            header("Location: faktury.php");
                        }   
                }    
                

               
                //tam bude gombik export_do_pdf
                //--------------------------------------------------------------------------

                //-------------------------------------------------------------------
                //test mpdf - toto bude potom ked kliknes na gombik export na faktury.php
                // $pdfcontent = '<h1>PDF faktúry</h1>
                //                 <h2>Employee Details</h2>
                //                 <table autosize="1">
                //                 <tr>
                //                 <td style="width: 33%"><strong>Nazov firmy</strong></td>
                //                 <td style="width: 36%"><strong>ICO</strong></td>
                //                 <td style="width: 30%"><strong>DIC</strong></td>
                //                 </tr>
                //                 </table>';
                // $pdfcontent = '<div id="page-wrapper">
                //                     <h2 class="page-header">
                //                         Hodinová taxa a príplatky pre firmu: '. LoadFakturaNazovFirmy() .'
                //                     </h2>
                //                 </div>';

                // $mpdf->WriteHTML($pdfcontent);

                // $mpdf->SetDisplayMode('fullpage');
                // $mpdf->list_indent_first_level = 0; 


                //output in browser
                //$mpdf->Output();
                //header("Location: faktury.php");
            }
        }//koniec giga funkcie insert_faktura
?>