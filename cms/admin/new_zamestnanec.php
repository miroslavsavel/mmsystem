<?php include "includes/admin_header.php" ?>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <ul class="nav navbar-right top-nav">
        <!-- Button fro closing form -->
        <input type="button" class="btn btn-success"
                       style="font-weight: bold;display: inline;"
                       value="Close"
                       onclick="closeMe()">
    </ul>  
</nav>       
    <div id="page-wrapper"> 
        <h1 class="page-header">
            Pridanie nového zamestnanca.
        </h1>
        <?php insert_zamestnanec(); ?> 
        <form action="" method="post">
            <!-- Formular pre pridanie noveho zamestnanca do tabulky zamestnanci -->
            <div class="form-group">
                <label for="form_zam_meno">Meno</label>
                <input type="text" class="form-control" id="form_zam_meno" placeholder="Zadaj meno" name="form_zam_meno">
            </div>
            <div class="form-group">
                <label for="form_zam_priezvisko">Priezvisko</label>
                <input type="text" class="form-control" id="form_zam_priezvisko" placeholder="Zadaj priezvisko" name="form_zam_priezvisko">
            </div>
            <div class="form-group">
                <label for="form_zam_id">Identifikačné číslo zamestnanca</label>
                <input type="number" class="form-control" id="form_zam_id" placeholder="ID" name="form_zam_id">
            </div>
            <div class="form-group">
                <label for="form_zam_dat_narodenia">Dátum narodenia</label>
                <input type="text" class="form-control" id="form_zam_dat_narodenia" placeholder="DD.MM.YYYY" name="form_zam_dat_narodenia">
            </div>
            <!-- kontakt -->
            <div class="form-group">
                <label for="form_zam_tel">Tel. číslo</label>
                <input type="text" class="form-control" id="form_zam_tel" placeholder="+421911333444" name="form_zam_tel">
            </div>
            <div class="form-group">
                <label for="form_zam_email">Email</label>
                <input type="text" class="form-control" id="form_zam_email" placeholder="mail@mail.sk" name="form_zam_email">
            </div>
            <!-- Bydlisko -->
            <div class="form-group">
                <label for="form_zam_tr_pobyt">Adresa trvalého pobytu</label>
                <input type="text" class="form-control" id="form_zam_tr_pobyt" placeholder="Zadaj adresu trvalého pobytu" name="form_zam_tr_pobyt">
            </div>
            <div class="form-group">
                <label for="form_zam_pr_pobyt">Adresa prechodného pobytu</label>
                <input type="text" class="form-control" id="form_zam_pr_pobyt" placeholder="Zadaj adresu prechodného pobytu" name="form_zam_pr_pobyt">
            </div>
            <!-- koeficienty -->
            <div class="form-group">
                <label for="form_zam_koef_plat">Koeficient platu</label>
                <input type="number" class="form-control" id="form_zam_koef_plat" min="0" value="0" step="0.01" placeholder="Koeficient ktorým sa násobia odpracované hodiny" name="form_zam_koef_plat">
            </div>
            <div class="form-group">
                <label for="form_zam_prip_noc">Príplatok noc (22:00 - 6:00)</label>
                <input type="number" class="form-control" id="form_zam_prip_noc" min="0" value="0" step="0.01" placeholder="Príplatok za nočnú prácu - pripočítava sa ku každej hodine" name="form_zam_prip_noc">
            </div>
            <div class="form-group">
                <label for="form_zam_prip_sobota">Príplatok sobota</label>
                <input type="number" class="form-control" id="form_zam_prip_sobota" min="0" value="0" step="0.01" placeholder="Príplatok za prácu v sobotu - pripočítava sa ku každej hodine" name="form_zam_prip_sobota">
            </div>
            <div class="form-group">
                <label for="form_zam_prip_nedela">Príplatok nedela</label>
                <input type="number" class="form-control" id="form_zam_prip_nedela" min="0" value="0" step="0.01" placeholder="Príplatok za prácu v nedelu - pripočítava sa ku každej hodine" name="form_zam_prip_nedela">
            </div>
            <div class="form-group">
                <label for="form_zam_prip_sviatok">Príplatok sviatok</label>
                <input type="number" class="form-control" id="form_zam_prip_sviatok" min="0" value="0" step="0.01" placeholder="Príplatok za prácu v štátny sviatok - pripočítava sa ku každej hodine" name="form_zam_prip_sviatok">
            </div>
            <div class="form-group">
                <label for="form_zam_koef_km">Koeficient za najazdené km</label>
                <input type="number" class="form-control" id="form_zam_koef_km" min="0" value="0" step="0.01" placeholder="Koeficient, ktorým sa násobia najazdené km" name="form_zam_koef_km">
            </div>
            <div class="form-group">
                <label for="form_zam_rodc">Rodné číslo (bez lomítka)</label>
                <input type="text" class="form-control" id="form_zam_rodc" placeholder="Zadaj rodné číslo bez lomítka" name="form_zam_rodc">
            </div>
            <div class="form-group">
                <label for="form_zam_op">Číslo občianskeho preukazu</label>
                <input type="text" class="form-control" id="form_zam_op" placeholder="Zadaj číslo občianskeho preukazu" name="form_zam_op">
            </div>
            <!-- button pre potvrdenie -->
            <div class="form-group">
                <input class="btn btn-primary" type="submit" name="submit" value="Pridať zamestnanca">
            </div>
        </form>         
    </div>
    <?php include "includes/admin_footer.php" ?>
