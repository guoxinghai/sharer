<%-- 
    Document   : navigationBar
    Created on : 2019-5-12, 15:42:44
    Author     : 24429
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" href="icons/photo.png" type="image/x-icon">
        <script src="js/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/nav_css.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="js/nav_js.js"></script>
        <style>
            #logo{max-width: 220px;max-height: 50px;margin-top: -15px;}

        </style>
    </head>
    <body>
    <input type="hidden" value="${sessionScope.user.uid}" id="userID"/>
    <!--用户头像-->
    <input type="hidden" value="${initParam.userPath}" id="userPath"/>
        <nav class="navbar navbar-default" style="background-color: white" >
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="logo/logo.jpg" id="logo">
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="home.jsp" ><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;首页  <span class="sr-only">(current)</span></a></li>
                        <li><a href="personalPage.jsp"><span class="glyphicon  glyphicon-user" aria-hidden="true"></span>&nbsp;个人 </a></li>
                         <li><a href="explorePage.jsp"><span class="glyphicon  glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;探索 </a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input id="search" onblur="lose()"  onfocus="searchUserByName_n()" oninput="searchUserByName_n()" type="text" class="form-control" placeholder="搜索sharer">
                        </div>
                        <a id="go" href="#" class="btn btn-default"><span class="glyphicon   glyphicon-search" aria-hidden="true"></span></a>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a onclick="logout()"style="cursor: pointer">退出</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    <div id="nav_div" onmouseover="over()" onmouseleave="leave()" data-flag="" style="display:none;background:rgba(255,255,255,0.7);z-index:999;position: absolute;float:left;margin:-2% 32.6%;width: 200px;height:auto">

    </div>
    <!--弹出重新登录模态框-->

    <div class="modal fade" id="reloginModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm"  style="margin-top: 250px">
            <div class="modal-content">
                <div align="center">
                    <h4 style="color:red;"> 下线通知 </h4>
                    <hr>
                </div>
                <div class="modal-body" align="center">
                    <p style="font-size: 20px;">您确认退出吗？</p><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a href="LogoutServlet"><button type="button" class="btn btn-success">确认</button></a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->

    </div>
    </body>
</html>
