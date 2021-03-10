<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mps_detail.css">
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_mng_account">
                    <!-- header -->
                    <header class="mp_detail_tl" style="border-bottom: 1px solid #ccc;">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${login.sitterno}">
                                    <i class="fas fa-angle-left"></i>
                                </a>
                                <h3 class="center-block">계정 관리</h3>
                            </div>
                        </div>
                    </header>

                    <div class="total_account">
                        <!-- 첫번째 항목 -->
                        <section class="group1_mng_account">
                            <div class="row">
                                <div class="col-xs-12 account_con_in">
                                    <div class="acc_con_one">
                                        <div class="acc_con_left col-xs-6">
                                            <p>회원 가입 정보</p>
                                        </div>
                                    </div>
                                    <div class="acc_con_two">
                                        <div class="user_info_p user_type">
                                            <h5 class="col-xs-4 col-md-3">회원 유형</h5> 
                                            <c:if test="${fn:contains(login.type, 'M')}">
                                               <p class="col-xs-8 col-md-5">부모회원</p>
                                            </c:if>
                                            <c:if test="${fn:contains(login.type, 'S')}">
                                               <p class="col-xs-8 col-md-5">시터회원</p>
                                            </c:if>
                                        </div>
                                        <div class="user_info_p user_now_id">
                                            <h5 class="col-xs-4 col-md-3">사용중인 아이디</h5>
                                            <p class="col-xs-8 col-md-5">${output.id }</p>
                                        </div>
                                        <div class="user_info_p user_phone">
                                            <h5 class="col-xs-4 col-md-3">가입한 휴대폰 번호</h5>
                                            <p class="col-xs-5 col-md-3">${output.phone }</p>
                                            <div><button type="button" class="col-xs-3 col-md-2"><a data-toggle="modal" href="#upd_phonenumber">수정하기</a></button></div>
                                        </div>
                                        <div class="user_info_p user_email">
                                            <h5 class="col-xs-4 col-md-3">가입한 이메일</h5>
                                            <p class="col-xs-5 col-md-3">${output.email }</p>
                                            <div><button type="button" class="col-xs-3 col-md-2"><a data-toggle="modal" href="#upd_email">수정하기</a></button></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 휴대폰번호 수정 modal -->
                            <div id="upd_phonenumber" class="modal fade" tabindex="-1" role="dialog"
                            aria-labelledby="modal_label1" aria-hidden="true">
                                <!-- modal dialog -->
                                <div class="modal-dialog">
                                    <!-- modal content -->
                                    <div class="modal-content">
                                        <!-- 제목 -->
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
                                                <i class="fas fa-times"></i>
                                            </button>
                                            <h4 class="modal-title" id="modal_label1" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                                    휴대폰 번호 수정하기
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="${pageContext.request.contextPath}/mypage/updateSitterPhone.do">
                                            	<label for="new_phonenumber">새로운 휴대폰 번호</label>
                                                <input type="hidden" name="memberno" value="${login.memberno}">
                                                <input type="text" name="phone" id="new_phonenumber" placeholder="새로운 휴대폰 번호를 입력하세요." 
                                                style="width: 100%; line-height: 36px; padding: 0 20px; border: 0; border: 2px solid #ccc;">
                                                <button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
                                                background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--// 후기작성 modal end -->
                            <!-- 가입한 이메일 수정 modal -->
                            <div id="upd_email" class="modal fade" tabindex="-1" role="dialog"
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
                                                    이메일 수정하기
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                        	<form method="POST" action="${pageContext.request.contextPath}/mypage/updateSitterEmail.do">
                                                <label for="new_email">새로운 이메일</label>
                                                <input type="hidden" name="memberno" value="${login.memberno}">
                                                <input type="text" name="email" id="new_email" placeholder="새로운 이메일을 입력하세요." 
                                                style="width: 100%; line-height: 36px; padding: 0 20px; border: 0; border: 2px solid #ccc;">
                                                <button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
                                                background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!--// 후기작성 modal end -->
                        </section>

                        <!-- 두번째 항목 -->
                        <section class="group_account_foot">
                            <div class="row">
                                <div class="col-xs-12 account_ft_in">
                                    <a class="account_ft_btn" href="${pageContext.request.contextPath}/mypage/mypage_sitter/updp/${login.memberno}">
                                        <p>비밀번호 변경</p>
                                        <i class="fas fa-angle-right"></i>
                                    </a>
                                    <div class="line"></div>
                                    <a class="account_ft_btn" href="${pageContext.request.contextPath}/mypage/mypage_sitter/leave_abu.do">
                                        <p>회원탈퇴 신청</p>
                                        <i class="fas fa-angle-right"></i>
                                    </a>
                                    <div class="line"></div>
                                    <a class="account_ft_btn" href="${pageContext.request.contextPath}/mypage/mypage_sitter/agree_service.do">
                                        <p>아부해 서비스 이용 동의</p>
                                        <i class="fas fa-angle-right"></i>
                                    </a>
                                    <div class="line"></div>
                                </div>
                            </div>
                        </section> 
                    </div>
            
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	</body>
</html>