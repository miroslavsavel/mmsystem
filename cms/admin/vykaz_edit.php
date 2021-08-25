<?php include "includes/admin_header.php" ?>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <?php include "includes/admin_navigation.php" //sidebar menu - LEFT in the admin section
        ?>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Editácia rozpracovaného pracovného výkazu
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
            </div>

            <!-- zobrazit obsah premennych co poslem z formu -->
            <?php
            if (isset($_POST["submit"])) {
                echo "Yes, button pridat was submitted";
                var_dump($_POST);
            } else {
                //echo "N0, button was not pressed";
            }
            ?>
            <!-- ================================================================================ -->
            <!-- zavolam funkciu, ktora skontroluje ci bol stlaceni potvrdzovaci button -->
            <!-- funkcia sa nachadza vo functions_vykazy.php -->
            <!-- ak ANO, tak ulozim permanentny vykaz, zaroven aj do financneho dennika zamestnanca -->
            <?php insert_permanent_vykaz(); ?>
            <!-- ================================================================================ -->


            <!-- Dynamicke pridavanie zamestnancov -->
            <!-- <script src="./js/dynamicky_zamestnanci.js"></script> -->
            <!-- tu ma funkciu ktoru pri edit vykazu vymazavam zamestnancov na vykaze -->
            <!--  <script src="./js/zamestnanci_edit.js"></script> -->
            <?php
            //lecture 104
            if (isset($_GET['edit'])) {
                $GetWait_vykazy_id = intval($_GET['edit']);
                $query = "SELECT * FROM wait_vykazy WHERE wait_vykazy_id = $GetWait_vykazy_id";
                $select_hlavicka_wait_vykaz = mysqli_query($connection, $query);
                while ($row = mysqli_fetch_assoc($select_hlavicka_wait_vykaz)) {
                    $wait_vykaz_id =  $row['wait_vykazy_id'];   //cat_id is the name of column in DB
                    $nazov_akcie =  $row['nazov_akcie'];
                    $akcia_dat = $row['akcia_dat'];
                    //musim konvertovat do DD.MM.YYYY
                    $akcia_dt = \DateTime::createFromFormat('Y-m-d', $akcia_dat);
                    if($akcia_dt != false)
                    {
                        $akcia_dat = $akcia_dt->format('d.m.Y');
                    }
                    else{
                        $akcia_dt = NULL;
                    }

                    $firmy_id = $row['firmy_id'];
                    $ine_naklady = $row['ine_naklady'];
            ?>
                    <form action="" method="post">
                        <!-- Nazov akcie -->
                        <div class="form-group">
                            <label for="form_vykaz_akcia">Nazov akcie</label>
                            <input value="<?php
                                            if (isset($nazov_akcie)) {
                                                echo $nazov_akcie;
                                            } ?>" type="text" class="form-inline" id="form_vykaz_akcia" placeholder="Zadaj nazov akcie" name="form_vykaz_akcia">
                        <!-- </div> -->
                        <!-- Datum akcie -->
                        <!-- <div class="form-group"> -->
                            <label class="control-label " for="form_vykaz_dat_akcia"> Dátum akcie </label>
                            <input value="<?php
                                            if (isset($akcia_dat)) {
                                                echo $akcia_dat;
                                            } ?>" class="form-inline" id="form_vykaz_dat_akcia" name="form_vykaz_dat_akcia" placeholder="DD.MM.YYYY" type="text" />
                        <!-- </div> -->
                        <!-- Vyber firmu -->
                        <!-- <div class="form-group"> -->
                            <!-- <div class="input-group"> -->
                                <label class="control-label " for="form_vykaz_firma"> Firma </label>
                                <select class="form-inline" id="form_vykaz_firma" name="form_vykaz_firma">
                                    <?php
                                    if (isset($firmy_id)) {
                                        vyber_firmu_edit($firmy_id);
                                    }
                                    ?>
                                </select>
                            <!-- </div> -->
                        <!-- </div> -->
                        <!-- Ine naklady -->
                        <!-- <div class="form-group"> -->
                            <label class="control-label " for="form_vykaz_ine_naklady"> Iné náklady v eurách </label>
                            <input value="<?php
                                            if (isset($ine_naklady)) {
                                                echo $ine_naklady;
                                            } ?>" type="number" class="form-inline" id="form_vykaz_ine_naklady" name="form_vykaz_ine_naklady" min="0" value="0" step="0.01" placeholder="form_vykaz_ine_naklady">
                            <!-- <input class="form-control" type="time" value="13:45:00" id="example-time-input"> -->
                        <!-- </div> -->
                <?php  }
            }
                ?>
                <!--Zamestnanci na vykaze ---------------------------------------------------------------------- -->
                <?php
                //lecture 104
                if (isset($_GET['edit'])) {
                    $GetWait_vykazy_id = intval($_GET['edit']);
                    $query = "SELECT * FROM wait_zamestnanci WHERE wait_vykazy_id = $GetWait_vykazy_id";
                    $select_hlavicka_wait_zamestnanci = mysqli_query($connection, $query);
                    $count = 1;
                    while ($row = mysqli_fetch_assoc($select_hlavicka_wait_zamestnanci)) {
                        $meno =  $row['meno'];
                        $priezvisko =  $row['priezvisko'];
                        $fixna_odmena =  intval($row['fixna_odmena']);
                        $fakturovana_suma =  intval($row['fakturovana_suma']);
                        //konvertujem cas do spravneho formatu, aby sme mali ludsky vystup
                        //je potrebne osetrit pripad ze nie je zadany, ak vrati NULL tak to vypisem
                        $cas_od =  $row['cas_od'];
                        if($cas_od == '0000-00-00 00:00:00')
                        {
                            //$cas_od = 'Čas bol zadaný v nesprrávnom formáte';
                            $cas_od ='dd.mm.YYYY HH:ii:ss';
                            $bad_cas_od = true;
                        }else{
                            $dt_od = \DateTime::createFromFormat('Y-m-d H:i:s', $cas_od);
                            $cas_od = $dt_od->format('d.m.Y H:i:s');
                        }
                        
                        //konvertujem cas do spravneho formatu, aby sme mali ludsky vystup
                        $cas_do =  $row['cas_do'];
                        if($cas_do == '0000-00-00 00:00:00')
                        {
                            //$cas_do = 'Čas bol zadaný v nesprrávnom formáte';
                            $cas_do ='dd.mm.YYYY HH:ii:ss';
                            $bad_cas_od = true;
                        }else{
                            $dt_do = \DateTime::createFromFormat('Y-m-d H:i:s', $cas_do);
                            $cas_do = $dt_do->format('d.m.Y H:i:s');
                        }
                        
                        $pocet_hodin =  $row['pocet_hodin'];
                        //casy hodiny-----------------------------------------------------
                        $hod_noc =  $row['hod_noc'];
                        $hod_sobota =  $row['hod_sobota'];
                        $hod_nedela =  $row['hod_nedela'];
                        $hod_sviatok =  $row['hod_sviatok'];
                        $hod_sobota_noc =  $row['hod_sobota_noc'];
                        $hod_nedela_noc =  $row['hod_nedela_noc'];
                        $hod_sviatok_noc =  $row['hod_sviatok_noc'];
                        $hod_sobota_sviatok =  $row['hod_sobota_sviatok'];
                        $hod_nedela_sviatok =  $row['hod_nedela_sviatok'];
                        $hod_sobota_sviatok_noc =  $row['hod_sobota_sviatok_noc'];
                        $hod_nedela_sviatok_noc =  $row['hod_nedela_sviatok_noc'];
                ?>
                        <!-- Nazov akcie -->
                        <div class="panel panel-default">
                            <div id="form_zamestnanci" class="removeclass">
                                <div id="zamestnanec" class="removeclass">
                                    <div class="panel-heading">Zamestnanec č.<?php echo $count; ?></div>
                                    <div class="panel-body">
                                        <div id="polia_zamestnanec">
                                        </div>
                                        <div class="form-group">
                                            <!-- Meno -->
                                            <label class="control-label " for="meno"> meno</label>
                                            <input value="<?php
                                                            if (isset($meno)) {
                                                                echo $meno;
                                                            } ?>" type="text" class="form-inline" id="meno" name="meno[]" value="" placeholder="meno">
                                            <!-- Priezvisko -->
                                            <label class="control-label " for="priezvisko"> priezvisko</label>
                                            <input value="<?php
                                                            if (isset($priezvisko)) {
                                                                echo $priezvisko;
                                                            } ?>" type="text" class="form-inline" id="priezvisko" name="priezvisko[]" value="" placeholder="priezvisko">
                                            <!-- Dopis ID zamestnanca -->
                                            <label class="control-label " for="id_zamestnanca" style="color:#FF0000"> dopíš ID zamestnanca: </label>
                                            <input type="text" id="id_zamestnanca" name="id_zamestnanca[]" value="" placeholder="id_zamestnanca">
                                        </div>
                                        <div class="form-group">
                                            <!--  Fixna odmena -->
                                            <label class="control-label " for="fixna_odmena"> zapíš v eurách ak sa jedná o fix </label>
                                            <input value="<?php
                                                            if (isset($fixna_odmena)) {
                                                                echo $fixna_odmena;
                                                            } ?>" type="number" class="form-inline" id="fixna_odmena" name="fixna_odmena[]" min="0" value="0" step="0.01" placeholder="fixna_odmena">
                                            <!--  Fakturovana suma -->
                                            <label class="control-label " for="fakturovana_suma"> fakturovaná suma ak sa jedná o fix </label>
                                            <input value="<?php
                                                            if (isset($fakturovana_suma)) {
                                                                echo $fakturovana_suma;
                                                            } ?>" type="number" class="form-inline" id="fakturovana_suma" name="fakturovana_suma[]" min="0" value="0" step="0.01" placeholder="fakturovana_suma">
                                            <p>
                                                <!--  cas od -->
                                                <label class="control-label " for="cas_od"> čas od: </label>
                                                <input value="<?php
                                                            if (isset($cas_od)) {
                                                                echo $cas_od;
                                                            } ?>" type="text" id="cas_od" name="cas_od[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">
                                                <!--  cas do -->
                                                <label class="control-label " for="cas_od"> čas do: </label>
                                                <input value="<?php
                                                            if (isset($cas_do)) {
                                                                echo $cas_do;
                                                            } ?>" type="text" id="cas_do" name="cas_do[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">
                                                <!--  pocet hodin -->
                                                <label class="control-label " for="pocet_hodin"> celkový počet hodín: </label>
                                                <input value="<?php
                                                            if (isset($pocet_hodin)) {
                                                                echo $pocet_hodin;
                                                            } ?>" type="number" id="pocet_hodin" name="pocet_hodin[]" min="0" value="0" step="0.01" placeholder="pocet_hodin" style="width: 4em">
                                            </p>
                                            <p>
                                                <!--  noc -->
                                                <label class="control-label " for="hod_noc"> noc:</label>
                                                <input value="<?php
                                                            if (isset($hod_noc)) {
                                                                echo $hod_noc;
                                                            } ?>" type="number" id="hod_noc" name="hod_noc[]" min="0" value="0" step="0.01" placeholder="hod_noc" style="width: 4em">
                                                <!--  sobota -->
                                                <label class="control-label " for="hod_noc"> sobota:</label>
                                                <input value="<?php
                                                            if (isset($hod_sobota)) {
                                                                echo $hod_sobota;
                                                            } ?>" type="number" id="hod_sobota" name="hod_sobota[]" min="0" value="0" step="0.01" placeholder="hod_sobota" style="width: 4em">
                                                <!--  nedela -->
                                                <label class="control-label " for="hod_nedela"> nedela:</label>
                                                <input value="<?php
                                                            if (isset($hod_nedela)) {
                                                                echo $hod_nedela;
                                                            } ?>" type="number" id="hod_nedela" name="hod_nedela[]" min="0" value="0" step="0.01" placeholder="hod_nedela" style="width: 4em">
                                                <!--  sviatok -->
                                                <label class="control-label " for="hod_sviatok"> sviatok:</label>
                                                <input value="<?php
                                                            if (isset($hod_sviatok)) {
                                                                echo $hod_sviatok;
                                                            } ?>" type="number" id="hod_sviatok" name="hod_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sviatok" style="width: 4em">
                                                <!--  sobota_noc -->
                                                <label class="control-label " for="hod_sobota_noc"> sobota noc:</label>
                                                <input value="<?php
                                                            if (isset($hod_sobota_noc)) {
                                                                echo $hod_sobota_noc;
                                                            } ?>" type="number" id="hod_sobota_noc" name="hod_sobota_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_noc" style="width: 4em">
                                                <!--  nedela_noc -->
                                                <label class="control-label " for="hod_nedela_noc"> nedela noc:</label>
                                                <input value="<?php
                                                            if (isset($hod_nedela_noc)) {
                                                                echo $hod_nedela_noc;
                                                            } ?>" type="number" id="hod_nedela_noc" name="hod_nedela_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_noc" style="width: 4em">
                                                <!--  sviatok_noc -->
                                                <label class="control-label " for="hod_sviatok_noc"> sviatok noc:</label>
                                                <input value="<?php
                                                            if (isset($hod_sviatok_noc)) {
                                                                echo $hod_sviatok_noc;
                                                            } ?>" type="number" id="hod_sviatok_noc" name="hod_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sviatok_noc" style="width: 4em">
                                                <!--  sobota_sviatok -->
                                                <label class="control-label " for="hod_sobota_sviatok"> sobota sviatok:</label>
                                                <input value="<?php
                                                            if (isset($hod_sobota_sviatok)) {
                                                                echo $hod_sobota_sviatok;
                                                            } ?>" type="number" id="hod_sobota_sviatok" name="hod_sobota_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok" style="width: 4em">
                                                <!--  nedela_sviatok -->
                                                <label class="control-label " for="hod_nedela_sviatok"> nedela sviatok:</label>
                                                <input value="<?php
                                                            if (isset($hod_nedela_sviatok)) {
                                                                echo $hod_nedela_sviatok;
                                                            } ?>" type="number" id="hod_nedela_sviatok" name="hod_nedela_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok" style="width: 4em">
                                                <!--  sobota_sviatok_noc -->
                                                <label class="control-label " for="hod_sobota_sviatok_noc"> sobota sviatok noc:</label>
                                                <input value="<?php
                                                            if (isset($hod_sobota_sviatok_noc)) {
                                                                echo $hod_sobota_sviatok_noc;
                                                            } ?>" type="number" id="hod_sobota_sviatok_noc" name="hod_sobota_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok_noc" style="width: 4em">
                                                <!--  nedela_sviatok_noc -->
                                                <label class="control-label " for="hod_nedela_sviatok_noc"> nedela sviatok noc:</label>
                                                <input value="<?php
                                                            if (isset($hod_nedela_sviatok_noc)) {
                                                                echo $hod_nedela_sviatok_noc;
                                                            } ?>" type="number" id="hod_nedela_sviatok_noc" name="hod_nedela_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok_noc" style="width: 4em">
                                            </p>


                                            <!-- <small>Odstrániť <span class="glyphicon glyphicon-minus gs"></span></small>  -->
                                        </div>
                                        <!--  <div class="panel-footer"><small>Odstrániť <span class="glyphicon glyphicon-minus gs"></span></small>
                                    </div> -->
                                        <!-- Odstranenie zamestnanca -->
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <button class="btn btn-danger" type="button" onclick="remove_Element('zamestnanec');">
                                            </div>
                                        </div>
                                        </button>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                        <?php
                        $count = $count + 1;
                    }
                }
                        ?>
                        <!-- Btn pridat noveho zamestnanca -->
                        <div class="panel-footer"><small>Pridať nového zamestnanca <span class="glyphicon glyphicon-plus gs"></span></small>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success" type="button" onclick="pridaj_zamestnanca();"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> </button>
                        </div>
                        <!-- button pre potvrdenie vykazu -->
                        <div class="form-group">
                            <input class="btn btn-primary" type="submit" name="vykaz_ok" value="Schváliť výkaz">
                        </div>
                    </form>
        </div>
        <!-- ---------------------------------------------------------------------- -->
        <?php
        //toto treba prerobit aby to mazalo z temp_vykazov
        //if we find in the address in web browser parameter delete
        if (isset($_POST['update_category'])) {
            $get_cat_title = $_POST['cat_title'];
            $query = "UPDATE categories SET cat_title = '{$get_cat_title}' WHERE cat_id = {$cat_id}";
            $update_query = mysqli_query($connection, $query);
            if (!$update_query) {
                die('QUERY FAILED' . mysqli_error($connection));
            }
            //this will refresh page
            header("Location: categories.php");
        }
        ?>
        <!-- /.container-fluid -->
    </div>
    <?php include "includes/admin_footer.php" ?>