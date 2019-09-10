<%-- 
    Document   : register
    Created on : 2019-5-10, 16:52:07
    Author     : 24429
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户注册</title>
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

        #login-color {
            background-color: #ffffff;
        }

        #sharer-img {
            max-width: 190px;
            max-height: 60px;
            margin-top: 20px
        }

        /*            #gutter {margin-bottom: 20px}*/
        /*            #userid {margin-top: }*/
        a:hover {
            color: #003569
        }

        h5 {
            text-align: center;
            color: #999999;
            font-weight: bold;
            margin-bottom: 15px
        }

    </style>
</head>

<body>
<div class="container">
    <div class="row row-centered  ">
        <div id="prompt"></div>
        <div class="well col-md-3  col-centered" id="login-color" style="float:none">
            <img src="profilePicture/logo.jpg" class="img-responsive center-block" id="sharer-img">
            <h5>注册 sharer，分享精彩世界</h5>

            <form action="rs" method="post" id="form">
                <div class="form-group">
                    <input type="text" class="form-control" name="Uphone" id="Uphone" placeholder="请输入手机号码">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="Uemail" id="Uemail" placeholder="Email">
                </div>
                <div class="form-group ">
                    <!--                            <span class="input-group-addon" ><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>-->
                    <input type="text" class="form-control " name="Uname" id="Uname" placeholder="请输入用户名"/>
                </div>

                <div class="form-group ">
                    <!--                            <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span> -->
                    <input type="password" class="form-control" id="Upwd" name="Upwd" placeholder="请输入密码"/>
                </div>
                <div class="form-group ">
                    <!--                            <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span> -->
                    <input type="password" class="form-control" id="reUpwd" name="reUpwd" placeholder="请再次输入密码"/>
                </div>
                <br/>
                <button type="submit" class="btn btn-primary btn-block" id="registerBtn"
                >注册
                </button>

                <hr>
                <center><h6>已有账户？请<a href="index.jsp" style="color:#003569 "><span
                        style="cursor: hand"><b>登录</b></span></a></h6></center>
            </form>
            <!--                     引入表单验证插件-->

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

                                fields: {  // 字段验证区域
                                    Uname: {
                                        verbose: false,
                                        message: '用户名验证失败',
                                        validators: { // 验证器，所有的验证规则必须放在里面
                                            notEmpty: {message: '用户名不能为空'},
                                            stringLength: {min: 1, max: 8, message: '用户名长度必须为1位到8位之间'},
                                            threshold: 1,//有1字符以上才发送ajax请求
                                            remote: {//ajax验证。server result:{"valid",true or false}
                                                url: "rcs",
                                                message: '用户名已存在,请重新输入',
                                                delay: 1000,//ajax刷新的时间是1秒一次
                                                type: 'POST'
                                            }
                                        }
                                    }
                                    ,
                                    Upwd: {
                                        message: '密码验证失败',
                                        validators: {
                                            notEmpty: {message: '密码不能为空'},
                                            stringLength: {min: 6, max: 13, message: '密碼长度必须为6位到13位之间'}
                                        }
                                    },
                                    Uphone: {
                                        message: 'The phone is not valid',
                                        validators: {
                                            notEmpty: {
                                                message: '手机号码不能为空'
                                            },
                                            stringLength: {
                                                min: 11,
                                                max: 11,
                                                message: '请输入11位手机号码'
                                            }

                                        }
                                    },
                                    Uemail: {
                                        validators: {

                                            notEmpty: {
                                                message: '邮箱地址不能为空'
                                            },
                                            emailAddress: {
                                                message: '请输入正确的邮件地址'
                                            }
                                        }
                                    },
                                    reUpwd: {
                                        message: '密码无效',
                                        validators: {
                                            identical: {//相同
                                                field: 'Upwd',
                                                message: '两次密码不一致'
                                            },
                                            different: {//不能和用户名相同
                                                field: 'Uname',
                                                message: '不能和用户名相同'
                                            }
//                                                    
                                        }
                                    }
                                }

                            });
                    // 重置表单验证
                    $('#loginBtn').click(function () {
                        $('#form').data('bootstrapValidator').resetForm(true);
                    });


                });


            </script>

        </div>
    </div>
</div>

</body>

</html>

