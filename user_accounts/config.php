<?php
    //http://codewithawa.com/posts/user-account-management,-roles,-permissions,-authentication-php-and-mysql---part-2

    session_start(); // start session
    //We have also started the session because we will need to use it later on to store logged in user information such as username


	// connect to database
	$conn = new mysqli("localhost", "root", "", "user_accounts");
	// Check connection
	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
  // define global constants
	define ('ROOT_PATH', realpath(dirname(__FILE__))); // path to the root folder
	define ('INCLUDE_PATH', realpath(dirname(__FILE__) . '/includes' )); // Path to includes folder
  define('BASE_URL', 'http://localhost/MMsystem/user_accounts/'); // the home url of the website
    


    // ...More code here ...=================================================================================================
//$sql = SELECT * FROM users WHERE username=John AND age=20; // this is the query

//$user = getSingleRecord($sql, 'si', ['John', 20]); // perform database query

//In the function call, 's' represents string type (since username 'John' is a string) 
//and 'i' means integer (age 20 is an integer). This function makes our work immensely
// easy because if we want to perform a database query in a hundred different places in
// our application, we will not have to only these two lines.

function getSingleRecord($sql, $types, $params) {
    global $conn;
    $stmt = $conn->prepare($sql);
    $stmt->bind_param($types, ...$params);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    $stmt->close();
    return $user;
  }





function getMultipleRecords($sql, $types = null, $params = []) {
    global $conn;
    $stmt = $conn->prepare($sql);
    if (!empty($params) && !empty($params)) { // parameters must exist before you call bind_param() method
      $stmt->bind_param($types, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_all(MYSQLI_ASSOC);
    $stmt->close();
    return $user;
  }




  
  function modifyRecord($sql, $types, $params) {
    global $conn;
    $stmt = $conn->prepare($sql);
    $stmt->bind_param($types, ...$params);
    $result = $stmt->execute();
    $stmt->close();
    return $result;
  }
?>