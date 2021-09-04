<?php include "includes/admin_header.php" ?>
<body>
    <div id="wrapper">
        <?php 
            //checking db connection
            if($connection)
                echo "Connection working";
        ?>
        <!-- Navigation -->
        <?php include "includes/admin_navigation.php" //sidebar menu - LEFT in the admin section?> 
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Vítajte v administrátorskej sekcii
                        </h1>
                        <h2 class="lead">
                        <small>Novinky a zmeny:</small>
                        </h2>
                        <p class="lead">
                            <!-- dorobit aby to tahalo z db -->
                            24.8.2021 - pridaná funkcionalita schválenia pracovného výkazu
                        </p>
                        <p class="lead">
                            <!-- dorobit aby to tahalo z db -->
                            25.8.2021 - pridaná funkcionalita finančného denníku pri rozkliknutí prezerať zamestnancov
                        </p>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
    <?php include "includes/admin_footer.php" ?>
