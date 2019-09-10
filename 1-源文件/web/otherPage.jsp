
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>OtherPage</title>
    <link rel="icon" href="icons/photo.png" type="image/x-icon">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <link rel="stylesheet" href="css/personalPage_css.css" >
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/otherPage_js.js"></script>
    <!--Loading动画css-->
    <link rel="stylesheet" href="css/loading_css.css" >
</head>
<body style="background-color:rgb(250,250,250);">
<jsp:include page="navigationBar.jsp"/>
<!--用户id-->
<%--<input type="hidden" value="${sessionScope.user.uid}" id="userID"/>--%>
<input type="hidden" value="${param.otherID}" id="otherID"/>
<input type="hidden" value="${sessionScope.user.uid}" id="userID"/>
<input type="hidden" value="${sessionScope.isAdmin}" id="isAdmin"/>
<!--用户头像-->
<input type="hidden" value="${initParam.userPath}" id="userPath"/>
<!--用户分享图片-->
<input type="hidden" value="${initParam.sharePath}" id="sharePath"/>
<div class="container">
    <!--loading动画-->
    <div class="spinner">
        <div class="rect1"></div>
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
        <div class="rect5"></div>
    </div>
    <!--用户头像和基本信息-->
    <div class="header">
        <div class="row"><!-- col-lg-2 col-lg-offset-2 col-md-2 col-md-2 col-md-offset-2 col-sm-offset-3 col-xs-offset-4 col-sm-2 col-xs-4-->
            <div class="user_img_div">
                    <!--style="margin-left: 40%;width: inherit"-->
                    <img src=""alt="用户头像" class="user_img img img-circle">
            </div>
            <div style="margin-top: 2%" class="col-lg-5 col-lg-offset-1 col-md-5 col-sm-5 col-xs-5 col-sm-offset-1 col-xs-offset-4">
                <span id="userName" style="font-size: 35px;font-weight: 200">adam.2671</span><br class="visible-xs"><br class="visible-xs">
                &nbsp;&nbsp;&nbsp;&nbsp;<span  id="userButton"><button style="margin-top: -4%" class="btn btn-default">已关注</button></span>
                <br><br>
                <span style="margin-left: 0px;font-weight: 400;"class="user_content"><span id="sharesNumber">0</span>&nbsp;帖子</span>
                <span class="user_content"><a id = "like"onclick="getLike()" class="userLike">0&nbsp;关注</a></span>
                <span class="user_content"><a id = "fan" onclick="getFan()" class="userLike">0&nbsp;粉丝</a></span><br><br>
                <h4 id="userWords">${sessionScope.user.uwords}</h4>
            </div>
        </div>
    </div>
    <br><br>
    <!--标签页（用户动态，和收藏动态）-->
    <div style="margin-left:15%"class="share col-lg-9">
        <div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#他的动态" aria-controls="home" role="tab" data-toggle="tab"><img style="display: inline-block" src="icons/动态.png"class="img-responsive">&nbsp;他的动态</a></li>
                <li role="presentation"><a href="#他的收藏" aria-controls="profile" role="tab" data-toggle="tab"><img style="display: inline-block" src="icons/收藏.png"class="img-responsive">&nbsp;他的收藏</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="他的动态">
                    <div id = "share_body"class="row">
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="他的收藏">
                </div>
            </div>
        </div>
    </div>
</div>

    <!--用户关注,粉丝静态块-->
    <!-- userLikeModal -->
    <div class="modal fade" id="userLikeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div style="width:25%; min-width: 300px" class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">关注列表</h4>
                </div>
                <div id="like_body"style="overflow-x: auto; overflow-y: auto;height: 400px;" class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- userFanModal -->
    <div class="modal fade" id="userFanModal" tabindex="-1" role="dialog" aria-labelledby="myFanLabel">
        <div style="width:25%; min-width: 300px"class="modal-dialog" role="document">
            <div  class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myFanLabel">粉丝列表</h4>
                </div>
                <div  id="fan-body"style="overflow-x: auto; overflow-y: auto;height: 400px;"class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!--UserShareModal-->
    <div id="share_modal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabel">动态详情</h4>
                </div>
                <div class="modal-body">
                    <div class="share row">
                        <div class="share_modal_img col-md-7 col-xs-7 col-sm-7">
                            <img class="inner_img img img-responsive" src="shareImages/defaultImg.jpeg"/>
                        </div>
                        <div class="text col-md-5 col-xs-5 col-sm-5">
                            <div class="share_user">
                                作者信息
                            </div>
                            <div class="share_modal_text col-md-12 panel panel-default">
                                <div class="share_text_body panel-body" style="overflow-y:auto;max-height:100px">
                                    <p>动态文字</p>
                                </div>
                            </div>
                            <div class="share_modal_comment col-md-12 hidden-xs hidden-sm panel panel-default">
                                <div id="comment_body" class="share_comment_body panel-body" style="overflow-y:auto;max-height:300px">
                                        <div class="share_commit_div">
                                            <div class="comment_user_div">
                                                <span><img style="display: inline-block" class="comment_img img-responsive img-circle" src="profilePicture/defaultImg.jpeg"></span><span>&nbsp;&nbsp;UserName</span>
                                            </div>
                                            <div class="comment_text_div">
                                                <p>文字评论</p>
                                            </div>
                                            <div class="comment_message">
                                                <span class="comment_time">1998-02-26</span>
                                                <span class="comment_num"><span class="glyphicon glyphicon-heart" style="color: red;"></span>&nbsp;521</span>
                                            </div>
                                        </div>
                                    <hr>
                                </div>
                            </div>
                            <div class="share_modal_message col-md-12 hidden-xs panel panel-default">
                                <div class="share_message_body panel-body" style="overflow-y:auto;max-height:300px">
                                    <div>
                                        <span class="share_love" data-flag=1 onclick="share_love_click()"><img src="icons/black_love.png"></span>
                                        <span class="share_comment" onclick="share_comment_click()" style="margin-left: 5%"><img src="icons/share_comment.png"></span>
                                        <span class="share_collection" data-flag="1" onclick="share_collection_click()" style="margin-left: 5%"><img src="icons/black_collection.png"></span><br><br>
                                        <p  style="font-size: 14px;font-weight: 400"><span id="share_love_num">521</span>次赞</p>
                                        <p  style="color:#999999;font-size: 12px;">2019-05-30 21:49:11.0</p><hr>
                                    </div>
                                    <!--输入框-->
                                    <div class="col-lg-12">
                                        <div class="input-group">
                                            <input id = "commit-button" type="text" class="form-control" placeholder="添加评论...">
                                            <span class="input-group-btn">
                                                    <button  class="btn btn-primary" onclick="commit()" type="button">发布</button>
                                                </span>
                                        </div><!-- /input-group -->
                                    </div><!-- /.col-lg-6 -->
                                </div><!-- /.row -->
                                <!--警示框-->
                                <div style="margin-left: 10%;width: 80%;display: none" id="alertMessage" class="alert alert-danger" role="alert">评论不能为空!</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
