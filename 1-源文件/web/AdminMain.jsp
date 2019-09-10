<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%> 

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!doctype html>
<html lang="ch">

    <head>
        <meta charset="utf-8">
        <!--        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>管理员主界面</title>
        <link rel="icon" href="icons/photo.png" type="image/x-icon">
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>

        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrapValidator.js"></script>
        <script
        src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script><!--
        -->              <script>
            $(function () {
                $(".meun-item").click(function () {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function () {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png");
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
            });
        </script>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/slide.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
        <style>
            .modalimg{
                width: 80px;
                height: 80px;
            }

        </style>

    </head>

    <body>

        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="" src="icons/wlogo.png"><span></span></p>

                </div>
                <div >
                    <img class="img-circle" src="images/${Admin.getAimg()}" id="Here"  style="float: left;max-height: 60px;max-width: 60px" data-toggle="modal" data-target="#myModal"/> <br>

                    <p id="AdminName" style="color:#aab1b7">&nbsp;&nbsp;&nbsp;${sessionScope.Admin.getAname()}</p>
                </div>
                <div id="personInfor" >

                    <p><a href="manager.jsp" style="text-decoration: none; color: #aab1b7;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出登录</a></p>
                </div>

                <div class="meun-title">账号管理</div>
                <div class="meun-item meun-item-active"  href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="images/icon_source.png">编辑个人信息</div>
                <br>
                <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">修改密码</div>
                <br>
                <div class="meun-item" href="#user"  aria-controls="user" role="tab" data-toggle="tab" ><img src="images/icon_user_grey.png">用户管理</div>
                <br>
                <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img  id=" Showbtn" src="images/icon_change_grey.png"  >用户动态</div>
                <br>
                <%--<div class="meun-item" href="#scho" aria-controls="scho" role="tab" data-toggle="tab"><img src="images/icon_house_grey.png">热门动态</div>--%>

            </div>
            <!--            右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!--编辑 个人信息模块 -->
                    <div role="tabpanel" class="tab-pane active" id="sour">
                        <script>
                            $(document).ready(function () {
                                $("#submitbtn").click(function () {
                                    if (!$('#form').data('bootstrapValidator').isValid()) {
                                        return;
                                    }
                                    $.ajax({
                                        url: 'eam',
                                        type: 'POST',
                                        data: $("#form").serialize(),
                                        success: function () {
                                            alert('修改成功');
                                        },
                                        error: function () {
                                            alert('修改失败');
                                        }


                                    });
                                });
                            });
                        </script>
                        <div class="container" style="margin-top: 200px;" >

                            <form class="form-horizontal" id="form"  method="post">
                                <div class="form-group">
                                    <label for="Adminname1" class="col-sm-3 control-label"><b>管理员姓名：</b></label>
                                    <div  class="col-sm-5">
                                        <input  class="form-control " type="text"  id="Adminname1" name="Adminname2" class="required"  placeholder="${Admin.getAname()}"/>
                                        <input  type="hidden"   name="Oldname"  value="${Admin.getAname()}"/> 
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="Adminid1" class="col-sm-3 control-label"><b>管理员账号：</b></label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="text"   id="Adminid1" name="Adminid2" placeholder="${Admin.getAid()}" disabled="disabled"/>
                                        <input  type="hidden"   name="Adminid3"  value="${Admin.getAid()}"/> 
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="AdminTelid" class="col-sm-3 control-label"><b>管理员电话：</b></label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="tel"   id="AdminTelid" name="AdminTelname" placeholder="请输入电话"/>
                                    </div>                                
                                </div>

                                <div class="form-group ">
                                    <label for="AdminEmid" class="col-sm-3 control-label"><b>管理员邮箱：</b></label>
                                    <div class="col-sm-5">
                                        <input class="form-control"  type="email"  id="AdminEmid" name="AdminEmname" placeholder="请修改邮箱"/>
                                    </div>
                                </div>

                                <div  class="form-group">
                                    <label for="AdminBirid" class="col-sm-3 control-label"><b>管理员生日：</b></label>
                                    <div class="col-sm-5">
                                        <input  class="form-control " type="date"  id="AdminBirid" name="AdminBirname" placeholder=""/>
                                    </div>
                                </div>

                                <div class="col-sm-offset-4 col-sm-10">
                                    <button  class="btn btn-lg btn-info" id="submitbtn"> 确认更改</button>
                                </div>

                            </form>

                        </div>
                    </div>

                    <!-- 修改密码模块 -->
                    <div role="tabpanel" class="tab-pane" id="char">
                        <script>
                            $(document).ready(function () {

                                $("#confirmbtn").click(function () {

                                    //if (!$("#oldpwd").val()==" " && !$("#newpwd").val()==" " && !$("#confirmpwd").val().==" ") {
                                    if (!$('#form1').data('bootstrapValidator').isValid()) {
                                        return;
                                    }
                                    $.ajax({
                                        url: 'pwd',
                                        type: 'POST',
                                        data: $("#form1").serialize(),
                                        dataType: "text",
                                        success: function (flag) {

                                            if (flag === "false") {
                                                alert("输入的原密码不正确");
                                            } else {
//                                                      alert('修改成功');
                                                $("#reloginModal").modal('show');
                                            }

                                        },
                                        error: function () {
                                            alert('修改失败');
                                        }


                                    });
                                    //  } 
//                                        alert("请输入密码!!");


                                });


                            });
                        </script>

                        <div class="container " style="margin-top: 200px;">
                            <form class="form-horizontal" id="form1"  name='form1' method="post">

                                <div class="form-group">
                                    <input  type="hidden"   name="Oldid"  value="${Admin.getAid()}"/> 
                                    <label for="AdminTelid" class="col-sm-3 control-label"><b>请输入原密码：</b></label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="password"  id="oldpwd" name="oldpwd" placeholder="请输入原密码"/>
                                    </div>                                
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="AdminTelid" class="col-sm-3 control-label"><b>请输入新密码：</b></label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="password"  id="newpwd" name="newpwd" placeholder="请输入新密码"  />
                                    </div>                                
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="AdminTelid" class="col-sm-3 control-label"><b>请确认新密码：</b></label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="password"  id="confirmpwd" name="confirmpwd" placeholder="请确认新密码"/>
                                    </div>                                
                                </div>
                                <br>
                                <div class="col-sm-offset-4 col-sm-10">
                                    <button  class="btn btn-lg btn-info" id="confirmbtn">确认修改</button>
                                </div>


                            </form>
                        </div>


                    </div>
                    <!--用户管理模块-->
                    <script>
                        $(document).ready(function () {
                            $("#ShowMessage").click(function () {
                                refresh();
                                $("#ShowMessagediv").toggle();

                            });
                        });


                        function ModifyStatus(Oldid, status) {

                            if (status != 1) {
                                $.ajax({
                                    url: 'tu',
                                    type: 'POST',
                                    data: {"Oldid": Oldid},
                                    dataType: "json",
                                    success: function (restatus) {

                                        alert("封号成功");
                                        $("#td" + Oldid).html(restatus);

                                        refresh();

                                    },
                                    error: function () {
                                        alert('出现错误!!!!');
                                    }

                                });

                            } else {
                                $.ajax({
                                    url: 'uu',
                                    type: 'POST',
                                    data: {"Oldid": Oldid},
                                    dataType: "json",
                                    success: function (restatus) {

                                        alert("解封成功");
                                        $("#td" + Oldid).html(restatus);
                                        refresh();


                                    },
                                    error: function () {
                                        alert('出现错误!!!!');
                                    }

                                });

                            }
                        }

                        function refresh() {
                            $.ajax({
                                url: 'su',
                                type: 'GET',
                                dataType: "json",
                                success: function (UsersList) {
                                    $("#MessageTable").html("<thead> <tr><th>用户账号</th><th>用户姓名</th><th>用户性别</th><th>用户邮箱</th><th>用户电话</th><th>用户生日</th><th>用户密码</th><th>用户状态</th><th>是否封禁</th></tr></thead><tbody>");
                                    $.each(UsersList, function (index, user) {
                                        var status = "封号";
                                        if (user.ustatus == 1) {
                                            status = "解封";
                                        }
                                        var str = "<tr>"
                                                + "<td>" + user.uid + "</td>"
                                                + "<td>" + user.uname + "</td>"
                                                + "<td>" + user.ugender + "</td>"
                                                + "<td>" + user.uemail + "</td>"
                                                + "<td>" + user.uphone + "</td>"
                                                + "<td>" + user.ubirth + "</td>"
                                                + "<td>" + user.upwd + "</td>"
                                                + "<td id='td" + user.uid + "'>" + user.ustatus + "</td>"
                                                + "<td ><a href=\"javascript: ModifyStatus('" + user.uid + "','" + user.ustatus + "');\"><span id='span" + user.uid + "'>" + status + "</span></a></td>"
                                                + "</tr>";
                                        $("#MessageTable").append(str);
                                    });
                                    $("#MessageTable").append("</tbody>");
                                },
                                error: function () {
                                    alert("出现错误!!!!");
                                }
                            });

                        }

                    </script>
                    <div role="tabpanel" class="tab-pane" id="user">

                        <div class="page-header" >
                            <a  id="ShowMessage" ><h1 style="font-size: 32px;  " class="text-center ">所有用户信息</h1></a>
                        </div>  
                        <div id="ShowMessagediv">
                            <table class="table table-striped table-hover" id="MessageTable" name="MessageTable">

                            </table>
                        </div>

                    </div>

                    <!-- 普通用户动态模块 -->
                    <script>

                        $(document).ready(function () {

                            function userShare() {

                                $.ajax({
                                    url: 'su',
                                    type: 'GET',
                                    dataType: "json",
                                    success: function (UsersList) {
                                        $("#chan").html("");
                                        $.each(UsersList, function (index, user) {

                                            var str = "<div style='background-color: pink; margin: 20px;padding: 20px;text-align:center;width: 150px; float: left;' class='img-circle '>" + "<a href='otherPage.jsp?otherID="+user.uid+"'>"
                                                    + "<img src='${initParam.userPath}"+user.uimg+"'  class='img-circle ' alt='头像' width='60' height='60'>" + "</a>" + "<br>"
                                                    + user.uname + "<br>"
                                                    + user.ugender + "<br>"
                                                    + user.uphone + "<br>"
                                                    + user.ubirth + "<br>"
                                                    + user.ustatus + "<br>"
                                                    + "</div>";
                                            $("#chan").append(str);
                                        });

                                    },
                                    error: function () {
                                        alert("出现错误!!!!");
                                    }
                                });
                            }
                            userShare();



                        });

                    </script>
                    <div role="tabpanel" class="tab-pane" id="chan"  >


                    </div>
                    <!--热门动态模块-->
                    <%--<div role="tabpanel" class="tab-pane" id="scho">--%>
                        <%--<div class="img-rounded"  style="background-color: hotpink; width:  200px;  height: 200px;"></div>--%>


                    <%--</div>--%>
                </div>
            </div>
        </div>

        <!--  编辑管理员信息表单验证-->
        <script >

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
                                        Adminname2: {
                                            message: '管理员验证失败',
                                            validators: {
                                                notEmpty: {message: '管理员不能为空'},
                                                stringLength: {min: 1, max: 8, message: '用户名长度必须为1位到8位之间'}
                                            }
                                        },
                                        AdminTelname: {
                                            message: '管理员电话验证失败',
                                            validators: {
                                                notEmpty: {message: '手机号不能为空'},
                                                stringLength: {min: 11, max: 11, message: '手机号必须为11位'}
                                            }
                                        },
                                        AdminEmname: {
                                            message: '管理员邮箱验证失败',
                                            validators: {
                                                notEmpty: {message: '邮箱不能为空'},
                                                emailAddress: {message: '请输入正确的邮箱地址'}
                                            }
                                        }
                                    }


                                });
                //             重置表单验证
                //                $('#submitbtn').click(function () {
                //        $('#form').data('bootstrapValidator').resetForm(true);
                //        });
            });
        </script>
        <!--修改密码表单验证-->
        <script >

            $(function () {
                $('#form1')
                        .bootstrapValidator(
                                {

                                    message: 'This value is not valid',
                                    feedbackIcons: {
                                        valid: 'glyphiconglyphicon-ok',
                                        invalid: 'glyphiconglyphicon-remove',
                                        validating: 'glyphiconglyphicon-refresh'
                                    },
                                    fields: {
                                        oldpwd: {
                                            validators: {
                                                notEmpty: {message: '密码不能为空'}

                                            }
                                        },
                                        newpwd: {
                                            validators: {
                                                notEmpty: {message: '新密码不能为空'},
                                                stringLength: {min: 6, max: 13, message: '密码必须为6-13位'}
                                            }
                                        },
                                        confirmpwd: {
                                            message: '密码无效',
                                            validators: {
                                                notEmpty: {message: '确认密码不能为空'},
                                                identical: {//相同
                                                    field: 'newpwd',
                                                    message: '两次密码不一致'
                                                },
                                                different: {//不能和用户名相同
                                                    field: 'Adminname2',
                                                    message: '不能和管理員相同'
                                                }

                                            }
                                        }


                                    }


                                });
                //             重置表单验证
                //                $('#submitbtn').click(function () {
                //        $('#form').data('bootstrapValidator').resetForm(true);
                //        });
            });

            $(document).ready(function () {
                ShowAdminImg();

                $("#SaveImg").click(function () {
                    if (!$("#GetImgid").val() == "") {
                        $("#SaveImg").attr("data-dismiss", "modal");

                        $.ajax({
                            url: 'uai',
                            type: 'POST',
                            data: $("#ImgForm").serialize(),
                            success: function () {
                                alert("头像修改成功");
                                $("#Here").attr("src", "images/" + $("#GetImgid").val());
                                $("#GetImgid").val("");
                                $("#SaveImg").removeAttr("data-dismiss");
                            },
                            error: function () {
                                alert("头像修改失败");
                            }
                        });

                    } else {
                        alert("请选择您的头像");
                    }

                });

            });

            function ShowAdminImg() {
                $.ajax({
                    url: "ShowAdminImg",
                    type: 'POST',
                    dataType: "json",
                    success: function (AdminImgsList) {
                        $.each(AdminImgsList, function (index, imgname) {
                            var sc = "<img   onclick='getValue(this)'   id=" + imgname + "  src='images/" + imgname + " 'width='60' height='60' >";

                            $("#ModalImgShow").append(sc);
                        });


                    },
                    error: function () {
                        alert("未显示成功!!!!");
                    }

                });
            }
            function getValue(obj) {
                var id = $(obj).attr("id");
                $("#GetImgid").val(id);
            }





        </script>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">请选择您的头像</h4>
                    </div>
                    <div class="modal-body" id="ModalImgShow">
                        <form  id="ImgForm">

                            <input  type="hidden"   id="Oldid" name="Oldid"  value="${Admin.getAid()}"/>
                            <input type="hidden"  id="GetImgid" name="GetIImgname" value=""/>

                    </div>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button  id="SaveImg" class="btn btn-primary" >保存</button>
                    </div>
                </div>
            </div>
        </div>
        <!--弹出重新登录模态框-->

        <div class="modal fade" id="reloginModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-sm"  style="margin-top: 250px">
                <div class="modal-content">
                    <div>
                        <h6 style="color:red;margin-left: 10%">下线通知 </h6>
                        <hr>
                    </div>
                    <div class="modal-body" align="center">
                        <p style="font-size: 20px; ">您的密码已修改，请<a href="manager.jsp">重新登录</a>.</p>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal -->

        </div>




    </body>
</html>