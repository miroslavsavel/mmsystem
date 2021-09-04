<?php include "includes/admin_header.php" ?>
<body>
<?php include "includes/small_navigation.php" ?>      
    <div id="page-wrapper"> 
        <h1 class="page-header">
            Finančný denník firmy: <?php LoadNazovFirmy() ?>
        </h1>
        <div id="formular">
            <form action="new_faktura.php" method="post">
                <table class="table table-bordered table-hover">
                    <!-- zobrazi financny dennik firmy -->
                    <!-- functions_fin_den.php -->
                    <?php LoadFinDenFirmy(); ?> 
                </table>
                <table class="table table-bordered table-hover">
                    <!-- zobrazi suhrn pre zamestnanaca -->
                    <!-- functions_fin_den.php -->
                    <?php LoadSumFirmy(); ?> 
                </table>
                <!-- <button type="button" class="btn btn-primary">Pridať záznamy na faktúru</button> -->
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" name="submit" value="Pridať záznamy na faktúru">
                </div>
            </form>    
    </div>
    <?php include "includes/admin_footer.php" ?>