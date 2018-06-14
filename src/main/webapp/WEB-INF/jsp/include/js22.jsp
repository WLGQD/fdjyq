<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

	<link rel="stylesheet" href="static/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="static/assets/css/ace.min.css" id="main-ace-style" />
	<link rel="stylesheet" href="static/assets/css/jquery-ui.min.css" />
	<link rel="stylesheet" href="static/assets/css/ace-fonts.css" />



<script src="static/assets/js/ace-extra.min.js"></script>
	<!--[if lte IE 8]>
	<script src="static/assets/js/html5shiv.min.js"></script>
	<script src="static/assets/js/respond.min.js"></script>
	<![endif]-->

	<script src='static/assets/js/jquery.min.js'></script>

	<script src="static/assets/js/bootstrap.min.js"></script>

	<script src='static/assets/js/jquery1x.min.js'></script>
	<!-- page specific plugin scripts -->
	<script src="static/assets/js/jquery-ui.min.js"></script>
	<script src="static/assets/js/jquery.ui.touch-punch.min.js"></script>

	<!-- ace scripts -->

	<!--[if lte IE 9]>
	<link rel="stylesheet" href="static/assets/css/ace-part2.min.css" />
	<![endif]-->
	<!--[if lte IE 9]>
	<link rel="stylesheet" href="static/assets/css/ace-ie.min.css" />
	<![endif]-->
	<!--[if IE]>
	<script type="text/javascript">
		window.jQuery || document.write("<script src='static/assets/js/jquery1x.min.js'>"+"<"+"/script>");
	</script>
	<![endif]-->
	<script type="text/javascript">
        if('ontouchstart' in document.documentElement) document.write("<script src='static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>

	<script type="text/javascript">
        window.jQuery || document.write("<script src='static/assets/js/jquery.min.js'>"+"<"+"/script>");
	</script>


<script>
    function checkEmpty(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    function checkNumber(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        if(isNaN(value)){
            alert(name+ "必须是数字");
            $("#"+id)[0].focus();
            return false;
        }

        return true;
    }
    function checkInt(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        if(parseInt(value)!=value){
            alert(name+ "必须是整数");
            $("#"+id)[0].focus();
            return false;
        }

        return true;
    }


    $(function(){
        $("a").click(function(){
            var deleteLink = $(this).attr("deleteLink");
            console.log(deleteLink);
            if("true"==deleteLink){
                var confirmDelete = confirm("确认要删除");
                if(confirmDelete)
                    return true;
                return false;

            }
        });
    })
</script>


<script type="text/javascript">
    $(function(){
        $(".sidebar h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".sidebar ul li a").click(function(){
         //   $("#a_leader_txt").text($(this).text());
            $(".sidebar ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
