<%--
  Created by IntelliJ IDEA.
  User: 24429
  Date: 2019/5/15
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>

<%@include file="navigationBar.jsp" %>
<%@page pageEncoding="UTF-8" %>

<html>
<head>
    <title>首页</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="icon" href="icons/photo.png" type="image/x-icon">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
    <script src="js/dropdown.js"></script>
    <script src="js/collapse.js"></script>
    <script src="js/transition.js"></script>

    <style>
        /*#commentText:focus {*/
        /*    outline: none;*/
        /*    border-color: #cfdc00;*/
        /*    box-shadow: 0 0 5px rgba(207, 220, 0, 0.4);*/
        /*    border-radius: 5px;*/
        /*}*/
        [placeholder~="添加评论..."]:focus {
            outline: none;
            border-color: #cfdc00;
            box-shadow: 0 0 5px rgba(207, 220, 0, 0.4);
            border-radius: 5px;
        }

        .panel {
            border-radius: 2px
        }

        body {
            background-color: #fafafa
        }

        #currentUserImg {
            height: 48px;
            width: 48px;
            margin-left: 20px;
            margin-top: 10px;
            display: inline-block;
        }

        #currentUserName {
            display: inline-block;
            font-weight: bold;
            margin-left: 9px;
            margin-top: 20px;
        }

        #default, #default1 {
            margin-left: 15px;
            margin-top: 20px;
        }


    </style>
</head>
<body>

