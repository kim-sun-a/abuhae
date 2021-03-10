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
		<title>맘시터 > 부모회원 > 돌봄활동과 활동비</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mom_activity_ch2_yj.css" />
        <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
        <!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
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
			
			<!-- header end-->
                <div class="col-xs-12 nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/customer_center.do">아부해 고객센터</a>
                    </li>
                    <span>></span>
                    <li>
                    	${output.category}
                    </li>
                    <span>></span>
                    <li>
                        ${output.sub_category}
                    </li>
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
                        <h1>[${output.sub_category}] ${output.title}</h1>
                        </div>
                    </div>
                    <div class="col-xs-12 article">
                        <div class="col-xs-2 article_img">
                            <img src="${pageContext.request.contextPath}/assets/img/logo2.png" width="" height="40">
                        </div>
                        <div class="col-xs-10 article_title">
                            <p style="margin-top: 10px;">아부해 고객지원팀</p>
                    </div>
                    </div>
                    <div class="col-xs-12 section_body">
                        ${output.text}
                    </div>
                    <div class="col-xs-12 section_footer">
                        <p>선긋기</p>
                    </div>
                    <div class="col-xs-12 article_footer">
                        <span>아부해를 이용해 주셔서감사합니다.</span>
                    </div>
                    <div class="col-xs-12 chat">
                        <a href="#" class="chat_title">1:1 채팅 문의하기</a>
                    </div>
                    <div class="col-xs-12 topbar">
                        <a href="#">
	                        <div class="col-xs-5 topbar_1">맨 위로 돌아가기
	                        </div>
	                        <div class="col-xs-7 topbar_2">
	                            <span class="glyphicon glyphicon-chevron-up" id="glyphicon_3">    
	                            </span>
	                        </div>
                    	</a>
                    </div>
			</div> <!-- row 끝 -->
        </div> <!-- container 끝 -->
	</body>
</html>