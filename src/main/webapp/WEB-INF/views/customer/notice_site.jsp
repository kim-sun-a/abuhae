<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>아부해 고객센터</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notice_site_yj.css" />
        <!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
        <style type="text/css">
	       	ul, li {
	       		list-style: none;
	       		padding: 0;
	       		margin: 0;
	       	}
       </style>
	</head>

	<body>
		<div class="container">
			<div class="row">
			
			<c:if test="${login != null }">
				<c:choose>
					<c:when test="${fn:contains(login.type, 'M')}">
						<%@ include file="../index_header_login_mom.jsp"%>
					</c:when>
					<c:when test="${fn:contains(login.type, 'S')}">
						<%@ include file="../index_header_login_sitter.jsp"%>
					</c:when>
				</c:choose>
			</c:if>
			<c:if test="${login == null }">
				<%@ include file="../index_header.jsp"%>
			</c:if>
	
                <div class="col-xs-12 nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/customer_center.do">아부해 고객센터</a>
                    </li>
                    <span>></span>
                    <li>
                        공지사항
                    </li>
                </div>
                <div class="col-xs-12 input">
                   <form action="${pageContext.request.contextPath}/customer/cus_search.do" role="search" class="search search-full" data-search
	                data-instant="true" autocomplete="off" accept-charset="UTF-8" method="GET">
	                	<input type="search" name="keyword" id="keyword" class="cus_search" value="${keyword}" placeholder="검색어를 입력하세요." aria-label="검색">
	                	<button type="submit" class="cus_btn"><i class="fas fa-search"></i></button>
	                </form>
                </div>
                <div class="col-xs-12 section">
                    <div class="section_header">
                    <!-- 두번째 카테고리 (부모 회원) -->
                    	<h2>공지사항</h2>
                    </div>
                 
                 <!-- 첫번째 서브 카테고리 게시글 목록 조회 -->
                    <div class="col-xs-12 section_middle">
                    	<!-- sub_category1 -->
               			<c:choose>
                   			<c:when test="${out==null || fn:length(out) == 0}">
                   				<p>조회결과가 없습니다.</p> 
                   			</c:when>
                   			
                   			<c:otherwise>
                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
                   					<!-- 카테고리=1(이용가이드) / 서브카테고리=1(이용가이드)의 작성글 제목 조회 -->
                   					<c:if test="${item_cate.cateno==2 && item_cate.subcateno==5}">
                   						<h2>${item_cate.sub_category}</h2>
                   					</c:if>
                   				</c:forEach>
                   			</c:otherwise>
                   		</c:choose>
                
                		<!-- sub_category1의 작성글 -->
                        <div class="col-xs-12 section_title">
                 		<c:choose>
                 			<c:when test="${output==null || fn:length(output) == 0}">
                 				<p>조회결과가 없습니다.</p>
                 			</c:when>
                 			
                 			<c:otherwise>
                 				<c:forEach var="item" items="${output}" varStatus="status">
                 					
                 					<%-- 상세페이지 URL --%>
                 					<c:url value="/customer/cus_view.do" var="viewUrl">
                 						<c:param name="boardnum" value="${item.boardnum}"/>
                 					</c:url>
                 					<c:if test="${item.subcateno == 5}">
                 						<ul>
                  						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
                  					</ul>
                 					</c:if>
                 					
                 				</c:forEach>
                 			</c:otherwise>
                 		</c:choose>
                 	</div>
                 </div>
                 
                 <div class="col-xs-12 section_middle">
                    	<!-- sub_category1 -->
               			<c:choose>
                   			<c:when test="${out==null || fn:length(out) == 0}">
                   				<p>조회결과가 없습니다.</p> 
                   			</c:when>
                   			
                   			<c:otherwise>
                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
                   					<!-- 카테고리=1(이용가이드) / 서브카테고리=1(이용가이드)의 작성글 제목 조회 -->
                   					<c:if test="${item_cate.cateno==2 && item_cate.subcateno==6}">
                   						<h2>${item_cate.sub_category}</h2>
                   					</c:if>
                   				</c:forEach>
                   			</c:otherwise>
                   		</c:choose>
                
                		<!-- sub_category1의 작성글 -->
                        <div class="col-xs-12 section_title">
                 		<c:choose>
                 			<c:when test="${output==null || fn:length(output) == 0}">
                 				<p>조회결과가 없습니다.</p>
                 			</c:when>
                 			
                 			<c:otherwise>
                 				<c:forEach var="item" items="${output}" varStatus="status">
                 					
                 					<%-- 상세페이지 URL --%>
                 					<c:url value="/customer/cus_view.do" var="viewUrl">
                 						<c:param name="boardnum" value="${item.boardnum}"/>
                 					</c:url>
                 					<c:if test="${item.subcateno == 6}">
                 						<ul>
                  						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
                  					</ul>
                 					</c:if>
                 					
                 				</c:forEach>
                 			</c:otherwise>
                 		</c:choose>
                 	</div>
                 </div>
                 
                </div>
                <div class="col-xs-12 footer">
                </div>
			</div> <!-- row 끝 -->
        </div> <!-- container 끝 -->
        
        <script type="text/javascript">
			$(function() {
				$("#mybutton").click(function(e) {
					$.ajax( {
						// 결과를 읽어올 URL
						url: '${pageContext.request.contextPath}/customer/hello2.do',
						// 웹 프로그램에게 데이터를 전송하는 방식
						// 생략할 경우 get으로 자동 지정됨
						method: 'get',
						// 전달할 조건값은 JSON형식으로 구성
						// 사용하지 않을 경우 명시 자체를 생략할 수 있다.
						data: {},
						// 읽어올 내용의 형식(생략할 경우 json)
						dataType: 'html',
						// 읽어온 내용을 처리하기 위한 함수
						success: function(req) {
							// 준비된 요소에게 읽어온 내용을 출력한다.
							$("#mybutton").before(req);
						}
					}); // end $.ajax
				}) // end $.#mybutton
			})
			//$(function() {
				//$("#menu").load("../index_header.html");
				//});
			</script>
	</body>
</html>