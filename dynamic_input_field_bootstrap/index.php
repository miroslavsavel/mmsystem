<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="skript.js"></script>
    <script>
    
    </script>
    <!------ Include the above in your HEAD tag ---------->
</head>
<body>
    <form action="index.php" method="post">       
        <div class="panel panel-default">
            <div class="panel-heading">Dynamic Form Fields - Add & Remove Multiple fields</div>
            <div class="panel-heading">Education Experience</div>
            <div class="panel-body">
            
            <div id="education_fields">
                    
                </div>
                <div class="col-sm-3 nopadding">
            <div class="form-group">
            <input type="text" class="form-control" id="Schoolname" name="Schoolname[]" value="" placeholder="School name">
            </div>
        </div>
        <div class="col-sm-3 nopadding">
            <div class="form-group">
            <input type="text" class="form-control" id="Major" name="Major[]" value="" placeholder="Major">
            </div>
        </div>
        <div class="col-sm-3 nopadding">
            <div class="form-group">
            <input type="text" class="form-control" id="Degree" name="Degree[]" value="" placeholder="Degree">
            </div>
        </div>
        
        <div class="col-sm-3 nopadding">
            <div class="form-group">
            <div class="input-group">
                <select class="form-control" id="educationDate" name="educationDate[]">
                
                <option value="">Date</option>
                <option value="2015">2015</option>
                <option value="2016">2016</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                </select>
                <div class="input-group-btn">
                <button class="btn btn-success" type="button"  onclick="education_fields();"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> </button>
                </div>
            </div>
            </div>
        </div>
        <div class="clear"></div>
            
            </div>
            <div class="panel-footer"><small>Press <span class="glyphicon glyphicon-plus gs"></span> to add another form field :)</small>, <small>Press <span class="glyphicon glyphicon-minus gs"></span> to remove form field :)</small></div>
            <div class="panel-footer"><small><em><a href="http://shafi.info/">More Info - Developer Shafi (Bangladesh)</a></em></em></small></div>
        </div>
         <!-- button pre potvrdenie -->
         <div class="form-group">
            <input class="btn btn-primary" type="submit" name="submit" value="Pridať">
        </div>
    </form>

  
    <?php
        if (isset($_POST["submit"])) {
            echo "Yes, mail is set";
            

            var_dump($_POST);

        } else {    
            echo "N0, mail is not set";
        }

        
    ?>
    
</body>
</html>