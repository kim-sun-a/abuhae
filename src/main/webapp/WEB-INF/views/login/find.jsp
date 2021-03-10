<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>아이를부탁해</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

    <!-- bootstrap -->
    <!--절대 경로 수정 1220 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--login css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css" />
    <!--header css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index_header.css">
    <!-- 아이콘 사용 -->
    <script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script>
    <!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <style type="text/css">
        .container {
            padding: 0;
            background-color: #f6f6f6;
            min-height: 736px;
        }
        i {
            font-style: normal;
        }
        .swal-button {
            padding: 7px 19px;
            border-radius: 2px;
            background-color: #ff7000 !important;
            font-size: 12px;
            border: 1px solid #ff7000 !important;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>

<body>
    <div id="find" class="container">
        <div id="menu">
            <%@ include file="../index_header.jsp"%>
        </div>
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <!--end header-->
            <div class="find_wrap">
            <c:if test="${isfind==null }">
                <div id="shwide" class="show_content">
                    <div class="find_title">
                        <h3>계정 찾기</h3>
                        <p>
                            <strong>아이디나 비밀번호를 잊어버리셨나요?</strong><br>
                            이름과 생년월일(YYYYMMDD), 휴대폰 번호를 입력하시면, 가입한 계정 정보를 알려드립니다.
                        </p>
                    </div>
                    <form id="findForm" method="POST" action="${pageContext.request.contextPath}/login/find_ok">
                        <div class="find_box">
                            <label>이름</label><input id="name" name="name" type="text" placeholder="이름을 입력하세요.">
                            <hr>
                            <label>생년월일 (예, 19860107)</label><input id="birthdate" name="birthdate" type="text" placeholder="생년월일 8자리(YYYYMMDD)를 입력해주세요.">
                            <hr>
                            <label>휴대폰번호(예, 01012345678)</label><input id="tel" name="tel" type="text" placeholder="휴대폰 번호를 '-' 없이 입력해주세요.">
                            <hr>
                        </div>
                        <button class="next_btn" type="submit" id="find_account">계정 찾기</button>
                    </form>
                </div>
                </c:if>

                <!--찾은 정보가 있을시에-->
                <c:if test="${isfind=='OK' }">
                <div class="show_content">
                    <div class="find_title">
                        <h3>계정 정보</h3>
                        <p>
                            입력한 정보로 가입한 계정 정보입니다. 임시 비밀번호 발급이 필요한 경우, '임시 비밀번호 받기' 버튼을 클릭해 주세요. 임시 비밀번호를 기입하신 이메일 번호로 전송해 드립니다.<br>
                            (비밀번호 변경은 로그인후 [마이페이지 -> 비밀번호변경]에서 가능합니다.)
                            </p>

                        <div id="find_id">아이디: <i id="getid">${id}</i></div>

                        <button class="next_btn_pw" id="find_account_pw">임시 비밀번호 발급</button>
                        <a href="${pageContext.request.contextPath}/login/find.do"><button class="next_btn" id="find_account">돌아가기</button></a>
                    </div>
                </div>
                </c:if>
            </div>
        </div> <!-- fin. col-xs-12 -->
    </div>
    <!--sweetalert plugin-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        /* $(function () {
            //$("#menu").load("../index_header.html");

            $("#find_account").on("click", function () {
                if ($("#name").val() == "정지우" && $("#birthdate").val() == "19700101" && $("#tel").val() == "01012345678") {
                    $("#shwide").removeClass("show_content");
                    $("#shwide").addClass("hide_content");

                    $("#shwide").next().removeClass("hide_content");
                    $("#shwide").next().addClass("show_content");
                }
            });
        }); */

        $(function(){
		$(".next_btn_pw").click(function(){

			$.ajax({
				url : "findpw",
				type : "POST",
				data : {
					id : $("#getid").text()
				},
				success : function(result) {
                    swal({
                        text: "임시 비밀번호가 발급되었습니다."
                    });

				},
                error : function() { //통신 실패시 ㅠㅠ
                    swal({
                        text: "발급에 실패했습니다. 관리자에게 문의해 주세요."
                    });
					}
			})
		});
	})
    </script>
</body>

</html>