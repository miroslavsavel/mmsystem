<?php
    
    //funkcia pre pridanie insert noveho zamestnanca do tabulky zamestnancov
    function insert_firma()
    {
        global $connection;
        if(isset($_POST['submit']))
        {
            $form_firma_nazov = $_POST['form_firma_nazov'];
            $form_firma_ico = $_POST['form_firma_ico'];
            $form_firma_dic = $_POST['form_firma_dic'];
            $form_firma_bezna_taxa = $_POST['form_firma_bezna_taxa'];
            $form_firma_prip_noc = $_POST['form_firma_prip_noc'];
            $form_firma_prip_sobota = $_POST['form_firma_prip_sobota'];
            $form_firma_prip_nedela = $_POST['form_firma_prip_nedela'];
            $form_firma_prip_sviatok = $_POST['form_firma_prip_sviatok'];



            $query = "INSERT INTO firmy( firmy_id,
                                                nazov_firmy,
                                                ico,
                                                dic,
                                                bezna_taxa,
                                                priplatok_noc,
                                                priplatok_sobota,
                                                priplatok_nedela,
                                                priplatok_sviatok
                                                )";
            $query .= "VALUE( NULL,
                            '{$form_firma_nazov}',
                            '{$form_firma_ico}',
                            '{$form_firma_dic}',
                            '{$form_firma_bezna_taxa}',
                            '{$form_firma_prip_noc}',
                            '{$form_firma_prip_sobota}',
                            '{$form_firma_prip_nedela}',
                            '{$form_firma_prip_sviatok}'
                                            )";
            $create_firma_query = mysqli_query($connection, $query);

            if(!$create_firma_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
            {
                    die('QUERY FAILED' . mysqli_error($connection));
            }
            else{
                //tuto musim nejako redirect
                header("Location: show_firmy.php");
            }
        }
    }


    function findAllFirmy()
    {
        global $connection;

        $query = "SELECT * FROM firmy";
        $select_firmy = mysqli_query($connection, $query);

        
        echo "<tr>";
            echo "<th> Názov firmy </th>";        //double bracket is because of double quotes, single quotes wont work
            echo "<th> ICO </th>";
            echo "<th> DIC </th>";
        echo "</tr>";
        //lecture 100
        while($row = mysqli_fetch_assoc($select_firmy))
        {
            
            $nazov_firmy = $row['nazov_firmy'];
            $ico = $row['ico'];
            $dic = $row['dic'];

            echo "<tr>";
            echo "<td> {$nazov_firmy} </td>";        //double bracket is because of double quotes, single quotes wont work
            echo "<td> {$ico} </td>";
            echo "<td> {$dic} </td>";

            //lecture 103 deleting categories
            //!!! passing parameter to browser after click
            //tuto bude treba uviest iba novu funkciu ktora sa zavola a deletne zaznam s danym ID

            echo "<td><a href='show_firmy.php?detail={$ico}'>Detail</a></td>";
            echo "<td><a href='show_firmy.php?edit={$ico}'>Edit</a></td>";
            echo "<td><a href='show_firmy.php?delete={$ico}'>Delete</a></td>";
            echo "</tr>";
        }
    }

    
    function deleteFirma()
    {
        global $connection;

        //103 deleting categories
        //DELETE QUERY
        //if we find in the address in web browser parameter delete
        if(isset($_GET['delete']))
        {
            $ico = $_GET['delete'];
            $query = "DELETE FROM firmy WHERE ico = {$ico}";
            $delete_query = mysqli_query($connection, $query);
            //this will refresh page
            header("Location: show_firmy.php");
        }
    }


?>