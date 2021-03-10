<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
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
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/join_parent.css" />

    <style type="text/css">
        html,
        body {
            color: #222;
            font-weight: 100;
            font-size: 1em;
            line-height: 1.375;
            padding: 0;
            margin: 0;
        }
    </style>
</head>

<body>
    <div id="start" class="container">
            <div class="col-xs-12">
                <!-- xs-12로 모바일 맞춤 -->
                <div class="join_title">
                    <img src="${pageContext.request.contextPath}/assets/img/parent_join_start.png">
                    <h3>회원님과 꼭 맞는 맘시터를 찾기 위해<br>몇가지 질문으로 시작하겠습니다.</h3>
                </div>

                <!--다음 회원가입으로 진행-->
                <a href="${pageContext.request.contextPath}/join/parent/activity_age.do"><button class="start_join_btn">회원가입 시작하기 ></button></a>
                <!--로그인 페이지로 이동-->
                <a href="${pageContext.request.contextPath}/login/login.do"><button class="already_join_btn">이미 맘시터 회원이신가요?</button></a>

            </div> <!-- fin. col-xs-12 -->
    </div>
    <!--end container-->

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>