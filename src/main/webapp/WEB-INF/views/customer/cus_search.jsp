<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

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
    		margin-bottom: 10px;
    		font-size: 1.1em;
    	}
    	
    	li:last-child {
			margin: 0;
		}
   	</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div id="menu">
				<c:if test="${isLogin ==true }">
					<c:choose>
						<c:when test="${fn:contains(loginType, 'M')}">
							<%@ include file="../index_header_login_mom.jsp"%>
						</c:when>
						<c:when test="${fn:contains(loginType, 'S')}">
							<%@ include file="../index_header_login_sitter.jsp"%>
						</c:when>
					</c:choose>
				</c:if>
				<c:if test="${isLogin == null }">
					<%@ include file="../index_header.jsp"%>
				</c:if>
			</div>

			<div class="col-xs-12 nav">
				<li><a href="${pageContext.request.contextPath}/customer/customer_center.do">아부해
						고객센터</a></li> <span>></span>
				<li>게시글 검색</li>
			</div>
			<div class="col-xs-12 input">
				<form
					action="${pageContext.request.contextPath}/customer/cus_search.do"
					role="search" class="search search-full" data-search
					data-instant="true" autocomplete="off" accept-charset="UTF-8"
					method="GET">
					<input type="search" name="keyword" id="keyword" class="cus_search"
						value="${keyword}" placeholder="검색" aria-label="검색">
					<button type="submit" class="cus_btn">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
			<div class="col-xs-12 section">
				<div class="section_header">
					<!-- 두번째 카테고리 (부모 회원) -->
					<h3>"${keyword}" 검색결과</h3>
				</div>

				<hr>

				<!-- 첫번째 서브 카테고리 게시글 목록 조회 -->
				<div class="col-xs-12 section_middle">
					<div class="col-xs-12 section_title">
						<c:choose>
							<%-- 조회겨로가가 없는 경우 --%>
							<c:when test="${output == null}">
                     			조회결과가 없습니다.
                     		</c:when>
							<%-- 조회결과가 있는 경우 --%>
							<c:otherwise>
								<c:forEach var="item" items="${output}" varStatus="status">
									<%-- 출력을 위한 게시글 제목 변수 --%>
									<c:set var="title" value="${item.title}" />

									<%-- 검색어가 있는 경우 --%>
									<c:if test="${keyword != ''}">
										<c:set var="mark" value="<mark>${keyword}</mark>" />
										<c:set var="title" value="${fn:replace(title, keyword, mark)}" />
									</c:if>

									<%-- 상세페이지 URL --%>
									<c:url value="/customer/cus_view.do" var="viewUrl">
										<c:param name="boardnum" value="${item.boardnum}" />
									</c:url>
									<ul>
										<li><a href="${viewUrl}">[${item.sub_category}]
												${title}</a></li>
									</ul>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="col-xs-12 footer"></div>
	</div>
	<!-- row 끝 -->
</div>
<!-- container 끝 -->
</body>

</html>