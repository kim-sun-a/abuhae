<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>아부해 - 관리자페이지</title>

	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	<!-- noto Sans 웹 폰트 적용 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
	<!-- css 참조  -->
	<style>
		html,
		body {
			color: #ff7000;
			font-size: 1em;
			font-weight: 600;
		}

		.app {
			padding: 0;
			margin: auto;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-color: #ffe4cf;
		}

		.container {
			margin-top: 200px;
		}

		.form_box {
			width: 400px;
			border: 1px solid #ff7000;
			background-color: #fff;
			margin: auto;
			border-radius: 5px;
		}

		.main_logo img {
			display: block;
			margin: 20px auto;
			width: 200px;
			
		}
		.login_btn {
			background-color: #ff7000;
			color: #fff;
			width: 300px;
			height: 40px;
			display: block;
			outline: none;
			border-radius: 5px;
			border: none;
			margin: 30px auto;
		}

		#adminid,
		#adminpw {
			background-color: #fff;
			display: block;
			margin: auto;
		}

		.form-group {
			text-align: left;
			width: 400px;
			margin: 10px auto;
		}

		label {
			text-shadow: 1px 1px 1px grey;
			margin-left: 50px;
		}

		.input_text {
			width: 300px;
			height: 45px;
			border: 1px solid #dedede;
			border-radius: 5px;
		}
	</style>
</head>

<body>
	<div class="app">
		<div class="container">
			<form role="form" class="form_box" method="post" action="${pageContext.request.contextPath}/admin/admin_login_ok">
				<div class="main_logo">
					<a href="${pageContext.request.contextPath}/abuhae">
						<img src="${pageContext.request.contextPath}/assets/img/logo(1).png" class="logo" />
					</a>
				</div>
				<div class="form-group">
					<label for="user_id">아이디</label>
					<input type="text" id="adminid" name="adminid" class="input_text" placeholder="아이디를 입력하세요." />
				</div>
				<div class="form-group">
					<label for="user_pw">비밀번호</label>
					<input type="password" id="adminpw" name="adminpw" class="input_text" placeholder="비밀번호를 입력하세요." />
				</div>
				<button type="submit" class="login_btn">로그인</button>
			</form>
		</div>
	</div>
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">

	</script>
</body>

</html>