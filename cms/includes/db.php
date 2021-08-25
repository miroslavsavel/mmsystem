<?php 
    /* $db['db_host'] = '127.0.0.1';
    $db['db_user'] = 'root';
    $db['db_pass'] = '';
    $db['db_name'] = 'cms';
    
    //convert into constant
    foreach($db as $key => $value)
    {
       // define("DB_HOST", '127.0.0.1'); //This will make konstant
        define
        define(strtoupper($key), $value);
    } */
    define("DB_HOST", '127.0.0.1');
    define("DB_USER", 'root');
    define("DB_PASS", '');
    define("DB_NAME", 'cms');
    
    $connection = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);    //not the correct way
    if($connection)
    {
        //echo "We are connected!";
    }
    else if ( mysqli_connect_errno() ) {
        // If there is an error with the connection, stop the script and display the error.
        exit('Failed to connect to MySQL: ' . mysqli_connect_error());
    }
?>