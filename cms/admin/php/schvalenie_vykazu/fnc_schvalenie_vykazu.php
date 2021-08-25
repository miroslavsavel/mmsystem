<?php
    //================================================================
    //hl. funkcia volana po stlaceni btn, urobi insert do tabu
    //================================================================
    function fnc_schvalenie_vykazu()
    {
        global $connection;
        $bOk = true;    //ak ide vsetko bez problemov, tato premenna je nastavena na true
        //nastartujem transakciu     
        try {
            $connection->autocommit(FALSE); // i.e., start transaction

            //insert do tabulky schvalene vykazy
            //insert do tabulky schvalene_vykazy_zamestnanaci
            //vsetko je realizovane cez tuto fnc, ktoru najdes v admin/php/schvalenie_vykazu/fnc_schvalenie_vykazu.php
            $bOk = fnc_insert_schvalene_vykazy();
            //zavolanie funkcie pre vypocet platu kazdeho zamestnanca
            //insert do tabulky fin_den_zamestnanci
            //zavolanie funkcie pre vypocet fakturovanej sumy pre firmy - iba koeficienty pre firmy
            //insert do tabulky fin_den_firmy 
            //nastav priznak v tabulke wait vykazy na potvrdeny aby z tadial vykaz zmizol

            //DELETE zaznamu z vykazov na schvalnie

            if ( !$bOk ) 
            {
                //$result->free();
                throw new Exception($connection->error);
            }



            // our SQL queries have been successful. commit them
            // and go back to non-transaction mode.
            $connection->commit();
            $connection->autocommit(TRUE); // i.e., end transaction
        }
        catch ( Exception $e ) {
            // before rolling back the transaction, you'd want
            // to make sure that the exception was db-related
            $connection->rollback(); 
            $connection->autocommit(TRUE); // i.e., end transaction 
        }






        
        echo 'Hello vykaz';
        return true;
    }
    


    //=================================================================
    //INSERT do schvalene_vykazy
    //=================================================================
    function fnc_insert_schvalene_vykazy()
    {
        global $connection;

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
        $query = "INSERT INTO schvalene_vykazy( schvalene_vykazy_id,
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
        $create_schvalene_vykazy_query = mysqli_query($connection, $query); 

        if(!$create_schvalene_vykazy_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
            {
                    //nepodarilo sa urobit INSERT do schvalene vykazy
                    die('QUERY FAILED' . mysqli_error($connection));
            }
            else{
                //INSERT do schvalene_vykazy prebehol OK 

                //GET max ID, kedze toto bude ID posledne vlozeneho vykazu a pod tymto ID budem vkladat 
                //do schvalene_vykazy_zamestnanci
                $query = "SELECT MAX(schvalene_vykazy_id) FROM schvalene_vykazy";
                $select_max_id_schvalene_vykazy = mysqli_query($connection, $query);
                $row = mysqli_fetch_assoc($select_max_id_schvalene_vykazy);
                //tu mam ulozene ID aktualne vlozeneho wait_vykazu
                $schvalene_vykazy_id = $row['MAX(schvalene_vykazy_id)'];

                //----------------------------------------------zamestnanci
                for ($i = 0; $i < count($_POST['meno']); $i++)
                {
                    //echo $_POST['id_zamestnanca'][$i];
                    //$form_vykaz_id_zamestnanca = $_POST['id_zamestnanca'][$i];            //ID po novom nezadavame pri zapise vykazu ale meno a priezvisko
                    $meno= $_POST['meno'][$i];
                    $priezvisko= $_POST['priezvisko'][$i];
                    $cislo_zamestnanca_id= $_POST['id_zamestnanca'][$i]; 
                    //ak je prazdne tak ohlas chybu
                    if($cislo_zamestnanca_id == NULL)
                    {
                        return false;
                    }   
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
                    $query = "INSERT INTO schvalene_vykazy_zamestnanci(
                                                        schvalene_vykazy_zamestnanci_id, 
                                                        schvalene_vykazy_id,
                                                        meno,
                                                        priezvisko,
                                                        cislo_zamestnanca_id,
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
                                    '{$schvalene_vykazy_id}',
                                    '{$meno}',
                                    '{$priezvisko}',
                                    '{$cislo_zamestnanca_id}',
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
                 $create_schvalene_vykazy_zamestnanci_query = mysqli_query($connection, $query);
                 
                //DELETE zaznamu z vykazov cakajucich na schvalenie
                // $del_id = $_REQUEST['edit'];
                // $query = "DELETE * from wait_vykazy WHERE wait_vykazy_id = {$del_id}"; 
                // $delete_query = mysqli_query($connection, $query);   
                
                $wait_vykazy_id = $_REQUEST['edit'];
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
                }


                 if(!$create_schvalene_vykazy_zamestnanci_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
                    {
                            die('QUERY WAIT_ZAMESTNANCI FAILED' . mysqli_error($connection));
                    }
                    else{
                        //INSERT prebehol OK
                        header("Location: vykazy.php"); 
                    }  


                }//end FOR


            }

        return true;
    }

?>

