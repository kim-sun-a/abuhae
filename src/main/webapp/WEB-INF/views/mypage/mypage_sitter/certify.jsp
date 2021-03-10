<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="wrap_certify">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${login.sitterno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">내 인증 관리</h3>
                            </div>
                        </div>
                    </header>

                    <section class="certify_tip">
                        <div class="row">
                            <div class="col-xs-12 tip_cont">
                                <div>
                                    <i class="fas fa-comment-dollar"></i>
                                </div>
                                <div>
                                    <p>
                                        인증 완료시 <span>쿠폰 즉시 지급!</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- cotent1 -->
                    <section class="group1_certify">
                        <div class="row">
                            <div class="col-xs-12 certify_cont1">
                                <!-- 첫번째 인증 -->
                                <div class="my_certi">
                                    <div class="my_certi_left">
                                        <c:choose>
                                        	<c:when test="${certify.cert == 'Y'}">
                                        		<img src="${pageContext.request.contextPath}/assets/img/mypage_img/certified.png" alt="인증 아이콘"> <br/>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<span style="color: #ccc; font-size: 5em"><i class="fas fa-certificate"></i></span>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="my_certi_right">
                                        <h3>
                                            등초본 인증 <span style="color: #ff2d81; font-size: 0.619em;">(핵심)</span>
                                        </h3>
                                        <br>
                                        <p>
                                            주민등록/초본으로 내 상태를 인증받으세요. <br/>
                                            <span style="color: #09f; font-size: 0.85em;">- 발급일 6개월 이내만 유효</span>
                                        </p>
                                        <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/certify_resident.do?sitterno=${login.sitterno}">
                                            <button type="button">
                                                인증받기 <i class="fas fa-angle-right"></i>
                                            </button>
                                        </a>
                                    </div>
                                </div>

                                <!-- 두반째 인증-->
                              <!--   <div class="my_certi">
                                    <div class="my_certi_left">
                                        <img src="../img/certified.png" alt="인증 아이콘"> <br/>
                                    </div>
                                    <div class="my_certi_right">
                                        <h3>
                                            엄마 미인증 <span style="color: #ff2d81; font-size: 0.619em;">(추가)</span>
                                        </h3>
                                        <br>
                                        <p>
                                            가족관계증명서로 엄마 인증을 받으세요. <br/>
                                            <span style="color: #09f; font-size: 0.85em;">- 발급일 6개월 이내만 유효</span>
                                        </p>
                                        <a href="certify_mom.html">
                                            <button type="button">
                                                인증받기 <i class="fas fa-angle-right"></i>
                                            </button>
                                        </a>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </section>

                    <!-- 두번째 항목 -->
                    <section class="group2_certify">
                        <div class="row">
                            <div class="col-xs-12 certify_cont2">
                                <c:choose>
                                	<c:when test="${certify.cert == 'Y' }">
	                                	<p>
		                                    <i class="fas fa-stamp"></i> <br/>
		                                    인증이 완료되었습니다.
		                                </p>
                                	</c:when>
                                	<c:otherwise>
                                		<p>
		                                    <i class="fas fa-stamp"></i> <br/>
		                                    인증을 받으면 부모님에게 <br/>
		                                    더 많은 선택을 받게 됩니다.
		                                </p>
                                	</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </section>                   
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	</body>
</html>