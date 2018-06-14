<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/19
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理中心</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>

</head>
<body >
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1> 后台管理中心</h1>
    </div>
    <div style="text-align:right;">
        <div class=" margin-big-right fadein-top" style="margin-top:10px;">
            <img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="${user.name}" />${user.name}
            <a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
            <a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;
            <a class="button button-little bg-red" href="logout"><span class="icon-power-off"></span> 退出登录</a>
        </div>


    </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>基本设置</h2>
    <ul style="display:block">
        <li><a href="user_list" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
        <li><a href="unit_list" target="right"><span class="icon-caret-right"></span>单位管理</a></li>
        <li><a href="role_list" target="right"><span class="icon-caret-right"></span>角色管理</a></li>
        <li><a href="privilegetree_list" target="right"><span class="icon-caret-right"></span>权限列表</a></li>
        <li><a href="book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
        <li><a href="column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
    <ul>
        <li><a href="list.html" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
        <li><a href="add.html" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
        <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>

    <ul class="bread">
        <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
        <li><a href="##" id="a_leader_txt">网站信息</a></li>
        <a href="javascript: window.parent.right.location.reload(true);">页面刷新</a>
    </ul>


<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
    <p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>