<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
         <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mpm_detail.css">
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_count_mom">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do?momno=${login.momno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">내 채용 내역</h3>
                            </div>
                        </div>
                    </header>
                    
                    <!-- 두번째 항목 -->
                    <section class="group1_count_mom">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="total_count">
                                    <p>
                                        총 <span style="color: #ff7000;">${workcount }</span>회
                                    </p>
                                </div>
                                <div class="cm_page_cont">
                                    <c:forEach var="item" items="${output}" varStatus="status">
                                    	<div class="ls_page_cont no_work">
                                        	<div class="ls_page_box">
	                                            <div class="ls_page_box_left">
	                                                <c:if test="${item.isProfile eq '0'}">
                                               			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 52px; height: 52px; border-radius: 50%;"/>
                                               		</c:if>
                                               		<c:if test="${item.isProfile eq 'y'.charAt(0) }">
                                               			<img src="${item.fileUrl }" alt="임시프로필" style="width: 52px; height: 52px; border-radius: 50%;">
                                               		</c:if>
	                                            </div>
	                                            <div class="ls_page_box_right">
	                                                <p style="font-size: 1em; font-weight: bold;">${item.name } <span style="color: #888888; font-size: 0.8em;">  | 지원 날짜 : ${item.applydate }</span></p>
	                                                <p style="color: #888888; font-size: 0.8em; font-weight: bold;">${item.si }&nbsp;${item.gu } </p>
	                                                <p style="color: #888888; font-size: 0.8em;">
	                                                    <span>${item.birthdate}세</span> l <span>희망시급 ${item.payment }원</span> 
	                                                </p>
	                                            </div>          
	                                        </div>
	                                    </div>
                                    </c:forEach>
                                </div>                      
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

        <script>
           $(function() {
               /**  탭 버튼의 클릭 처리 */
               $(".tab-button-item-link").click(function(e) {
                   // 페이지 이동 방지
                   e.preventDefault();

                   $(".tab-button-item-link").not(this).removeClass("selected");

                   $(this).addClass("selected");

                   var target = $(this).attr("href");
                   $(target).removeClass("hide");
                   $(".tab-panel > div").not($(target)).addClass("hide");
               });
           });
           
        </script>
	</body>
</html>