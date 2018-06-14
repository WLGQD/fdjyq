<%--
  Created by IntelliJ IDEA.
  Role: Administrator
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
            if(!checkEmpty("name","角色名称"))
                return false;
            return true;
        });
    });

</script>
<div class="workingArea">
    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增角色</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="role_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>角色名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>角色描述</td>
                        <td><input  id="description" name="description" type="text" class="form-control"></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>