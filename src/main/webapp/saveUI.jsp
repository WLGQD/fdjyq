<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>视频文件存储定义添加</title>
   	<%--<%@ include file="/WEB-INF/jsp/public/commons.jspf" %>--%>
   	<script type="text/javascript">
   	function browseFolder(path) {
   	    try {
   	        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
   	        var Shell = new ActiveXObject("Shell.Application");
   	        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
   	        //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
   	        if (Folder != null) {
   	            Folder = Folder.items(); // 返回 FolderItems 对象
   	            Folder = Folder.item(); // 返回 Folderitem 对象
   	            Folder = Folder.Path; // 返回路径
   	            if (Folder.charAt(Folder.length - 1) != "\\") {
   	                Folder = Folder + "\\";
   	            }
   	            document.getElementById(path).value = Folder;
   	            return Folder;
   	        }
   	    }
   	    catch (e) {
   	        alert(e.message);
   	    }
   	}
    function speech() {
        var msg = new SpeechSynthesisUtterance("机房报警请立即处理");
        window.speechSynthesis.speak(msg);
    }
   	</script>

</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 视频文件存储定义添加
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="videostorage_%{id == null ? 'add' : 'edit'}" >
    	<s:hidden name="id"></s:hidden>
        
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 单位信息 </div> 
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    
                   <tr><td>监控对象</td>
                        <td>
                        <s:select name="monitorObjectDefId" cssClass="SelectStyle" 
                        		list="#monitorObjectDefList" listKey="id" listValue="name"
                        		headerKey="" headerValue="==请选择监控对象=="/>
                        </td>
                    </tr>
                    <tr><td>存储路径</td>
                  <td><s:textfield name="imageFile" cssClass="InputStyle"/></td>
                   <td><input type="file">
</td>

                       <%--
                         <td><input type=button value="选择" onclick="browseFolder('path')"/></td>
                    --%></tr>
                </table>
            </div>
        </div>
	 <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/style/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/style/images/goBack.png"/></a>
        </div>
       
    </s:form>
</div>
</body>
</html>
