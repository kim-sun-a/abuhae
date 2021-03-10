<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>아이를부탁해</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        
        <!-- icon 참조 -->
        <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mps_detail.css">
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_payment">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do?momno=${login.momno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">결제내역</h3>
                            </div>
                        </div>
                    </header>

                    <!-- content -->
                    <section class="group1_payment">
                        <div class="row">
                            <div class="col-xs-12 payment_cont1">
                                <c:choose>
                                	<c:when test="${output == null}">
                                		<p>결제 내역이 없습니다.</p>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="kind_payment">
		                                    <c:if test="${output.ticket_type eq '1'}">
		                                    	<p>무제한 이용권 (1개월)</p>
		                                    </c:if>
		                                    <c:if test="${output.ticket_type == '3'}">
		                                    	<p>무제한 이용권 (3개월)</p>
		                                    </c:if>
		                                    <c:if test="${output.ticket_type == '6'}">
		                                    	<p>무제한 이용권 (6개월)</p>
		                                    </c:if>
		                                    <p>결제 일시 ${output.startdate }</p>
		                                </div>
		                                <div class="money_payment">
		                                    <p>${output.ticket_price }원</p>
		                                </div>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <hr/>
                    </section>
             
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	</body>
</html>