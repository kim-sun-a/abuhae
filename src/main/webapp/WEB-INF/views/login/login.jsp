<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %>
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
		<!--절대 경로 수정 1220 선아-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        <!--header css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index_header.css">
        <!-- icon 참조 -->
        <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>
        <!--login css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css" />
        <!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<style type="text/css">
            .container {
                padding: 0;
                background-color: #f6f6f6;
                min-height: 100vh;
            }
		</style>
	</head>

	<body>
		<div id="login" class="container">
            <div id="menu">
                <%@ include file="../index_header.jsp"%>
            </div>
            <div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
                <h2 class="title">로그인</h2>
                <form method="POST" action="${pageContext.request.contextPath}/login/login_ok.do">
                <div class="login_box">
                    <input type="text" id="userid" name="user_id" placeholder="아이디를 입력해 주세요.">
                    <hr>
                    <input type="password" id="password" name="user_pw" placeholder="비밀번호를 입력하세요">
                </div>
                <button class="next_btn" type="submit" id="login_btn">로그인</button>
                </form>

                <div class="other_action">
                    <a href="${pageContext.request.contextPath}/login/find.do" class="otehr_login underline">로그인 정보를 잊으셨나요?</a>
                    <a href="${pageContext.request.contextPath}/join/join.do" class="otehr_login">회원가입</a>
                </div>
				
			</div> <!-- fin. col-xs-12 -->
		</div>
	

        <script type="text/javascript">
            $(function(){
                //$("#menu").load("../index_header.html");

                //$("#login_btn").on("click", function(){
                    //if($("#userid").val() == "mom" && $("#password").val() == "sitter") {
                        //location.href="${pageContext.request.contextPath}/";
                    //} else {
                        //alert("아이디 혹은 비밀번호를 확인해 주세요.");
                    //}
                    
                //});
            });
        </script>
	</body>
</html>