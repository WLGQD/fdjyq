<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>编辑分类</title>
<%@include file="../include/js.jsp"%>
<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","单位名称"))
                return false;
            if(!checkEmpty("unitLayer","单位层级"))
                return false;
            if(!checkEmpty("code","单位代码"))
                return false;
            return true;
        });
    });

</script>


<div class="workingArea">
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑用户</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="unit_update"  enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>单位名称</td>
                        <td><input  id="name" name="name" type="text" value="${u.name}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>单位层级</td>
                        <td><input  id="unitLayer" name="unitLayer" type="text" value="${u.unitLayer}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>单位代码</td>
                        <td><input  id="code" name="code" type="text" value="${u.code}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>上级单位</td>
                        <td><select name="parentId" class="form-control">
                            <c:if test='${u.parentId == null}'><option  value="">请选择上级单位</option></c:if>
                            <c:forEach items="${unitList}" var="list" >
                                <option <c:if test='${u.parentId == list.id}'>selected="selected"</c:if> value="${list.id}">${list.name}</option>
                            </c:forEach>
                        </select>
                            <%--<c:if test='${employee.deptNo == list.id}'>selected="selected"</c:if>--%>
                            <%--<input  id="parentId" name="parentId" type="text" class="form-control">--%>
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