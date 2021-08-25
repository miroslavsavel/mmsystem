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
                            Welcome to post section
                        </h1>

                        <!-- Nadpis tabulky -->
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Author</th>
                                    <th>Title</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                    <th>Image</th>
                                    <th>Tags</th>
                                    <th>Comments</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                        <!-- Telo tabulky -->
                            <tbody>
                                <?php 
                                    $query = "SELECT * FROM posts";
                                    $select_posts = mysqli_query($connection, $query);
                        
                                    while($row = mysqli_fetch_assoc($select_posts))
                                    {
                                        echo "<tr>";
                                            $post_id =  $row['post_id'];   //cat_id is the name of column in DB
                                            $post_category_id =  $row['post_category_id'];
                                            $post_title =  $row['post_title'];
                                            $post_author =  $row['post_author'];
                                            $post_user =  $row['post_user'];
                                            $post_date =  $row['post_date'];
                                            $post_image =  $row['post_image'];
                                            $post_content =  $row['post_content'];
                                            $post_tags =  $row['post_tags'];
                                            $post_comment_count =  $row['post_comment_count'];
                                        echo "</tr>";
                                    }
                                ?>
                                <tr>
                                    <td>10</td>
                                    <td>Miro</td>
                                    <td>Bootstrap framework</td>
                                    <td>Bootstrap</td>
                                    <td>Status</td>
                                    <td>Image</td>
                                    <td>Tags</td>
                                    <td>Comments</td>
                                    <td>Date</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
    <?php include "includes/admin_footer.php" ?>
