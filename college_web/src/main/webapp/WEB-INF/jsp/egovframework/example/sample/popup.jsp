<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="egovframework.example.sample.service.LoginVO" %>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<title>팝업창</title>
<link rel="stylesheet"  href="./css/egovframework/popip_style.css">
<script type="text/javascript">
	function setPopUpStart(obj){
		if(obj.checked == true){
			var expireDate = new Date();
			expireDate.setMonth(expireDate.getMonth() + 1); // 쿠키의 유효 시간을 한달로 설정.
			
			// notShowPop 쿠키 값을 true로 설정하여 재접속시 팝업창을 나타내지 않게 함.
			document.cookie = "notShowPop="+ "true" +";path=/; expires="+ expireDate.toGMTString();
			window.close();
		}
	}
</script>
</head>
<body>
	<form>
	<div id = "logo">E Z E N</div>
	<img src="../images/egovframework/example/img3.png" />
		<input type="checkbox" onclick="setPopUpStart(this)"/>오늘 더 이상 팝업창 띄우지 않기
		<button onclick="javascript:self.close();">팝업창 닫기</button>
	</form>
</body>
</html>