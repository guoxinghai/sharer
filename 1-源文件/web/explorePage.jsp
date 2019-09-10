<%-- 
    Document   : explorePage
    Created on : 2019-5-13, 19:36:30
    Author     : jiawe
--%>
<%@page import="java.util.Date" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>探索</title>
    <link rel="icon" href="icons/photo.png" type="image/x-icon">
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/explorePage.css" rel="stylesheet" type="text/css"/>
    <script>
        var id = 2;
        $(document).ready(function () {
            getRandomUsers();
            getRandomShare();

            /*$("#10").click(function () {
                $('#myModal10').modal(options);
            });*/

            $("#refresh").click(function () {
                $.ajax({
                    url: "US",
                    type: "POST",
                    data: {"item": 3},
                    success: function (data) {
                        var c = "";
                        for (var i = 0; i < data.length; i++) {
                            c = c + getRandomUSER(data[i]);
                        }
                        $("#randomUsers").html(c);
                    },
                    dataType: "json"
                })
            });
        });

        function getRandomShare() {
            $.ajax({
                url: "EP",
                type: "POST",
                success: function (out) {
                    var c = "";
                    for (var i = 1; i <= out.length; i++) {
                        c = c + getRandomSHARE(out[i-1]);
                        if(i%3===0){
                            c = c + "<div class='clearfix'></div><br>";
                        }
                    }
                    $(".RandomShare").html(c);
                },
                dataType: "json"
            })
        }


        function getRandomUsers() {
            $.ajax({
                url: "US",
                type: "POST",
                data: {"item": 3},
                success: function (data) {
                    var c = "";
                    for (var i = 0; i < data.length; i++) {
                        c = c + getRandomUSER(data[i]);
                    }
                    $("#randomUsers").html(c);
                },
                dataType: "json"
            })
        }

        function getRandomUSER(data) {
            var c = "<div class=\"\"><div class=\" col-md-3 col-sm-6 col-xs-10\"><div class=\"thumbnail\">";
            c = c + "<a href=\"otherPage.jsp?otherID="+data.uid+"\"><img src=\"${initParam.userPath}" + data.uimg + "\" alt=\"推荐\" class=\" img-circle img-thumbnail img-responsive\"></a><div class=\"caption\"><h5 style=\" text-align:  center\">";
            c = c + data.uname + "</h5><h5 style=\" text-align:  center; color:  #999999\">可能认识的人</h5>";
            c = c + "<p style=\" text-align:  center\"><a href=\"otherPage.jsp?otherID="+data.uid+"\" class=\"btn btn-primary\" role=\"button\" >详细</a> </p></div></div></div>"
            return c;
        }


        function shareLikeNumberOperate(item,sid) {
            $.ajax({
                url:"LS",
                data:{"item":item,"uid":id,"sid":sid},
                type:"POST",
                success:function (data) {
                }
            })
        }

        function setShareLikeNum(sid){
            var num = getShareLikeNum(sid);
            $("#share_love_num"+sid).html(num);
        }
        function setShareImg(sid){
            var flag = isLikeShare(sid);
            if(flag == "true"){
                $(".share_love").attr("data-flag",2);
                $(".share_love img").attr("src","icons/red_love.png");
            }else{
                $(".share_love").attr("data-flag",1);
                $(".share_love img").attr("src","icons/black_love.png");
            }
        }

        function getShareLikeNum(sid) {
            var num=0;
            $.ajax({
                url:"LS",
                type:"POST",
                data:{"item":1,"sid":sid},
                async:false,
                success:function(data){
                    num = data;
                }
            })
            return num;
        }
        function share_love_click(obj,sid){
            var num = parseInt($("#share_love_num"+sid).html());
            var flag = $(obj).attr("data-flag");
            if(flag == 1){
                shareLikeNumberOperate(2,sid);
                $(obj).find("img").attr("src","icons/red_love.png");
                $(obj).attr("data-flag",2);
                $("#share_love_num"+sid).html(num+1);
            }else{
                shareLikeNumberOperate(3,sid);
                $(obj).find("img").attr("src","icons/black_love.png");
                $(obj).attr("data-flag",1);
                $("#share_love_num"+sid).html(num-1);
            }
        }
        //判断用户是否给某个动态点赞了
        function isLikeShare(sid){
            var flag = "";
            $.ajax({
                url:"LS",
                type:"POST",
                async:false,
                data:{"item":4,"uid":id,"sid":sid},
                dataType:"text",
                success:function(data){
                    flag = data;
                }
            })
            return flag;
        }
    </script>
    <style>
        #bottom a {
            text-align: center;
            color: #003569;

        }
    </style>

