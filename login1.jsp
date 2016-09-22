<%@page language="java"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	String loginMessage = request.getParameter("result");
	String loginAction = request.getContextPath()+"/loginAction";
	if(loginMessage!=null&&"0".equals(loginMessage))
	{
		loginMessage = "用户名、密码错误请重新输入";
	}else if("1".equals(loginMessage)){
		loginMessage="非法访问请重新登录";
	}else{
		loginMessage="";
	}
%>

<html>
<head>
 

<title>管理登录</title>

<link rel="stylesheet" type="text/css" href="../framework/bootstrap/css/bootstrap.min.css" />

<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 400px;
	position: absolute;
	top: 50%;

	margin-top: -200px;
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 275px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 300px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
.messageInfo{
	text-align:center;
	padding-bottom:30px;
}
</style>

</head>

<body onload="init()">
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>登录</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form action="<%=loginAction%>" method="post" name="loginForm" id="loginForm" onsubmit="return checkAll();">
				<div class="messageInfo"><%=loginMessage%></div>
				 
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username"  title="请填写用户名" name="username" class="form-control" placeholder="用户名">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" title="请填写用户密码" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button type="submit"  class="btn btn-sm btn-info"><span class="glyphicon glyphicon-off"></span> 登录</button>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<script language="javaScript">
function init()
{
	document.getElementById("password").value="";
}
function checkAll()
{
    var i;
    var ele;
    var loginForm=document.getElementById("loginForm");
    for (i=0;i<loginForm.elements.length;i++) {
        ele = document.all? loginForm.elements(i):loginForm.elements[i];
        if (ele != null) {
            if (!checkField(ele)) 
            {
            	return false;
            }
        }
    }
}

function checkField(field)
{
    if (field.type != "text" && field.type != "password") return true;
    if (field.value == "") {
        alert(field.getAttribute("title") + "!" );
        field.focus();
        return false;
    }
    return true;
}

 
</script>
</body>

</html>