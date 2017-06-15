<%@page import="Model.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>

<%
    String user_id = (String) session.getAttribute("user");
    Connection conn = DBConnection.getActiveConnection();
    String sql = "select account_type from account where account_id = "+ Integer.parseInt(user_id);
    PreparedStatement stmt;
    stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    ResultSet rs = stmt.executeQuery();
    rs.next();
    Integer account_type = rs.getInt("account_type");
    
    if (!account_type.equals(0)) {
        response.sendRedirect("/ProjectView/Controller");
    }
    
    conn = DBConnection.getActiveConnection();
    String id = request.getParameter("movie_id");
    int movieId = Integer.parseInt(id);
    sql = "select * from movie where movie_id = "+ movieId;
    stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    rs = stmt.executeQuery();
    rs.next();
    String name = rs.getString("movie_name");
    String description = rs.getString("movie_description");
    float price = rs.getFloat("movie_price");
    int year = rs.getInt("movie_year");
    int rentCount = rs.getInt("movie_rentCount");
    String imageUrl = rs.getString("movie_imgPath");
    float rate = rs.getFloat("movie_rate");
    
%>



<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Movies</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Movie Shop</a>
            </div>
            <!-- /.navbar-header -->




            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                        <li>
                            <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>

                        <li>
                            <a href="add-movie.jsp"><i class="fa  fa-fw"></i> Add Movie</a>
                        </li>

                        <li>
                            <a href="/ProjectView/SendMails"><i class="fa fa-fw"></i>Send Emails</a>
                        </li>


                    </ul>
                </div>
                <!-- /.sidebar-collapse -->

            </div>
            <!-- /.navbar-static-side -->


        </nav>





        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit Movie</h1>
                </div>


                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit form for Batman Movie
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form" action="/ProjectView/EditMovie"  method="post">
                                        <div class="form-group" style="display: hidden;">
                                            <label>id</label>
                                            <input class="form-control" type="text" value="<%= id %>" name="id">
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input class="form-control" type="text" value="<%= name %>" name="name">
                                        </div>

                                        <div class="form-group">
                                            <label>price</label>
                                            <input class="form-control" value="<%= price %>" name="price">
                                        </div>

                                        <div class="form-group">
                                            <label>description</label>
                                            <textarea class="form-control" rows="3" name="description"><%= description %></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>year</label>
                                            <input class="form-control" value="<%= year %>" name = "year">
                                        </div>

                                        <div class="form-group">
                                            <label>Rent Count</label>
                                            <input class="form-control" value="<%= rentCount %>" name="rentCount">
                                        </div>

                                        <div class="form-group">
                                            <label>Rate</label>
                                            <input class="form-control" value="<%= rate %>" name="rate">
                                        </div>

                                        <div class="form-group">
                                            <label>Image_URl</label>
                                            <input class="form-control" value="<%= imageUrl %>" name="image_url">
                                        </div>

                                        </div>
                                        <button type="submit" class="btn btn-default">Submit </button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->

                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->

            </div>
            <!-- /.row -->
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
