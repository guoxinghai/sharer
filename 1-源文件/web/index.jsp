<%-- 
    Document   : index
    Created on : 2019-5-10, 16:46:29
    Author     : 24429
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="icon" href="icons/photo.png" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>

    <style>
        body {
            background-color: #fafafa;
            background-image: url("images/bg.jpeg");
        }

        /*web background*/
        .container {
            display: table;
            height: 100%;
        }

        .row {
            display: table-cell;
            vertical-align: middle;
        }

        /* centered columns styles */
        .row-centered {
            /*                text-align 属性规定元素中的文本的水平对齐方式。*/
            text-align: center;
        }

        .col-centered {
            display: inline-block;
            float: none;
            text-align: left;
            margin-right: -4px;
        }

        #login-color, #login-color1 {
            background-color: #ffffff;
            margin-top: 20px
        }

        #sharer-img {
            max-width: 190px;
            max-height: 60px;
            margin-bottom: 20px;
            margin-top: 20px
        }

        /*            #gutter {margin-bottom: 20px}*/
        /*            #userid {margin-top: }*/
        a:hover {
            color: #003569
        }


    </style>
</head>

<body>

<c:if test="${requestScope.registrationStatus == 'true'}" var="result" scope="request">
    <div class="alert alert-success alert-dismissible in fade" role="alert">
        <button type="button" class="close " data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <center><strong>恭喜你！</strong> 注册成功，请登录！</center>
    </div>
</c:if>

<div class="container">

    <div class="row ">
        <div class=" col-md-3 col-md-offset-4 col-sm-5 col-sm-offset-4 ">
            <div class="well" id="login-color" style="margin-top: 40%;">
                <img src="profilePicture/logo.jpg" class="img-responsive center-block" id="sharer-img">
                <div id="error"></div>
                <form action="" method="post" id="form">
                    <div class="form-group ">
                        <!--                            <span class="input-group-addon" ><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>-->
                        <input type="text" class="form-control " name="Uname" id="Uname" placeholder="请输入用户名"/>
                    </div>

                    <div class="form-group ">
                        <!--                            <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span> -->
                        <input type="password" class="form-control" id="Upwd" name="Upwd" placeholder="请输入密码"/>
                    </div>
                    <br/>
                    <button type="button" class="btn btn-primary btn-block" id="loginBtn">登录</button>
                    <hr>
                    <center><h6>没有账户？<a href="register.jsp" style="color:#003569 "><span
                            style="cursor: hand"><b>注册</b></span></a></h6></center>
                    <center><h6><a href="manager.jsp" style="color:#386966 "><span
                            style="cursor: hand">管理员登录</span></a></h6></center>
                </form>
            </div>


        </div>
    </div>
    <%--    <div class="row">--%>
    <%--        <div class="well col-md-4 col-md-offset-4 col-sm-5 col-sm-offset-4 col-lg-3 col-lg-offset-4"></div>--%>
    <%--    </div>--%>

</div>

</body>
<script>


    $(function () {
        $('#form')
            .bootstrapValidator(
                {

                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphiconglyphicon-ok',
                        invalid: 'glyphiconglyphicon-remove',
                        validating: 'glyphiconglyphicon-refresh'
                    },

                    fields: {
                        Uname: {
                            message: '用户名验证失败',
                            validators: {
                                notEmpty: {message: '用户名不能为空'},
                                stringLength: {min: 1, max: 8, message: '用户名长度必须为1位到8位之间'}
                            }
                        },
                        Upwd: {
                            message: '密码验证失败',
                            validators: {
                                notEmpty: {message: '密码不能为空'},
                                stringLength: {min: 6, max: 13, message: '密碼长度必须为6位到13位之间'}
                            }
                        }
                    }

                });
        (function () {
            $('#form').data('bootstrapValidator').resetForm(false);
        })();
        <%--var Uname=${'#Uname'}.val();--%>
        $('#loginBtn').click(function () {
            if ($('#form').data('bootstrapValidator').isValid()) {
                $.ajax({
                    url: "uls",
                    type: "POST",
                    data: {Uname: $('#Uname').val(), Upwd: $('#Upwd').val()},
                    datatype: "text",
                    beforeSend: function () {
                        $("#loginBtn").attr('disabled', true);
                        $('#loginBtn').text("登录中...");
                    },
                    success: function (result) {
                        if (result === 'false') {
                            $('#error').html("  <div class=\"alert alert-warning alert-dismissible in fade\" role=\"alert\">\n" +
                                "                        <button type=\"button\" class=\"close \" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
                                "                        <center> 用户名或密码错误！</center>\n" +
                                "                    </div>");

                        } else {
                            if (result === 'true') {
                                window.location.href = "home.jsp";
                            }else {
                                $('#error').html("  <div class=\"alert alert-warning alert-dismissible in fade\" role=\"alert\">\n" +
                                    "                        <button type=\"button\" class=\"close \" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
                                    "                        <center> 用户被封禁！</center>\n" +
                                    "                    </div>");
                            }


                            // 登录成功就跳转页面
                        }


                    },
                    error: function () {
                    },
                    complete: function () {
                        $("#loginBtn").attr('disabled', false);
                        $('#loginBtn').text("登录");
                    }

                })
            }

        });

        // // 重置表单验证
        // $('#loginBtn').click(function () {
        //     $('#form').data('bootstrapValidator').resetForm(ture);
        // });


    });


</script>
</html>