<div class="row">
    <div class="col-md-2 col-sm-2 col-xs-1 ">
        <%--第一列--%>
    </div>

    <div class="col-md-5  col-sm-5 col-xs-10 ">
        <%--        发表动态部分开始--%>
        <div class="row thumbnail" style="margin-bottom: 40px;">
            <div style="margin-right: 0;margin-left: 0;margin-top: 20px;">
                <form role="form" style="">
                    <div class="form-group">
                        <textarea style="resize: none;border: none" placeholder="有什么新鲜事？" class="form-control" id="Stext"
                                  rows="3"></textarea>
                    </div>
                </form>

            </div>

            <div style="margin-top: -15px">
                <input style="position: absolute;opacity: 0;display: none" id="thisFile" type="file">
                <img style="float: left;margin-left:2px;margin-top: 8px"
                     id="browse" src="images/图片.png" alt="选择图片">
                <input type="text" id="showname" style="margin-left: 4px;margin-top: 8px;width: 95px">
                <button type="button" class="btn btn-info " id="uploadBtn"
                        style="float: right;margin-top: 5px;margin-right: 3px;">发表
                </button>
                <%--                <label for="visibleSelected">可见范围</label>--%>
                <select id="visibleSelected"
                        style="float: right;margin-right: 10px;margin-top: 8px;height: 28px;width: 95px">
                    <option selected="selected" value="0">所有人可见</option>
                    <option value="1">仅自己可见</option>
                </select>
            </div>
        </div>
        <%--            用户发表的动态在这个div里--%>
        <div id="sharePanel"></div>

        <%--        发表动态部分结束--%>
        <%--删--%>
        <%--        <div class="panel panel-default " style="margin-bottom: 0;margin-top: 40px">--%>
        <%--            <!-- Default panel contents -->--%>
        <%--            <div class="panel-heading;" style="background-color: #ffffff;">--%>
        <%--                &lt;%&ndash;            用户名、头像部分&ndash;%&gt;--%>
        <%--                <div>--%>
        <%--                    <div style="display: inline-block">--%>
        <%--                        <a href="#" class="img-responsive">--%>
        <%--                            <img class="img-circle " src="profilePicture/defaultImg.jpeg"--%>
        <%--                                 style="height: 40px;width: 40px;margin-bottom: 3px"--%>
        <%--                                 alt="用户头像">--%>
        <%--                        </a>--%>
        <%--                    </div>--%>
        <%--                    &nbsp;--%>
        <%--                    <div style="display: inline-block">--%>
        <%--                        <h5> haha</h5>--%>
        <%--                    </div>--%>
        <%--                </div>--%>

        <%--            </div>--%>
        <%--            &lt;%&ndash;            动态图片部分&ndash;%&gt;--%>
        <%--            <img class="img-responsive " src="profilePicture/test.jpg">--%>
        <%--        </div>--%>

        <%--   删             点赞、评论、转发部分--%>
        <%--        <div class="panel panel-default">--%>
        <%--            <!-- Default panel contents -->--%>
        <%--            <div class="panel-heading" style="background-color: #ffffff ;">--%>
        <%--                &lt;%&ndash;                <div class="feed" id="feed1">&ndash;%&gt;--%>
        <%--                &lt;%&ndash;                                    点赞&ndash;%&gt;--%>
        <%--                <div class="heart "--%>
        <%--                     style="margin-top: -25px;margin-left: 10px;display: inline-block;position: absolute;z-index: 0;"--%>
        <%--                     id="like1" rel="like"></div>--%>

        <%--                &lt;%&ndash;                评论&ndash;%&gt;--%>
        <%--                <div style="display: inline-block;margin-top: 3px;margin-left: 35px;position: absolute;z-index: 1"><img--%>
        <%--                        src="images/评论%20(2).png"></div>--%>

        <%--                &lt;%&ndash;                分享&ndash;%&gt;--%>
        <%--                <div style="float: right;margin-right: -10px"><img src="images/星星线描%20(1).png"></div>--%>
        <%--                &lt;%&ndash;            <div style="float: right;margin-right: -10px"><img src="images/星星_选中.png"></div>&ndash;%&gt;--%>
        <%--                <div style="margin-top:6px;margin-left: 77px"><img src="images/分享%20(3).png"></div>--%>
        <%--                <div class="likeCount" style="width: 30px;margin-left: -8px;margin-top: 2px" id="likeCount1">14</div>--%>

        <%--                <div style="margin-left: 15px;margin-top: -20px;float: left"><b>&nbsp;次赞</b></div>--%>
        <%--                    <div style="margin-top: 5px" class="row"><h5 style="display: inline-block;margin-left: 10px;font-weight: 600">Adam</h5><h5 style="display: inline-block">&nbsp;旋转 跳跃 我闭着眼</h5></span> </div>--%>
        <%--                    <a href="#" style="margin-left: -5px;color: #8c8c8c">查看全部评论</a>--%>
        <%--                &lt;%&ndash;                            </div>&ndash;%&gt;--%>

        <%--            </div>--%>
        <%--        </div>--%>


        <%--    </div>--%>
    </div>
    <%--    这个div用来存放响应隐藏面板--%>

    <div class="col-md-3 col-sm-3  hidden-xs">
        <div class="row" style="position: fixed;">
            <a href="personalPage.jsp"><img class="img-circle" id="currentUserImg"
                                            src="${initParam.userPath}${sessionScope.user.uimg}"></a>
            <h5 id="currentUserName" style="display: inline-block">${sessionScope.user.uname}</h5>
            <div class="row thumbnail" style="padding: 10px;width: 270px" id="default1">
                <div><h5 style="color: #8c8c8c">个性签名</h5></div>
                <div style="margin-top: 13px">
                    <h5 style="">${sessionScope.user.uwords}&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; </h5>
                </div>
            </div>

            <div class=" thumbnail" style="margin-top:-8px;padding: 10px;width: 270px" id="default">

                <div><h5 style="color: #8c8c8c">为你推荐</h5></div>

                <div style="margin-top: 13px" id="recommend">
                    <div style="margin-top: 10px"><img src="profilePicture/defaultImg.jpeg" class="img-circle"
                                                       style="display: inline-block;margin-left:10px;height: 35px;width:35px">
                        <h5 style="display: inline-block;margin-left: 10px">haha</h5><h5
                                style="margin-left:70px;margin-right:10px;margin-top:5px;display:inline-block;color: #3897f0;">
                            关注</h5>
                    </div>
                </div>


            </div>
            <div><span style="color:#c7c7c7;font-size: smaller;margin-left: 18px">关于我们&nbsp;支持&nbsp;新闻中心&nbsp;工作&nbsp;隐私&nbsp;使用条款&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目录&nbsp;
                个人主页&nbsp;话题&nbsp;标签&nbsp;语言 </span>
                <div style="margin-top: 10px"><span style="color:#c7c7c7;font-size: x-small;margin-left: 18px;">© 2019 SHARER</span></div>
            </div>

        </div>


    </div>

    <div class="col-md-2 col-sm-2 col-xs-1 ">


    </div>


</div>
</body>

