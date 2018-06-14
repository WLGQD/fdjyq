<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>编辑分类</title>
<%@include file="../include/js.jsp"%>
<script>
    $(function() {
        $("#editForm").submit(function() {
            if(!checkEmpty("name","用户名称"))
                return false;
            if(!checkEmpty("userName","登录名称"))
                return false;
            if(!checkEmpty("password","登录密码"))
                return false;
            return true;
        });
    });
</script>


<div class="workingArea">
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑用户</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="user_update"  enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>用户名称</td>
                        <td><input  id="name" name="name" type="text" value="${u.name}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>登录名称</td>
                        <td><input  id="userName" name="userName" type="text" value="${u.userName}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>登录密码</td>
                        <td><input  id="password" name="password" type="text" value="${u.password}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>上级单位</td>
                        <td><select name="roleId" class="form-control">
                                <c:if test='${u.roleId == null}'><option  value="">请选择角色</option></c:if>
                                <c:forEach items="${roleList}" var="list" >
                                    <option <c:if test='${u.roleId == list.id}'>selected="selected"</c:if> value="${list.id}">${list.name}</option>
                                </c:forEach>
                            </select>
                        </td>

                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${u.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>