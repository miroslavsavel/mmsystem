<?php include "includes/admin_header.php" ?>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <ul class="nav navbar-right top-nav">
        <!-- Button fro closing form -->
        <input type="button" class="btn btn-danger"
                       style="font-weight: bold;display: inline;"
                       value="Close"
                       onclick="closeMe()">
    </ul>  
</nav>       
    <div id="page-wrapper"> 
        <h1 class="page-header">
            Zoznam všetkých zamestnancov.
        </h1>
        <table class="table table-bordered table-hover">
            <!-- zobrazi tabulku vsetkych zamestnancov -->
            <?php findAllZamestnanci(); ?> 
            <!-- pri kliknuti na delete zamestnanca je zaznam odobrany -->
            <?php deleteZamestnanci();   ?>
        </table>      
    </div>
    <?php include "includes/admin_footer.php" ?>
