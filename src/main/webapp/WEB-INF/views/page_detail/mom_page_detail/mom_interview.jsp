<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
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

<!-- 아이콘 사용 -->
<script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script> 

<!-- sweetalert 사용 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/interview.css" />
</head>
	
<body>		
		<div class="container">
			<div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
			<form action="${pageContext.request.contextPath}/page_detail/mom_page_detail/mom_interview_ok.do" method="post">
				<div class="siren_header">
					<div class="x_btn_area">
						<button type="button" class="x_btn" onclick = "history.back() ">
							<img src="${pageContext.request.contextPath}/assets/img/x-btn.jpg" width="28" height="28"/>
						</button>
					</div> <!-- fin. x_btn_area -->
					<div class="header_text_area col-xs-12">
						<span class="header_text">인터뷰 지원 유의사항</span>
					</div> <!-- fin. header_text_area -->
				</div> <!-- fin. siren_header -->
				<div class="main">
				<div class="info_box">
					<div class="info_area">
						<div class="info_text_box">
							<div class="info_text">
								<div class="siren_body_profil">
								<p>
									 인터뷰 지원 후 맘회원의 답변을 기다려 주세요.<br/>
									 매일 낮 12시에 다시 인터뷰 지원을 할 수 있습니다.<br/>
									인터뷰 지원권을 구매하면, 제한 없이 맘회원에게 지원할 수 있습니다.<br/>
								</p>
								<div class="desc">
								<span><i class="fas fa-exclamation-circle"></i></span> 지원하기를 누르면 내 프로필이 맘회원에게 바로 전송되니 신중하게 지원해주시길 바랍니다.
								</div>
								<span class="interview_info">
								</span>
								<div class="btn_area">
								</div> <!-- fin. btn_area -->
								</div> <!-- fin. siren_body_profil -->
							</div>
						</div>
					</div>
				</div> <!-- fin. info_box -->
				<div class="desc_box">
					<button type="submit" class="btn btn-block" id="btn_interview">
						<span class="btn_interview">인터뷰 신청하기</span>
					</button>
					<!-- ------모달 영역
					<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
						<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
							<h5 class="modal-title" id="myModalLabel">인터뷰 지원이 완료되었습니다.</h5>
						</div>
						<div class="modal-body">
						<p style="padding-bottom: 10px;">
						 이제 맘회원의 답변을 기다려 주세요.<br/>
						 매일 낮 12시에 다시 인터뷰 지원을 할 수 있습니다.<br/>
						 인터뷰 지원권을 구매하면, 매일 하루 6명의 맘회원에게 지원할 수 있습니다.<br/>
						 </p>
						 <button type="button" class="btn btn-primary" id="buy_btn" onclick = "location.href = 'http://localhost:8080<%=request.getContextPath()%>/buy/buy.jsp'">지원권 구매하러 가기</button>
						</div>
						<div class="modal-footer">
							<p style="font-size: 0.9em; font-weight: bold; padding-bottom: 10px;">
								<span style="color: #ff7000;"><i class="fas fa-exclamation-circle"></i></span> 맘회원과 활동을 약속한 후, 갑작스런 '활동취소','연락두절'을 할 경우 <span style="color:red;">강제 탈퇴</span> 되니 주의해주세요.
							</p>
							<div style="padding-bottom: 10px;">
							<button type="button" class="btn btn-default" id="no_action_btn">시터회원이 하면 안되는 행동들</button>
							</div>
							<button type="button" class="btn btn-default" id="closeModalBtn">확인</button>
						</div>
						</div>
						</div>
					</div> ------- -->
					<input type="hidden" id="who" name="who" value='S'>
					<input type="hidden" id="momno" name="momno" value="${output.momno}">
					<input type="hidden" id="sitterno" name="sitterno" value="${login.sitterno}">
				</div> <!-- fin. desc_box -->
				</div> <!-- fin. main -->
				</form>
			</div> <!-- fin. col-xs-12 -->
		</div> <!-- fin. container -->
	
		<!-- Javascript -->
		
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script type="text/javascript">
		jQuery(function($) {
			$('#btn_interview').on('click', function(){
			$('#modalBox').modal('show');
			});
			// 모달 안의 확인 버튼에 이벤트를 건다.
			$('#closeModalBtn').on('click', function(){
			$('#modalBox').modal('hide');
			});
			
		});
		</script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script> 
	</body>
</html>