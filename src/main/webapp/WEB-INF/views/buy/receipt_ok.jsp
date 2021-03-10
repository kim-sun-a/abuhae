<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>아이를 부탁해</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--slick slider-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick-theme.css" />
    <!-- fontawesome(글리피콘) 적용 -->
    <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>

    <!-- sweetalert 사용 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- css 적용 -->
    <style>
      html,
      body {
        margin: 0;
        padding: 0;
      }
      body {
        height: 100vh;
        background-color: #ddd;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      #confirm_ok {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #fff;
        height: 200px;
        width: 30vh;
        border-radius: 3px;
      }

      p {
        text-align: center;
        padding-top: 10px;
        font-weight: bold;
      }

      span {
        color: #ff7000;
      }

      button {
        border: 10px;
        box-sizing: border-box;
        cursor: pointer;
        margin: 18px 0px 20px;
        text-decoration: none;
        padding: 0px 10px;
        outline: none;
        font-size: 1em;
        height: 47px;
        line-height: 36px;
        background-color: #ff7000;
        text-align: center;
        box-shadow: rgba(133, 133, 133, 0.5) 0px 1px 4px 0px;
        border-radius: 3px;
        font-weight: bold;
        color: #fff;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div id="confirm_ok">
      <div>
        <p>결제되셨습니다.</p>
        <button onclick="location.href='${pageContext.request.contextPath}/search/sitter_search.do'">인터뷰 지원하러 가기</button>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--slick slider-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"></script>
  </body>
</html>
