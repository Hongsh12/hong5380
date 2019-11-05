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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <title>공지사항페이지</title>
    <link rel="stylesheet"  href="./css/egovframework/board_style.css">
    <script type="text/javaScript" language="javascript" defer="defer">
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateBoardView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/boardList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/boardList.do'/>";
           	document.listForm.submit();
        }
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addboardtView.do'/>";
           	document.listForm.submit();
        }
        function fn_egov_Select() {
        	if(${loginName != null}) {
        		if(true) {
        		document.listForm.action = "<c:url value='/classSelectpage.do'/>";
               	document.listForm.submit();
        		} 
        	} else if(${loginName == null}) {
        		if(true) {
       			var con_test = confirm("로그인이 필요합니다.");
	   	           	if(con_test == true) {
	   	           		window.location.href = "<c:url value='/login.do'/>";
	   	           	} else {
	   	           		return;
	   	           	}
           		}
        	}
        }
        function fn_egov_time() {
        		if(${loginName != null}) {
            		if(true) {
            		document.listForm.action = "<c:url value='/Classtimetable.do'/>";
                   	document.listForm.submit();
            		} 
            	} else if(${loginName == null}) {
            		if(true) {
            		var con_test = confirm("로그인이 필요합니다.");
	    	           	if(con_test == true) {
	    	           		window.location.href = "<c:url value='/login.do'/>";
	    	           	}else {
	       	           		return;
	       	           	}
            		}
            	}
            }
    </script>
</head>

<body style="margin:0 auto; display:inline; padding-top:100px;">
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
				<li class="panel-font"><a href="javascript:fn_egov_Select()">출결관리</a></li>
				<li class="panel-font"><a href="javascript:fn_egov_time()">강의시간표</a></li>
				<li class="panel-font"><a href="collegemain.do">대학 홈페이지</a></li>
			</div>
			</div>
		</div>
		<div id = "logo"><a href="mainpage.do">E Z E N</a></div>
		<%
       LoginVO loginVO = (LoginVO)session.getAttribute("loginVO"); 
       if(loginVO == null){ 
    	%>
    <div id="header_loginname">
        <a href="#" ></a>
    </div>
    <div class="header_loginconnection"></div>
    <ul class="sec1">
        <li class="righttop_bgmiddle"><a href="<c:url value='login.do'/>">Login</a></li>
    </ul>
    <% }else { %>
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
    <% } %>
	</div>
    
    <section>
    	<ol class="breadcrumb">
                |
                <li class="active"><a href="#">공지사항</a></li>
                |
                <li><a href="freeboard.do">자유게시판</a></li>
                |
                <li><a href="mainNews.do">주요소식</a></li>
                |
        </ol>
    </section>

    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- List -->
        	<div class="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="ID, 제목, 내용, 작성자, 조회수">
        			<caption style="visibility:hidden">ID, 제목, 내용, 작성자, 조회수</caption>
        			<colgroup>
        				<col width="10"/>
        				<col width="80"/>
        				<col width="20"/>
        				<col width="30"/>
        			</colgroup>
        			<tr class="headtable">
        				<th align="center">No</th>
        				<th align="center">제목</th>
        				<th align="center">작성자</th>
        				<th align="center">ID</th>
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr class="thumbnail">
            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.bname}"/>')"><c:out value="${result.bname}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.writer}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.bid}"/></a></td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging" style="text-align: center;margin: 5px;">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<c:if test="${loginId == 'admin'}">
        	<div id="sysbtn">
    			<a href="javascript:fn_egov_addView();">
				<button type="button" class="btn btn-default">
					<span class="glyphicon glyphicon-pencil"></span>글쓰기
				</button></a>
            </div>
            </c:if>
        	<div id="search">
       			    <label for="searchCondition" style="visibility:hidden;"></label>
       				<form:select path="searchCondition" cssClass="use">
       					<form:option value="0" label="제목" />
       					<form:option value="1" label="작성자" />
       				</form:select>
        			<label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                    <form:input path="searchKeyword" cssClass="txt"/>
       	            <span class="btn_blue_l">
       	                <a href="javascript:fn_egov_selectList();">검색</a>
       	            </span>
        	</div>
    </form:form>
    <footer id="re-footer">
            <img src="../images/egovframework/example/footer_logo.png" class="imgsbox">
            <div class="addr">
                대전광역시 서구 대덕대로 325<br>
        
                이젠컴퓨터대학교
                <span class="p">대표자 : 김동욱</span><br>
                
                학교의 명칭 : 이젠컴퓨터대학교
                <p class="copy">Copyright by EZEN. All rights reserved.</p>
            </div>
        </footer>
	</div>
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
