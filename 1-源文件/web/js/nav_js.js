var id = 2;
var userPath;
$(function() {
    id = $("#userID").val();
    userPath = $("#userPath").val();

});
//通过模糊搜索查询用户id
function searchUserByName_n(){
    var name = $("#search").val();
    if(name.trim().length===0||name==null||name==undefined){
        return ;
    }
    $("#nav_div").html("<br>");
    $.ajax({
        url:"US",
        type:"POST",
        async:false,
        data:{"name":name,"item":"4"},
        success:function(data) {
            var index;
            if(data.length===0){
                return ;
            }
            $("#nav_div").css("display","inline-block");
            for (index=0;index<data.length;index=index+1){
                if(index===0){
                    $("#go").attr("href","otherPage.jsp?otherID="+data[0]);
                }
                setNavDiv(data[index]);
            }
        },
        error:function(){
            alert("error");
        },
        dataType:"json"
    })
}
//向nav提示框内增加代码
function setNavDiv(uid){
    $.ajax({
        url:"US",
        type:"POST",
        async:false,
        data:{"Uid":uid,"item":"1"},
        success:function (data) {
            var c = "";
            if(data.length==0){
                return ;
            }
            //设置share用户信息
            c = c + "<div onmouseover='clickUserDiv(this)' style='margin-top:-15px' class=\"user_panel panel panel-default\"><div class=\"panel-body\">";
            c = c + getFanHtml_n(data);
            c = c + getButtonHtml_n(data);
            c = c + "</div></div>";
            $("#nav_div").append(c);
        },
        dataType:"json"
    })
}
function  getFanHtml_n(data) {
    var c="";
    var url="";
    if(id==data.uid){
        url = "personalPage.jsp";
    }else{
        url = "otherPage.jsp?otherID="+data.uid;
    }
    c = c + "<div style=\"float: left\"><a href=\""+url+"\"><img src=\""+userPath+data.uimg+"\" style='width: 35px;height: 35px;' class=\"img-responsive img-circle\"></a></div>";
    c = c + "<div class=\"fan_div\"><span><b class=\"fan_name_n\" data-uid=\""+data.uid+"\">"+data.uname+"</b></span>";
    c = c + "</div>";
    return c;

}
function getButtonHtml_n(data){
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
    c = c + "<button "+button_flag+"name=\""+data.uname+"\""+"onclick=\"fanClick_n(this)\" value=\""+value_flag+"\" class=\"btn-userLike_n btn "+btn_flag+" btn-sm\">"+text_flag+"</button></div><div class=\"clearfix\"></div>";
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
    });
    return flag;
}
function fanClick_n(obj){
    var v = $(obj).attr("value");
    if(v=="1"){
        //已经关注了
        unFollow($(obj).attr("name"));
        $(obj).text("关注");
        $(obj).attr("value","2");
        $(obj).attr("class","btn-userLike_n btn btn-primary btn-sm");
    }else {
        //没关注
        follow($(obj).attr("name"));
        $(obj).text("已关注");
        $(obj).attr("value","1");
        $(obj).attr("class","btn-userLike_n btn btn-default btn-sm");
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
//鼠标点击提示框时
function clickUserDiv(obj){
    var name = $(obj).find(".fan_name_n").html();
    var uid = $(obj).find(".fan_name_n").attr("data-uid");
    $("#search").val(name);
    $("#go").attr("href","otherPage.jsp?otherID="+uid);
}
function lose() {
    var flag = $("#nav_div").attr("data-flag");
    if(flag===""){
        $("#nav_div").css("display","none");
    }
}
function over(){
    $("#nav_div").attr("data-flag","active");
}
function leave(){
    $("#nav_div").attr("data-flag","");
    if(!$("#search").is(":focus")){
        $("#nav_div").css("display","none");
    }

}
function logout() {
    $("#reloginModal").modal('show');
}

