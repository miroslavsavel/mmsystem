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
                            Zoznam vytvorených faktúr pre firmy
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <table class="table table-bordered table-hover">
                <!-- zobrazi tabulku vsetkych vytvorenych faktur -->
                <!-- functions_vytvorene_faktury.php -->
                <?php findAllVytvoreneFaktury(); ?>
                <!-- pri kliknuti na delete vykazu je zaznam odobrany -->
                <?php //deleteWaitVykaz(); ?>
                <?php //detailWaitVykaz(); ?>
                <?php //editWaitVykaz(); ?>
            </table>
            <!-- /.container-fluid -->
        </div>
        <?php include "includes/admin_footer.php" ?>