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
                            Výkazy, ktoré boli schválené manažérom.
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <table class="table table-bordered table-hover">
                <!-- zobrazi tabulku vsetkych vykazov -->
                <?php findAllSchvaleneVykazy(); ?>
                <!-- pri kliknuti na delete perma vykazu je zaznam odobrany -->

                <!-- editacia permanentneho vykazu -->
                
            </table>
            <!-- /.container-fluid -->
        </div>
        <?php include "includes/admin_footer.php" ?>