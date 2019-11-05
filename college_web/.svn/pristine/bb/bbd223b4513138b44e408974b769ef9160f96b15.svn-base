<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.example.sample.service.LoginVO" %>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>입실/퇴실 선택</title>
    <c:set var="registerFlag" value="${empty classselectVO.cno ? 'create' : 'modify'}"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='./css/egovframework/classview.css'/>"/>
    <validator:javascript formName="classselectVO" staticJavascript="false" xhtml="true" cdata="false"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        
        function fn_egov_come() {
        	document.detailForm.action = "<c:url value='/classdetailList.do'/>";
           	document.detailForm.submit();
        }
        function fn_egov_inout() {
        	frm = document.detailForm;
           	frm.action = "<c:url value='/addClass.do'/>";
            frm.submit();
        }
        
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:contents;">

<form:form commandName="classselectVO" id="detailForm" name="detailForm">
    <div class="contain">
    <div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapsehead">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></a>
				</h4>
				</div>
			<div id="collapsehead" class="panel-collapse collapse in">
			<div class="panel-body">
				<li class="panel-font"><a href="classSelectpage.do">출결관리</a></li>
				<li class="panel-font"><a href="Classtimetable.do">강의시간표</a></li>
				<li class="panel-font"><a href="collegemain.do">대학 홈페이지</a></li>
			</div>
			</div>
		</div>
		<div id = "logo"><a href="mainpage.do">E Z E N</a></div>
		<% LoginVO loginVO = (LoginVO)session.getAttribute("loginVO"); %>
        <c:set var="loginId" value="<%= loginVO.getId() %>"/>
	    <c:set var="loginName" value="<%= loginVO.getName() %>"/>
	    <ul class="sec1">
	        <li class="righttop_bgmiddle">
	        <c:choose>
	        <c:when test="${loginId == 'admin'}">
	        	<c:out value="관리자"/>님 	
	        </c:when>
	    	<c:otherwise>
	        <c:out value="${loginName}"/>님
	        </c:otherwise> 
	        </c:choose>
	        <a href="actionLogout.do" class="logoutbt">Logout</a></li>
	    </ul>
	</div>
    	<!-- // 타이틀 -->
    	<div id="table">
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
			<jsp:useBean id="toDay" class="java.util.Date" />
			<form:input path="cno" type="hidden"/>
			<form:input path="clname" type="hidden"/>
			<form:input path="clftime" type="hidden"/>
			<form:input path="cletime" type="hidden"/>
			<form:input path="cldate" type="hidden"/>
			<form:input path="classstatus" type="hidden"/>
			<h1 class="name"><c:out value="${classselectVO.clname}"/></h1>
			<h1 class= "totime">현재시간 : <fmt:formatDate type="time" value="${toDay}" pattern="HH:mm:ss" /></h1>
				
			
      	</div>
    	<div id="sysbtn">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal1">
        <span class="glyphicon glyphicon-log-in">입실 
        </span></button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2">
        <span class="glyphicon glyphicon-log-out">퇴실
        </span></button>

	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"></div>
	      <div class="modal-body">
	      <p>출석 처리 하시겠습니까? </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <a href="javascript:fn_egov_inout()"><button type="button" class="btn btn-primary">처리가 완료되었습니다.</button></a>
	      </div>
	    </div> 
	  </div> 
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            <div class="modal-header"></div>
	            <div class="modal-body">
	            <p>퇴실 처리 하시겠습니까? </p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                <a href="javascript:fn_egov_inout()"><button type="button" class="btn btn-primary">처리가 완료되었습니다.</button></a>
	            </div>
	            </div> 
	        </div> 
	</div>
    </div>
		<div id="sysbtn">
			<a href="javascript:fn_egov_come();">
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-list"></span>세부출결현황
			</button></a></div>
    </div>
</form:form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/jquery.bxslider.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
    <script type="text/javascript">
	$(function () { $('#collapsehead').collapse('hide')});
	$(".logoutbt").on("click", function() {
		if(${loginId == "admin"}) {
			alert("관리자님 로그아웃되었습니다.");
		} else {
		alert("<c:out value="${loginName}"/>님 " + "로그아웃되었습니다.");
		}
	});
	</script>
</body>
</html>