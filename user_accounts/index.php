<?php include("config.php") ?>
<?php include(INCLUDE_PATH . "/logic/common_functions.php"); ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>UserAccounts - Home</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
  <!-- Custome styles -->
  <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <?php include(INCLUDE_PATH . "/layouts/navbar.php") ?>
    <?php include(INCLUDE_PATH . "/layouts/messages.php") ?>
    <h1>Home page</h1>
    <?php include(INCLUDE_PATH . "/layouts/footer.php") ?>



<!-- tu si chcem vyskusat bcrypt -->
<?php
  $password1 = password_hash('123', PASSWORD_DEFAULT); //encrypt the password before saving in the database
  $password2 = password_hash('123', PASSWORD_DEFAULT);

  echo $password1 . "<br>";
  echo $password2 . "<br>";
?>