<script>
    var Kuid = "${sessionScope.user.uid}";  // 存储的当前登录用户的uid
    var start = 1;
    var path = "${applicationScope.path}";
    $(document).ready(function () {
        getRandomUsers();

        // 初始化界面
        created();

        function created() {
            var csid;
            $.ajax({
                url: 'sss',
                type: 'GET',
                data: {Uid: ${sessionScope.user.uid}, start: start},
                async: false,
                dataType: "json",
                success: function (shareList) {


                    $.each(shareList, function (index, share) {
                        var url = "#";
                        csid = share.sid;
                        // 可以在这对发此条动态的用户进行查询,应该要改成同步的
                        var userInfoList = {}; // 用userInfoList来接收用户的数据
                        $.ajax({
                            url: "sus",
                            type: 'POST',
                            data: {Suid: share.suid},
                            dataType: "json",
                            async: false,
                            success: function (userInfo) {

                                userInfoList = userInfo;
                            },
                            error: function () {
                                alert("error!")
                            }
                        });

                        url="otherPage.jsp?otherID=" + userInfoList.uid;

                        // console.log('userInfoList', userInfoList);
                        // console.log('shareTest', share.stext);
                        // console.log('shareTest', share.sid);
                        var s1 = "    <div class=\"panel panel-default\" style=\"margin-bottom: 0px;\">\n" +
                            "        <!-- Default panel contents -->\n" +
                            "        <div class=\"panel-heading\" style=\"background-color: #ffffff\">\n" +
                            "            <%--            用户名、头像部分--%>\n" +
                            "            <div>\n" +
                            "                <div style=\"display: inline-block\">\n" +
                            "                    <a href=\""+url+"\" class=\"img-responsive\">\n" +
                            "                        <img class=\"img-circle \" src=\"${initParam.userPath}" + userInfoList.uimg + "\"\n" +
                            "                             style=\"height: 40px;width: 40px;margin-bottom: 3px\"\n" +
                            "                             alt=\"用户头像\">\n" +
                            "                    </a>\n" +
                            "                </div>\n" +
                            "                &nbsp;\n" +
                            "                <div style=\"display: inline-block\">\n" +
                            "                    <h5 ><b> " + userInfoList.uname + "</b></h5>\n" +
                            "                </div>\n" +
                            "            </div>\n" +
                            "\n" +
                            "        </div>\n" +
                            "        <%--            动态图片部分--%>\n" +
                            "        <img class=\"img-responsive center-block \" src=\"${initParam.sharePath}" + share.simg + "\">\n" +
                            "    </div>";


                        var s2 = "    <%--        点赞、评论、转发部分--%>\n" +
                            "    <div class=\"panel panel-default\">\n" +
                            "        <!-- Default panel contents -->\n" +
                            "        <div class=\"panel-heading\" id=\"doPanel\" style=\"background-color: #ffffff ;\">\n" +
                            "            <%--                <div class=\"feed\" id=\"feed1\">--%>\n" +
                            "        <%--            点赞--%>\n" +
                            "          <a style=\"display: block;width:30px\" id=\"like" + share.sid + "\" href=\"javascript:updateLike('" + share.sid + "')\">" + isLiked(share.sid) + " </a>" + // 为作区分，点赞按钮的超链接的id取名为like+sid
                            "        <%--                评论--%>\n" +
                            "            <div style=\"display: inline-block;margin-top: -2px;margin-left: 35px;position: absolute;z-index: 1\"><img\n" +
                            "                    src=\"images/评论%20(2).png\"></div>\n" +
                            "        <%--                分享--%>\n" +
                            "            <div style=\"margin-top:2px;margin-left: 77px\"><img src=\"images/分享%20(3).png\"></div>\n" +
                            // 收藏
                            "            <a id=\"" + share.sid + "\" href=\"javascript:updateKeep('" + share.sid + "')\"><div id=\"keep\" style=\"float: right;margin-right: -10px;margin-top:-30px\">" + iskeep(share.sid) + "</div>\n</a>" +

                            "            <div id=\"likesCount" + share.sid + "\" class=\"likeCount\" style=\"width: 30px;margin-left: -5px;margin-top: 2px\">" + getLikesCount(share.sid) + "</div>\n" +
                            "\n" +
                            "          <div  style=\"margin-left: 15px;margin-top: -23px;float: left\"><b>次赞</b></div>\n" +
                            "                <div></div>\n";


                        let s3 = "<div style=\"margin-top: 2px\" class=\"row\"><h5 style=\"display: inline-block;margin-left: 10px;font-weight: 600\">" + userInfoList.uname + "</h5><h5 style=\"display: inline-block\">&nbsp;" + share.stext + "</h5></span> </div>\n";

                        let s4 = "          <div>" +
                            "<a id=\"fold" + share.sid + "\" data-toggle=\"collapse\" style='margin-left: -5px;color: #8c8c8c;text-decoration: none' data-parent=\"#accordion\"\n" +
                            "                       href=\"#collapseOne" + share.sid + " \" class=\"myCollapse\">\n" +
                            "                        查看全部评论\n" +
                            "</a>\n" +
                            "            <div id=\"collapseOne" + share.sid + "\" class=\" collapse \">\n" +
                            "            </div><div></div>"; // 这里包括一个面板的div

                        let s5 = "<hr><div><input id='commentText" + share.sid + "' type='text'  style='border: none;margin-top: -10px;'  placeholder='添加评论...'/>" +
                            "<h5 id='commitComment' onclick='commitComment(" + share.sid + ")' style='cursor:pointer;color: #3897f0;float: right;margin-top: 0px '>发布</h5></div>"


                        $('#sharePanel').append(s1 + s2 + s3 + s4 + s5);

                        (function getComment() {
                            $.ajax({  // 请求所有评论
                                url: "cs",
                                type: "POST",
                                dataType: "json",
                                data: {item: 1, sid: csid},
                                async: false,
                                success: function (commentArray) {

                                    // console.log(commentArray);
                                    $.each(commentArray, function (index, comment) {
                                        var cname;  // 评论者的名称
                                        $.ajax({
                                            url: "cs",
                                            type: "POST",
                                            async: false,
                                            // dataType:"text",
                                            data: {item: 2, cuid: comment.cuid},
                                            success: function (uname) {
                                                cname = uname;
                                            },
                                            error: function () {
                                                console.log("获取评论者的名称出错！")
                                            }
                                        });

                                        $("#collapseOne" + csid).append("<div style=\"margin-top: 2px\" class=\"row\"><h5 style=\"display: inline-block;margin-left: 10px;font-weight: 600\">" + cname + ":</h5><h5 style=\"display: inline-block\">&nbsp;" + comment.ctext + "</h5></div>");
                                    });


                                },
                                error: function () {
                                    alert("获取评论出错！")
                                }

                            });
                        })()

                    }); // 动态列表遍历一次后也就是一条动态生成后，再生成评论

                },
                error: function () {
                    alert("error!")
                }

            });


        }


        $(".myCollapse").click(function () {// 修复折叠面板的bug
            var itemHref = $(this).attr("href");
            // console.log( $(this).attr("id"));
            var itemClass = $(itemHref).attr("class");
            if (itemClass === "panel-collapse collapse") {
                $(itemHref).attr("class", "panel-collapse collapse in").css("height", "auto");

                $(this).text("收起所有评论")
            } else {
                $(itemHref).attr("class", "panel-collapse collapse").css("height", "0px");

                $(this).text("查看所有评论")
            }

            return false;//停止运行bootstrap自带的函数
        });

        // 展示图片路径
        $('#browse').click(function makeThisFile() {
                $('#thisFile').click();
            }
        );


        // 当此元素的值发生改变时调用此函数
        $('#thisFile').change(function () {
            var path = $('#thisFile').val();  // 文件路径
            var fileNameIndex = path.lastIndexOf("\\") + 1;
            var filename = path.substr(fileNameIndex);
            $('#showname').val(filename)

        });

// 滚动加载更多

        $(window).scroll(function () {
            var scrolltop = $(document).scrollTop();
            var scrollheight = $(document).height();
            var widowheight = $(window).height();
            if (scrolltop + widowheight + 1 >= scrollheight) {
                start++;
                created();
                // console.log('start' + start);
            }
        });

        // 滚动到顶部刷新

        // $(window).scroll(function(){
        //     if($(document).scrollTop()==0){
        //         console.log("hh")
        //     created()
        //     }
        // });
        $('#uploadBtn').click(function btu() { // 发表动态
            start = 1;
            // var name=$("#name").val();
            var Svisable = $('#visibleSelected').val();
            var file = $("#thisFile")[0].files[0];//新特性，获取文件对象
            var Stext = $("#Stext").val();
            var fordata = new FormData();//新特性，得到formData对象，把获取的值扔进去，相当于map
            fordata.append("Svisible", Svisable);
            fordata.append("Stext", Stext);
            fordata.append("file", file);
            // console.log(file);
            // console.log('visable', Svisable);
            $.ajax({
                url: "uss",
                data: fordata,
                cache: false,
                processData: false, //必须写
                contentType: false, //必须写
                type: "post",
                success: function (data) {
                    console.log("Success")
                },
                complete: function () {
                    $("#Stext").val("");
                    $("#showname").val("");
                    $("#sharePanel").html('');
                    created();
                }
            })
        });

// 查询收藏按钮初始状态
        function iskeep(Ksid) {
            var flag = false;
            // console.log("run");
            var unSelected = "<img title=\"收藏\" id=\"unSelected\" src=\"images/星星线描%20(1).png\">";
            var selected = "<img title=\"取消收藏\" id=\"selected\" src=\"images/星星_选中.png\">";
            $.ajax({
                url: "iks",
                async: false,
                type: 'POST',
                data: {Kuid: Kuid, Ksid: Ksid},
                dataType: 'text',
                success: function (status) {
                    // console.log('status', status);

                    if (status === "true") {
                        // $('#keep').html(selected);
                        flag = true;
                    }
                },
                error: function () {
                    alert("error!")
                }

            });
            if (flag === true) {
                return selected;
            } else {
                return unSelected
            }
        }


    });

    // 收藏按钮的操作
    function updateKeep(Sid) {
        var flag = 0;
        var unSelected = "<img title=\"收藏\" id=\"unSelected\" src=\"images/星星线描%20(1).png\">";
        var selected = "<img title=\"取消收藏\"   id=\"selected\" src=\"images/星星_选中.png\">";
        if ($("#" + Sid + " #selected").length > 0) {  // 原来选中点击变为不选中,取消收藏
            $.ajax({
                type: 'POST',
                url: "uks",
                dataType: "text",
                async: false,
                data: {flag: flag, Kuid: Kuid, Ksid: Sid},
                success: function (deleteStatus) {
                    if (deleteStatus === "true") {
                        $("#" + Sid + " #keep").html(unSelected);
                    } else {
                        console.log("取消收藏失败！")
                    }
                },
                error: function () {
                    console.log("error1")
                }
            });

            // console.log("存在选中！");
        } else { // 原来不选中点击变为选中，收藏
            flag = 1;
            $.ajax({
                type: 'POST',
                url: "uks",
                dataType: "text",
                async: false,
                data: {flag: flag, Kuid: Kuid, Ksid: Sid},
                success: function (insertStatus) {
                    if (insertStatus === "true") {
                        $("#" + Sid + " #keep").html(selected);
                    } else {
                        console.log("收藏失败！")
                    }
                },
                error: function () {
                    console.log("error2")
                }
            });

        }
    }

    // 点赞按钮初始状态
    function isLiked(Lsid) {
        var flag = false;
        var liked = "<div class=\"heart heartAnimation\" style=\"margin-top:-30px;margin-left:10px;display:inline-block;position:absolute;z-index:0;\" id=\"likeOrUnlike\" rel=\"like\"></div>";
        var unLiked = "<div class=\"heart \" style=\"margin-top:-30px;margin-left:10px;display:inline-block;position:absolute;z-index:0;\" id=\"likeOrUnlike\" rel=\"unlike\"></div>";
        $.ajax({
            url: "IsLikedServlet",
            dataType: "text",
            type: "POST",
            async: false,
            data: {Luid: Kuid, Lsid: Lsid},
            success: function (status) {
                if (status === "true") {
                    flag = true;
                }
            },
            error: function () {
                alert("error")
            }
        });
        if (flag === true) {
            return liked;
        } else {
            return unLiked;
        }
    }

    // 修改点赞按钮状态
    function updateLike(Lsid) {
        // console.log("a");
        var a = "#like" + Lsid + " #likeOrUnlike";
        var flag = 0; // 0代表没点赞取消点赞 1代表点赞";
        var status = $(a).attr("rel");
        // console.log(status);
        $(a).css("background-position", "");
        if (status === 'unlike') {  // 如果原来没点赞，执行点赞操作
            flag = 1;
            $.ajax({
                url: "UpdateLikesServlet",
                type: "post",
                dataType: "text",
                data: {flag: flag, Lsid: Lsid, Luid: Kuid},
                success: function (insertStatus) {
                    if (insertStatus === "true") {
                        $(a).addClass("heartAnimation").attr("rel", "like");
                        $("#likesCount" + Lsid).html(getLikesCount(Lsid));


                    } else {
                        console.log("添加点赞失败!");
                    }
                },
                error: function () {
                    alert("error")
                }
            });


        } else {  // 执行取消点赞操作
            flag = 0;
            $.ajax({
                url: "UpdateLikesServlet",
                type: "post",
                async: false,
                dataType: "text",
                data: {flag: flag, Lsid: Lsid, Luid: Kuid},
                success: function (insertStatus) {
                    if (insertStatus === "true") {
                        $(a).removeClass("heartAnimation").attr("rel", "unlike");
                        $(a).css("background-position", "left");
                        $("#likesCount" + Lsid).html(getLikesCount(Lsid));
                    } else {
                        console.log("取消点赞失败!");
                    }

                },
                error: function () {
                    alert("error");
                }
            });

            // $(a).removeClass("heartAnimation").attr("rel", "unlike");
            // $(a).css("background-position", "left");
        }
    }

    function getLikesCount(Lsid) {
        var count;
        $.ajax({
            url: "LikesCountServlet",
            dataType: "text",
            type: "post",
            data: {Lsid: Lsid},
            async: false,
            success: function (likesCount) {
                count = likesCount
                // $("#likescount"+Lsid).html(likesCount);
            },
            error: function () {
                console.log("查询赞数失败")
            }
        });
        // console.log("count", count);
        return count;

    }

    function commitComment(csid) {  // 发表评论功能

        if ($("#commentText" + csid).val() === "") {
            $("#commentText" + csid).attr('placeholder', "请先输入评论内容！")
        } else {
            $("#commentText" + csid).attr('placeholder', "添加评论...")
            $.ajax({
                url: "cs",
                async: false,
                type: "POST",
                data: {cuid: Kuid, csid: csid, item: 3, text: $("#commentText" + csid).val()},
                dataType: "text",
                success: function (num) {  // 返回受影响的函数
                    var a = Number(num);
                    if (a > 0) {

                        var cname = "${sessionScope.user.uname}";
                        $("#collapseOne" + csid).prepend("<div style=\"margin-top: 2px\" class=\"row\"><h5 style=\"display: inline-block;margin-left: 10px;font-weight: 600\">" + cname + ":</h5><h5 style=\"display: inline-block\">&nbsp;" + $("#commentText" + csid).val() + "</h5></div>");
                        $("#commentText" + csid).val("")
                    }

                },
                error: function () {
                    alert("插入动态失败!")
                }
            })
        }

    }

    function getRandomUsers() {
        $.ajax({
            url: "US",
            type: "POST",
            data: {"item": 3},
            success: function (data) {
                var c = "";
                for (var i = 0; i < 3; i++) {
                    c = c + getRandomUSER(data[i]);
                }
                $("#recommend").html(c);
            },
            dataType: "json"
        })
    }

    function getRandomUSER(user) {
        var url = "otherPage.jsp?otherID=" + user.uid;
        var c = "   <div style=\"margin-top: 10px\"><img src=\"${initParam.userPath}" + user.uimg + "\" class=\"img-circle\"\n" +
            "                                                           style=\"display: inline-block;margin-left:5" +
            "px;height: 35px;width:35px\">\n" +
            "                            <h5 style=\"display: inline-block;margin-left: 10px;\">" + user.uname + "</h5><a href=\"" + url + "\" id=\"recommend" + user.uid + "\";><h6\n" +
            "                                   style=\"font-weight: bold;float:right;margin-top:10px;margin-right:5px;display:inline-block;color: #3897f0;\">详情</h6></a>\n" +
            "                        </div>";

        return c;
    }

    function updateFollow(uname) {
        function follow(name) {
            $.ajax({
                url: "FOS",
                async: false,
                type: "POST",
                data: {"Uid": id, "flag": 1, "Uname": name}
            })
        }

        function unFollow(name) {
            $.ajax({
                url: "FOS",
                async: false,
                type: "POST",
                data: {"Uid": id, "flag": 2, "Uname": name}
            })
        }

    }


</script>
</html>