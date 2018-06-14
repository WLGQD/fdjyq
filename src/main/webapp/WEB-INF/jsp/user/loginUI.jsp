<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/fore/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script type="text/javascript">
        $(function(){
            document.forms[0].userName.focus();
        });

        // 在被嵌套时就刷新上级窗口
        if(window.parent != window){
            window.parent.location.reload(true);
        }
    </script>
    <script>
        $(function(){
            <c:if test="${!empty msg}">
            $("span.errorMessage").html("${msg}");
            $("div.loginErrorMessageDiv").show();
            </c:if>

            $("form.loginForm input").keyup(function(){
                $("div.loginErrorMessageDiv").hide();
            });

            var left = window.innerWidth/2+162;
            $("div.loginSmallDiv").css("left",left);
        })
    </script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form class="loginForm" action="login" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="userName" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<div class="field">--%>
                            <%--<input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />--%>
                           <%--<img src="captcha" id="captchaImage" alt="点击换一张" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="VerificationCode()">--%>

                        <%--</div>--%>
                    <%--</div>--%>
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
            </div>
            </form>          
        </div>
    </div>
</div>
<script>
    function VerificationCode(){
        var rad = Math.floor(Math.random() * Math.pow(10, 8));
//uuuy是随便写的一个参数名称，后端不会做处理，作用是避免浏览器读取缓存的链接
        $('#captchaImage').attr("src", "captcha?timestamp=" + (new Date()).valueOf());
    }
</script>
</body>
</html>