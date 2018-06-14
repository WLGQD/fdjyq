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

<%@include file="../include/js.jsp"%>
<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","用户名称"))
                return false;
            if(!checkEmpty("userName","登录名称"))
                return false;
            if(!checkEmpty("passWord","登录密码"))
                return false;
            return true;
        });
    });

</script>
<div class="workingArea">
    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增用户</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="user_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>用户名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>登录名称</td>
                        <td><input  id="userName" name="userName" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>登录密码</td>
                        <td><input  id="passWord" name="passWord" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分配角色</td>
                        <td>
                            <select name="roleId" class="form-control">
                                <c:forEach items="${roleList}" var="list" >
                                    <option  value="${list.id}">${list.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="token" value="${token}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>
</div>
<%--<script>--%>
    <%--function formsubmit() {--%>
        <%--var a  = document.getElementById("submit");--%>
       <%--// a.disabled = "disabled";--%>

      <%--//  document.forms.formsubmitf.submit();--%>
    <%--}--%>
<%--</script>--%>