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
<body style="background-color: white">
<div class="workingArea">
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>单位名称</th>
                <th>单位层级</th>
                <th>单位代码</th>
                <th>上级单位</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${units}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.unitLayer}</td>
                    <td>${c.code}</td>
                    <td>${c.parent.name}</td>
                    <td>
                        <a href="unit_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a> <span>&nbsp; &nbsp; &nbsp;</span>
                        <a deleteLink="true" href="unit_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <a id="add" type="button" href="unit_addUI" class="btn btn-success">添  加</a>&nbsp; &nbsp; &nbsp;
    <div class="pageDiv" style="text-align:center;">
        <%@include file="../include/Page.jsp" %>
    </div>

</div>
</body>