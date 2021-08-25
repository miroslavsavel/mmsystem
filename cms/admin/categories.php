<?php include "includes/admin_header.php" ?>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <?php include "includes/admin_navigation.php" //sidebar menu - LEFT in the admin section?> 
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Welcome to admin section
                            <small>Author</small>
                        </h1>
                        <div class="col-xs-6">  <!-- 6 mean half of the screen -->
                            <!-- lecture 101 adding the categories from admin section -->
                            <?php insert_categories(); ?>
                            <!-- form for add category -------------------------------------------->
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="cat-title">Add Category</label>
                                    <input type="text" class="form-control" name="cat_title">
                                </div>
                                <div class="form-group">
                                    <input class="btn btn-primary" type="submit" name="submit" value="Add Category">
                                </div>                  
                            </form>
                            <!-- form for edit category ---------------------------------------------->
                             <?php //UPDATE AND INCLUDE QUERY
                                if(isset($_GET['edit']))
                                {
                                    $cat_id = $_GET['edit'];
                                    include "includes/update_categories.php";
                                }
                             ?>   
                        </div>
                        <!-- Lecture 99 -->
                        <div class="col-xs-6">  <!-- 6 mean half of the screen -->
                            <table class="table table-bordered table-hover">
                                <!-- Here i let the code for basic table manipulation -->
                                <!-- <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Category title</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Some category</td>
                                        <td>Another category</td>
                                    </tr>
                                </tbody> -->                               
                                <?php 
                                    findAllCategories();
                                ?>
                                <?php 
                                    deleteCategories();
                                ?>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
    <?php include "includes/admin_footer.php" ?>
