<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.example.sample.service.LoginVO" %>
<%@ page import ="egovframework.example.sample.service.LoginService, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>로그인페이지</title>
  
  <link href="./css/egovframework/login_style.css" rel="stylesheet">
  <script type="text/javaScript" language="javascript" defer="defer">
  
  
  function fn_egov_addView() {
     	document.listForm.action = "<c:url value='/registerView.do'/>";
     	document.listForm.submit();
  }
  
  function fn_egov_login(name) {
	var id = document.listForm.id.value;
	var pwd = document.listForm.password.value;
	
	if(id != ""){
		if(id == "admin") {
			alert("관리자로 로그인하였습니다.");
			document.listForm.action = "<c:url value='/actionLogin.do'/>";
		   	document.listForm.submit();
		} else if(pwd == ""){
			alert("비밀번호를 입력하세요");
			document.listForm.password.focus();
			return false;
		}  else {
			alert(id + "님 로그인되었습니다.");
			document.listForm.action = "<c:url value='/actionLogin.do'/>";
		   	document.listForm.submit();
		}
	} else {
		alert("아이디를 입력하세요");
		document.listForm.id.focus();
		return false;
	}
  }
  
  </script>
</head>

<body>
<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
	<div id="header">
		<h1><a href="mainpage.do" class="sp h_logo"><span class="blind">E Z E N</span></a></h1>
	</div>
  <div class="wrapper">
  <div id="contents">
    <div class="loginSec" id="loginSec">
      <div class="idPass">
        <fieldset>
        <div class="btLoginPC">
          <legend>
          <input type="button" id="login_stu" value="학생 로그인" onclick="changestu()"/>
          <input type="button" id="login_pro" value="교수 로그인" onclick="changepro()"/>
          </legend>
         </div>
          <div class="id"><input type="text" id="id" name = "id" class="input01" placeholder="ID를&nbsp;입력해주세요."></div>
          <div class="pass"><input type="password" id="password" name="password" class="input01" placeholder="비밀번호를 입력해주세요."></div>
      </fieldset>
      </div>
      
    </div>
    <div class= "home"> 
        <a href= "javascript:fn_egov_login()"><button type="button" class="btn btn-primary btn-lg btn-block">로그인</button></a><br>
  		<a href= "javascript:fn_egov_addView()"><button type="button" class="btn btn-primary btn-lg btn-block">회원가입</button></a>
     </div>
  </div>
  </div>
  </form:form>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script type="text/javaScript">
  
  $("#login_pro").on("click", function changepro() {
		   $("#login_stu").css({
			   display: "inline", padding: "10px", color: "#7a7a7a", "text-decoration": "none",
				"font-weight": "700", "text-align": "center", 
				border: "1px solid #dedede", "border-bottom": "0", "background-color": "#f4f4f4"
		   });
		   $("#login_pro").css({
			   display: "inline", padding: "10px", color: "#222", "font-weight": "700",
		   	   "text-align": "center", border: "1px solid #cbcbcb", "border-bottom": "0",
		   		"background-color": "#fafafa"
		   });
	});
  $("#login_stu").on("click", function changestu() {
	   $("#login_pro").css({
		   display: "inline", padding: "10px", color: "#7a7a7a", "text-decoration": "none",
			"font-weight": "700", "text-align": "center", 
			border: "1px solid #dedede", "border-bottom": "0", "background-color": "#f4f4f4"
	   });
	   $("#login_stu").css({
		   display: "inline", padding: "10px", color: "#222", "font-weight": "700",
	   	   "text-align": "center", border: "1px solid #cbcbcb", "border-bottom": "0",
	   		"background-color": "#fafafa"
	   });
});
  </script>
</body>
</html>