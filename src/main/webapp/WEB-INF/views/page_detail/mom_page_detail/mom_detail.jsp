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

<!-- sweetalert 사용 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mom_page_detail.css" />

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript">
	
	jQuery(function($) {
		$('#swapHeart').on('click', function() {
		
	          var $jim = $(this);
	          let momno = $(this).data("momno");
	          let sitterno = $("#app").data("login");
	          
	       	// 찜할 때 alert창과 glyphicon변형
	          if (sitterno != "" || sitterno != 0) {
	        	  
	            if ($(this).find("span").hasClass("glyphicon-heart-empty")) {
	              $(this).find("span").removeClass("glyphicon-heart-empty");
	              $(this).find("span").addClass("glyphicon-heart");
	              $.get("${pageContext.request.contextPath}/heart/detail/insertMom", {
	                sitterno: sitterno,
	                momno: momno,
	                jjim: "Y",
	              });
	              swal("찜 하기 완료!", "마이페이지 > 찜한 맘회원에서 확인할 수 있습니다.");
	            }
	            // 찜 취소할 때 alert창과 glyphicon변형
	            else {
	              $(this).find("span").addClass("glyphicon-heart-empty");
	              $.get("${pageContext.request.contextPath}/heart/detail/deleteMom", {
	                sitterno: sitterno,
	                momno: momno,
	                jjim: "N",
	              });
	              swal("찜 하기 취소");
	            }
	          } else {
	            swal("시터회원으로 가입 후 이용해주세요.");
	          }
	        }); // fin. 찜버튼 기능
	        
	        $('#siren').on('click', function() {
		          let momno = $(this).data("momno");
		          
		          if (${fn:contains(login.type, 'M')}) {
		            
		              swal("맘은 맘회원을 신고할 수 없습니다.");
		              
		              return false;
		            } 
		          location.href='${pageContext.request.contextPath}/page_detail/mom_page_detail/mom_report.do?momno=${output.momno}';
			}); // fin. 같은 타입 신고막기 
			
			$('#interview').on('click', function() {
		          let momno = $(this).data("momno");
		          
		          if (${fn:contains(login.type, 'M')}) {
		            
		              swal("맘은 맘회원에게 지원할 수 없습니다.");
		              
		              return false;
		            } 
		          location.href='${pageContext.request.contextPath}/page_detail/mom_interview.do?momno=${output.momno}';
				}); // fin. 같은 타입 인터뷰 막기 
		}); 
	 </script>
	 <!-- jquery 파일명 수정 -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script> 
</head>
	
