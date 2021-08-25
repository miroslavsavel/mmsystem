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
        <?php insert_firma(); ?> 
        <form action="" method="post">
            <!-- Formular pre pridanie novej firmy -->
            <div class="form-group">
                <label for="form_firma_nazov">Názov firmy</label>
                <input type="text" class="form-control" id="form_firma_nazov" placeholder="Zadaj názov firmy" name="form_firma_nazov">
            </div>
            <div class="form-group">
                <label for="form_firma_ico">ICO</label>
                <input type="text" class="form-control" id="form_firma_ico" placeholder="Zadaj ICO" name="form_firma_ico">
            </div>
            <div class="form-group">
                <label for="form_firma_dic">DIC</label>
                <input type="text" class="form-control" id="form_firma_dic" placeholder="Zadaj DIC" name="form_firma_dic">
            </div>
            <!-- koeficienty -->
            <div class="form-group">
                <label for="form_firma_bezna_taxa">Bežná taxa pre firmu</label>
                <input type="number" class="form-control" id="form_firma_bezna_taxa" placeholder="Zadaj bežnú taxú, ktorá sa účtuje firme za hodinu" name="form_firma_bezna_taxa">
            </div>
            <div class="form-group">
                <label for="form_firma_prip_noc">Príplatok noc (22:00 - 6:00)</label>
                <input type="number" class="form-control" id="form_firma_prip_noc" placeholder="Príplatok za nočnú prácu - pripočítava sa ku každej hodine" name="form_firma_prip_noc">
            </div>
            <div class="form-group">
                <label for="form_firma_prip_sobota">Príplatok sobota</label>
                <input type="number" class="form-control" id="form_firma_prip_sobota" placeholder="Príplatok za prácu v sobotu - pripočítava sa ku každej hodine" name="form_firma_prip_sobota">
            </div>
            <div class="form-group">
                <label for="form_firma_prip_nedela">Príplatok nedela</label>
                <input type="number" class="form-control" id="form_firma_prip_nedela" placeholder="Príplatok za prácu v nedelu - pripočítava sa ku každej hodine" name="form_firma_prip_nedela">
            </div>
            <div class="form-group">
                <label for="form_firma_prip_sviatok">Príplatok sviatok</label>
                <input type="number" class="form-control" id="form_firma_prip_sviatok" placeholder="Príplatok za prácu v štátny sviatok - pripočítava sa ku každej hodine" name="form_firma_prip_sviatok">
            </div>

            <!-- button pre potvrdenie -->
            <div class="form-group">
                <input class="btn btn-primary" type="submit" name="submit" value="Pridať firmu">
            </div>
        </form>         
    </div>
    <?php include "includes/admin_footer.php" ?>
