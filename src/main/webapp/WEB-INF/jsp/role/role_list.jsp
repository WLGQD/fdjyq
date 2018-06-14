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

<div class="workingArea">
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>角色名称</th>
                <th>角色描述</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${roles}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.description}</td>
                    <td>
                        <a href="role_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a> <span>编辑</span>&nbsp; &nbsp; &nbsp;
                        <a deleteLink="true" href="role_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a><span>删除</span>&nbsp; &nbsp; &nbsp;
                        <a href="role_PrivilegeUI?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a> <span>设置权限</span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <a id="add" type="button" href="role_addUI" class="btn btn-success">添  加</a>&nbsp; &nbsp; &nbsp;
    <div class="pageDiv" style="text-align:center;">
        <%@include file="../include/Page.jsp" %>
    </div>

</div>
