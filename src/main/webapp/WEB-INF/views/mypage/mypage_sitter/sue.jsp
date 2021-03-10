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
                <div class="wrap_sue">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${out.sitterno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">신고내역</h3>
                            </div>
                        </div>
                    </header>

                    <!-- content -->
                    <section class="sue_content">
                        
                            <c:choose>
                            	<c:when test="${output == null }">
                            		<p>조회결과가 없습니다.</p>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="item" items="${output }" varStatus="status">
	                            		<div class="row">
	                            			<div class="col-xs-12 sue_con_in">
				                                <div class="sue_con_prof">
				                                   <c:if test="${item.isProfile eq '0'}">
                                              			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; border-radius: 50%;"/>
                                              		</c:if>
                                              		<c:if test="${item.isProfile eq 'y'.charAt(0) }">
                                              			<img src="${item.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
                                              		</c:if>
				                                    <div class="sue_con_prof_in">
				                                        <h4>${item.name }</h4>
				                                        <p>신고 일시 : ${item.reg_date }</p>
				                                        <!-- 신고 이유 -->
				                                        <p>${item.contents }</p>
				                                    </div>
				                                </div>
				                                <!-- 라디오버튼으로 선택한 신고 이유 
				                                    (허위정보 기재, 부적절한 사진, 부적절한 내용, 규정 위반, 맘시터 회원 자격 없음, 기타 중 선택) -->
				                                <p class="sue_reason">${item.type}</p>
				                            </div>
			                            </div>
			                             <hr>
                            		</c:forEach>
                            	</c:otherwise>
                            </c:choose>
                    </section>
             
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="../../assets/js/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
	</body>
</html>