<?php include "includes/admin_header.php" ?>
<body>
<?php include "includes/small_navigation.php" ?>      
    <div id="page-wrapper"> 
        <h1 class="page-header">
            Vytvorenie novej faktúry.
        </h1>
        <?php 
            echo var_dump($_REQUEST);
            // sem nacitaj vsetky udaje z FIN_DEN_FIRMY pre ID ktore su v $_REQUEST poslane
        ?>      
    </div>
    <?php include "includes/admin_footer.php" ?>
