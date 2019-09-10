
var sstart = 0;//标志获取动态的开始位置
var kstart = 0;//标志获取收藏的开始位置
var id = 2;
var userPath = "";
var sharePath = "";
//为窗口绑定滚动事件
$(function(){
    id = $("#userID").val();
    userPath = $("#userPath").val();
    sharePath = $("#sharePath").val();
    getShare(id);//加载动态
    getKeep(id);//加载收藏
    setLikeNumber();//设置关注数
    setFanNumber();//设置粉丝数
    setShareNumber();//设置动态的数量
    //监听滚动条
    $(window).scroll(function (){
        var scrolltop = $(document).scrollTop();
        var scrollheight = $(document).height();
        var widowheight = $(window).height();
        if(scrolltop+widowheight+1>=scrollheight){
            if($("#我的动态").css("display")=="block"){
                //获取我的动态
                getShare(id);
            }else{
                //获取我的收藏
                getKeep(id);
            }
        }
    })
    //设置用户鼠标悬浮在头像上时显示提示信息
    //鼠标位于 a标签上方时发生 mouseover 事件
    $(".user_img").mouseover(function (e) {
        $("body").append("<div id='div_toop'>" + "修改头像" + "</div>");//将要显示的内容添加到 新建 div标签中 并追加到 body 中
        $("#div_toop")
            .css({
                //设置 div 内容位置
                "top": (e.pageY + 10) + "px",
                "position": "absolute",//添加绝对位置
                "left": (e.pageX + 20) + "px",
                "background-color":"white",
                "font-size":"10px",
                "padding":"3px"
            })
            .show("fast");// show(spe.ed,callback) speed: xian'shi'su'du
            }).mouseout(function () { //鼠标指针从 头像 上离开时 发生mouseout 事件
                $("#div_toop").remove();//移除对象
            }).mousemove(function (e) { //鼠标指针在 头像 中移动时 发生mouseout 事件
                $("#div_toop")
                    .css({
                        //设置 div 内容位置
                        "top": (e.pageY + 10) + "px",
                        "position": "absolute",//添加绝对位置
                        "left": (e.pageX + 20) + "px"
                    });
            });
});
function getFan(){
    showModal($("#userFanModal"));
    $.ajax({
        url:"FS",
        type:"POST",
        data:{"Uid":id,"flag":1},
        success:function (data) {
            var c = "";
            if(data.length==0){
                c = "<p>还没有人关注你欧~</p>";
            }
            for(var i=0;i<data.length;i++){
                c = c + "<div class=\"panel panel-default\"><div class=\"panel-body\">";
                c = c + getFanHtml(data[i]);
                c = c + getButtonHtml(data[i]);
                c = c + "</div></div>";
            }
            $("#fan-body").html(c);
        },
        dataType:"json"
    })
}
function getButtonHtml(data){
    var c="";
    var button_flag = "";
    var text_flag = "关注";
    var value_flag = "2";
    var btn_flag = "btn-primary";
    if(isFan(id,data.uid)=="true"){
        text_flag = "已关注";
        value_flag = "1";
        btn_flag = "btn-default"
    }
    if(id == data.uid){
        button_flag = "disabled =\"disabled\"";
    }
    c = c + "<button "+button_flag+"name=\""+data.uname+"\""+"onclick=\"fanClick(this)\" value=\""+value_flag+"\" class=\"btn-userLike btn "+btn_flag+" btn-sm\">"+text_flag+"</button></div><div class=\"clearfix\"></div>";
    return c;
}
function getLike(){
    showModal($("#userLikeModal"));
    $.ajax({
        url:"FS",
        type:"POST",
        data:{"Uid":id,"flag":2},
        success:function (data) {
            var c = "";
            if(data.length == 0){
                c = "<p>还未关注任何人欧~</p>"
            }
            for(var i=0;i<data.length;i++){
                c = c + "<div class=\"panel panel-default\"><div class=\"panel-body\">";
                c = c + getFanHtml(data[i]);
                c = c + "<button name=\""+data[i].uname+"\""+" onclick=\"fanClick(this)\" value=\"1\" class=\"btn-userLike btn btn-default btn-sm\">已关注</button></div><div class=\"clearfix\"></div>";
                c = c + "</div></div>";
            }
            $("#like_body").html(c);
            setLikeNumber();
        },
        dataType:"json"
    })
}
function setLikeNumber(){
    $.ajax({
        url:"FS",
        type:"POST",
        data:{"Uid":id,"flag":4},
        success:function (data) {
            var c = "";
            c = data+"&nbsp;关注";
            $("#like").html(c);
        },
    })
}
function setFanNumber(){
    $.ajax({
        url:"FS",
        type:"POST",
        data:{"Uid":id,"flag":3},
        success:function (data) {
            var c = "";
            c = data+"&nbsp;粉丝";
            $("#fan").html(c);
        },
    })
}
function  getFanHtml(data) {
    var c="";
    var words = ""
    var url="";
    if(id==data.uid){
        url = "personalPage.jsp";
    }else{
        url = "otherPage.jsp?otherID="+data.uid;
    }
    c = c + "<div style=\"width:18%;height: 15%;float: left\"><a href=\""+url+"\"><img src=\""+userPath+data.uimg+"\" style='width: 55px;height: 55px;' class=\"img-responsive img-circle\"></a></div>";
    c = c + "<div class=\"fan_div\"><span><b class=\"fan_name\">"+data.uname+"</b></span>";
    if(!(data.uwords==""||data.uwords==null||data.uwords==undefined)){
        words = data.uwords;
    }
    c = c + "<p class=\"fan_words\">"+words+"</p></div>";
    return c;

}
function isFan(fid,sid){
    var flag = 'false';
    $.ajax({
        url:"IFS",
        async:false,
        type:"POST",
        data:{"Fid":fid,"Sid":sid},
        success:function(data) {
            flag = data;
        },
        dataType:"text"
    })
    return flag;
}
function fanClick(obj){
    var v = $(obj).attr("value");
    if(v=="1"){
        //已经关注了
        unFollow($(obj).attr("name"));
        $(obj).text("关注");
        $(obj).attr("value","2");
        $(obj).attr("class","btn-userLike btn btn-primary btn-sm");
        setLikeNumber(id);
    }else {
        //没关注
        follow($(obj).attr("name"));
        $(obj).text("已关注");
        $(obj).attr("value","1");
        $(obj).attr("class","btn-userLike btn btn-default btn-sm");
        setLikeNumber(id);
    }
}
function follow(name){
    $.ajax({
        url:"FOS",
        async:false,
        type:"POST",
        data:{"Uid":id,"flag":1,"Uname":name}
    })
}
function unFollow(name){
    $.ajax({
        url:"FOS",
        async:false,
        type:"POST",
        data:{"Uid":id,"flag":2,"Uname":name}
    })
}

