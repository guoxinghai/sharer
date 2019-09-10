<%-- 
    Document   : editPage
    Created on : 2019-5-18, 22:08:09
    Author     : jiawe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="navigationBar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="icons/photo.png" type="image/x-icon">
    <script src="js/bootstrapValidator.js"></script>
    <script src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>

    <script>
        var id = 2;
        $(function () {
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })

                $('#userPwd')
                    .bootstrapValidator(
                        {

                            message: 'This value is not valid',
                            feedbackIcons: {
                                valid: 'glyphiconglyphicon-ok',
                                invalid: 'glyphiconglyphicon-remove',
                                validating: 'glyphiconglyphicon-refresh'
                            },
                            fields: {
                                inputPwd1: {
                                    validators: {
                                        notEmpty: {message: '密码不能为空'}
                                    }
                                },
                                inputPwd2: {
                                    validators: {

                                        stringLength: {min: 6, max: 13, message: '密码必须为6-13位'}
                                    }
                                },
                                inputPwd3: {
                                    message: '密码无效',
                                    validators: {
                                        identical: {//相同
                                            field: 'inputPwd2',
                                            message: '两次密码不一致'
                                        },
                                        notEmpty: {message: '新密码不能为空'}

                                    }
                                }


                            }


                        });
                //             重置表单验证
                //                $('#submitbtn').click(function () {
                //        $('#form').data('bootstrapValidator').resetForm(true);
                //        });

            $('.lan').click(function () {
//                    $(this).addClass('change');
//                    $('.lan').not(this).removeClass('change');
                idx = $(this).index('.lan');
                $('.mb').eq(idx).show();
                $('.mb').not($('.mb').eq(idx)).hide();


            });
        });


        function modifyPassword() {
            $.ajax({
                url: "MP",
                async: false,
                type: "POST",
                dataType: "text",
                data: $("#userPwd").serialize(),

                success: function (status) {
                    // console.log("flag", flag);
                    // console.log(typeof (flag));
                    // console.log(typeof ("false"));
                    if (status === "equalStatus:false") {
                        alert("旧密码不正确");
                    }
                    if (status === "modifyStatus:true") {
                        alert("修改成功！")
                    }
                    if(status === "modifyStatus:false"){
                        alert("修改失败！")
                    }
                },
                error: function () {
                    alert("error");
                }

            });
        }


        function userUpdate() {
            $.ajax({
                url: "US",
                type: "POST",
                async: true,
                data: $('#userForm').serialize(),
                datatype: "text",
                success: function (data) {
                    console.log(data);
                    if(data=="false"){
                        alert("修改失败");
                    }else{
                        alert("修改成功");
                        $(".uName").html($("#inputName").val());
                    }
                },
                error: function () {
                    alert("error！");
                }
            });
        }

    </script>
    <title>编辑主页</title>
</head>
<body style=" background:  #fafafb">

<div class="container thumbnail"
     style=" margin-top: 70px; width: 60%; background-color:  white; padding-top: 20px; padding-left: 10px">

    <div class="row" style=" border:  black">
        <div class=" col-md-3 col-sm-3 col-xs-12 " style=" display:  inline; ">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="home.jsp">Home</a></li>
                <li role="presentation" id="lan" class="lan"><a href="#">编辑主页</a></li>
                <li role="presentation" id="lan" class="lan"><a href="#">更改密码</a></li>
                <li role="presentation" id="lan" class="lan"><a href="#">授权的应用程序</a></li>
                <li role="presentation" id="lan" class="lan"><a href="#">隐私和安全</a></li>
            </ul>
        </div>

        <div class="col-md-8 col-sm-6 col-xs-10  mb thumbnail" style="margin-left: 20px; display:  inline; border:  black ;" id="mb">
            <div class=" col-md-12 col-sm-12 col-xs-12" style="border: 0; border-color:  #999999;display: block; margin-bottom: 20px" ><a href="personalPage.jsp"><img src="${initParam.userPath}${sessionScope.user.uimg}" alt="" class=" img-circle  col-md-2 col-sm-4 col-xs-4 img-responsive "
                                  style=" margin-left: 20px; margin-bottom: 20px;  "/></a>
                <span class="uName"  style=" text-align:  center; font-size: 30px; margin-top:10px; margin-left: 20px; float: left">${sessionScope.user.uname}</span>

            </div>

            <form class="form-horizontal responsive" id="userForm">

                <input type="hidden" name="item" id="item" value="2">
                <input type="hidden" name="oldName" value="${sessionScope.user.uname}">
                <input type="hidden" name="uid" value="${sessionScope.user.uid}">
                <input type="hidden" name="userPwd" value="${sessionScope.user.upwd}">


                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label" >姓名</label>
                    <div class="col-sm-10">
                        <input type="text" name="inputName" class="form-control" id="inputName" placeholder="Name" value="${sessionScope.user.uname}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputWords" class="col-sm-2 control-label">签名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="inputWords" id="inputWords"
                               placeholder="BriefIntroduction" value="${sessionScope.user.uwords}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputGender" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-10">
                        <!--                                <input type="" class="form-control" id="inputGender" placeholder="Gender">-->
                        <select name="inputGender" class="form-control" id="inputGender">
                            <option value="m">男</option>
                            <option value="f">女</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputBirth" class="col-sm-2 control-label">生日</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" name="inputBirth" id="inputBirth"
                               placeholder="Birthday" value="${sessionScope.user.ubirth}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" name="inputEmail" id="inputEmail" placeholder="Email" value="${sessionScope.user.uemail}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputTel" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-10">
                        <input type=" tel" class="form-control" name="inputTel" id="inputTel" placeholder="PhoneNumber" value="${sessionScope.user.uphone}">
                    </div>
                </div>

