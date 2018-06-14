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
            if(!checkEmpty("name","单位名称"))
                return false;
            if(!checkInt("unitLayer","单位层级"))
                return false;
            if(!checkEqualLen("unitLayer","单位层级",1))
                return false;
            if(!checkEmpty("code","单位代码"))
                return false;
            return true;
        });
    });

</script>
<div class="workingArea">
    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增单位</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="unit_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>单位名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>单位层级</td>
                        <td><input  id="unitLayer" name="unitLayer" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>单位代码</td>
                        <td><input  id="code" name="code" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>上级单位</td>
                        <td><select name="parentId" class="form-control">
                                <option  value="">请选择上级单位</option>
                                <c:forEach items="${unitList}" var="list" >
                                    <option  value="${list.id}">${list.name}</option>
                                </c:forEach>
                            </select>
                            <%--<c:if test='${employee.deptNo == list.id}'>selected="selected"</c:if>--%>
                            <%--<input  id="parentId" name="parentId" type="text" class="form-control">--%>
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