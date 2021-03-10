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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/guide_yj.css" />
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
			
			<div id="menu">
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
				<%-- <h3>${login.type}, ${login.momno }</h3>
				<p>${login.sitterno }</p> --%>
			</div>
			
                <div class="col-xs-12 nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/customer_center.do">아부해 고객센터</a>
                    </li>
                    <span>></span>
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/faq.do">자주하는 질문</a>
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
                        <!-- 첫번째 카테고리 (자주묻는 질문) -->
                        	<h2>자주묻는 질문</h2>
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
	                   					<c:if test="${item_cate.cateno==1 && item_cate.subcateno==1}">
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
	                    					<c:if test="${item.cateno==1 && item.subcateno == 1}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    					
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
	                    	</div>
	                    </div>
	                    
	                    <!-- 두번째 서브 카테고리 게시글 목록 조회 -->
                        <div class="col-xs-12 section_middle">
                        	<!-- sub_category2 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(out) == 0}">
	                   				<p>조회결과가 없습니다.</p> 
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<!-- 카테고리=1(이용가이드) / 서브카테고리=1(이용가이드)의 작성글 제목 조회 -->
	                   					<c:if test="${item_cate.cateno==1 && item_cate.subcateno==2}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
	                   		<!-- sub_category2의 작성글 -->
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
	                    					<c:if test="${item.cateno==1 && item.subcateno == 2}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    					
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
	                    	</div>
	                    </div>
                    
                    	<!-- 세번째 서브 카테고리 게시글 목록 조회 -->
                        <div class="col-xs-12 section_middle">
                        	<!-- sub_category3 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(out) == 0}">
	                   				<p>조회결과가 없습니다.</p> 
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<!-- 카테고리=1(이용가이드) / 서브카테고리=1(이용가이드)의 작성글 제목 조회 -->
	                   					<c:if test="${item_cate.cateno==1 && item_cate.subcateno==3}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
	                   		<!-- sub_category3의 작성글 -->
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
	                    					<c:if test="${item.cateno==1 && item.subcateno == 3}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title} </a></li>
		                    					</ul>
	                    					</c:if>
	                    					
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
	                    	</div>
	                    </div>
	                    
	                    <!-- 네번째 서브 카테고리 게시글 목록 조회 -->
                        <div class="col-xs-12 section_middle">
                        	<!-- sub_category4 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(out) == 0}">
	                   				<p>조회결과가 없습니다.</p> 
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<!-- 카테고리=1(이용가이드) / 서브카테고리=1(이용가이드)의 작성글 제목 조회 -->
	                   					<c:if test="${item_cate.cateno==1 && item_cate.subcateno==4}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
	                   		<!-- sub_category4의 작성글 -->
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
	                    					<c:if test="${item.cateno==1 && item.subcateno == 4}">
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
                    
                    <div class="col-xs-12 footer"></div>
			</div> <!-- row 끝 -->
        </div> <!-- container 끝 -->

	</body>
</html>