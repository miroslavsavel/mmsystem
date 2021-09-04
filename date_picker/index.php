<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- include input widgets; this is independent of Datepair.js -->
<link rel="stylesheet" type="text/css" href="jquery.timepicker.css" />
<link rel="stylesheet" type="text/css" href="bootstrap-datepicker.css" />
<script type="text/javascript" src="bootstrap-datepicker.js"></script>
<script type="text/javascript" src="jquery.timepicker.js"></script>

<script type="text/javascript" src="datepair.js"></script>
<script>
    // initialize input widgets first
    $('#basicExample .time').timepicker({
        'showDuration': true,
        'timeFormat': 'g:ia'
    });

    $('#basicExample .date').datepicker({
        'format': 'm/d/yyyy',
        'autoclose': true
    });

    // initialize datepair
    var basicExampleEl = document.getElementById('basicExample');
    var datepair = new Datepair(basicExampleEl);
</script>
</head>

<body>
<?php
                if (isset($_POST["submit"])) {
                    echo "Yes, button pridat was submitted";
                    var_dump($_POST);
                } else {
                    echo "N0, button was not pressed";
                }
                ?>
<input id="datePicker">
 
<p id="basicExample">
    <input type="text" class="date start" />
    <input type="text" class="time start" /> to
    <input type="text" class="time end" />
    <input type="text" class="date end" />
</p>


</html>