<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		#subject {
			width: 100%;
			margin-top: 10px;
		}
		</style>
	</head>

	<body>
		<div class="container">
		<header>
			<%@ include file="../admin/admin_header.jsp"%>
			</header>
			<!--content header-->
			<div class="Title">
				<h1>글 수정</h1>
				<ol class="breadcrumb">
					<li>
						<i class="fas fa-home"></i>
						<a href="${pageContext.request.contextPath}/admin/admin_member.do?type=M">Home</a>
					</li>
					<li class="active">
						글수정
					</li>
				</ol>
			</div>
			<!--end content_header-->
			<!--main content-->
			<section id="#edit">
				<div class="col-md-12">
					<div class="write_title_group">
						<form method="POST" action="${pageContext.request.contextPath}/admin/edit_ok.do">
							<input type="hidden" id="boardno" name="boardno" value="${output.boardnum}">
						<div class="gleft">
							<select class="filter" id="filter_bbs" name="filter_bbs">
								<option value="">카테고리 선택</option>
							</select>
							<select class="filter" id="filter_sub_bbs" name="filter_sub_bbs">
                    			<option value="">하위카테고리 선택</option>
							</select>
							
							<input type="text" name="subject" id="subject" value="${output.title}">
						</div>
					
					<div>
						<div class="bbs_content">
							<textarea name="content" id="content" class="ckeditor">${output.text}</textarea>
						</div>
					</div>
					<hr>
					<div>
						<div class="btn_button">
							<button class="btn_warning" type="submit"><span><i class="far fa-file-alt"></i>&nbsp;글수정</span></button>
							<button class="btn_nomal" type="reset"><span><i class="fas fa-pen"></i>&nbsp;취소</span></button>
						</div>
					</div>
				</form>
				</div>

			</section>
		</div>
	
		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
		<script type="text/javascript">
			$(function () {
				var catelist = new Array();
				<c:forEach items="${category}" var="item"> 
					var json = new Object();
					json.cateno="${item.cateno}";
					json.category="${item.category}";
					catelist.push(json);
				</c:forEach>
				//console.log(catelist);
				//서브카테고리 리스트
				var subcatelist = new Array();
				<c:forEach items="${subcate}" var="item"> 
					var json = new Object();
					json.subcateno="${item.subcateno}";
					json.cateno="${item.cateno}";
					json.sub_category="${item.sub_category}";
					subcatelist.push(json);
				</c:forEach>
				console.log(subcatelist);
				//output.category
				var cateno = "${output.cateno}";
				var subcateno = "${output.subcateno}";
					//catogory selectbox 가져오기
					var categotySelectBox = $("select[name='filter_bbs']");

					for (var i = 0; i < catelist.length; i++) {
						categotySelectBox.append("<option value='" + catelist[i].cateno + "'> " + catelist[i].category + "</option>");
					}

					//*********** 1depth카테고리 선택 후 2depth 생성 START ***********
					$(document).on("change", "select[name='filter_bbs']", function () {

						//두번째 셀렉트 박스를 삭제 시킨다.
						var subCategorySelectBox = $("select[name='filter_sub_bbs']");
						subCategorySelectBox.children().remove(); //기존 리스트 삭제

						//선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
						$("option:selected", this).each(function () {
							var selectValue = $(this).val(); //main category 에서 선택한 값
							subCategorySelectBox.append("<option value=''>전체</option>");
							for (var i = 0; i < subcatelist.length; i++) {
								if (selectValue == subcatelist[i].cateno) {

									subCategorySelectBox.append("<option value='" + subcatelist[i].subcateno + "'> <c:if test='"+subcatelist[i].sub_category==sub_category+"'>selected</c:if>" + subcatelist[i].sub_category + "</option>");

								}
							}
						});

					});
				});
		</script>
	</body>
</html>