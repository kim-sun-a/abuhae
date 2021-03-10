<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<!-- 아이콘 사용 -->
<script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script> 

<!-- sweetalert 사용 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/report.css" />
</head>
	
<body>		
		<div class="container">
			<div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
			<form action="${pageContext.request.contextPath}/page_detail/sitter_page_detail/sitter_report_ok.do" method="post">
				<div class="siren_header">
					<div class="x_btn_area">
						<button type="button" class="x_btn" onclick = "history.back() ">
							<img src="${pageContext.request.contextPath}/assets/img/x-btn.jpg" width="28" height="28"/>
						</button>
					</div> <!-- fin. x_btn_area -->
					<div class="header_text_area col-xs-12">
						<span class="header_text">신고하기</span>
					</div> <!-- fin. header_text_area -->
					<div class="btn_area">
						<button name ="test" type="submit" class="btn" id="btn_submit">
							<span class="btn_text">제출</span>
						</button>
					</div> <!-- fin. btn_area -->
				</div> <!-- fin. siren_header -->
				<div class="siren_body">
					<div class="siren_body_profil">
						<c:choose>			  
						  	<c:when test="${profile == null }">
								<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" width="80" height="80"/>				
						  	</c:when>
						  	<c:otherwise>
						  		<img src="${profile.fileUrl}" width="80" height="80"/>
						  	</c:otherwise>
						</c:choose>
						<br/>
						<span class="sitter_number">
							no.${output.sitterno}
						</span>
						<span class="sitter_name">
							${output.name}
						</span>
					</div> <!-- fin. siren_body_profil -->
					<div class="siren_type">
						<h4 class="siren_title">신고 유형을 선택해주세요.</h4>
						<div class="siren_type_box">
							<input id="rd1" type="radio" name="type" value="허위정보를 기재하였습니다.">
							<label for="rd1">허위정보를 기재하였습니다.</label><br/>
							<input id="rd2" type="radio" name="type" value="부적절한 사진입니다.">
							<label for="rd2">부적절한 사진입니다.</label><br/>
							<input id="rd3" type="radio" name="type" value="부적절한 내용입니다.">
							<label for="rd3">부적절한 내용입니다.</label><br/>
							<input id="rd4" type="radio" name="type" value="규정을 위반하였습니다.">
							<label for="rd4">규정을 위반하였습니다.</label><br/>
							<input id="rd5" type="radio" name="type" value="맘시터 회원 자격이 없습니다.">
							<label for="rd5">맘회원 자격이 없습니다.</label><br/>
							<input id="rd6" type="radio" name="type" value="기타">
							<label for="rd6">기타</label><br/>
						</div> <!-- fin. siren_type_box -->
					</div> <!-- fin. siren_type -->
					<div class="siren_text_box">
						<h4>신고 내용을 입력해주세요.</h4>
						<textarea id="contents" name="contents" placeholder="예). 부적절한 사진이 올라가 있습니다."></textarea>
					</div>  <!-- fin. siren_text_box -->
					<div class="desc_area">
						<p class="desc">
							* 이 회원이 신고대상에 해당하는지 다시 한 번 확인하여 주시기 바랍니다. 
							<br/>
							* 신고 내용이 등록되면, 맘시터팀이 조사에 들어갈 것입니다.
							<br/>
							* 신고자와 신고 내용은 외부에 공개되지 않습니다.
							<br/>
							* 신고된 회원은 맘시터 약관에 따라 이용 제재 등 불이익을 받을 수 있습니다.
							<br/>
						</p>
					</div> <!-- fin. desc_area -->
					<input type="hidden" id="who" name="who" value='M'>
					<input type="hidden" id="momno" name="momno" value="${login.momno}">
					<input type="hidden" id="sitterno" name="sitterno" value="${output.sitterno}">
					</div> <!-- fin. siren_body -->
				</form>
				</div> <!-- fin. siren_body -->
			</div> <!-- fin. col-xs-12 -->
		</div> <!-- fin. container -->
	
		<!-- Javascript -->
		<script type="text/javascript">
		/* $(function() {
		$("#btn_submit").on('click', function () {
			
		});
		
	})
	   function success() {
	    	if ($("input:radio[name='type']").is(":checked")==false) {
	    		swal("신고유형을 선택하여 주십시오.");
	    		return;
	    	}else {
	        swal("신고완료", "신고가 완료되었습니다. 감사합니다.");
	    	}
	    }		    
	    
		$(function(){
			$("#btn_submit").on('click', function(e){
				e.preventDefault();
				var who = $("#who").val();
				var type = $('input[name="type"]:checked').val();
				var contents = $("#contents").val();
				var momno = $("#momno").val();

				console.log(who);
				console.log(type);
				console.log(contents);
				console.log(momno);

			});
		});*/		    
		</script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script> 
	</body>
</html>