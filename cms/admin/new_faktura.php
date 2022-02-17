<?php include "includes/admin_header.php" ?>
<body>
<?php include "includes/small_navigation.php" ?>      
    <div id="page-wrapper"> 
        <!-- functions faktury -->
        <?php InsertFaktura(); ?>
        <form action="new_faktura.php" method="post">
            <h1 class="page-header">
                Vytvorenie novej faktúry.
            </h1>
            <!-- Vrchna tabulka kde su uvedene vo fakture priplatky danej firmy -->
            <table class="table table-bordered table-hover">
            <h2 class="page-header">
                Hodinová taxa a príplatky pre firmu: <?php LoadFakturaNazovFirmy(); ?>
            </h2>
            <p class="fs-6">
                <?php LoadFakturaSumarKoefFirmy(); ?>
            </p>
            <!-- Hlavna tabulka zamestnanci a kolko hodin odrobili -->
                <!-- echo var_dump($_REQUEST);
                sem nacitaj vsetky udaje z FIN_DEN_FIRMY pre ID ktore su v $_REQUEST poslane
                ak je TransakcieList[] prazdny zahlas chybu ze neboli vybrane ziadne transakcie -->
            <h2 class="page-header">
                Prehľad za jednotlivých pracovníkov
            </h2>
            <table class="table table-bordered table-hover">
                    <?php LoadNewFaktura(); ?> 
            </table>
                    
            <!-- Tabulka celkovy sucet -->
            <h2 class="page-header">
                Celkový sumár
            </h2>
            <table class="table table-bordered table-hover">
                <?php LoadFakturaCelkovySucet() ?>
            </table>
            <p class="font-weight-bold">
                <strong><?php LoadVyslednaSuma(); ?></strong>
            </p>
            <div class="form-group">
                    <input class="btn btn-primary" type="submit" name="schval_fakturu" value="Potvrdiť faktúru">
            </div>
        </form> 
    </div>
    <?php include "includes/admin_footer.php" ?>