<%--                <div class="form-group">--%>
<%--                    <div class="col-sm-offset-2 col-sm-10">--%>
<%--                        <div class="checkbox">--%>
<%--                            <label>--%>
<%--                                <input type="checkbox"> 类似用户推荐--%>
<%--                            </label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </form>
            <div class="form-group" style=" text-align:  center">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <button onclick="userUpdate()" class="btn btn-success">提交</button>
                    <button type="btn" class="btn btn-danger disabled">注销该账户</button>
                </div>

            </div>
        </div>

        <div class="col-md-8 col-sm-6 col-xs-10  mb thumbnail" style="margin-left: 20px; border:  black ; display: none  " id="mb">
            <div class=" col-md-12 col-sm-12 col-xs-12" style="border: 0; border-color:  #999999;display: block; margin-bottom: 20px" ><a href="personalPage.jsp"><img src="${initParam.userPath}${sessionScope.user.uimg}" alt="" class=" img-circle  col-md-2 col-sm-4 col-xs-4 img-responsive "
                                                                                                                                                                       style=" margin-left: 20px; margin-bottom: 20px;  "/></a>
                <span class="uName"  style=" text-align:  center; font-size: 30px; margin-top:10px; margin-left: 20px; float: left">${sessionScope.user.uname}</span>

            </div>

<%--                <div class="row thumbnail hidden-sm hidden-xs" style="border: 0; border-color:  #999999"><img src="profilePicture/1.jpeg" alt="" class=" img-circle col-md-2 col-ms-3  "--%>
<%--                                                                                                              style=" margin-left: 20px; margin-bottom: 20px;  "/>--%>
<%--                    <span style=" text-align:  center; font-size: 30px; margin-top:10px; margin-left: 20px; float: left">用户名</span>--%>

<%--                </div>--%>

            <div style="margin-top: 30px">
                <form class="form-horizontal" id="userPwd">
                    <input type="hidden" name="userPwd" value="${sessionScope.user.upwd}">
                    <input type="hidden" name="uid" value="${sessionScope.user.uid}">
                    <div class="form-group">
                        <label for="inputPwd1" class="col-sm-2 control-label">旧密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="inputPwd1" id="inputPwd1"
                                   placeholder="formerPassword"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPwd2" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPwd2" name="inputPwd2"
                                   placeholder="newPassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPwd3" class="col-sm-2 control-label">再次输入</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPwd3" name="inputPwd3"
                                   placeholder="type it again">
                        </div>
                    </div>


                    <div class="form-group" style=" text-align:  center">
                        <div class="col-sm-offset-2 col-sm-10 ">
                            <button onclick="modifyPassword()" class="btn btn-success">更改密码</button>
                        </div>

                    </div>

<%--                    <div class="modal fade" tabindex="-1" role="dialog">--%>
<%--                        <div class="modal-dialog" role="document">--%>
<%--                            <div class="modal-content form-group" style=" text-align:  center">--%>
<%--                                <div class="modal-header col-sm-offset-2 col-sm-10 ">--%>
<%--                                    <button onclick="modifyPassword()" class="close col-sm-offset-2 col-sm-10 " data-dismiss="modal" aria-label="Close">更改密码<span aria-hidden="true">&times;</span></button>--%>
<%--                                </div>--%>
<%--                                <div class="modal-body">--%>
<%--                                    <p>修改成功！</p>--%>
<%--                                </div>--%>
<%--                                <div class="modal-footer">--%>
<%--                                    <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>--%>
<%--                                </div>--%>
<%--                            </div><!-- /.modal-content -->--%>
<%--                        </div><!-- /.modal-dialog -->--%>
<%--                    </div><!-- /.modal -->--%>
                </form>
            </div>
        </div>

        <div class="col-md-8 mb" style=" border:  black ; display:  none " id="mb">
            <h3 style=" color:  #999999;  margin-top: 80px; margin-left: 80px">你未授权任何应用程序访问 Sharer帐户。</h3>


        </div>

        <div class="col-md-8 mb" style=" border:  black ; display:  none " id="mb">

            <div style=" ">
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">新邮件
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 提醒邮件
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 产品邮件
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 研究邮件
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">短信
                            </label>
                        </div>
                    </div>
                </div>


            </div>
        </div>


    </div>


    <div class=" navbar " id='bottom' style=" margin-top: 100px">
        <hr>
        <a href="#">关于我们</a>
        <a href="#">支持</a>
        <a href="#">新闻中心</a>
        <a href="#">API</a>
        <a href="#">工作</a>
        <a href="#">隐私</a>
        <a href="#">条款</a>
        <a href="#">目录</a>
        <a href="#">个人主页</a>
        <a href="#">话题标签</a>
        <a href="#">语言</a>

        <span style=' float:  right ; color:  #999999'> 2019 AOLIGEI</span>
    </div>
</div>
</body>
</html>
