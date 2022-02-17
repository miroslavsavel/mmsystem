<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php">MMsystem 1.0</a> <!-- Nazov nad menu -->
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li>
                    <a href="index.php">Home</a>
                </li>          
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Prihlásený ako: <?=$_SESSION['name']?> <b class="caret"></b></a> -->
                    <!-- <p>Welcome back, <?=$_SESSION['name']?>!</p> -->
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="http://127.0.0.1/MMsystem/phplogin/logout.php"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <!-- Výkazy z akcií -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#vykazy_dropdown"><i class="fa fa-fw fa-arrows-v"></i> Pracovné výkazy z akcií <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="vykazy_dropdown" class="collapse">
                            <li>
                                <a href="vykazy.php">Výkazy na schválenie</a>
                            </li>
                            <li>
                                <a href="schvalene_vykazy.php">Schválené výkazy</a>
                            </li>
                            <li>
                                <a href="pridaj_vykaz.php">Pridať výkaz</a>
                            </li>
                        </ul>
                    </li>
                    <!-- Zamestnanci -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#zamestnanci_dropdown"><i class="fa fa-user"></i> Zamestnanci <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="zamestnanci_dropdown" class="collapse">
                            <li>
                                <!-- <a href="zamestnanci.php">Prezerať zamestnancov</a> -->
                                <a target="_blank" href="show_zamestnanci.php" id="myLink1">Prezerať zamestnancov</a>
                                <script>
                                    var strWindowFeatures = "location=yes,height=1200,width=1200,scrollbars=yes,status=yes";
                                    document.getElementById("myLink1").onclick = function(){
                                        //var winPop = window.open(this.href);
                                        var win = window.open(this.href, "_blank", strWindowFeatures);
                                        return false;
                                    }
                                </script>
                            </li>
                            <li>
                                <!-- <a href="new_zamestnanec.php">Pridať nového zamestnanca</a> -->
                                <!-- echo 'window.open("page2.php", $other_Attributes_here )'; -->
                                <!-- <a onclick="window.open(document.URL, '_blank', 'location=yes,height=800,width=800,scrollbars=yes,status=yes');">
                                    Pridať nového zamestnanca
                                </a> -->
                                
                                <!-- https://stackoverflow.com/questions/14132122/open-url-in-new-window-with-javascript -->
                                <!-- https://stackoverflow.com/questions/11000967/best-practice-for-js-window-open-in-href-or-in-onclick -->
                                <a target="_blank" href="new_zamestnanec.php" id="myLink2">Pridať nového zamestnanca</a>
                                <script>
                                    var strWindowFeatures = "location=yes,height=1200,width=1200,scrollbars=yes,status=yes";
                                    document.getElementById("myLink2").onclick = function(){
                                        //var winPop = window.open(this.href);
                                        var win = window.open(this.href, "_blank", strWindowFeatures);
                                        return false;
                                    }
                                </script>
                                
                            </li>
                        </ul>
                    </li>
                    <!-- Firmy -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#firmy_dropdown"><i class="fa fa-cubes"></i> Firmy <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="firmy_dropdown" class="collapse">
                            <li>
                                <a target="_blank" href="show_firmy.php" id="myLink3">Prezerať firmy</a>
                                <script>
                                    var strWindowFeatures = "location=yes,height=0,width=0,scrollbars=yes,status=yes";
                                    document.getElementById("myLink3").onclick = function(){
                                        //var winPop = window.open(this.href);
                                        var win = window.open(this.href, "_blank", strWindowFeatures);
                                        return false;
                                    }
                                </script>
                            </li>
                            <li>
                                <a target="_blank" href="new_firma.php" id="myLink4">Pridať novú firmu</a>
                                <script>
                                    var strWindowFeatures = "location=yes,height=1200,width=1200,scrollbars=yes,status=yes";
                                    document.getElementById("myLink4").onclick = function(){
                                        //var winPop = window.open(this.href);
                                        var win = window.open(this.href, "_blank", strWindowFeatures);
                                        return false;
                                    }
                                </script>
                                
                            </li>
                        </ul>
                    </li>
                    <!-- Faktúry -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#faktury_dropdown"><i class="fa fa-folder"></i> Faktúry <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="faktury_dropdown" class="collapse">
                            <li>
                                <a href="faktury.php">Prezerať faktúry</a>
                            </li>
                            <li>
                                <a href="vykazy.php">Vytvoriť novú faktúru</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>