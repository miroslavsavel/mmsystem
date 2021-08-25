<?php include "includes/admin_header.php" ?>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <?php include "includes/admin_navigation.php" //sidebar menu - LEFT in the admin section
        ?>
        <div id="page-wrapper">
            <div class="container-fluid" id="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Pridať nový pracovný výkaz z akcie
                        </h1>
                    </div>
                </div>
                <?php
                /* if (isset($_POST["submit"])) {
                    echo "Yes, button pridat was submitted";
                    var_dump($_POST);
                } else {
                    echo "N0, button was not pressed";
                } */
                ?>
                <?php insert_temp_vykaz(); ?>
                <div id="formular">
                    <form action="" method="post">
                        <!-- Formular pre pridanie noveho vykazu -->
                        <span class="form-group">
                            <label for="form_vykaz_akcia">Nazov akcie: </label>
                            <input type="text" id="form_vykaz_akcia" placeholder="Zadaj nazov akcie" name="form_vykaz_akcia">
                            <!-- Datum akcie -->
                            <label class="control-label " for="form_vykaz_dat_akcia"> Dátum akcie: </label>
                            <input id="form_vykaz_dat_akcia" name="form_vykaz_dat_akcia" placeholder="DD.MM.YYYY" type="text" />
                            <!-- Vyber firmu -->
                            <label class="control-label " for="form_vykaz_firma"> Firma:</label>
                            <select id="form_vykaz_firma" name="form_vykaz_firma">
                                <?php
                                vyber_firmu();
                                ?>
                            </select>
                            <!-- Ine naklady -->
                            <label class="control-label " for="form_vykaz_ine_naklady"> Iné náklady v eurách: </label>
                            <input type="number" id="form_vykaz_ine_naklady" name="form_vykaz_ine_naklady" min="0" value="0" step="0.01" placeholder="form_vykaz_ine_naklady">
                            <!-- <input class="form-control" type="time" value="13:45:00" id="example-time-input"> -->
                        </span>
                        <div class="clear">
                            <br>
                        </div>
                        <!-- ============================================================================================================================== -->
                        <!-- Dynamicke pridavanie zamestnancov =============================================================================================-->
                        <script src="./js/dynamicky_zamestnanci.js"></script>
                        <!-- ============================================================================================================================== -->
                        <div class="panel panel-default" id="vykaz">
                            <!-- <div class="panel-heading">
                                Pridať zamestnancov zúčastnených na pracovnej akcii
                            </div> -->
                            <div class="panel-heading" >
                                Zamestnanec č.1
                            </div>
                            <div class="panel-body" id="polia_zamestnanec" >
                                <span class="form-group">
                                    <p>
                                        <!-- Meno zamestnanca -->
                                        <label class="control-label " for="meno"> meno: </label>
                                        <input type="text" id="meno" name="meno[]" value="" placeholder="Meno">
                                        <!-- Priezvisko zamestnanca -->
                                        <label class="control-label " for="meno"> priezvisko: </label>
                                        <input type="text" id="priezvisko" name="priezvisko[]" value="" placeholder="Priezvisko">
                                    </p>
                                </span>
                                <div class="form-group">
                                    <!--  Fixna odmena -->
                                    <p>
                                        <label class="control-label " for="fixna_odmena"> zapíš v eurách ak sa jedná o fix: </label>
                                        <input type="number" id="fixna_odmena" name="fixna_odmena[]" min="0" value="0" step="0.01" placeholder="fixna_odmena">
                                        <!--  Fakturovaná suma -->
                                        <label class="control-label " for="fakturovana_suma"> fakturovaná suma ak sa jedná o fix: </label>
                                        <input type="number" id="fakturovana_suma" name="fakturovana_suma[]" min="0" value="0" step="0.01" placeholder="fakturovana_suma">
                                    </p>
                                </div>
                                <div class="form-group">
                                    <p>
                                        <!--  cas od -->
                                        <label class="control-label " for="cas_od"> čas od: </label>
                                        <input type="text" id="cas_od" name="cas_od[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">
                                        <!--  cas do -->
                                        <label class="control-label " for="cas_do"> čas do: </label>
                                        <input type="text" id="cas_do" name="cas_do[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">
                                        <!--  pocet hodin -->
                                        <label class="control-label " for="pocet_hodin"> celkový počet hodín: </label>
                                        <input type="number" id="pocet_hodin" name="pocet_hodin[]" min="0" value="0" step="0.01" placeholder="pocet_hodin" style="width: 4em">
                                    </p>
                                    <p>
                                        <!--  noc -->
                                        <label class="control-label " for="hod_noc"> noc:</label>
                                        <input type="number" id="hod_noc" name="hod_noc[]" min="0" value="0" step="0.01" placeholder="hod_noc" style="width: 4em">
                                        <!--  sobota -->
                                        <label class="control-label " for="hod_noc"> sobota:</label>
                                        <input type="number" id="hod_sobota" name="hod_sobota[]" min="0" value="0" step="0.01" placeholder="hod_sobota" style="width: 4em">
                                        <!--  nedela -->
                                        <label class="control-label " for="hod_nedela"> nedela:</label>
                                        <input type="number" id="hod_nedela" name="hod_nedela[]" min="0" value="0" step="0.01" placeholder="hod_nedela" style="width: 4em">
                                        <!--  sviatok -->
                                        <label class="control-label " for="hod_sviatok"> sviatok:</label>
                                        <input type="number" id="hod_sviatok" name="hod_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sviatok" style="width: 4em">
                                        <!--  sobota_noc -->
                                        <label class="control-label " for="hod_sobota_noc"> sobota noc:</label>
                                        <input type="number" id="hod_sobota_noc" name="hod_sobota_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_noc" style="width: 4em">
                                        <!--  nedela_noc -->
                                        <label class="control-label " for="hod_nedela_noc"> nedela noc:</label>
                                        <input type="number" id="hod_nedela_noc" name="hod_nedela_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_noc" style="width: 4em">
                                        <!--  sviatok_noc -->
                                        <label class="control-label " for="hod_sviatok_noc"> sviatok noc:</label>
                                        <input type="number" id="hod_sviatok_noc" name="hod_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sviatok_noc" style="width: 4em">
                                        <!--  sobota_sviatok -->
                                        <label class="control-label " for="hod_sobota_sviatok"> sobota sviatok:</label>
                                        <input type="number" id="hod_sobota_sviatok" name="hod_sobota_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok" style="width: 4em">
                                        <!--  nedela_sviatok -->
                                        <label class="control-label " for="hod_nedela_sviatok"> nedela sviatok:</label>
                                        <input type="number" id="hod_nedela_sviatok" name="hod_nedela_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok" style="width: 4em">
                                        <!--  sobota_sviatok_noc -->
                                        <label class="control-label " for="hod_sobota_sviatok_noc"> sobota sviatok noc:</label>
                                        <input type="number" id="hod_sobota_sviatok_noc" name="hod_sobota_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok_noc" style="width: 4em">
                                        <!--  nedela_sviatok_noc -->
                                        <label class="control-label " for="hod_nedela_sviatok_noc"> nedela sviatok noc:</label>
                                        <input type="number" id="hod_nedela_sviatok_noc" name="hod_nedela_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok_noc" style="width: 4em">
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success" type="button" onclick="polia_zamestnanecX();"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> </button>
                            <button class="btn btn-danger" type="button" onclick="remove_polia_zamestnanec1();"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span> </button>
                        </div>
                        <!-- button pre potvrdenie -->
                        <div class="form-group">
                            <input class="btn btn-primary" type="submit" name="submit" value="Pridať vykaz na schvalenie">
                        </div>
                    </form>
                </div><!-- koniec div formular -->
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <?php include "includes/admin_footer.php" ?>