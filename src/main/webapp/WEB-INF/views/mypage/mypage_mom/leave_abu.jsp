<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    
    	<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div id="menu">
                    <c:if test="${login != null }">
                        <c:choose>
                            <c:when test="${fn:contains(login.type, 'M')}">
                                <%@ include file="../../index_header_login_mom.jsp"%>
                            </c:when>
                            <c:when test="${fn:contains(login.type, 'S')}">
                                <%@ include file="../../index_header_login_sitter.jsp"%>
                            </c:when>
                        </c:choose>
                    </c:if>
                    <c:if test="${login == null }">
                        <%@ include file="../../index_header.jsp"%>
                    </c:if>
                </div>

               <div class="wrap_leave_abu">
                    <!-- content -->
                    <section class="check_leave">
                        <div class="row">
                            <div class="col-md-6 col-xs-12" style="float: none; margin: 0 auto;">
                                <div class="check_leave_title" style="text-align: center;">
                                    <h3><mark>회원탈퇴 전</mark> 꼭 확인해주세요!</h3>
                                    <br>
                                    <p>아래 사유로 탈퇴를 원하실 경우 <br/> '문의하기' 버튼을 통해 먼저 연락주시기 바랍니다. </p>
                                </div>
                                <div class="check_leave_cont">
                                    <ul>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 기존 계정을 버리고 새로운 계정으로 재가입 하려는 경우
                                        </li>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 부모 또는 시터회원으로 회원 유형을 변경하고 싶은 경우 
                                        </li>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 맘시터 유형을 잘못 선택한 경우 (대학생, 엄마, 선생님, 일반)
                                        </li>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 아이디 수정 및 변경이 필요한 경우
                                        </li>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 패스워드 수정 및 변경이 필요한 경우
                                        </li>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 당분간 구직/ 구인 활동 계획이 없을 경우
                                        </li>
                                        <li>
                                            <span style="color: #ff7000;"><i class="fas fa-check"></i></span> 문자 및 카톡이 너무 많이 와서 조치가 필요한 경우.
                                        </li>
                                    </ul>
                                </div>
                                <div class="leave_question" style="text-align: center;">
                                    <h4>고객센터 <br> <span style="font-size: 0.8em;">02) 1234-5678</span></h4>
                                    <p>운영시간 평일 10:00 ~ 18:00
                                        <br> (점심시간 12:00 ~ 13:00 제외 ㅣ 주말, 공휴일 제외)
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="recheck">
                        <div class="row">
                            <div class="col-md-6 col-xs-12" style="float: none; margin: 0 auto;">
                                <div class="recheck_title" style="text-align: center;">
                                    <p>위 내용을 잘 확인하셨나요?</p>
                                    <h3>아부해 <mark>탈퇴신청</mark>을 하시겠습니까?</h3>
                                </div>
                                <div class="recheck_cont">
                                    <ul style="list-style: outside;">
                                        <li>회원 탈퇴 요청 시 고객관리팀이 지난 활동 내용을 검토 후, 탈퇴처리가 진행됩니다.</li>
                                        <li>회원 탈퇴 처리가 완료되면, 약관에 따라 데이터가 삭제되며 복구되지 않습니다.</li>
                                    </ul>
                                </div>
                                <form name="form" method="POST" action="${pageContext.request.contextPath}/mypage/mypage_mom/leaveok.do" onsubmit="return check()">
                                    <div class="recheck_reason">
                                        <label for="leave_reason">탈퇴 사유</label>
                                        <input type="hidden" name="memberno" value="${login.memberno}">
                                        <input type="text" name="leave_reason" id="leave_reason" placeholder="여기에 적어주세요.">
                                        <p>알려주신 소중한 내용으로 더 좋은 맘시터 서비스를 만들 수 있도록 노력하겠습니다.</p>
                                        <button type="submit">탈퇴 신청</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
               </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function check(){
                if(form.leave_reason.value==""){
                    alert("탈퇴 사유를 적어 주세요.");
                    $("#leave_reason").focus();
                    return false;
                }

                if (!confirm("정말 탈퇴하시겠습니까?")) {
							return false;
				}
                return true;
            }
        </script>
	</body>
</html>