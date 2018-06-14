<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script src="js/jquery.js"></script>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/blue/file.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery_treeview/jquery.treeview.css" />
<link href="css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/back/style.css" rel="stylesheet">
<script src="js/jquery_treeview/jquery.treeview.js"></script>
	<script type="text/javascript">
        var flag = true;
		$(function(){
			// 指定事件处理函数
			$("[name=privilegeIds]").click(function(){
                if ($(this).is(":checked")) {
                    $(this).siblings("ul").find("input").prop('checked', true);
                }else{
                    $(this).siblings("ul").find("input").prop('checked', false);
                }
				// 当选中或取消一个权限时，也同时选中或取消所有的下级权限

				
				// 当选中一个权限时，也要选中所有的直接上级权限
				if(this.checked == true){
					$(this).parents("li").children("input").prop('checked', true);
				}
				
			});
            $("#cbSelectAll").click(function () {
                if (flag== true){
                    $('[name=privilegeIds]').prop('checked', true);
                    flag = false;
				}else {
                    $('[name=privilegeIds]').prop("checked", false);
                    flag = true;
				}


            });

		});
	</script>

<div id=workingArea>
	<div class="panel panel-warning ">
		<div class="panel-heading">编辑权限</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="role_setPrivilege" enctype="multipart/form-data">
				<div class="ItemBlock_Title1"><!-- 信息说明 -->
					<div class="ItemBlock_Title1">
					 正在为【${role.name}】配置权限
					</div>
				</div>
				<table class="addTable">
					<thead>
					<tr align="LEFT" valign="MIDDLE" id="TableTitle">
						<td width="300px" style="padding-left: 7px;">
							<!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->
							<input type="checkbox" id="cbSelectAll" />
							<label for="cbSelectAll">全选/全不选</label>
						</td>
					</tr>
					</thead>

					<tbody id="TableData">
					<tr class="TableDetail1">
						<!-- 显示权限树 -->
						<td>
						<ul id="tree">
							<c:forEach items="${privilegeList}" var="top"><!--系统管理 -->
							<li>
									<input type="checkbox" name="privilegeIds" value="${top.id }" id="cb_${top.id }"
											<c:forEach var="item" items="${privilegeIds}">
												<c:if test="${item eq top.id }">
													checked="checked"
												</c:if>
											</c:forEach>
									 /><label for="cb_${top.id }"><span class="folder">${top.name}</span></label>
									<ul>
										<c:forEach items="${top.children}" var="c"><!--用户管理 -->

											<li>
												<input type="checkbox" name="privilegeIds" value="${c.id }" id="cb_${c.id }"
														<c:forEach var="item" items="${privilegeIds}">
															<c:if test="${item eq c.id }">
																checked="checked"
															</c:if>
														</c:forEach>
												/>
												<label for="cb_${c.id }"><span class="folder">${c.name}</span></label>
												<ul>
													<c:forEach items="${c.children}" var="cc"><!--用户登录 -->
														<li>
															<input type="checkbox" name="privilegeIds" value="${cc.id }" id="cb_${cc.id }"
																	<c:forEach var="item" items="${privilegeIds}">
																		<c:if test="${item eq cc.id }">
																			checked="checked"
																		</c:if>
																	</c:forEach>
															/><label for="cb_${cc.id }"><span class="folder">${cc.name}</span></label>
														</li>
													</c:forEach>
												</ul>
											</li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
						</td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="id" value="${role.id}">
							<button type="submit" class="btn btn-success">提 交</button>
						</td>
					</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<script language="javascript">
        $(function(){
            $("#tree").treeview();
        });

	</script>
</div>
