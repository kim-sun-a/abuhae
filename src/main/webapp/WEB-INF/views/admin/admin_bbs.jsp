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
		<title>아이를부탁해-관리자</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<!--절대 경로 수정 1220 선아-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
		<!-- fontawesome(글리피콘) 적용 -->
		<script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
		<!-- css 참조  -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_coupon.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_header.css" />
		<style type="text/css">
		.page {
  text-align: center;
}
		</style>
	</head>

<body>
	<div class="container">
	<header>
		<%@ include file="../admin/admin_header.jsp" %>
	</header>
	<div class="Title">
		<h1>${category}</h1>
		<ol class="breadcrumb">
			<li>
				<i class="fas fa-home"></i>
				<a href="${pageContext.request.contextPath}/admin/admin_member.do?type=M">Home</a>
			</li>
			<li class="active">
				${category}
			</li>
		</ol>
	</div>
	<div class="state">
		<div class="gleft">
			<!--  <p class="total">오늘 등록된 글 <strong>4</strong>건 / 전체 게시글 <strong>10</strong>건</p> -->
		</div>
	</div>
	<!--main content-->
	<div id="tabCont2_1" class="tabCont">
		<div class="mTab typeTab eTab">
			<div class="bbs_btn">
				<a href="${pageContext.request.contextPath}/admin/admin_bbs_write.do" class="btn_nomal"><span><i class="far fa-file-alt"></i>&nbsp;새글작성</span></a>
				<a id="edit" class="btn_nomal"><span><i class="fas fa-pen"></i>&nbsp;수정</span></a>
				<a id="delete" class="btn_nomal"><span><i class="far fa-trash-alt"></i>&nbsp;삭제</span></a>
			</div>
		</div>
		<div id="tabContSub2_1_1" class="tabContSub">
			<div class="mBoard typeLiset gScroll gCellSingle">
				<table>
					<colgroup>
						<col style="width: 42px;">
						<col style="width: 80px;">
						<col style="width: 70px;">
						<col style="width: 300px;">
						<col style="width: 120px">
						<col style="width: 120px;">
					</colgroup>
					<thead>
						<tr>
							<th class="col-md-1"><input type="checkbox" id="all_check"></th>
							<th class="col-md-1">글번호</th>
							<th class="col-md-1">카테고리</th>
							<th class="col-md-1">글 제목</th>
							<th class="col-md-2">작성자</th>
							<th class="col-md-2">작성일자</th>
						</tr>
					</thead>
					<tbody class="center">
						<c:choose>
						<%-- 조회결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0}">
								<tr>
									<td colspan="6" align="center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
						<%-- 조회결과가 있는 경우 --%>
							<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<tr>
										<td class="text-center"><input type="checkbox" name="chk" class="rowcheck"></td>
										<td align="center">${item.boardnum}</td>
										<td align="center">${item.sub_category}</td>
										<td align="center"><a href="${pageContext.request.contextPath}/customer/cus_view.do?boardnum=${item.boardnum}" target="_blank">${item.title}</a></td>
										<td align="center">${item.writer}</td>
										<td align="center">${item.reg_date}</td>
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
								<c:url value="/admin/admin_bbs.do" var="prevPageUrl">
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
				</div>
			</div>
		</div>

	</div>
</div>
	

		<!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<!--Google CDN 서버로부터 jQuery 참조 -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- jQuery Ajax Form plugin CDN -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
		<!-- jQuery Ajax Setup -->
		<script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
		<script>
			$(function(){

				//console.log("${output}");
				//올체크
				$("#all_check").change(function(){
					//모든 hobby의 상태를 올체크와 동일하게
					$(".agree").prop('checked', $(this).prop('checked'));
					var now = $(".next_btn").prop('disabled');
					$(".next_btn").prop('disabled', !now);
				});

				$("#edit").on('click', function(){
					var checkbox = $("input[name=chk]:checked");
					var boardnum = null;
					checkbox.each(function (i) {
						var tr = checkbox.parent().parent().eq(i); //checkbox의 두단계 상위가 tr
						var td = tr.children(); //td태그는 tr의 하위
	
						boardnum = td.eq(1).text(); //boardno는 td의 두번째 요소
						window.location = "${pageContext.request.contextPath}/admin/edit.do?boardnum="+boardnum;
					});
				});

				$("#delete").on('click', function(){
					var checkbox = $("input[name=chk]:checked");
					var boardnum = null;
					checkbox.each(function (i) {
						var tr = checkbox.parent().parent().eq(i); //checkbox의 두단계 상위가 tr
						var td = tr.children(); //td태그는 tr의 하위

						boardnum = td.eq(1).text(); //boardno는 td의 두번째 요소

						// 삭제 확인
						if (!confirm("정말 삭제하시겠습니까?")) {
							return false;
						}

						// delete 메서드로 Ajax 요청 --> <form> 전송이 아니므로 직접 구현한다.
						$.delete("${pageContext.request.contextPath}/admin/delete", {
							"boardnum": boardnum
						}, function (json) {
							if (json.rt == "OK") {
								alert("삭제되었습니다.");
								// 삭제 완료 후 페이지 새로고침
								window.location.reload();
							}
						});
					});
				});
			});

		</script>
	</body>
</html>
</body>

</html>