//获取动态
function getShare() {
    $.ajax({
        url: "SS",
        type: "POST",
        async: false,
        data: {"Uid": id, "flag": 0, "start": sstart, "item": 1},
        success: function (data) {
            if (data.length == 0) {
                return;
            }
            sstart += data.length;
            for (var i = 0; i < data.length; i++) {
                var h = getShareHtml(data[i]);
                $("#我的动态").append(h);
            }
        },
        dataType: "json"
    })
}
//获取收藏
function getKeep(){
    $.ajax({
        url:"KS",
        type:"POST",
        async:false,
        data:{"item":1,"uid":id,"start":kstart},
        success:function (data) {
            if(data.length==0){
                return ;
            }
            kstart += data.length;
            for (var i=0;i<data.length;i++){
                var h = getShareHtml(data[i]);
                $("#我的收藏").append(h);
            }
        },
        dataType:"json"
    })
}
//判断用户是否收藏了某个动态
function isKeep(sid){
    var flag = "";
    $.ajax({
        url:"KS",
        type:"POST",
        data:{"item":2,"uid":id,"sid":sid},
        async:false,
        success:function(data){
            flag = data;
        }
    })
    return flag;
}
//获取share动态html
function getShareHtml(data){
    var h = "<div class=\"share_div col-lg-4 col-md-4 col-xs-4 thumbnail\"><div class=\"share_cover\" onclick=\"setShareModalContent(this)\" data-id=\""+data.sid+"\" >";
    h = h + "<div class=\"share_cover_data\">";
    var num = getShareLikeNum(data.sid);
    var cnum = getShareCommentNumber(data.sid);
    h = h + "<span class=\"share_cover_heart\"><img src=\"icons/heart.png\">&nbsp;<span id=\"share_cover_num_"+data.sid+"\">"+num+"</span></span>";
    h = h + "<span class=\"share_cover_comment\"><img src=\"icons/comment.png\">&nbsp;<span id=\"share_cover_cnum_"+data.sid+"\">"+cnum+"</span></span></div></div>";
    var img;
    if(data.simg != "null"){
        img = data.simg;
    }else{
        img = "defalutImg.jpeg"
    }
    h = h + "<img class=\"share_img\" src=\""+sharePath+img+"\" class=\"img-responsive img-rounded \">";
    return h;
}
function setShareModalHeight(){
    var img_height = $(".share_modal_img").height();
    console.log(img_height);
    $(".text").css("height",img_height+"px");
}
function setShareModalContent(obj){
    showModal($(".bs-example-modal-lg"));
    $.ajax({
        url:"SS",
        type:"POST",
        async:true,
        data:{"Sid":$(obj).attr("data-id"),"item":"2"},
        beforeSend:function(){
            $(".spinner").css("display","inline-block");
            setInterval(setLoading,500);
        },
        success:function (data) {
            var c = "";
            if(data.length==0){
                return ;
            }
            //设置share图片
            $(".inner_img").attr("src",sharePath+data.simg);
            //给share图片设置一个data-sid属性
            $(".inner_img").attr("data-sid",data.sid);
            //设置share作者信息
            setShareUser(data.suid);
            //设置share文字
            $(".share_text_body").html("<p>"+data.stext+"</p>")
            //设置share评论
            getComment(data.sid);
            //设置share获赞数
            setShareLikeNum(data.sid);
            //设置share点赞图片
            setShareImg(data.sid);
            //设置share收藏图片
            setShareCollectionImg(data.sid);
            //设置删除按钮
            setShareDeleteButton(data.suid,data.sid);
        },
        dataType:"json"
    })
}
function setShareUser(uid){
    $.ajax({
        url:"US",
        type:"POST",
        async:true,
        data:{"Uid":uid,"item":"1"},
        success:function (data) {
            var c = "";
            if(data.length==0){
                return ;
            }
            //设置share作者信息
            c = c + "<div class=\"panel panel-default\"><div class=\"panel-body\">";
            c = c + getFanHtml(data);
            c = c + getButtonHtml(data);
            c = c + "</div></div>";
            $(".share_user").html(c);
        },
        dataType:"json"
    })
}
function getComment(sid){
    $.ajax({
        url:"CS",
        type:"POST",
        data:{"item":1,"sid":sid},
        dataType:"json",
        success:function (data) {
            var c = "";
            if(data.length===0){
                $(".share_comment_body").empty();
                $(".share_comment_body").html("<p style=\"font-size: 25px\">暂时没有评论欧~</p>")
                return;
            }
            for (var i=0;i<data.length;i++){
                c = c + getCommentHtml(data[i]);
            }
            $(".share_comment_body").html(c);
        }
    })
}
function getCommentHtml(data) {
    var c = getCommentUserHtml(data.cuid);
    var color_flag="red";//红色代表用户已经给评论点了赞,灰色没点赞
    var value_flag=1;//1代表用户已经给评论点了赞,0代表用户未点赞
    var num=0;//评论得点赞数
    c = c + "<div class=\"comment_text_div\"><p>";
    c = c + data.ctext + "</p></div>";
    c = c + "<div class=\"comment_message\"><span class=\"comment_time\">";
    c = c + data.ctime+"</span>";
    if(isThumbs(data.cid)==="false"){
        color_flag = "gray";
        value_flag = 0;
    }
    num = getThumbsNumber(data.cid);
    c = c + "<span class=\"comment_num\" onclick='thumbs(this)' data-id="+data.cid+" data-flag="+value_flag+"><span class=\"glyphicon glyphicon-heart\" style=\"color: "+color_flag+";\"></span>&nbsp;<span class='comment_thumbs'>"+num+"</span></span></div></div><hr>";
    return c;
}
function getCommentUserHtml(uid){
    var c = "";
    $.ajax({
        url:"US",
        type:"POST",
        async:false,
        data:{"Uid":uid,"item":"1"},
        success:function (data) {
            var url="";
            if(id==data.uid){
                url = "personalPage.jsp";
            }else{
                url = "otherPage.jsp?otherID="+data.uid;
            }
            c = "<div class=\"share_commit_div\"><div class=\"comment_user_div\"><span><a href=\""+url+"\"><img style=\"display: inline-block;width:40px;height:40px\" class=\"comment_img img-responsive img-circle\" src=\""+userPath;
            c = c + data.uimg+"\"></a></span><span>&nbsp;&nbsp;";
            c = c + data.uname+"</span></div><br>";
        },
        dataType:"json"
    });
    return c;
}
//判断用户是否给某个评论点赞了
function isThumbs(cid){
    var flag="";
    $.ajax({
        url:"CS",
        type:"POST",
        async:false,
        data:{"item":2,"cid":cid,"uid":id},
        dataType:"text",
        success:function (data) {
            flag = data;
        }
    });
    return flag;
}
function thumbs(obj){
    var num = parseInt($(obj).children(".comment_thumbs").html());
    var cid = $(obj).attr("data-id");
    var flag = 3;
    if($(obj).attr("data-flag")==1){
        $(obj).attr("data-flag",0);
        $(obj).children(".glyphicon").css("color","gray");
        $(obj).children(".comment_thumbs").html(num-1);
        flag = 4;
    }else{
        $(obj).attr("data-flag",1);
        $(obj).children(".glyphicon").css("color","red");
        $(obj).children(".comment_thumbs").html(num+1);
    }
    toThumbs(id,cid,flag);
}
//给评论点赞(3)取消赞(4)
function toThumbs(uid,cid,flag){
    $.ajax({
        url:"CS",
        type:"POST",
        async:true,
        data:{"item":flag,"cid":cid,"uid":id}
    });
}
//获取评论得点赞数
function getThumbsNumber(cid){
    var num=0;
    $.ajax({
        url:"CS",
        type:"POST",
        async:false,
        data:{"item":5,"cid":cid},
        dataType:"text",
        success:function (data) {
            num = data;
        }
    });
    return num;
}
//提交评论函数
function commit(){
    var csid = $(".inner_img").attr("data-sid");
    var text = $("#commit-button").val();
    //判断字符串是否为空
    if(text ==null||text==undefined||text.trim()==""){
        $("#alertMessage").show("fast");
        setInterval(hideAlert,10000);
        return ;
    }else{
        hideAlert();
    }
    $.ajax({
        url:"CS",
        data:{"item":6,"cuid":id,"csid":csid,"text":text},
        type:"POST",
        success:function () {
            insertComment(csid);
            $("#commit-button").val("");
            getComment(csid);
            document.getElementById("comment_body").scrollTop = 0;
        }
    })
}
function hideAlert(){
    $("#alertMessage").hide(1000);
    clearInterval(hideAlert);
}
function setShareLikeNum(sid){
    var num = getShareLikeNum(sid);
    $("#share_love_num").html(num);
}
//设置动态点赞图片
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
//设置动态收藏图片
function setShareCollectionImg(sid){
    var flag = isKeep(sid);
    if(flag == "true"){
        $(".share_collection").attr("data-flag",2);
        $(".share_collection img").attr("src","icons/red_collection.png");
    }else{
        $(".share_collection").attr("data-flag",1);
        $(".share_collection img").attr("src","icons/black_collection.png");
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
function share_love_click(){
    var sid = $(".inner_img").attr("data-sid");
    var num = parseInt($("#share_love_num").html());
    var num_cover = parseInt($("#share_cover_num_"+sid).html());
    var flag = $(".share_love").attr("data-flag");
    if(flag == 1){
        shareLikeNumberOperate(2,sid);
        $(".share_love img").attr("src","icons/red_love.png");
        $(".share_love").attr("data-flag",2);
        $("#share_love_num").html(num+1);
        $("#share_cover_num_"+sid).html(num_cover+1);
    }else{
        shareLikeNumberOperate(3,sid);
        $(".share_love img").attr("src","icons/black_love.png");
        $(".share_love").attr("data-flag",1);
        $("#share_love_num").html(num-1);
        $("#share_cover_num_"+sid).html(num_cover-1)
    }
}
function share_collection_click(){
    var sid = $(".inner_img").attr("data-sid");
    var flag = $(".share_collection").attr("data-flag");
    if(flag == 1){
        shareKeepNumberOperate(3,sid);
        $(".share_collection img").attr("src","icons/red_collection.png");
        $(".share_collection").attr("data-flag",2);
    }else{
        shareKeepNumberOperate(4,sid);
        $(".share_collection img").attr("src","icons/black_collection.png");
        $(".share_collection").attr("data-flag",1);
    }
}
function share_comment_click() {
    $("#commit-button").focus();
}
//2为增加一条点赞数据，3为删除
function shareLikeNumberOperate(item,sid) {
    $.ajax({
        url:"LS",
        data:{"item":item,"uid":id,"sid":sid},
        type:"POST",
        success:function (data) {
        }
    })
}
//3为增加一条收藏数据，4为删除
function shareKeepNumberOperate(item,sid) {
    $.ajax({
        url:"KS",
        data:{"item":item,"uid":id,"sid":sid},
        type:"POST",
        success:function (data) {
        }
    })
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
//根据share modal的可见性设置loading函数
function setLoading(){
    if($("#share_modal").css("display")!="none"){
        $(".spinner").css("display","none");
        clearInterval(setLoading);
    }
}


//获取动态的评论数
function getShareCommentNumber(sid){
    var num = 0;
    $.ajax({
        url:"CS",
        type:"POST",
        async:false,
        data:{"item":7,"sid":sid},
        success:function (data) {
            num = data;
        }
    });
    return num;
}
//增加了一条评论
function insertComment(sid){
    var snum = $("#share_cover_cnum_"+sid).html();
    var num = parseInt(snum);
    $("#share_cover_cnum_"+sid).html(num+1);
}
//用户点击按钮实现选择图片
function clickProfile(){
    $("#file").click();
}
//实现上传图片
function commitImage(){
    var file=$("#file")[0].files[0];//新特性，获取文件对象
    var fordata=new FormData();//新特性，得到formData对象，把获取的值扔进去，相当于map
    fordata.append("file",file);
    fordata.append("uid",id);
    console.log(file)
    $.ajax({
        url:"UI",
        data:fordata,
        cache:false,
        processData:false, //必须写
        contentType:false, //必须写
        type:"POST",
        success:function(data){
            //更新用户头像
            $(".user_img").attr("src",data);
        }
    })

}
function showModal(obj){
    $(obj).modal("show");
}
//设置用户发表动态的数量
function setShareNumber(){
    $.ajax({
        url:"SS",
        data:{"item":3,"Uid":id},
        type:"POST",
        success:function(data){
            $("#sharesNumber").html(data);
        }
    })
}
//设置sharedeleteButton
function setShareDeleteButton(uid,sid) {
    if(uid==id){
        $(".share_delete button").attr("onclick","deleteShare("+sid+")");
        $(".share_delete button").css("display","inline-block");
    }else{
        $(".share_delete button").css("display","none");
    }

}
function deleteShare(sid){
    $.ajax({
        url:"SS",
        type:"POST",
        data:{"item":4,"Sid":sid},
        async:true,
        success:function (data) {
            $(".bs-example-modal-sm").modal("show");
        },
        dataType:"json"
    })
}
//关闭shareModal
function shareModalClose(){
    $('#share_modal').modal('hide');
    //重新加载个人动态和个人动态
    sstart = 0;
    kstart = 0;
    //清空收藏和动态标签页
    $("#我的动态").html("");
    $("#我的收藏").html("");
    //重新获取动态和收藏
    getShare(id);
    getKeep(id);
    //设置动态的数量
    setShareNumber();
}




