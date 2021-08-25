<?php
    //tato funkcia nacita do multiple select boxu zoznam firiem z ktorych moze user vybrat
    function vyber_firmu()
    {
        global $connection;
        $query = "SELECT nazov_firmy, firmy_id FROM firmy";
        $select_firmy_do_ponuky = mysqli_query($connection, $query);

        echo "<option></option>";
        while($row = mysqli_fetch_assoc($select_firmy_do_ponuky))
        {
            $nazov_firmy = $row['nazov_firmy'];
            $firmy_id = $row['firmy_id'];
            $zobrazeny_text = $nazov_firmy . '   -> id: ' . $firmy_id; 
            //$_SESSION["firmy_id"] = $firmy_id;    //tu mi je zbytocne to ulozit do session, nakolko sa tam vzdy da posledne nacitane ID, kedze v tomto momente este neviem co vybral      
            echo "<option>{$zobrazeny_text}</option>";                   
        }
    } 

    //tato funkcia ma predvyplnenu moznost ktoru uzivatel vybral, plus umoznuje dalej vyberat
    function vyber_firmu_edit($par_firmy_id)
    {
        global $connection;
        $query = "SELECT nazov_firmy, firmy_id FROM firmy";
        $select_firmy_do_ponuky = mysqli_query($connection, $query);

        //tu si najprv selektnem label to scrollboxu, aby sa ukazala povodne vybrata firma
        $label_firmy_id = intval($par_firmy_id);
        $query_label = "SELECT nazov_firmy, firmy_id FROM firmy WHERE firmy_id = {$label_firmy_id} ";
        $select_firmy_label = mysqli_query($connection, $query_label);
        while($row = mysqli_fetch_assoc($select_firmy_label))
        {
            $nazov_firmy_label = $row['nazov_firmy'];
            $firmy_id_label = $row['firmy_id'];
            $zobrazeny_text_label = $nazov_firmy_label . '   -> id: ' . $firmy_id_label;                
        }

        echo "<option>{$zobrazeny_text_label}</option>";
        //tu si uz celu scrollbox
        while($row = mysqli_fetch_assoc($select_firmy_do_ponuky))
        {
            $nazov_firmy = $row['nazov_firmy'];
            $firmy_id = $row['firmy_id'];
            $zobrazeny_text = $nazov_firmy . '   -> id: ' . $firmy_id;
            if($zobrazeny_text_label != $zobrazeny_text)
            {
                echo "<option>{$zobrazeny_text}</option>"; 
            }      
        }


    } 


    //====================================================================================================
    //tato funkcia sa vyuziva pri vlozeni este neschvaleneho vykazu
    //====================================================================================================
    function insert_temp_vykaz()
    {
        global $connection;
        //$connection->autocommit(FALSE);
        // Commit transaction
/* if (!$mysqli -> commit()) {
    echo "Commit transaction failed";
    exit();
  } */
        if(isset($_POST['submit']))
        {
            //nazov_akcie
            $form_vykaz_akcia = $_POST['form_vykaz_akcia'];
            //akcia_dat
            $form_vykaz_dat_akcia = $_POST['form_vykaz_dat_akcia'];
            //musim prekonvertovat string na DATE
            //https://stackoverflow.com/questions/12120433/php-mysql-insert-date-format
           // $_firstDate = date("Y-m-d", strtotime($form_vykaz_dat_akcia));
            $dt = \DateTime::createFromFormat('d.m.Y', $form_vykaz_dat_akcia);
            if($dt == false)
            {
                $dt = NULL;
            }
            if($dt != NULL)
            {
                $form_vykaz_dat_akcia = $dt->format('Y-m-d');
            }
            else{
                echo 'chyba - datum akcie je zle vyplneny';
            }
            

            //tento text musim rozbit na nazov firmy a ID ktore user vybral
            //https://stackoverflow.com/questions/2192170/how-to-remove-part-of-a-string
            //https://www.php.net/manual/en/function.explode.php
            $form_vykaz_firma = $_POST['form_vykaz_firma'];
            $rozlozeny = explode("id:",$form_vykaz_firma);
            $orezane_id_firmy = trim($rozlozeny[1]);
            //firmy_id
            $firmy_id = intval($orezane_id_firmy);
            //-----------------------------------------------------
            $form_vykaz_ine_naklady = floatval($_POST['form_vykaz_ine_naklady']);


            //najprv spravim INSERT do wait_vykazy
            $query = "INSERT INTO wait_vykazy( wait_vykazy_id,
                                                nazov_akcie,
                                                akcia_dat,
                                                firmy_id,
                                                ine_naklady
                                                )";
            $query .= "VALUE( NULL,
            '{$form_vykaz_akcia}',
            '{$form_vykaz_dat_akcia}',
            '{$firmy_id}',
            '{$form_vykaz_ine_naklady}'
                            )";                                    
            $create_wait_vykazy_query = mysqli_query($connection, $query); 

            if(!$create_wait_vykazy_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
            {
                    die('QUERY FAILED' . mysqli_error($connection));
            }
            else{
                //INSERT prebehol OK
                //header("Location: show_firmy.php");

                //GET max ID, kedze toto bude ID posledne vlozeneho vykazu a pod tymto ID budem vkladat 
                //do wait_zamestnanci
                $query = "SELECT MAX(wait_vykazy_id) FROM wait_vykazy";
                $select_max_id_wait_vykazy = mysqli_query($connection, $query);
                $row = mysqli_fetch_assoc($select_max_id_wait_vykazy);
                //tu mam ulozene ID aktualne vlozeneho wait_vykazu
                $wait_vykazy_id = $row['MAX(wait_vykazy_id)'];

                //----------------------------------------------zamestnanci
                //https://stackoverflow.com/questions/10262763/php-how-to-loop-through-a-post-array
                for ($i = 0; $i < count($_POST['meno']); $i++)
                {
                    //echo $_POST['id_zamestnanca'][$i];
                    //$form_vykaz_id_zamestnanca = $_POST['id_zamestnanca'][$i];            //ID po novom nezadavame pri zapise vykazu ale meno a priezvisko
                    $meno= $_POST['meno'][$i];
                    $priezvisko= $_POST['priezvisko'][$i];   
                    $fixna_odmena = floatval($_POST['fixna_odmena'][$i]);
                    $fakturovana_suma = floatval($_POST['fakturovana_suma'][$i]);
                    //------------------------------
                    //vsetupny string je vo formate DD.MM.YYYY hh:mm:ss
                    $cas_od = $_POST['cas_od'][$i];
                    $dt_od = \DateTime::createFromFormat('d.m.Y H:i:s', $cas_od);
                    if($dt_od != false)
                    {
                        $cas_od = $dt_od->format('Y-m-d H:i:s');
                    }
                    else{
                        //$cas_od = '2020-01-01 00:00:00';
                        $cas_od = NULL;
                    }
                    

                    $cas_do = $_POST['cas_do'][$i];
                    $dt_do = \DateTime::createFromFormat('d.m.Y H:i:s', $cas_do);
                    if($dt_do != false)
                    {
                        $cas_do = $dt_do->format('Y-m-d H:i:s');
                    }
                    else
                    {
                        //$cas_do = '2020-01-01 00:00:00';
                        $cas_do = NULL;
                    }
                        
                    
                    //------------------------
                    $pocet_hodin = floatval($_POST['pocet_hodin'][$i]);
                    $hod_noc = floatval($_POST['hod_noc'][$i]);
                    $hod_sobota = floatval($_POST['hod_sobota'][$i]);
                    $hod_nedela = floatval($_POST['hod_nedela'][$i]);
                    $hod_sviatok = floatval($_POST['hod_sviatok'][$i]);
                    $hod_sobota_noc = floatval($_POST['hod_sobota_noc'][$i]);
                    $hod_nedela_noc = floatval($_POST['hod_nedela_noc'][$i]);
                    $hod_sviatok_noc = floatval($_POST['hod_sviatok_noc'][$i]);
                    $hod_sobota_sviatok = floatval($_POST['hod_sobota_sviatok'][$i]);
                    $hod_nedela_sviatok = floatval($_POST['hod_nedela_sviatok'][$i]);
                    $hod_sobota_sviatok_noc= floatval($_POST['hod_sobota_sviatok_noc'][$i]);
                    $hod_nedela_sviatok_noc= floatval($_POST['hod_nedela_sviatok_noc'][$i]);

                    //idem vkladat do wait_zamestnanci
                    //cislo_zamestnanca, uz nezadavame pri zapise
                    $query = "INSERT INTO wait_zamestnanci(
                                                        wait_zamestnanci_id, 
                                                        wait_vykazy_id,
                                                        meno,
                                                        priezvisko,
                                                        fixna_odmena,
                                                        fakturovana_suma,
                                                        cas_od,
                                                        cas_do,
                                                        pocet_hodin,
                                                        hod_noc,
                                                        hod_sobota,
                                                        hod_nedela,
                                                        hod_sviatok,
                                                        hod_sobota_noc,
                                                        hod_nedela_noc,
                                                        hod_sviatok_noc,
                                                        hod_sobota_sviatok,
                                                        hod_nedela_sviatok,
                                                        hod_sobota_sviatok_noc,
                                                        hod_nedela_sviatok_noc
                                                        )";
                    $query .= "VALUE( NULL,
                                    '{$wait_vykazy_id}',
                                    '{$meno}',
                                    '{$priezvisko}',
                                    '{$fixna_odmena}',
                                    '{$fakturovana_suma}',
                                    '{$cas_od}',
                                    '{$cas_do}',
                                    '{$pocet_hodin}',
                                    '{$hod_noc}',
                                    '{$hod_sobota}',
                                    '{$hod_nedela}',
                                    '{$hod_sviatok}',
                                    '{$hod_sobota_noc}',
                                    '{$hod_nedela_noc}',
                                    '{$hod_sviatok_noc}',
                                    '{$hod_sobota_sviatok}',
                                    '{$hod_nedela_sviatok}',
                                    '{$hod_sobota_sviatok_noc}',
                                    '{$hod_nedela_sviatok_noc}'
                                                    )";
                 //Spustim INSERT                                   
                 $create_wait_zamestnanci_query = mysqli_query($connection, $query);
                 
                 if(!$create_wait_zamestnanci_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
                    {
                            die('QUERY WAIT_ZAMESTNANCI FAILED' . mysqli_error($connection));
                    }
                    else{
                        //INSERT prebehol OK
                        header("Location: vykazy.php"); 
                    }  


                }

            }





        }
    } 
    
    
    function findAllVykazyNaSchvalenie()
    {
        global $connection;

        $query = "  SELECT W.wait_vykazy_id, W.nazov_akcie, W.akcia_dat, F.nazov_firmy 
                    FROM wait_vykazy W
                    INNER JOIN firmy F
                    ON W.firmy_id = F.firmy_id
                    ";
        $select_wait_vykazy = mysqli_query($connection, $query);

        
        echo "<tr>";
            echo "<th> Názov akcie </th>";        //double bracket is because of double quotes, single quotes wont work
            echo "<th> Dátum akcie </th>";
            echo "<th> Názov firmy </th>";
        echo "</tr>";
        
        while($row = mysqli_fetch_assoc($select_wait_vykazy))
        {
            $wait_vykazy_id = $row['wait_vykazy_id'];
            $nazov_akcie = $row['nazov_akcie'];
            $akcia_dat = $row['akcia_dat'];
            //-------upravim na vhodny casovy format
            $dt = \DateTime::createFromFormat('Y-m-d', $akcia_dat);
            $akcia_dat = $dt->format('d.m.Y');
            $nazov_firmy = $row['nazov_firmy'];


            echo "<tr>";
            echo "<td> {$nazov_akcie} </td>";        //double bracket is because of double quotes, single quotes wont work
            echo "<td> {$akcia_dat} </td>";
            echo "<td> {$nazov_firmy} </td>";

            //lecture 103 deleting categories
            //!!! passing parameter to browser after click
            //tuto bude treba uviest iba novu funkciu ktora sa zavola a deletne zaznam s danym ID

            echo "<td><a href='vykazy.php?detail={$wait_vykazy_id}'>Detail</a></td>";
            echo "<td><a href='vykazy.php?edit={$wait_vykazy_id}'>Edit</a></td>";
            echo "<td><a href='vykazy.php?delete={$wait_vykazy_id}'>Delete</a></td>";
            echo "</tr>";
        }
    }


    function deleteWaitVykaz()
    {
        global $connection;

        //103 deleting categories
        //DELETE QUERY
        //if we find in the address in web browser parameter delete
        if(isset($_GET['delete']))
        {
            $wait_vykazy_id = $_GET['delete'];
            //delete z wait_zamestnanaci
            $query = "DELETE FROM wait_zamestnanci WHERE wait_vykazy_id = {$wait_vykazy_id}";
            $delete_query_wait_zamestnanci = mysqli_query($connection, $query);
            if(!$delete_query_wait_zamestnanci)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
            {
                    die('QUERY DELETE FROM WAIT_ZAMESTNANCI FAILED' . mysqli_error($connection));
            }
            else{
                //DELETE prebehol OK
                $query = "DELETE FROM wait_vykazy WHERE wait_vykazy_id = {$wait_vykazy_id}";
                $delete_query_wait_vykazy = mysqli_query($connection, $query);

                if(!$delete_query_wait_vykazy)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
                {
                        die('QUERY DELETE FROM WAIT_Vykazy FAILED' . mysqli_error($connection));
                }
                else{
                    header("Location: vykazy.php");      
                }

            }  
        }
    }

    function detailWaitVykaz()
    {
        global $connection;

        if(isset($_GET['detail']))
        {
            header("Location: vykaz_detail.php");
        }
    }

    function editWaitVykaz()
    {
        global $connection;

        //presmerujem na inu stranku??
        if(isset($_GET['edit']))
        {
            $wait_vykazy_id = $_GET['edit'];
            header("Location: vykaz_edit.php?edit={$wait_vykazy_id}");
        } 





    }





    //====================================================================================================
    //tato funkcia sa vyuziva pri schvaleni vykazu adminom -> po stlaceni btn Schval vykaz
    //====================================================================================================
    function insert_permanent_vykaz()
    {
        global $connection;

        if(isset($_POST['vykaz_ok']))
        {
            //insert do tabulky schvalene vykazy
            //insert do tabulky schvalene_vykazy_zamestnanaci
            //vsetko je realizovane cez tuto fnc, ktoru najdes v admin/php/schvalenie_vykazu/fnc_schvalenie_vykazu.php
            //zavolanie funkcie pre vypocet platu kazdeho zamestnanca
            //insert do tabulky fin_den_zamestnanci
            //zavolanie funkcie pre vypocet fakturovanej sumy pre firmy
            //insert do tabulky fin_den_firmy
            $bSchvalenie = false;
            $bSchvalenie = fnc_schvalenie_vykazu();


            if($bSchvalenie = true)
            {
                header("Location: vykaz_ok.php");
            }
            else{
                header("Location: vykaz_err.php");
            }
            
        }
    }

    //====================================================================================================
    //po nacitani schvalene_vykazy.php sa zobrazi tabulka so schvalenymi vykazmi
    //z tabulky schvalene_vykazy
    //====================================================================================================
    function findAllSchvaleneVykazy()
    {
        global $connection;

        $query = "  SELECT S.schvalene_vykazy_id, S.nazov_akcie, S.akcia_dat, F.nazov_firmy 
                    FROM schvalene_vykazy S
                    INNER JOIN firmy F
                    ON S.firmy_id = F.firmy_id
                    ";
        $select_schvalene_vykazy = mysqli_query($connection, $query);

        
        echo "<tr>";
            echo "<th> Názov akcie </th>";        //double bracket is because of double quotes, single quotes wont work
            echo "<th> Dátum akcie </th>";
            echo "<th> Názov firmy </th>";
        echo "</tr>";
        
        while($row = mysqli_fetch_assoc($select_schvalene_vykazy))
        {
            $schvalene_vykazy_id = $row['schvalene_vykazy_id'];
            $nazov_akcie = $row['nazov_akcie'];
            $akcia_dat = $row['akcia_dat'];
            //-------upravim na vhodny casovy format
            $dt = \DateTime::createFromFormat('Y-m-d', $akcia_dat);
            $akcia_dat = $dt->format('d.m.Y');
            $nazov_firmy = $row['nazov_firmy'];


            echo "<tr>";
            echo "<td> {$nazov_akcie} </td>";        //double bracket is because of double quotes, single quotes wont work
            echo "<td> {$akcia_dat} </td>";
            echo "<td> {$nazov_firmy} </td>";

            echo "<td><a href='schvalene_vykazy.php?detail={$schvalene_vykazy_id}'>Detail</a></td>";
            echo "</tr>";
        }
    }

?>