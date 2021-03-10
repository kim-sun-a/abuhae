<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<title>아이를 부탁해</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<!-- noto Sans 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="assets/css/notosans.css" />
<!--slick slider-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick-theme.css" />
<!--header css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index_header.css">
<!-- fontawesome(글리피콘) 적용 -->
<script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>

<!-- animaition 적용-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" />
<!--section-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/section.css">
<!--footer css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index_footer.css">
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<style type="text/css">
html, body {
	color: #222;
	font-weight: 100;
	font-size: 1em;
	line-height: 1.375;
	padding: 0;
	margin: 0;
}
</style>
</head>

<!--grid 사용시 col-xs-nn 사용-->

<body>
	<div id="app">
		<div class="container">
			<div id="menu">
				<c:if test="${login != null }">
					<c:choose>
						<c:when test="${fn:contains(login.type, 'M')}">
							<%@ include file="index_header_login_mom.jsp"%>
						</c:when>
						<c:when test="${fn:contains(login.type, 'S')}">
							<%@ include file="index_header_login_sitter.jsp"%>
						</c:when>
					</c:choose>
				</c:if>
				<c:if test="${login == null }">
					<%@ include file="index_header.jsp"%>
				</c:if>
				<%-- <h3>${login.type}, ${login.momno }</h3>
				<p>${login.sitterno }</p> --%>
			</div>

			<!--section-->
			<section class="row">
				<!--캐러셀-->
				<div class="col-xs-12 banner_slider">
					<button type="button" data-role="none"
						class="slick-arrow slick-prev" style="display: block;">Previous</button>
					<div>
						<img src="assets/img/main_banner_1.jpg" alt="슬라이더1">
					</div>
					<div>
						<img src="assets/img/main_banner_2.png" alt="슬라이더2">
					</div>
					<div>
						<img src="assets/img/main_banner_3.png" alt="슬라이더3">
					</div>
					<div>
						<img src="assets/img/main_banner_4.png" alt="슬라이더4">
					</div>
					<button type="button" data-role="none"
						class="slick-arrow slick-next" style="display: block;">Next</button>
					<!--현재위치 버튼 현재 구현이 안됨 추가 구현-->
					<ul class="slick-dots">
						<li>
							<button>1</button>
						</li>
						<li>
							<button>2</button>
						</li>
						<li>
							<button>3</button>
						</li>
						<li>
							<button>4</button>
						</li>

					</ul>
				</div>
				<!--end slider-->
				<!--활동 선택 옆에 자리 넘치는 거 확인 -->
				<div class="col-xs-12">
					<div class="row wantactive">
						<a
							href="${pageContext.request.contextPath}/search/sitter_search.do"
							class="col-xs-4">
							<div class="want_box">
								<img src="assets/img/want_active_1.png" class="want_img"
									alt="등하원">
								<div class="want_text_box">
									<span class="want_text">등하원</span> <img
										src="assets/img/btn_arrow.png" class="btn_arrow" alt="이동">
								</div>
							</div>
						</a> <a
							href="${pageContext.request.contextPath}/search/sitter_search.do"
							class="col-xs-4">
							<div class="want_box">
								<img src="assets/img/want_active_2.png" class="want_img"
									alt="실내놀이">
								<div class="want_text_box">
									<span class="want_text">실내놀이</span> <img
										src="assets/img/btn_arrow.png" class="btn_arrow" alt="이동">
								</div>
							</div>
						</a> <a
							href="${pageContext.request.contextPath}/search/sitter_search.do"
							class="col-xs-4">
							<div class="want_box">
								<img src="assets/img/want_active_3.png" class="want_img"
									alt="야외활동">
								<div class="want_text_box">
									<span class="want_text">야외활동</span> <img
										src="assets/img/btn_arrow.png" class="btn_arrow" alt="이동">
								</div>
							</div>
						</a> <a
							href="${pageContext.request.contextPath}/search/sitter_search.do"
							class="col-xs-4">
							<div class="want_box">
								<img src="assets/img/want_active_4.png" class="want_img"
									alt="학습지도">
								<div class="want_text_box">
									<span class="want_text">학습지도</span> <img
										src="assets/img/btn_arrow.png" class="btn_arrow" alt="이동">
								</div>
							</div>
						</a> <a
							href="${pageContext.request.contextPath}/search/sitter_search.do"
							class="col-xs-4">
							<div class="want_box">
								<img src="assets/img/want_active_5.png" class="want_img"
									alt="영어놀이">
								<div class="want_text_box">
									<span class="want_text">영어놀이</span> <img
										src="assets/img/btn_arrow.png" class="btn_arrow" alt="이동">
								</div>
							</div>
						</a> <a
							href="${pageContext.request.contextPath}/search/sitter_search.do"
							class="col-xs-4">
							<div class="want_box">
								<img src="assets/img/want_active_6.png" class="want_img"
									alt="가사돌봄">
								<div class="want_text_box">
									<span class="want_text">가사돌봄</span> <img
										src="assets/img/btn_arrow.png" class="btn_arrow" alt="이동">
								</div>
							</div>
						</a>
					</div>
				</div>
				<!--end 활동 선택-->
				<!--중간 줄띄움 바-->
				<div class="col-xs-12 bar"></div>
				<!--end 줄띄움 바-->

				<!--맘시터 이렇게 이용하세요-->
				<div class="col-xs-12">
					<div class="guide_box">
						<h3 class="guide_title">
							<img class="guide_titme_img" src="assets/img/icon-m-phone.png"
								alt="맘시터 가이드"> <br> 아이를 부탁해 이렇게&nbsp; <strong
								class="unber_bar">이용하세요!</strong>
						</h3>
					</div>
					<div class="guide_gorup">
						<!--부모회원 버튼-->
						<button class="guide_group_button select" data-tab="mom_guide">부모
							회원</button>
						<!--시터회원 버튼-->
						<button class="guide_group_button" data-tab="sitter_guide">시터
							회원</button>
					</div>
					<!--가이드 그림 -->
					<div id="guide_main" class="guide_main"></div>
					<!--부모회원 가이드 가기 버튼 -> 고객센터로 이동-->

				</div>
				<!--end 맘시터 이렇게 이용하세요-->
				<!--맘시터가 궁금하신가요?-->
				<div class="col-xs-12 faq_box">
					<h3 class="guide_title">
						아이를 부탁해가 <strong class="unber_bar">궁금</strong>하신가요?
					</h3>
					<div class="faq_group">
						<div class="bor_box_left"></div>
						<div>
							<div class="qna_box">
								<div class="qna_img_box">
									<img class="qna_img" src="assets/img/icon-qa-1.png">
								</div>
								<span><strong>맘시터</strong>를 어떻게 믿죠?</span>
							</div>
							<div class="qna_box">
								<div class="qna_img_box">
									<img class="qna_img" src="assets/img/icon-qa-2.png">
								</div>
								<span><strong>부모님</strong>을 어떻게 믿죠?</span>
							</div>
							<div class="qna_box">
								<div class="qna_img_box">
									<img class="qna_img" src="assets/img/icon-qa-3.png">
								</div>
								<span>맘시터 <strong>이용권/지원권</strong>은<br> 무엇인가요?
								</span>
							</div>
						</div>
						<div class="bor_box_right"></div>
					</div>
					<a
						href="${pageContext.request.contextPath}/customer/faq.do"
						class="btn btn-primary btn-lg">FAQ 더 알아보기</a>
				</div>
				<!--end 맘시터가 궁금하신가요?-->
			</section>

			<!--footer-->
			<footer>
				<div class="container">
					<div class="ft_content">
						<div class="row">
							<div class="ft_logo">
								<div class="col-lg-6 col-xs-6 pull-left">
									<img src="assets/img/logo(1).png" alt="로고">
								</div>
								<div class="col-xl-6 col-xs-6">
									<div class="ft_icon">
										<a href="#"><i class="fab fa-instagram"></i></a> <a href="#"><i
											class="fab fa-blogger-b"></i></a> <a href="#"><i
											class="fas fa-pen-square"></i></a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-xs-12">
								<div class="ft_button">
									<div class="store_link">
										<a href="#"><img src="assets/img/index-android_pc.png"
											alt="안드로이드앱 다운로드 버튼"></a>
									</div>
									<div class="store_link">
										<a href="#"><img src="assets/img/index-ios_pc.png"
											alt="ios 다운로드 버튼"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-xs-6">
								<div class="ft_list">
									<h4 class="ft_list_tl">서비스 종류</h4>
									<li><a
										href="${pageContext.request.contextPath}/search/sitter_search.do"
										class="ft_list_con">신생아/영아 풀타임 돌봄</a></li>
									<li><a
										href="${pageContext.request.contextPath}/search/sitter_search.do"
										class="ft_list_con">신생아/영아 보조 돌봄</a></li>
									<li><a
										href="${pageContext.request.contextPath}/search/sitter_search.do"
										class="ft_list_con">등하원 돌봄</a></li>
									<li><a
										href="${pageContext.request.contextPath}/search/sitter_search.do"
										class="ft_list_con">놀이/학습 돌봄</a></li>
									<li><a
										href="${pageContext.request.contextPath}/search/sitter_search.do"
										class="ft_list_con">긴급/단기 돌봄</a></li>
								</div>
							</div>
							<div class="col-md-12 col-xs-6">
								<div class="ft_list">
									<h4 class="ft_list_tl">맘시터 정보</h4>
									<li><a
										href="${pageContext.request.contextPath}/abu-service/introduce.do"
										class="ft_list_con">서비스 소개</a></li>
									<li><a
										href="https://www.notion.so/2d568de1bcaa4de181b33c72be346c66"
										class="ft_list_con">개발 과정</a></li>
									<li><a
										href="${pageContext.request.contextPath}/abu-service/team.do"
										class="ft_list_con">개발자 정보</a></li>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="ft_list">
									<h4 class="ft_list_tl">고객센터</h4>
									<li><a
										href="${pageContext.request.contextPath}/customer/notice_site.do"
										class="ft_list_con">공지사항 ㅣ</a> <a
										href="${pageContext.request.contextPath}/customer/guide.do"
										class="ft_list_con">이용가이드 ㅣ</a> <a
										href="${pageContext.request.contextPath}/customer/question_sitter.do"
										class="ft_list_con">자주 묻는 질문</a></li>
									<li><a
										href="${pageContext.request.contextPath}/abu-service/agreement.do"
										class="ft_list_con">이용약관 ㅣ</a> <a
										href="${pageContext.request.contextPath}/abu-service/privacy.do"
										class="ft_list_con">개인정보처리방침 ㅣ</a> <a href="#"
										class="ft_list_con">1:1문의</a></li>
									<li class="ft_list_con ft_time">※ 운영시간 : 평일 10:00 ~ 18:00
									</li>
									<li class="ft_list_con ft_time">(점심시간 12:00 ~ 13:00 제외 /
										주말 및 공휴일 제외)</li>
								</div>
							</div>
						</div>
						<address>
							<div class="ft_list">
								<p class="ft_list_con">
									<span class="ft_list_tl">(주)아이를부탁해</span> <br /> 서울시 서초구
									서초대로77길 55 에이프로스퀘어 3층 <br /> 대표 아부해 ㅣ 사업자등록번호 : 123-56-78910 <br />
									통신판매업 신고번호 : 제 2020-서울서초-1234호 <br /> 직업제공업 신고번호 : 서울서부 제 2020
									- 01호 <br /> 이 사이트는 학생들이 취업을 위한 포트폴리오 제작 사이트입니다.<br /> 추가 문의는
									gina305496@gmail.com, ori080525@gmail.com로 부탁드립니다.
								</p>
							</div>
						</address>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!--slick slider-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//브라우저 로드시 헤더 받아오기
			//$("#guide_main").load("mom_guide.do");

			//브라우저 로드시 에이작스 받아오기 
			//default는 부모 가이드
			$(document).ready(function() {
				$.ajax({
					type : 'GET', //get방식으로 통신
					url : "mom_guide.do", //부모가이드 보여주기
					dataType : "text", //html형식으로 값 읽기
					error : function() { //통신 실패시 ㅠㅠ
						alert('통신실패!');
					},
					success : function(data) { //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
						$('#guide_main').html(data);
					}
				});
			});

			/*배너, 가이드 이미지 슬라이딩 - 선아*/
			$(".banner_slider").slick({
				infinite : true, //무한 반복
				autoplay : true, //자동 슬라이드
				autoplaySpeed : 1500,
				arrows : true
			//옆으로 이동하는 화살표 여부

			});

			/*부모회원, 시터회원 클릭시 페이지 전환 - 선아*/
			$(".guide_group_button").click(function(e) {
				//현재 select 클래스가 적용되어있는지 확인
				var select = $(this).hasClass("select");

				//선택이 되어있을 때
				if (select) {
					$(this).removeClass("select");
					$(this).next().addClass("select");
				} else {
					$(this).addClass("select");
					$(this).prev().removeClass("select");
				}
				//선택이 안되어있는 걸 클릭했을 때
				if (select == false) {
					$(this).addClass("select");
					$(this).next().removeClass("select");
				} else {
					$(this).removeClass("select");
					$(this).prev().addClass("select");
				}

				//버튼 클릭시에 가이드 페이지 변경
				var activebtn = $(this).attr('data-tab');
				$.ajax({
					type : 'GET', //get방식으로 통신
					url : activebtn + ".do", //탭의 data-tab속성의 값으로 된 html파일로 통신
					dataType : "text", //html형식으로 값 읽기
					error : function() { //통신 실패시 ㅠㅠ
						alert('통신실패!');
					},
					success : function(data) { //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
						$('#guide_main').html(data);
					}
				});

			});

		});
	</script>
</body>

</html>