</head>
<body style=" background:  #fafafb">
<%@include file="navigationBar.jsp" %>
<div class="container" style=" margin-top: 70px; width: 60%">
    <div style="">
        <h5 style="  color:  #999999;">发现用户<a href="#" id="refresh" style=' float:  right ; '>刷新</a></h5>
        <hr>
        <div style="">

            <div id="randomUsers" class="row">
<%--                <div class=" col-md-3 col-sm-4 col-xs-6">--%>
<%--                    <div class="thumbnail">--%>
<%--                        <img src="profilePicture/1.jpeg" alt="推荐" class=" img-circle img-thumbnail img-responsive">--%>
<%--                        <div class="caption">--%>
<%--                            <h5 style=" text-align:  center">用户名</h5>--%>
<%--                            <h5 style=" text-align:  center; color:  #999999">可能认识的人</h5>--%>
<%--                            <p style=" text-align:  center "><a href="#" class="btn btn-primary" role="button">关注</a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class=" col-md-3 col-sm-4 col-xs-6">--%>
<%--                    <div class="thumbnail">--%>
<%--                        <img src="profilePicture/2.jpeg" alt="推荐" class=" img-circle img-thumbnail img-responsive">--%>
<%--                        <div class="caption">--%>
<%--                            <h5 style=" text-align:  center">用户名</h5>--%>
<%--                            <h5 style=" text-align:  center; color:  #999999">可能认识的人</h5>--%>
<%--                            <p style=" text-align:  center "><a href="#" class="btn btn-primary" role="button">关注</a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class=" col-md-3 col-sm-4 hidden-xs">--%>
<%--                    <div class="thumbnail">--%>
<%--                        <img src="profilePicture/3.jpeg" alt="推荐" class=" img-circle img-thumbnail img-responsive">--%>
<%--                        <div class="caption">--%>
<%--                            <h5 style=" text-align:  center">用户名</h5>--%>
<%--                            <h5 style=" text-align:  center; color:  #999999">可能认识的人</h5>--%>
<%--                            <p style=" text-align:  center "><a href="#" class="btn btn-primary" role="button">关注</a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class=" col-md-3 hidden-sm hidden-xs ">--%>
<%--                    <div class="thumbnail">--%>
<%--                        <img src="profilePicture/4.jpeg" alt="推荐" class=" img-circle img-thumbnail img-responsive">--%>
<%--                        <div class="caption">--%>
<%--                            <h5 style=" text-align:  center">用户名</h5>--%>
<%--                            <h5 style=" text-align:  center; color:  #999999">可能认识的人</h5>--%>
<%--                            <p style=" text-align:  center "><a href="#" class="btn btn-primary" role="button">关注</a>--%>
<%--                            </p>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>


        </div>
        <script>
            function getRandomSHARE(out) {
                var num = getShareLikeNum(out.sid);
                var flag = isLikeShare(out.sid);
                var img="";
                if(flag=="false"){
                    img = "<a><span class=\"share_love\" data-flag=1 onclick=\"share_love_click(this,"+out.sid+")\"><img src=\"icons/black_love.png\"></span></a>"
                }else{
                    img = "<a><span class=\"share_love\" data-flag=2 onclick=\"share_love_click(this,"+out.sid+")\"><img src=\"icons/red_love.png\"></span></a>"
                }
            /*var c = "<div class=\" col-md-4 \">";
            c=c+"<a href=\"#\" class=\" thumbnail\" style=\" border: 0; border-color:  #999999\" data-toggle=\"modal\" data-target=\"#myModal"+out.sid+"\"> <img src=\"profilePicture/"+out.sid+".jpeg\" id=\""+out.sid+"\" alt=\"\"/></a>";
                c=c+"<div class=\"modal fade\" id=\"myModal"+out.sid+"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">";
                c=c+"<div class=\"modal-dialog modal-lg\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span\n" +
                    "                                            aria-hidden=\"true\">&times;</span></button>";
                c=c+"<h4 class=\"modal-title\" id=\"myModalLabel\">"+out.suid+"</h4></div><div class=\"modal-body\">";
                c=c+"<img src=\"profilePicture/"+out.sid+".jpeg\" alt=\"\" style=\" \"/><span>"+out.stext+"</span>";
                <%--c=c+"<c:set var=\"now\" value=\"<%=new Date()%>\"/> <p style=\" text-align:  center; margin-top: 10px\">"--%>
                c=c+"<p style=\" text-align:  center; margin-top: 10px\">"
                <%--c=c+"<fmt:formatDate value=\"${now}\" type=\"both\" pattern=\"yyyy/MM/dd HH:mm:ss E\"/>";--%>
                c=c+" </p>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"modal-footer\">\n" +
                    "                                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n" +
                    "                                    <button type=\"button\" class=\"btn btn-primary\"><span\n" +
                    "                                            class=\"glyphicon glyphicon-thumbs-up\"></span></button>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>";*/
                var c = "<div class=\" col-md-4 col-sm-4 col-xs-10 \">\n" +
                    "                    <a  class=\" thumbnail\" style=\" border: 0; border-color:  #999999\" data-toggle=\"modal\"\n" +
                    "                       data-target=\"#myModal"+out.sid+"\"> <img src=\"${initParam.sharePath}"+out.simg+"\" id=\""+out.sid+"\" class=\"img-responsive\"  alt=\"\"/></a>\n" +
                    "                    <div class=\"modal fade\" id=\"myModal"+out.sid+"\"tabindex=\"-1\" data-value=\""+out.sid+"\" role=\"dialog\" aria-labelledby=\"myModalLabel\">\n" +
                    "                        <div class=\"modal-dialog modal-lg\" role=\"document\">\n" +
                    "                            <div class=\"modal-content\">\n" +
                    "                                <div class=\"modal-header\">\n" +
                    "                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span\n" +
                    "                                            aria-hidden=\"true\">&times;</span></button>\n" +
                    "                                    <h4 class=\"modal-title\" id=\"myModalLabel\"><a href=\"otherPage.jsp?otherID="+out.suid+"\">作者主页</a></h4>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"modal-body \" align=\"center\">\n" +
                    "                                    <img src=\"${initParam.sharePath}"+out.simg+"\" alt=\"\" class=\"img-responsive\" />\n" +

                    "                                    <br><hr><p style=\" text-align:  center; margin-top: 10px\">"+out.stext+"</p><p style=\" text-align:  center; margin-top: 10px\">"+out.stime+"</p>\n" +
                    "                                    <p style=\" text-align:  center; margin-top: 10px\">\n" +
                    "                                        \n" +
                    "                                    </p>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"modal-footer\">\n" +
                    "                                    "+img+"<span><span id=\"share_love_num"+out.sid+"\">"+num+"</span>次赞</span>\n" +
                    // "                                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n" +
                    "                                </div>\n" +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </div>"
                return c;
            }
        </script>

        <div>
            <h5 style="  color:  #999999">探索</h5>
            <hr>
            <div class="row RandomShare">

                <%--<div class=" col-md-4 ">
                    <a href="#" class=" thumbnail" style=" border: 0; border-color:  #999999" data-toggle="modal"
                       data-target="#myModal10"> <img src="profilePicture/10.jpeg" id="10" alt=""/></a>
                    <div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">用户名</h4>
                                </div>
                                <div class="modal-body">
                                    <img src="profilePicture/10.jpeg" alt="" style=" "/>
                                    <span>asdasdasd</span>

                                    <c:set var="now" value="<%=new Date()%>"/>

                                    <p style=" text-align:  center; margin-top: 10px">
                                        <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd HH:mm:ss E"/>
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary"><span
                                            class="glyphicon glyphicon-thumbs-up"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class=" col-md-4 ">

                    <a href="#" class=" thumbnail" style=" border: 0; border-color:  #999999" data-toggle="modal"
                       data-target="#myModal11"> <img src="profilePicture/2.jpeg" id="11" alt=""/></a>
                    <div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">用户名</h4>
                                </div>
                                <div class="modal-body">
                                    <img src="profilePicture/2.jpeg" alt="" style=" width: 100%"/>


                                    <c:set var="now" value="<%=new Date()%>"/>

                                    <p style=" text-align:  center; margin-top: 10px">
                                        <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd HH:mm:ss E"/>
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Like!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class=" col-md-4">

                    <a href="#" class=" thumbnail" style=" border: 0; border-color:  #999999" data-toggle="modal"
                       data-target="#myModal10"> <img src="profilePicture/10.jpeg" id="10" alt=""/></a>
                    <div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">用户名</h4>
                                </div>
                                <div class="modal-body">
                                    <img src="profilePicture/10.jpeg" alt="" style=" width: 100%"/>


                                    <c:set var="now" value="<%=new Date()%>"/>

                                    <p style=" text-align:  center; margin-top: 10px">
                                        <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd HH:mm:ss E"/>
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Like!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




            &lt;%&ndash;            <div class="row">&ndash;%&gt;

            <div class=" col-md-4">

                <a href="#" class=" thumbnail" style=" border: 0; border-color:  #999999" data-toggle="modal"
                   data-target="#myModal1"> <img src="profilePicture/1.jpeg" id="1" alt=""/></a>
                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">用户名</h4>
                            </div>
                            <div class="modal-body">
                                <img src="profilePicture/1.jpeg" alt="" style=" width: 100%"/>


                                <c:set var="now" value="<%=new Date()%>"/>

                                <p style=" text-align:  center; margin-top: 10px">
                                    <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd HH:mm:ss E"/>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary"><span
                                        class="glyphicon glyphicon-thumbs-up"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class=" col-md-4">

                <a href="#" class=" thumbnail" style=" border: 0; border-color:  #999999" data-toggle="modal"
                   data-target="#myModal2"> <img src="profilePicture/2.jpeg" id="2" alt=""/></a>
                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">用户名</h4>
                            </div>
                            <div class="modal-body">
                                <img src="profilePicture/2.jpeg" alt="" style=" width: 100%"/>


                                <c:set var="now" value="<%=new Date()%>"/>

                                <p style=" text-align:  center; margin-top: 10px">
                                    <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd HH:mm:ss E"/>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Like!</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class=" col-md-4">

                <a href="#" class=" thumbnail" style=" border: 0; border-color:  #999999" data-toggle="modal"
                   data-target="#myModal3"> <img src="profilePicture/3.jpeg" id="3" alt=""/></a>
                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">用户名</h4>
                            </div>
                            <div class="modal-body">
                                <img src="profilePicture/3.jpeg" alt="" style=" width: 100%"/>


                                <c:set var="now" value="<%=new Date()%>"/>

                                <p style=" text-align:  center; margin-top: 10px">
                                    <fmt:formatDate value="${now}" type="both" pattern="yyyy/MM/dd HH:mm:ss E"/>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Like!</button>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
            <%--            </div>--%>


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

        <span style=' float:  right ; color:  #999999'>© 2019 AOLIGEI</span>
    </div>

</div>


</body>

</html>
