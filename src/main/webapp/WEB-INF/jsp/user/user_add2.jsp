<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@include file="../include/js.jsp"%>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/back/style.css" rel="stylesheet">
<div class="page-content">

    <div class="page-content-area">

        <div class="row">
            <div class="col-xs-12">
                <c:if test="${!empty msg}">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>

                    <strong>
                        <i class="ace-icon fa fa-times"></i>
                        错误
                    </strong>

                        ${msg}
                    <br />
                </div>
                </c:if>
                <!-- PAGE CONTENT BEGINS -->
                <div class="panel panel-warning addDiv">
                    <div class="panel-heading">新增用户</div>
                    <div class="panel-body">
                        <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                            <table class="addTable">
                                <tr>
                                    <td>用户名称</td>
                                    <td><input  id="name" name="name" type="text" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>登录名称</td>
                                    <td><input  id="userName" name="name" type="text" class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>登录密码</td>
                                    <td><input  id="passWord" name="name" type="text" class="form-control"></td>
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
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content-area -->
</div><!-- /.page-content -->