<body>		
		<div id="app" data-login="${login.sitterno}">
		<div class="container" >
			<div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
				<div class="pull-right">
					<button type="button" class="btn btn-dark btn-xs" id="siren">
				 	 <img src="${pageContext.request.contextPath}/assets/img/siren.png" width="13" height="15"/>
				             신고
				  	</button>
				</div>
				  <button type="button" class="x_btn" onclick = "location.href='${pageContext.request.contextPath}';">
					<img src="${pageContext.request.contextPath}/assets/img/x-btn.jpg" width="28" height="28"/>
				  </button>
				<div class="profil_photo">
				  <div class="profil_img">
				  <c:choose>			  
				  	<c:when test="${profile == null }">
						<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" width="100%"/>				
				  	</c:when>
				  	<c:otherwise>
				  		<img src="${profile.fileUrl}" width="100%"/>
				  	</c:otherwise>
				  </c:choose>
				  </div>
				</div> <!-- fin. profil_photo -->
				<div class="profil_info">
					<p>${output.apply_title}</p>
				</div> <!-- fin. profil_info -->
				<div class="mom_info">
				    <div class="name">${output.name}</div>
					<div class="line"></div>
					<div class="number">no.${output.momno}</div>
				</div>
				<hr/>
				<div class="two_info_box">
					<div class="two_info_area">
						<div class="views_area">
							<div id="views"><i class="fas fa-user-friends"></i> 지원자 수</div>
							<div id="views_number"><span style="color: #00726e;">현재 ${output.cntno}명</span></div>
						</div>
						<div class="two_info_style"></div>
						<div class="clock_area">
							<div id="clock"><i class="far fa-clock"></i> 신청서 작성</div>
							<div id="date">${output.openingdate}</div>
						</div>
					</div>
				</div>
				<!-- Main start-->
				<div class="main">
				<c:if test="${output.apply_content!=null}">
					<div class="info_box">
						<div class="box_name">신청내용</div>
						<div class="info_area">
							<div class="info_text_box">
								<div class="info_text">
									<span>
										${output.apply_content}
									</span>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					<div class="iwant_box">
						<div class="box_name">원하는 시터나이</div>
						<div class="iwant_area">
							<div class="sitter_age_area">
							<c:set var="theString" value="${output.want_age}" />
								<c:if test="${fn:contains(theString, '20')==false}">
								<div class="sitter_age_no_area">
									20대
								</div>
								</c:if>
								<c:if test="${fn:contains(theString, '20')==true}">
								<div class="sitter_age_ok_area">
									20대
								</div>
								</c:if>
								<c:if test="${fn:contains(theString, '30')==false}">
								<div class="sitter_age_no_area">
									30대
								</div>
								</c:if>
								<c:if test="${fn:contains(theString, '30')==true}">
								<div class="sitter_age_ok_area">
									30대
								</div>
								</c:if><c:if test="${fn:contains(theString, '40')==false}">
								<div class="sitter_age_no_area">
									40대
								</div>
								</c:if>
								<c:if test="${fn:contains(theString, '40')==true}">
								<div class="sitter_age_ok_area">
									40대
								</div>
								</c:if><c:if test="${fn:contains(theString, '50')==false}">
								<div class="sitter_age_no_area">
									50대
								</div>
								</c:if>
								<c:if test="${fn:contains(theString, '50')==true}">
								<div class="sitter_age_ok_area">
									50대
								</div>
								</c:if><c:if test="${fn:contains(theString, '60')==false}">
								<div class="sitter_age_no_area">
									60대
								</div>
								</c:if>
								<c:if test="${fn:contains(theString, '60')==true}">
								<div class="sitter_age_ok_area">
									60대
								</div>
								</c:if>
							</div>
						</div>
					</div> <!-- fin. iwant_box -->
					<div class="possible_zone_box">
						<div class="box_name">돌봄 지역</div>
						<div class="possible_zone_area">
							<div>
								<div class="zone_line">
									<span style="color: #028071;"><i class="fas fa-map-marker-alt"></i></span> 
									<div id="zone_line_blank">${output.si}&nbsp;${output.gu}</div>
								</div>
							</div>
						</div> <!-- fin. possible_zone_area -->
					</div> <!-- fin. possible_zone_box -->				
					<div class="active_box">
						<div class="box_name">활동 가능 시간</div>
						<div class="active_area">
							<div class="active_area_text">
							<div>
								<c:if test="${output.frequency=='noplan'}">
								<div style="display: flex;">
								<div class="active_area_profil">
								  <c:choose>			  
								  	<c:when test="${profile == null }">
										<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" width="60" height="60" style="border-radius: 100%"/>				
								  	</c:when>
								  	<c:otherwise>
								  		<img src="${profile.fileUrl}" width="60" height="60" style="border-radius: 100%"/>
								  	</c:otherwise>
								  </c:choose>
								</div>
								<div class="active_area_text_box">
									<div id="active_area_style"></div>
									<div style="padding: 8px 0px;">
										<div class="active_text_line">
											<span id="active_text_style">
											* 아래 표시된 날에만 돌봐주세요.
											<br/>
											<c:if test="${output.schedule_ok==Y}">
											<span style="margin-left: 5px;">
											* 이 일정은 맘시터에 맞춰서 얼마든지 
											<br/>
											<span style="margin-left: 13px;">
											조정할 수 있어요.
											</span>
											</span>
											</c:if>
											</span>
										</div>
									</div>
								</div>
								</div >
								</c:if>
								<c:if test="${output.frequency=='shortTerm'}">
								<div style="display: flex;">
									<div class="active_area_profil">
									  <c:choose>			  
									  	<c:when test="${profile == null }">
											<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" width="60" height="60" style="border-radius: 100%"/>				
									  	</c:when>
									  	<c:otherwise>
									  		<img src="${profile.fileUrl}" width="60" height="60" style="border-radius: 100%"/>
									  	</c:otherwise>
									  </c:choose>
									</div>
									<div class="active_area_text_box">
									<div id="active_area_style"></div>
									<div style="padding: 8px 0px;">
										<div class="active_text_line">
											<span id="active_text_style">
											<span id="schedule_text"> ${output.startdate} </span>
												이 날짜에 아이를 돌봐주세요
											</span>
										</div>
									</div>
								</div>
								</div>
								</c:if>
								<c:if test="${output.frequency=='regular'}">
								<div>
								<div style="display: flex;">
									<div class="active_area_profil">
									  <c:choose>			  
									  	<c:when test="${profile == null }">
											<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" width="60" height="60" style="border-radius: 100%"/>				
									  	</c:when>
									  	<c:otherwise>
									  		<img src="${profile.fileUrl}" width="60" height="60" style="border-radius: 100%"/>
									  	</c:otherwise>
									  </c:choose>
									</div>
								<div class="active_area_text_box">
									<div id="active_area_style"></div>
									<div style="padding: 8px 0px;">
										<div class="active_text_line">
											<span id="schedule_text"> 
											${fn:split(output.startdate,'/')[0]}년 ${fn:split(output.startdate,'/')[1]}월 ${fn:split(output.startdate,'/')[2]}일 
											 </span> 부터 일을 시작할 수 있어요.
											 <br/>
											 <c:if test="${fn:contains(output.schedule_ok,Y)}">
											<span style="margin-left: 5px;">
											* 이 일정은 맘시터에 맞춰서 얼마든지 
											<span>
											조정할 수 있어요.
											</span>
											</span>
											</c:if>
										</div>
									</div>
								</div>
								</div>
							</div>
							<div>
							<div class="col-xs-12" style="text-align: center;">
							<c:set var="theString" value="${output.days}" />
							<c:if test="${fn:contains(theString, 'mon')==false}">
							<div class="days_box_no">
								월 
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'mon')}">
							<div class="days_box_ok">
								월 
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'tue')==false}">
							<div class="days_box_no">
								화
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'tue')}">
							<div class="days_box_ok">
								화 
							</div>
							</c:if><c:if test="${fn:contains(theString, 'wen')==false}">
							<div class="days_box_no">
								수
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'wen')}">
							<div class="days_box_ok">
								수 
							</div>
							</c:if><c:if test="${fn:contains(theString, 'thu')==false}">
							<div class="days_box_no">
								목 
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'thu')}">
							<div class="days_box_ok">
								목 
							</div>
							</c:if><c:if test="${fn:contains(theString, 'fri')==false}">
							<div class="days_box_no">
								금
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'fri')}">
							<div class="days_box_ok">
								금  
							</div>
							</c:if><c:if test="${fn:contains(theString, 'sat')==false}">
							<div class="days_box_no">
								토 
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'sat')}">
							<div class="days_box_ok">
								토 
							</div>
							</c:if><c:if test="${fn:contains(theString, 'sun')==false}">
							<div class="days_box_no">
								일 
							</div>
							</c:if>
							<c:if test="${fn:contains(theString, 'sun')}">
							<div class="days_box_ok">
								일 
							</div>
							</c:if>
							</div>
							</div>
							<div style="text-align: center; font-weight: bold; padding-top: 10px;">
							<span style="color: #ff7000; font-weight: normal; ">
								* 자세한 시간은 맘시터 회원과 매칭된 이후에 조율해요. 
							</span>
							</div>
							</c:if>
							<c:if test="${output.frequency=='noplan'}">
							<c:set var="theString" value="${output.wanttime}" />
								<div class="active_time_box">
									<div class="partTime_line">
										<div class="partTime">
											<div class="part">오전</div>
											<div class="time">07시 ~ 12시</div>
										</div>
										<div class="partTime">
											<div class="part">오후</div>
											<div class="time">12시 ~ 18시</div>
										</div>
										<div class="partTime">
											<div class="part">저녁</div>
											<div class="time">18시 ~ 22시</div>
										</div>
									</div> <!-- fin. partTime_line -->
									<div class="partDay_line">
										월
										<c:if test="${fn:contains(theString, 'wek_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										화
										<c:if test="${fn:contains(theString, 'wek_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										수
										<c:if test="${fn:contains(theString, 'wek_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										목
										<c:if test="${fn:contains(theString, 'wek_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										금
										<c:if test="${fn:contains(theString, 'wek_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'wek_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										토
										<c:if test="${fn:contains(theString, 'end_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										일
										<c:if test="${fn:contains(theString, 'end_morning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_morning')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_launch')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_launch')==false}">
										<div class="partDay_no"></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_evning')}">
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										</c:if>
										<c:if test="${fn:contains(theString, 'end_evning')==false}">
										<div class="partDay_no"></div>
										</c:if>
									</div> <!-- fin. partDay_line -->
									
								</div> <!-- fin. active_time_box -->
								
								</c:if>
								
							</div>
						</div> <!-- fin. active_area -->
					</div> <!-- fin. active_box -->					
					<div class="possible_age_box">
					<div class="box_name">아이 정보</div>
					<div class="possible_age_area" style="font-weight: bold;">
						<div>												
							<div class="child_age_line" style="padding-bottom: 15px;">
								<div style="margin-bottom: -10px">
								</div>
								<c:if test="${output.kids_nai =='got_baby'}">
								<span style="color: #ff7000;"><i class="fas fa-baby fa-3x"></i></span> 
								<span style="margin-top: 11px; margin-left: 10px;">신생아 ${age}세</span>
								</c:if>
								<br/>
								<c:if test="${output.kids_nai == 'baby'}">
								<span style="color: #ff7000;"><i class="fas fa-baby-carriage fa-3x"></i></span> 
								<span style="margin-top: 11px; margin-left: 10px;">영아 ${age}세</span>
								</c:if>
								<br/>
								<c:if test="${output.kids_nai == 'children'}">
								<span style="color: #ff7000;"><i class="fas fa-child fa-3x"></i></span>
								<span style="margin-top: 11px; margin-left: 10px;"> 유아 ${age}세 </span>
								</c:if>
								<br/>
								<c:if test="${output.kids_nai == 'element'}">
								<span style="color: #ff7000;"><i class="fas fa-school fa-3x"></i></span> 
								<span style="margin-top: 11px; margin-left: 10px;">초등학생 ${age}세</span>
								</c:if>
							</div>	
							<c:if test="${age2!=''}">
							<div class="child_age_line">
								<div style="margin-bottom: -10px">
								</div>
								<c:if test="${output.kids_nai2 =='got_baby'}">
								<span style="color: #ff7000;"><i class="fas fa-baby fa-3x"></i></span> 
								<span style="margin-top: 11px; margin-left: 10px;">신생아 ${age2}세</span>
								</c:if>
								<br/>
								<c:if test="${output.kids_nai2 == 'baby'}">
								<span style="color: #ff7000;"><i class="fas fa-baby-carriage fa-3x"></i></span> 
								<span style="margin-top: 11px; margin-left: 10px;">영아 ${age2}세</span>
								</c:if>
								<br/>
								<c:if test="${output.kids_nai2 == 'children'}">
								<span style="color: #ff7000;"><i class="fas fa-child fa-3x"></i></span>
								<span style="margin-top: 11px; margin-left: 10px;"> 유아 ${age2}세 </span>
								</c:if>
								<br/>
								<c:if test="${output.kids_nai2 == 'element'}">
								<span style="color: #ff7000;"><i class="fas fa-school fa-3x"></i></span> 
								<span style="margin-top: 11px; margin-left: 10px;">초등학생 ${age2}세</span>
								</c:if>
							</div>	
							</c:if>										
						</div>
					</div> <!-- fin. possible_age_area -->
				</div> <!-- fin. possible_age_box -->
					<div class="possible_age_box">
						<div class="box_name">원하는 활동</div>
						<div class="possible_age_area">
							<div>
							<div class="possible_active_main">
									<div class="active_line col-xs-3">
										<c:if test="${output.want_act1!='innerplay'}">
										<c:if test="${output.want_act2!='innerplay'}">
										<c:if test="${output.want_act3!='innerplay'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/innerplayicon_s.png"/>
												</div>
												<span>실내놀이</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='innerplay' || output.want_act2=='innerplay' || output.want_act3=='innerplay'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/innerplayicon_s.png"/>
												</div>
												<span>실내놀이</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='korean'}">
										<c:if test="${output.want_act2!='korean'}">
										<c:if test="${output.want_act3!='korean'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/koreanicon_s.png"/>
												</div>
												<span>한글놀이</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='korean' || output.want_act2=='korean' || output.want_act3=='korean'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/koreanicon_s.png"/>
												</div>
												<span>한글놀이</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='simple_cleaning'}">
										<c:if test="${output.want_act2!='simple_cleaning'}">
										<c:if test="${output.want_act3!='simple_cleaning'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/cleanicon_s.png"/>
												</div>
												<span>간단 청소</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='simple_cleaning' || output.want_act2=='simple_cleaning' || output.want_act3=='simple_cleaning'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/cleanicon_s.png"/>
												</div>
												<span>간단 청소</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='long_move_in'}">
										<c:if test="${output.want_act2!='long_move_in'}">
										<c:if test="${output.want_act3!='long_move_in'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/longhouseicon_s.png"/>
												</div>
												<span>장기입주</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='long_move_in' || output.want_act2=='long_move_in' || output.want_act3=='long_move_in'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/longhouseicon_s.png"/>
												</div>
												<span>장기입주</span>
											</div>
										</div>
										</c:if>
									</div>
									<!-- --- -->
									<div class="active_line col-xs-3">
										<c:if test="${output.want_act1!='guide'}">
										<c:if test="${output.want_act2!='guide'}">
										<c:if test="${output.want_act3!='guide'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/guideicon_s.png"/>
												</div>
												<span>등하원 돕기</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='guide' || output.want_act2=='guide' || output.want_act3=='guide'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/guideicon_s.png"/>
												</div>
												<span>등하원 돕기</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='english'}">
										<c:if test="${output.want_act2!='english'}">
										<c:if test="${output.want_act3!='english'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/englishicon_s.png"/>
												</div>
												<span>영어놀이</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='english' || output.want_act2=='english' || output.want_act3=='english'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/englishicon_s.png"/>
												</div>
												<span>영어놀이</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='eat'}">
										<c:if test="${output.want_act2!='eat'}">
										<c:if test="${output.want_act3!='eat'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/eaticon_s.png"/>
												</div>
												<span>밥 챙겨주기</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='eat' || output.want_act2=='eat' || output.want_act3=='eat'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/eaticon_s.png"/>
												</div>
												<span>밥 챙겨주기</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='short_move_in'}">
										<c:if test="${output.want_act2!='short_move_in'}">
										<c:if test="${output.want_act3!='short_move_in'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/houseicon_s.png"/>
												</div>
												<span>단기입주</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='short_move_in' || output.want_act2=='short_move_in' || output.want_act3=='short_move_in'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/houseicon_s.png"/>
												</div>
												<span>단기입주</span>
											</div>
										</div>
										</c:if>
									</div>
									<!-- ----- -->
									<div class="active_line col-xs-3">
										<c:if test="${output.want_act1!='read'}">
										<c:if test="${output.want_act2!='read'}">
										<c:if test="${output.want_act3!='read'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/readicon_s.png"/>
												</div>
												<span>책읽기</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='read' || output.want_act2=='read' || output.want_act3=='read'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/readicon_s.png"/>
												</div>
												<span>책읽기</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='study'}">
										<c:if test="${output.want_act2!='study'}">
										<c:if test="${output.want_act3!='study'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/studyicon_s.png"/>
												</div>
												<span>학습지도</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='study' || output.want_act2=='study' || output.want_act3=='study'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/studyicon_s.png"/>
												</div>
												<span>학습지도</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='do_dish'}">
										<c:if test="${output.want_act2!='do_dish'}">
										<c:if test="${output.want_act3!='do_dish'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/dishicon_s.png"/>
												</div>
												<span>간단 설거지</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='do_dish' || output.want_act2=='do_dish' || output.want_act3=='do_dish'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/dishicon_s.png"/>
												</div>
												<span>간단 설거지</span>
											</div>
										</div>
										</c:if>
									</div>
									<!-- ------- -->
									<div class="active_line col-xs-3">
										<c:if test="${output.want_act1!='outside'}">
										<c:if test="${output.want_act2!='outside'}">
										<c:if test="${output.want_act3!='outside'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/ousideicon_s.png"/>
												</div>
												<span>야외활동</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='outside' || output.want_act2=='outside' || output.want_act3=='outside'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/ousideicon_s.png"/>
												</div>
												<span>야외활동</span>
											</div>
										</div>
										</c:if>
										<c:if test="${output.want_act1!='sport'}">
										<c:if test="${output.want_act2!='sport'}">
										<c:if test="${output.want_act3!='sport'}">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="${pageContext.request.contextPath}/assets/img/ballicon_s.png" />
												</div>
												<span>체육놀이</span>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:if>
										<c:if test="${output.want_act1=='sport' || output.want_act2=='sport' || output.want_act3=='sport'}">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="${pageContext.request.contextPath}/assets/img/ballicon_s.png" />
												</div>
												<span>체육놀이</span>
											</div>
										</div>
										</c:if>
										</div>								
								</div>
							</div>
						</div>
						</div> <!-- fin. possible_active_area -->
						<c:if test="${output.description!=null}">
						<div class="possible_age_box">
						<div class="box_name">시터가 알아야 할 사항</div>
						<div class="possible_age_area">
							${output.description}
						</div>
						</div>						
						</c:if>
						<c:if test="${output.sitter_gender!='' || output.care_type!=null || output.interview_type!=null}">
						<div class="possible_age_box">
						<div class="box_name">그 외 요청사항</div>
						<div class="possible_age_area">
							<c:if test="${output.sitter_gender!=''}">
								<div class="other_line">
									<label class="want_gender_line">희망 맘시터 성별 : </label>
									<c:if test="${fn:contains(output.sitter_gender,'F')}">
									<span class="want_gender">여자</span>
									</c:if>
									<c:if test="${fn:contains(output.sitter_gender,'M')}">
									<span class="want_gender">남자</span>
									</c:if>
									<c:if test="${fn:contains(output.sitter_gender,'N')}">
									<span class="want_gender">무관</span>
									</c:if>
								</div>
							</c:if>
							<c:if test="${output.care_type!=null}">	
								<div class="other_line">
									<label class="want_care_line">희망 돌봄 방식 : </label>
									<span class="want_care">${output.care_type}</span>
								</div>	
							</c:if>	
							<c:if test="${output.interview_type!=null}">	
								<div class="other_line">
									<label class="want_care_line">희망 인터뷰 방식 : 
									<c:if test="${output.interview_type=='call'}">
									<span class="want_care">전화 인터뷰</span></c:if>
									<c:if test="${output.interview_type=='face'}">
									<span class="want_care">대면 인터뷰</span></c:if>
									<c:if test="${output.interview_type=='test'}">
									<span class="want_care">시범 채용</span></c:if>
									</label>
								</div>
							</c:if>								
							</div>
						</div> <!-- fin. possible_age_box -->
						</c:if>
						</div> <!-- fin. possible_active_box -->
					</div>
					</div>
					</div>
					</div>			
				<!-- ----------하단고정 부분 시작------------ -->
			<div class="fixed_box col-xs-12">
				<div class="fixed_area">
					<div class="fixed_area_age">
						<div class="fixed_name">
						</div>
						<div class="fixed_age">
							희망시급 <c:if test="${fn:contains(output.payment_ok,Y)}">(협의가능)</c:if>
						</div>
						<div class="fixed_money">
						<fmt:formatNumber value="${output.payment}" pattern="#,###" />원
						</div>
					</div>
				</div> <!-- fin. fixed_area -->
				<div class="fixed_btn">
					<div class="fixed_btn_jim">
						<button id="swapHeart" class="btn btn-default swap" type="button" data-momno="${output.momno}">
							<c:if test="${output.findHt == 0}">
						    <span class="glyphicon glyphicon-heart-empty"></span>
							</c:if>
							<c:if test="${output.findHt != 0}">
						    <span class="glyphicon glyphicon-heart"></span>
							</c:if>
						</button>					
					</div>
					<div class="interview_btn">
							<button tabindex="0" type="button" class="btn-interview" id="interview">
								<div>
									<div class="btn_text_box">
										<span><a data-toggle="modal" href="#myModal" class="btn btn-primary btn-sm">인터뷰 신청하기</a></span>
									</div>
								</div>
							</button>
					</div> <!-- fin. interview_btn -->
				</div>
			</div> <!-- fin. fixed_box -->
				<!-- /.modal -->	
			
	</body>
</html>