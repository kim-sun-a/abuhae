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
<title>아이를부탁해</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

<!-- bootstrap -->
<!--절대 경로 수정 1220 선아-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- noto Sans 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />

<!-- icon 참조 -->
<script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_coupon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_header.css" />
<style>
	h3 {
		margin-top: 0;
	}
</style>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="../admin/admin_header.jsp" %>
	</header>
	<div class="Title">
		<h1>탈퇴 회원 관리</h1>
		<ol class="breadcrumb">
			<li>
				<i class="fas fa-home"></i>
				<a href="${pageContext.request.contextPath}/admin/admin_member.do?type=M">Home</a>
			</li>
			<li></i>회원관리</li>
			<li class="active"></i>탈퇴회원 관리</li>
		</ol>
	</div>
	<div id="tabCont2_1" class="tabCont">
		<div class="mTab typeTab eTab">
			<ul>
				<button type="button" class="rep_btn button">
					<i class="fas fa-times"></i> 탈퇴승인
				</button>
			</ul>
		</div>
		<div id="tabContSub2_1_1" class="tabContSub">
			<div class="mBoard typeLiset gScroll gCellSingle">
				<!-- 조회 결과 목록 -->
				<table class="table table-bordered table-hover">
					<thead>
						<tr role="row">
							<th class="text-center"><input type="checkbox" id="all_check"></th>
							<th class="text-center">회원유형</th>
							<th class="text-center">id</th>
							<th class="text-center">이름</th>
							<th class="text-center">email</th>
							<th class="text-center">phone</th>
							<th class="text-center">탈퇴사유</th>
							<th class="text-center">탈퇴신청 일자</th>
							<th class="text-center">탈퇴승인 일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<%-- 조회결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0}">
								<tr>
									<td colspan="9" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%-- 조회결과가 있는 경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<tr>
										<td class="text-center"><input type="checkbox" name="chk"></td>
										<c:if test="${fn:contains(item.type, 'M')}">
											<td align="center">부모회원</td>
										</c:if>
										<c:if test="${fn:contains(item.type, 'S')}">
											<td align="center">시터회원</td>
										</c:if>
										<td align="center">${item.id}</td>
										<td align="center">${item.name}</td>
										<td align="center">${item.email}</td>
										<td align="center">${item.phone}</td>
										<td align="center">${item.reason}</td>
										<td align="center">${item.leave_date}</td>
										<td align="center">${item.leaveok_date}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="page">
					<ul class="pagination">
						<!-- 페이지 번호 구현 -->
						<%-- 이전 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 이전 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.prevPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/admin/admin_leave.do" var="prevPageUrl">
									<c:param name="page" value="${pageData.prevPage}" />
									<c:param name="type" value="${type}" />
								</c:url>
								<li class="page-item prev_btn"><a href="${prevPageUrl}">[Prev]</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a>[Prev]</a></li>
							</c:otherwise>
						</c:choose>

						<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
						<c:forEach var="i" begin="${pageData.startPage}"
							end="${pageData.endPage}" varStatus="status">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/admin/admin_member.do" var="pageUrl">
								<c:param name="page" value="${i}" />
								<c:param name="type" value="${type}" />
							</c:url>

							<%-- 페이지 번호 출력 --%>
							<c:choose>
								<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
								<c:when test="${pageData.nowPage == i}">
									<li class="page-item active"><a>${i}</a></li>
								</c:when>
								<%-- 나머지 페이지의 경우 링크 적용함 --%>
								<c:otherwise>
									<li class="page-item"><a href="${pageUrl}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<%-- 다음 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 다음 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.nextPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="/admin/admin_member.do" var="nextPageUrl">
									<c:param name="page" value="${pageData.nextPage}" />
									<c:param name="type" value="${type}" />
								</c:url>
								<li class="page-item next_btn"><a href="${nextPageUrl}">[Next]</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a>[Next]</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div><!--end page-->
			</div>
		</div>
	</div>
</div><!--end container-->
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<!-- jquery 파일명 수정 -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(function () {
				//올체크 상태 변경되었을 떄 이벤트 - 선아
				$("#all_check").change(function(){
					//모든 hobby의 상태를 올체크와 동일하게
					$(".chk").prop('checked', $(this).prop('checked'));
				});

				$("#filter_ok").on('change', function () {
				//alert($(this).val());
				//select 값 가져오기 -> 파라미터
				var isok = $(this).val();
				//selected 주기 -> 상태유지
				$(this).attr("selected", "true");

				location.href = '${pageContext.request.contextPath}/admin/admin_leave.do';

			});
	
				$(".rep_btn").on("click", function () {
					//체크된 row의 회원번호 가져오기
					var checkbox = $("input[name=chk]:checked");
					var id = null;
					let isok = null;
					checkbox.each(function (i) {
						var tr = checkbox.parent().parent().eq(i); //checkbox의 두단계 상위가 tr
						var td = tr.children(); //td태그는 tr의 하위
	
						id = td.eq(2).text(); //id는 td의 두번째 요소
						isok = td.eq(8).text(); //leave date는 td의 여덟번째 요소
					});

					if(isok != "") {
						alert("이미 탈퇴 처리된 회원입니다.");
						return false;
					}
	
					$.ajax({
						type: 'POST',
						url: '${pageContext.request.contextPath}/admin/deletemember?id='+id,
						success: function(json){
							// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
							if (json.rt == "OK") {
								alert(id+"회원 탈퇴 처리 성공");
								window.location = "${pageContext.request.contextPath}/admin/admin_leave.do";
							}
							
						},
						error : function() { //통신 실패시 ㅠㅠ
							alert('통신실패!');
						}
					});
	
				});
	
			});
		</script>
</body>
</html>