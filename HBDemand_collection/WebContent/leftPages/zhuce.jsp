<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<script language="javascript">
function validate(){
			if(document.getElementById("userName").value==""){
				alert("用户名为空！请重新输入");
				document.getElementById("userName").focus();
				return false;
			}
			else if(document.getElementById("password").value==""){
				alert("密码为空！请重新输入");
				document.getElementById("password").focus();
				return false;
			}
			else if(document.getElementById("surepsw").value==""){
				alert("请确认密码！确保密码不丢失");
				document.getElementById("surepsw").focus();
				return false;
			}
			else if(document.getElementById("password").value!=document.getElementById("surepsw").value){
				alert("两次密码输入相异！请重新输入");
				document.getElementById("surepsw").focus();
				return false;
			}else if (document.getElementById("password").value.length > 20 || document.getElementById("password").value.length < 6) {
				alert("密码应小于6位或大于20位");
				document.getElementById("password").focus();
				return false;
			}else if(document.getElementById("postalAdds").value==""){
				alert("通讯地址为必填项！请重新输入");
				document.getElementById("postalAdds").focus();
				return false;
			}
			else if(document.getElementById("lawPeople").value==""){
				alert("法人代表为必填项！请重新输入");
				document.getElementById("lawPeople").focus();
				return false;
			}
			else if(document.getElementById("contacts").value==""){
				alert("联系人为必填项！请重新输入");
				document.getElementById("contacts").focus();
				return false;
			}
			else if(document.getElementById("email").value==""){
				alert("电子邮箱为必填项！请重新输入");
				document.getElementById("email").focus();
				return false;
			}
			else if(document.getElementById("cellphone").value==""){
				alert("手机号为必填项！请重新输入");
				document.getElementById("cellphone").focus();
				return false;
			}else if(document.getElementById("ID").value==""){
				alert("机构代码为必填项！请重新输入");
				document.getElementById("ID").focus();
				return false;
			}
		}
function isNum(obj){                          //判断输入是否为数字
	for (ilen = 0; ilen < obj.value.length; ilen++) {
		if (obj.value.charAt(ilen) < '0' || obj.value.charAt(ilen) > '9') {
            return false;
        }
    }
    return true;
}
</script>
</head>
<style type="text/css">
<!--
 .red {
	color: #ff0000;
}
</style>
<body>
<form action="registerJudge.jsp" method="post" name="zhuceform" onsubmit = "return validate();">>
<table  width="640" height="520" border="1" align="center" style="margin-top:50px">
	<tr><th height="43" scope="col">
    	<div align="left"><span>用户注册 <a>(带<i class="red"> * </i>号的为必填项,信息为以后使用,请认真填写.)</a></span></div></th>
    </tr>
	<tr>
	  <td><p>机构全称：<input name="userName" type="text" id="userName" ><i class="red"> *</i></p>
	  <p>登录密码：<input name="password" type="password" id="password" > <i class="red">*</i>
		<em id="_userid">(6到20位字母和数字组成)</em></p>
	  <p>确认密码：<input name="surepsw" type="password" id="surepsw" > <i class="red">*</i></p>
	  <p>机构代码 ：<input name="ID" type="text" id="ID" > <i class="red">*</i></p>
	  <p>通讯地址：<input name="postalAdds" type="text" id="postalAdds" > <i class="red">*</i></p>
	  <p>网&nbsp;&nbsp;&nbsp;&nbsp;址：<input name="webAdds" type="text" id="webAdds"> </p>
	  <p>法人代表：<input name="lawPeople" type="text" id="lawPeople" > <i class="red">*</i></p>
	  <p>联系人姓名：<input name="contacts" type="text" id="contacts" > <i class="red">*</i></p>			
	  <p>电子邮箱：<input name="email" type="text" id="email" > <i class="red">*</i></p>
	  <p>邮政编码：<input name="postNum" type="text" id="postNum" > </p>
	  <p>手机号码：<input name="cellphone" type="text" id="cellphone" onchange="isNum(cellphone)" ><i class="red">*</i></p>
	  <p>座机号码：<input name="telephone" type="text" id="telephone" ></p>
	  <p>传真号码：<input name="faxAds" type="text" id="faxAds" ></p> 
	  <p>机构属性：<select name="InstSx" id="InstSx">
      		<option value="企业">企业</option>
      		<option value="高等院校">高等院校 </option>
      		<option value="研究机构">研究机构</option>
      		<option value="究发展与成果应用">研究发展与成果应用</option>
      		<option value="其他">其他</option>
    	</select><i class="red">*</i></p>
	  <p>注册协议：</p>
		<textarea name="message" readonly class="STYLE222"style="height:170px; width:550px">1、在本站注册的企业，必须遵守《互联网电子公告服务管理规定》，不得在本站发表诽谤他人，侵犯、曝露他人隐私，侵犯他人知识产权，传播病毒，政治言论，商业讯息等信息.
								2、在所有在本站注册的内容，本站都具有最终编辑权，并且保留用于印刷或向第三方发表的权利，如果你的资料不齐全，我们将不予采集。在本站输入的内容须遵守法律规定，内容健康向上，不得包含政治敏感、淫秽低俗内容，不文明用语等。
								3、在征集过程中，您将选择注册名和密码。注册名的选择应遵守法律法规及社会公德，我们有权对您的用户名作出审核和删除。您必须对您的密码保密，您将对您注册名和密码下发生的所有活动承担责任。"
        </textarea>
	  <p align="center"><input type="submit" name="submit" value="注册" style="margin-top:20px; margin-right:70px;color:#cc3300 ">
			<input type="reset" value="重置" style="margin-top:20px;margin-right:60px; color:#ff0000"></p>
			</tr> 
</table>
</form>
</body>
</html>