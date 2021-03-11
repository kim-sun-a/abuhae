<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <div class="wrap_review">
                     <!-- header -->
                     <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${out.sitterno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">후기 관리</h3>
                            </div>
                        </div>
                    </header>

                    <!-- content1 -->
                    <section class="group1_review">
                        <!-- 탭버튼 -->
                        <div class="row">
                            <div class="col-xs-12 rev_tab">
                                <!-- 탭 버튼 영역 -->
                                <ul class="rev_tab_button">
                                   <li id="button3" class="tab_button_item">
                                        <a class="tab_button_item_link" href="#tab_page_3">받은 후기</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- 탭 내용 영역 -->
                        <div class="row">
                            <div class="col-xs-12 rev_tab_panel">
                                <div class="rev_tab_panel_con">
                                    <!-- 받은 후기 -->
                                    <div id="tab_page_3">
                                    	<c:forEach var="item" items="${output}" varStatus="status">
                                    		  <c:if test="${item.contents != null }">
                                    		  		
                              		  			<div class="si_rev_no">
		                                            <div class="si_rev_no_tl">
		                                                <!-- 후기작성 부모 프로필사진 -->
		                                                <div class="si_rev_no_prof">
		                                                    <c:if test="${item.isProfile eq '0'}">
	                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; border-radius: 50%;"/>
	                                                   		</c:if>
	                                                   		<c:if test="${item.isProfile eq 'y'.charAt(0) }">
	                                                   			<img src="${item.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
	                                                   		</c:if>
		                                                </div>
		                                                <!-- 후기작성 부모 정보 -->
		                                                <div class="si_rev_no_info">
		                                                    <h4>${item.name } 부모 <span class="rev_info" style="font-size: 0.85em; color: #999999;">영아 1명 ㅣ 채용후기</span></h4>
		                                                    <p class="star">
		                                                    	<c:if test="${item.rev_rate eq '1'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${item.rev_rate eq '2'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${item.rev_rate eq '3'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${item.rev_rate eq '4'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${item.rev_rate eq '5'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																</c:if>
		                                                    	<span class="rev_info" style="font-size: 0.85em; color: #999999;">${item.reg_date }</span>
		                                                    </p>
		                                                    <p class="rev_text">${item.contents}</p>
		                                                </div>
		                                            </div>
		                                        </div>	
                                    		  	
                                    		  </c:if>
                                    	</c:forEach>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>

                       <!-- 후기작성 모달 -->
                       <div id="rev_modal" class="modal fade" tabindex="-1" role="dialog"
                       aria-labelledby="modal_label" aria-hidden="true">
                           <!-- modal dialog -->
                           <div class="modal-dialog">
                               <!-- modal content -->
                               <div class="modal-content">
                                   <!-- 제목 -->
                                   <div class="modal-header">
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
                                           <i class="fas fa-times"></i>
                                       </button>
                                       <h4 class="modal-title" id="modalLabel" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                            후기 작성하기
                                       </h4>
                                   </div>
                                   <div class="modal-body"">
                                        <form action="#">
                                            <textarea name="rev_no_text" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
                                            <button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
                                            background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>
                                        </form>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div id="rev_modal2" class="modal fade" tabindex="-1" role="dialog"
                       aria-labelledby="modal_label2" aria-hidden="true">
                           <!-- modal dialog -->
                           <div class="modal-dialog">
                               <!-- modal content -->
                               <div class="modal-content">
                                   <!-- 제목 -->
                                   <div class="modal-header">
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
                                           <i class="fas fa-times"></i>
                                       </button>
                                       <h4 class="modal-title" id="modalLabel2" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                            답글 작성하기
                                       </h4>
                                   </div>
                                   <div class="modal-body"">
                                        <form action="#">
                                            <textarea name="rev_no_text" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
                                            <button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
                                            background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>
                                        </form>
                                   </div>
                               </div>
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