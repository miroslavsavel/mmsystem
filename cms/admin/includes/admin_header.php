<?php ob_start();
//this function buffer our requests in the header function which redirect user
//https://stackoverflow.com/questions/4401949/whats-the-use-of-ob-start-in-php
?>
<?php
// We need to use sessions, so you should always start sessions using the below code.
session_start();
// If the user is not logged in redirect to the login page...
if (!isset($_SESSION['loggedin'])) {
    header('Location: http://127.0.0.1/MMsystem/phplogin/index.html');
    exit;
}
?>
<!-- zakladne DB spojenie -->
<?php include "../includes/db.php" ?>
<!-- funkcie pre manipulaciu so zamestnancami -->
<?php include "functions_zamestnanci.php" ?>
<!-- funkcie pre manipulaciu s firmami -->
<?php include "functions_firmy.php" ?>
<!-- funkcie pre manipulaciu s vykazmi -->
<?php include "functions_vykazy.php" ?>
<!-- funkcie pre schvalenie vykazu -->
<?php include "../admin/php/schvalenie_vykazu/fnc_schvalenie_vykazu.php" ?>
<!-- funkcie pre zobrazenie financneho denniku zamestnanca-->
<?php include "functions_fin_den.php" ?>
<!-- funkcie pre zobrazenie financneho denniku firmy-->
<?php include "functions_fin_den_firmy.php" ?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>




    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Dynamicky formular -->
    <!-- http://www.randomsnippets.com/2008/02/21/how-to-dynamically-add-form-elements-via-javascript/ -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- tu su umiestnene moje js funkcie -->
    <script src="js/funkcie.js"></script>
    <!-- Dynamicke pridavanie zamestnancov -->
     <script src="./js/dynamicky_zamestnanci.js"></script>
    <!-- tu ma funkciu ktoru pri edit vykazu vymazavam zamestnancov na vykaze -->
    <script src="./js/zamestnanci_edit.js"></script>


    <!-- Date picker -->
<!--     <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css"> -->

</head>