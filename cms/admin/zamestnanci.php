<?php include "includes/admin_header.php" ?>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <ul class="nav navbar-right top-nav">
        <!-- Button fro closing form -->
        <input type="button" class="btn btn-success"
                       style="font-weight: bold;display: inline;"
                       value="Close"
                       onclick="closeMe()">
        <!-- back butn -->
        <input type="button" class="btn btn-success"
        style="font-weight: bold;display: inline;"
        value="Back"
        onclick="window.history.go(-1)">
    </ul>  
</nav>       
    <div id="page-wrapper"> 
        <h1 class="page-header">
            Zamestnanci.
        </h1> 
                  
    </div>
    <?php include "includes/admin_footer.php" ?>
