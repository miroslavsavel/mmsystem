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
                            <!-- <small>Author</small> -->
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
    <?php include "includes/admin_footer.php" ?>
