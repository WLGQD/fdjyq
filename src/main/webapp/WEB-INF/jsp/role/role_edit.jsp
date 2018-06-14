<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>编辑分类</title>
<%@include file="../include/js.jsp"%>
<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","角色名称"))
                return false;
            return true;
        });
    });

</script>


<div class="workingArea">
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑用户</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="role_update"  enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>角色名称</td>
                        <td><input  id="name" name="name" type="text" value="${u.name}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>角色描述</td>
                        <td><input  id="description" name="description" type="text" value="${u.description}" class="form-control"></td>
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