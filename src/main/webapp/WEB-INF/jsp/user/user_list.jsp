<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/19
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script type="text/javascript">
    function browseFolder(path) {
        try {
            var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
            var Shell = new ActiveXObject("Shell.Application");
            var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
            //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
            if (Folder != null) {
                Folder = Folder.items(); // 返回 FolderItems 对象
                Folder = Folder.item(); // 返回 Folderitem 对象
                Folder = Folder.Path; // 返回路径
                if (Folder.charAt(Folder.length - 1) != "\\") {
                    Folder = Folder + "\\";
                }
                document.getElementById(path).value = Folder;
                return Folder;
            }
        }
        catch (e) {
            alert(e.message);
        }
    }
    function speech() {
        var msg = new SpeechSynthesisUtterance("机房报警请立即处理");
        window.speechSynthesis.speak(msg);
    }
</script>
<%@include file="../include/js.jsp"%>
<body style="background-color: white">
<div class="workingArea">
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>用户名称</th>
                <th>登录名称</th>
                <th>所属角色</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.userName}</td>
                    <%--<td><c:if test='${c.role != null}'>${c.role.name}</c:if></td>--%>
                    <td>
                        <c:choose>
                            <c:when test="${c.role != null}">
                                &nbsp;${c.role.name}
                            </c:when>
                            <c:otherwise>
                                【未分配角色】
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="user_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a> <span>&nbsp; &nbsp; &nbsp;</span>
                        <a deleteLink="true" href="user_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <a id="add" type="button" href="user_addUI" class="btn btn-success">添  加</a>&nbsp; &nbsp; &nbsp;
    <div class="pageDiv" style="text-align:center;">
        <%@include file="../include/Page.jsp" %>
    </div>
    <%--<div style="display: none" class="panel panel-warning addDiv">--%>
        <%--<div class="panel-heading">新增分类</div>--%>
        <%--<div class="panel-body">--%>
            <%--<form method="post" id="addForm" action="userAdd" enctype="multipart/form-data">--%>
                <%--<table class="addTable">--%>
                    <%--<tr>--%>
                        <%--<td>用户名称</td>--%>
                        <%--<td><input  id="name" name="name" type="text" class="form-control"></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>登录名称</td>--%>
                        <%--<td><input  id="userName" name="userName" type="text" class="form-control"></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>登录密码</td>--%>
                        <%--<td><input  id="passWord" name="password" type="text" class="form-control"></td>--%>
                    <%--</tr>--%>
                    <%--<tr class="submitTR">--%>
                        <%--<td colspan="2" align="center">--%>
                            <%--<button type="submit" class="btn btn-success">提 交</button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
<script>
    // $("#add").click(function(){
    //     $(".addDiv").toggle();
    //     if (this.innerHTML == "添  加"){
    //         this.innerHTML = "隐  藏";
    //     }else {
    //         this.innerHTML = "添  加";
    //     }
    //
    // });
</script>

</body>