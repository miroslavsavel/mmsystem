<?php
    function insert_categories()
    {
        global $connection;
        if(isset($_POST['submit']))
        {
            //echo "<h1>It is working</h1>";
            $cat_title = $_POST['cat_title'];
            
            if($cat_title == "" || empty($cat_title))
            {
                echo "This field should not be empty";
            }
            else {
                $query = "INSERT INTO categories (cat_title)";
                $query .= "VALUE('{$cat_title}')";
                $create_category_query = mysqli_query($connection, $query);

                if(!$create_category_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
                {
                    die('QUERY FAILED' . mysqli_error($connection));
                }
            }
        }
    }

    function findAllCategories()
    {
        global $connection;

        //lecture 100
        //find all categories query
        $query = "SELECT * FROM categories";
        $select_categories = mysqli_query($connection, $query);


        //lecture 100
        while($row = mysqli_fetch_assoc($select_categories))
        {
            $cat_id =  $row['cat_id'];   //cat_id is the name of column in DB
            $cat_title =  $row['cat_title'];

            echo "<tr>";
            echo "<td> {$cat_id} </td>";        //double bracket is because of double quotes, single quotes wont work
            echo "<td> {$cat_title} </td>";
            //lecture 103 deleting categories
            //!!! passing parameter to browser after click
            echo "<td><a href='categories.php?delete={$cat_id}'>Delete</a></td>";
            echo "<td><a href='categories.php?edit={$cat_id}'>Edit</a></td>";
            echo "</tr>";
        }
    }

    function deleteCategories()
    {
        global $connection;

        //103 deleting categories
        //DELETE QUERY
        //if we find in the address in web browser parameter delete
        if(isset($_GET['delete']))
        {
            $get_cat_id = $_GET['delete'];
            $query = "DELETE FROM categories WHERE cat_id = {$get_cat_id}";
            $delete_query = mysqli_query($connection, $query);
            //this will refresh page
            header("Location: categories.php");
        }
    }


    //funkcia pre pridanie insert noveho zamestnanca do tabulky zamestnancov
    function insert_zamestnanec()
    {
        global $connection;
        if(isset($_POST['submit']))
        {
            $form_zam_meno = $_POST['form_zam_meno'];
            $form_zam_priezvisko = $_POST['form_zam_priezvisko'];
            $form_zam_id = $_POST['form_zam_id'];
            $form_zam_tel = $_POST['form_zam_tel'];
            $form_zam_email = $_POST['form_zam_email'];
            $form_zam_dat_narodenia = $_POST['form_zam_dat_narodenia'];
            $form_zam_tr_pobyt = $_POST['form_zam_tr_pobyt'];
            $form_zam_pr_pobyt = $_POST['form_zam_pr_pobyt'];
            $form_zam_koef_plat = $_POST['form_zam_koef_plat'];
            $form_zam_prip_noc = $_POST['form_zam_prip_noc'];
            $form_zam_prip_sobota = $_POST['form_zam_prip_sobota'];
            $form_zam_prip_nedela = $_POST['form_zam_prip_nedela'];
            $form_zam_prip_sviatok = $_POST['form_zam_prip_sviatok'];
            $form_zam_koef_km = $_POST['form_zam_koef_km'];
            $form_zam_rodc = $_POST['form_zam_rodc'];
            $form_zam_op = $_POST['form_zam_op'];


            $query = "INSERT INTO zamestnanci ( cislo_zamestnanca,
                                                meno,
                                                priezvisko,
                                                tel,
                                                mail,
                                                dat_narodenia,
                                                adresa_tr_pobyt,
                                                adresa_pr_pobyt,
                                                koef_platu,
                                                priplatok_noc,
                                                priplatok_sobota,
                                                priplatok_nedela,
                                                priplatok_sviatok,
                                                koef_km,
                                                rodne_cislo,
                                                cislo_op)";
            $query .= "VALUE('{$form_zam_id}',
                            '{$form_zam_meno}',
                            '{$form_zam_priezvisko}',
                            '{$form_zam_tel}',
                            '{$form_zam_email}',
                            '{$form_zam_dat_narodenia}',
                            '{$form_zam_tr_pobyt}',
                            '{$form_zam_pr_pobyt}',
                            '{$form_zam_koef_plat}',
                            '{$form_zam_prip_noc}',
                            '{$form_zam_prip_sobota}',
                            '{$form_zam_prip_nedela}',
                            '{$form_zam_prip_sviatok}',
                            '{$form_zam_koef_km}',
                            '{$form_zam_rodc}',
                            '{$form_zam_op}'
                                            )";
            $create_zamestnanec_query = mysqli_query($connection, $query);

            if(!$create_zamestnanec_query)         //ak vrati FALSE, negaciou bude TRUE a vtedy vypise
            {
                    die('QUERY FAILED' . mysqli_error($connection));
            }
            else{
                //po uspesnom pridani ho redirectnem na tabulku vsetkych zamestnancov
                header("Location: show_zamestnanci.php");
            }
        }
    }


    function findAllZamestnanci()
    {
        global $connection;

        $query = "SELECT * FROM zamestnanci";
        $select_zamestnanci = mysqli_query($connection, $query);

        
        echo "<tr>";
            echo "<th> Meno </th>";        //double bracket is because of double quotes, single quotes wont work
            echo "<th> Priezvisko </th>";
            echo "<th> Identifikačné číslo </th>";
        echo "</tr>";
        //lecture 100
        while($row = mysqli_fetch_assoc($select_zamestnanci))
        {
            
            $meno = $row['meno'];
            $priezvisko = $row['priezvisko'];
            $id = $row['cislo_zamestnanca'];
            $tel = $row['tel'];
            $email = $row['mail'];
            $koef_platu = $row['koef_platu'];
            $prip_noc = $row['priplatok_noc'];
            $prip_sobota = $row['priplatok_sobota'];
            $prip_nedela = $row['priplatok_nedela'];
            $koef_km = $row['koef_km'];
            $rc = $row['rodne_cislo'];
            $op = $row['cislo_op'];

            echo "<tr>";
            echo "<td> {$meno} </td>";        //double bracket is because of double quotes, single quotes wont work
            echo "<td> {$priezvisko} </td>";
            echo "<td> {$id} </td>";

            //lecture 103 deleting categories
            //!!! passing parameter to browser after click
            //tuto bude treba uviest iba novu funkciu ktora sa zavola a deletne zaznam s danym ID

            echo "<td><a href='show_zamestnanci.php?detail={$id}'>Detail</a></td>";
            echo "<td><a href='fin_den_zamestnanci.php?id_zamestnanca={$id}'>Finančný denník</a></td>";
            echo "<td><a href='show_zamestnanci.php?edit={$id}'>Edit</a></td>";
            echo "<td><a href='show_zamestnanci.php?delete={$id}'>Delete</a></td>";
            echo "</tr>";
        }
    }

    function deleteZamestnanci()
    {
        global $connection;

        //103 deleting categories
        //DELETE QUERY
        //if we find in the address in web browser parameter delete
        if(isset($_GET['delete']))
        {
            $id = $_GET['delete'];
            $query = "DELETE FROM zamestnanci WHERE cislo_zamestnanca = {$id}";
            $delete_query = mysqli_query($connection, $query);
            //this will refresh page
            header("Location: show_zamestnanci.php");
        }
    }



?>