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
            Finančný denník zamestnanca
        </h1>
        <table class="table table-bordered table-hover">
            <!-- zobrazi financny dennik zamestnanca -->
            <!-- functions_fin_den.php -->
            <?php LoadFinDen(); ?> 
        </table>      
    </div>
    <?php include "includes/admin_footer.php" ?>