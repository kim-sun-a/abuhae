<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<!-- css 참조 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/review_more.css" />		
		</head>
	
		<body>
			<div class="container">
				<div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->				
					<!-- Main start-->
					<div class="main">						
						<div class="talk_box">
							<div class="fixeBox col-xs-12">
							<a href="javascript:history.back();"><img src="${pageContext.request.contextPath}/assets/img/backPage.svg"/></a><div class="box_name"><h4>부모 후기</h4></div>
							</div>
							<div class="talk_area">
							<div class="talk_main">
								<div>
								<div class="talk_box_ea">
								<c:forEach var="item" items="${reput}" varStatus="status">
								<c:if test="${item.rev_rate!=''}">
									<li style="list-style:none;" >
										<div class="talk_box_line" style="margin: 15px 0px;">
											<c:choose>			  
										  	<c:when test="${item.isProfile==''}">
												<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" width="50" height="50"/>				
										  	</c:when>
										  	<c:otherwise>
										  		<img src="${item.fileUrl}" width="50" height="50"/>
										  	</c:otherwise>
										  </c:choose>
											<div class="talk_box_line_text">
												<div class="talk_box_line_date_name">
													${item.name}
													<div class="talk_box_line_date">${item.reg_date}</div>
												</div>
												<div class="talk_box_line_date_name">
													<div style="color: #000; font-size: 0.8em; margin-right: 5px; font-weight: bold;">인터뷰 후기</div>
													<div class="star_area">				
													<c:if test="${fn:contains(item.rev_rate,0)}">
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</c:if>																		
													<c:if test="${fn:contains(item.rev_rate,1)}">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</c:if>
													<c:if test="${fn:contains(item.rev_rate,2)}">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</c:if>
													<c:if test="${fn:contains(item.rev_rate,3)}">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</c:if>
													<c:if test="${fn:contains(item.rev_rate,4)}">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</c:if>
													<c:if test="${fn:contains(item.rev_rate,5)}">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
													</c:if>
													</div>
												</div>
												<div class="talk_box_line_date_name">
													<div class="talk_box_talk">
														<span>								
															${item.contents}														
														 </span>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										<hr style="margin: -1px 0px 0px; height: 1px; border: none; background-color: rgb(224,224,224);">
									</c:forEach>
									</div>
								</div>
							</div>
						</div> <!-- fin. talk_area -->
						</div> <!-- fin. talk_box -->
					</div> <!-- fin. Main -->										
				</div> <!-- fin. col-xs-12 -->
			</div> <!-- container -->
			<!-- Javascript -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			 <!-- jquery 파일명 수정 -->
			<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script> 
		</body>
	</html>