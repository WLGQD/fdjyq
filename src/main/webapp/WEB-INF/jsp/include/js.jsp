<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/back/style.css" rel="stylesheet">

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
    function checkEqualLen(id, name,len){
        var value = $("#"+id).val();
       // value = parseInt(value)
        if(value.length != len){
            alert(name+ "长度必须为" +len);
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    /*
    英文判断函数，返回true表示是全部英文，返回false表示不全部是英文
    */
    function isLetter(str){
        if(""==str){
            return false;
        }
        for(var i=0;i<str.length;i++)
            var c = str.charAt(i);
			if((c<"a"||c>"z")&&(c<"A"||c>"Z")){
				return false;
			}
		return true;
    }
    /*
    空格判断，当包含有空格返回false，当不包含一个空格返回true
    ""不能被判断
    */
    function notInSpace(str){
        if(""==str){
            return false;
        }
        var badChar =" ";
        badChar += "　";
        for(var i=0;i<str.length;i++)
			var c = str.charAt(i);//字符串str中的字符
			if(badChar.indexOf(c) > -1){
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


