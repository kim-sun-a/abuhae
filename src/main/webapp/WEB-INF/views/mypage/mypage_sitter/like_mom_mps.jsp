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
                <div class="wrap_like_mom">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${login.sitterno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">내가 찜한 일자리 <span style="color: #ff7000;">${heartcount }명</span></h3>
                            </div>
                        </div>
                    </header>
                    <!-- end header -->
                    
                    <!-- content1 -->
                    <section class="grouop1_like_mom">
                        <div class="row">
                            <div class="col-xs-12 lm_tab">
                                <!-- 탭 메뉴 -->
                                <ul class="lm_tab_button">
                                    <li class="lm_tab_button_item pull-left">
                                        <a class="lm_tab_button_item_link selected" href="#lm_tab_page_1">
                                            <span class="glyphicon glyphicon-ok"></span> 전체
                                        </a>
                                    </li>
                                    <li class="lm_tab_button_item pull-left">
                                        <a class="lm_tab_button_item_link" href="#lm_tab_page_2">
                                            <span class="glyphicon glyphicon-ok"></span> 구인 중인 일자리만
                                        </a>
                                    </li>
                                </ul>
                                <!-- 내용 영역 -->
                                <div class="lm_tab_panel">
                                    <!-- 전체 일자리 -->
                                    <div id="lm_tab_page_1">
                                        <c:choose>
                                        	<c:when test="${output == null }">
                                        		<p>조회내역이 없습니다.</p>
                                       		</c:when>
                                       		<c:otherwise>
                                       			<c:forEach var="item" items="${output}" varStatus="status">
		                                        	<c:if test="${item.job_opening eq 'Y'.charAt(0)}">
		                                        		<div class="lm_page_cont" id="page_con_1">
				                                            <div class="lm_page_box">
				                                                <div class="lm_page_box_left">
				                                                    <c:if test="${item.isProfile eq '0'}">
			                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; border-radius: 50%;"/>
			                                                   		</c:if>
			                                                   		<c:if test="${item.isProfile eq 'y'.charAt(0) }">
			                                                   			<img src="${item.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
			                                                   		</c:if>
				                                                </div>
				                                                <div class="lm_page_box_right">
				                                                	<a href="${pageContext.request.contextPath}/page_detail/mom_detail.do?momno=${item.momno }">
				                                                    	<p style="color: #0e6f6f; font-weight: bold; font-size: 1em;">신생아&nbsp;${item.kids_num }명 ㅣ <span style="color: #888888; font-size: 0.9em;">${item.reg_date }</span></p>
				                                                    </a>
				                                                    <p style="font-size: 1em; font-weight: bold;">${item.apply_title}</p>
				                                                    <p style="color: #888888; font-size: 0.9em; font-weight: bold;">${item.si}&nbsp;${item.gu} ㅣ ${item.name }</p>
				                                                    <p style="color: #888888; font-size: 0.9em;">
				                                                        <i class="fas fa-dollar-sign" style="color: #007e62;"></i> 희망시급 ${item.payment }원 
				                                                    </p>
				                                                </div>          
				                                            </div>
				                                        </div>
		                                        	</c:if>
		                                        	<c:if test="${item.job_opening eq 'N'.charAt(0)}">
		                                        		<div class="lm_page_cont" id="no_show">
				                                            <div class="lm_page_box">
				                                                <div class="lm_page_box_left">
				                                                    <c:if test="${item.isProfile eq '0'}">
			                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; border-radius: 50%;"/>
			                                                   		</c:if>
			                                                   		<c:if test="${item.isProfile eq 'y'.charAt(0) }">
			                                                   			<img src="${item.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
			                                                   		</c:if>
				                                                </div>
				                                                <div class="lm_page_box_right">
				                                                    <p style="color: #0e6f6f; font-weight: bold; font-size: 1em; color: #888888;">신생아&nbsp;${item.kids_num }명 ㅣ <span style="color: #888888; font-size: 0.9em;">${item.reg_date }</span></p>
				                                                    <p style="font-size: 1em; font-weight: bold;">${item.apply_title}</p>
				                                                    <p style="color: #888888; font-size: 0.9em; font-weight: bold;">${item.si}&nbsp;${item.gu} ㅣ ${item.name }</p>
				                                                    <p style="color: #888888; font-size: 0.9em;">
				                                                        <i class="fas fa-dollar-sign" style="color: #007e62;"></i> 희망시급 ${item.payment }원 
				                                                    </p>
				                                                </div>          
				                                            </div>
				                                        </div>
		                                        	</c:if>
		                                        </c:forEach>
                                       		</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!-- end 전체 일자리 -->

                                    <!-- 구인중인 일자리 -->
                                    <div id="lm_tab_page_2" class="hide">
                                        <c:choose>
                                        	<c:when test="${output == null }">
                                        		<p>조회결과가 없습니다.</p>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:forEach var="it" items="${output }" varStatus="status">
                                        			<c:if test="${it.job_opening eq 'Y'.charAt(0)}">
                                        				
                                        					<div class="lm_page_cont" id="page_con_1">
					                                            <div class="lm_page_box">
					                                                <div class="lm_page_box_left">
					                                                    <c:if test="${it.isProfile eq '0'}">
				                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; height: 42px; border-radius: 50%;"/>
				                                                   		</c:if>
				                                                   		<c:if test="${it.isProfile eq 'y'.charAt(0) }">
				                                                   			<img src="${it.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
				                                                   		</c:if>
					                                                </div>
					                                                <div class="lm_page_box_right">
					                                                	<a href="${pageContext.request.contextPath}/page_detail/mom_detail.do?momno=${it.momno}">
					                                                    	<p style="color: #0e6f6f; font-weight: bold; font-size: 1em;">신생아&nbsp;${it.kids_num }명 ㅣ <span style="color: #888888; font-size: 0.9em;">${it.reg_date }</span></p>
				                                                    	</a>
					                                                    <p style="font-size: 1em; font-weight: bold;">${it.apply_title}</p>
					                                                    <p style="color: #888888; font-size: 0.9em; font-weight: bold;">${it.si}&nbsp;${it.gu} ㅣ ${it.name }</p>
					                                                    <p style="color: #888888; font-size: 0.9em;">
					                                                        <i class="fas fa-dollar-sign" style="color: #007e62;"></i> 희망시급&nbsp;${it.payment }원 
					                                                    </p>
					                                                </div>          
					                                            </div>
					                                        </div>
                                        			
                                        			</c:if>
                                        		</c:forEach>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!--end 구인 중인 일자리 -->
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
               $(".lm_tab_button_item_link").click(function(e) {
                   // 페이지 이동 방지
                   e.preventDefault();

                   $(".lm_tab_button_item_link").not(this).removeClass("selected");

                   $(this).addClass("selected");

                   var target = $(this).attr("href");
                   $(target).removeClass("hide");
                   $(".lm_tab_panel > div").not($(target)).addClass("hide");
               });

               /** 임시 삭제 기능 */
               $(".garbage").click(function(e) {
                   var is_ok = confirm("정말 삭제하시겠습니까?");

                   if(is_ok) {
                    $(this).parents("#page_con_1").addClass("hide");
                   }
               });
               
               $("#no_show").click(function(e) {
            	   alert("프로필을 비공개하였습니다.");
               });
           });
           
        </script>
	</body>
</html>