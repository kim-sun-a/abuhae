<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />

    <!-- icon 참조 -->
    <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

    <!-- animaition 적용-(for header) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" />

    <!-- sitter_mypage css 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sitter_mypage.css">
    </link>

    <style type="text/css">
    </style>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</head>

<body>
    <div id="app">
        <div class="container">
            <!-- header -->
            <div id="menu">
                <c:if test="${isLogin ==true }">
                    <c:choose>
                        <c:when test="${fn:contains(loginType, 'S')}">
                            <%@ include file="../../index_header_login_sitter.jsp" %>
                        </c:when>
                    </c:choose>
                </c:if>
            </div>


            <!-- sitter_mypage -->
            <div class="wrap_mps">
                <!--첫번째 항목-->
                <section class="group1_mps">
                    <div class="row">
                        <div class="col-xs-12 mps_title">
                            <h3>마이페이지</h3>
                            <div class="mps_title_cont">
                                <!--백엔드 연동 필요-->
                                <a
                                    href="${pageContext.request.contextPath}/mypage/mypage_sitter/updp/${login.memberno}"><span
                                        class="glyphicon glyphicon-pencil"></span>비밀번호 변경</a>
                                ㅣ
                                <a href="${pageContext.request.contextPath}/logout"" id="mps_logout">로그아웃</a>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- fin 첫번째 항목 -->

                <!--두번째 항목-->
                <section class="group2_mps">
                    <div class="row">
                        <div class="col-xs-12 mps_profile">
                            <!--백엔드 연동 필요-->
                            <div class="mps_prof_info">
                                <c:choose>
                                	<c:when test="${profile == null }">
                                		<img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg"
                                    	alt="임시 프로필사진" style="width: 52px; height:52px; border-radius: 50%;">
                                	</c:when>
                                	<c:otherwise>
                                		<img src="${profile.fileUrl}"
                                    	alt="임시 프로필사진" style="width: 52px; height: 52px; border-radius: 50%;">
                                	</c:otherwise>
                                </c:choose>
                                <p class="info_sitter">${output.name }</p>
                                <p class="info_sitter">no.${output.sitterno }</p>
                            </div>

                            <hr style="border: 1px solid rgb(226, 225, 225); background-color: rgb(226, 225, 225);">
							
							
							<div class="buy_title">
                                <div class="buy_title_left">
                                    <h4 style="font-size: 1em; font-weight: bold;">내 프로필 상태</h4>
                                    <!--백엔드 연동 필요-->
                                    <!-- 구직중/구직종료 Toggle button -->
                                    <div id="switch_buy" class="buy_tl_switch">
                                       <c:choose>
                                       		<c:when test="${output.job_opening eq 'Y'.charAt(0)}">
                                       			<span style="color: rgb(34, 172, 135); font-size: 0.9em; font-weight: bold; margin-right: 5px;">구직 중</span>
                                       			 <input type="checkbox" id="check" value="true" checked>
                                        		<label id="switch" class="round" for="check"></label>
                                   			</c:when>
                              				<c:otherwise>
                              					<span style="color: #858585; font-size: 0.9em; font-weight: bold; margin-right: 5px;">구직 종료</span>
                                   				 <input type="checkbox" id="check" value="false">
                                        		<label id="switch" class="round" for="check"></label>
                                   			</c:otherwise>
                                       </c:choose>
                                         
                                    </div>
                                    <!-- end 구직중/구직종료 Toggle button -->
                                    
                                </div>
                                <div class="buy_title_right">
                                	<a data-toggle="modal" href="#tl_right_modal">
                                        <i class="fas fa-question-circle" style="color: #b6b5b5; font-size: 1.7em;"></i>
                                    </a>
                                </div>
                                 <!-- modal(구직 중/ 구직 종료 상태 설명) -->
                                <div id="tl_right_modal" class="modal fade" tabindex="-1" role="dialog"
                                    aria-labelledby="modalLabel" aria-hidden="true">
                                    <!-- mocal-dialog -->
                                    <div class="modal-dialog">
                                        <!-- modal-content -->
                                        <div class="modal-content">
                                            <!--제목-->
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true" style="padding: 10px 0;">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                                <h4 class="modal-title" id="modalLabel"
                                                    style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                                    구직 중, 구직 종료 상태란?
                                                </h4>
                                            </div>

                                            <!-- 내용 -->
                                            <div class="modal-body">
                                                <h4 style="font-size: 1.3em; font-weight: bold;">
                                                    1.'구직 중' 상태
                                                </h4>
                                                <br />
                                                <p style="font-size: 1em;">
                                                    부모님들이 내 프로필을 보고 인터뷰 신청을 할 수 있는 상태입니다. 구직을 <br />
                                                    종료하고 싶은 경우, 반드시 ‘구직 종료’로 변경해주세요. 프로필에 작성한 <br />
                                                    돌봄 기간이 지난 경우, ‘구직 종료’ 상태로 자동 변경됩니다. <br />
                                                    <span style="font-size: 0.9em; color: #b6b5b5;"><span
                                                            class="glyphicon glyphicon-hand-right"></span> 실제와 다른
                                                        내용의 프로필 내용은 신고사유가 될 수 있습니다.</span>
                                                </p>
                                                <br /> <br />
                                                <h4 style="font-size: 1.3em; font-weight: bold;">
                                                    2.'구직 종료' 상태
                                                </h4>
                                                <br />
                                                <p style="font-size: 1em; margin-bottom: 20px;">
                                                    부모님들이 내 프로필을 보고 인터뷰 신청할 수 없는 상태입니다. 구직을 <br />
                                                    다시 시작하고 싶은 경우, 반드시 ‘구직 중’으로 변경해주세요.
                                                </p>
                                            </div>
                                        </div>
                                        <!-- //modal-content end -->
                                    </div>
                                    <!-- //modal-dailog end-->
                                </div>
                                <!-- // modal end -->
                            </div>
                        </div>
                    </div>
                </section>
                <!-- end 두번째 항목 -->

                <!--세번째 항목-->
                <section class="group3_mps">
                    <div class="row">
                        <div class="col-xs-12 mps_menu">
                            <a
                                href="${pageContext.request.contextPath}/mypage/mypage_sitter/getm/${login.sitterno}">
                                <i class="fas fa-address-book mps_menu3_list1"></i>
                                <p class="mps_menu3_list2">내 구직 현황</p>
                                <i class="fas fa-angle-right mps_menu3_list3"></i>
                            </a>

                            <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                            <a
                                href="${pageContext.request.contextPath}/mypage/mypage_sitter/likem/${login.sitterno}">
                                <i class="fab fa-gratipay mps_menu_list1"></i>
                                <p class="mps_menu_list2">찜한 일자리</p>
                                <p class="mps_menu_list3">${heartcount }명</p>
                                <i class="fas fa-angle-right mps_menu_list4"></i>
                            </a>

                            <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                            <a
                                href="${pageContext.request.contextPath}/page_detail/sitter_detail.do?sitterno=${login.sitterno}">
                                <i class="fas fa-user-circle mps_menu3_list1"></i>
                                <p class="mps_menu3_list2">내 프로필 보기</p>
                                <i class="fas fa-angle-right mps_menu3_list3"></i>
                            </a>

                            <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                            <a
                                href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_sitter_profile.do?sitterno=${login.sitterno}">
                                <i class="fas fa-pen mps_menu3_list1"></i>
                                <p class="mps_menu3_list2">내 프로필 수정</p>
                                <i class="fas fa-angle-right mps_menu3_list3"></i>
                            </a>
                        </div>
                    </div>
                </section>

                <!--  <div class="row">
                        <div class="col-xs-12 line_bold"></div>
                    </div>
                    
                    <section class="group3_mps">
                        <div class="row">
                            <div class="col-xs-12 mps_menu">

                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/fund.do">
                                    <i class="fas fa-comment-dollar mps_menu3_list1" style="color: #fa9547;"></i>
                                    <p class="mps_menu3_list2">내 적립금</p>
                                    <i class="fas fa-angle-right mps_menu3_list3"></i>
                                </a>

                                <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/coupon.do?sitterno=${output.sitterno}">
                                    <i class="fas fa-file-invoice-dollar mps_menu_list1" style="color: #fa9547;"></i>
                                    <p class="mps_menu_list2">내 쿠폰함</p>
                                    <p class="mps_menu_list3" style="color: rgb(255, 129, 0);">1 장</p>
                                    <i class="fas fa-angle-right mps_menu_list4"></i>
                                </a>
                            </div>
                        </div>
                    </section> -->

                <div class="row">
                    <div class="col-xs-12 line_bold"></div>
                </div>

                <section class="group3_mps">
                    <div class="row">
                        <div class="col-xs-12 mps_menu">
                            <a
                                href="${pageContext.request.contextPath}/mypage/mypage_sitter/rv/${login.sitterno}">
                                <i class="fas fa-star mps_menu3_list1"></i>
                                <p class="mps_menu3_list2">후기 관리</p>
                                <i class="fas fa-angle-right mps_menu3_list3"></i>
                            </a>

                            <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                            <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/ct/${login.sitterno}">
                                <i class="fas fa-check-circle mps_menu_list1"></i>
                                <p class="mps_menu_list2">인증 관리</p>
                                <!--백엔드 연동 필요-->
                                <c:choose>
                                	<c:when test="${certify.cert == 'Y' }">
                                		<p class="mps_menu_list3">인증 완료</p>
                                	</c:when>
                                	<c:otherwise>
                                		<p class="mps_menu_list3">0개 완료</p>
                                	</c:otherwise>
                                </c:choose>
                                <i class="fas fa-angle-right mps_menu_list4"></i>
                            </a>

                            <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                            <a
                                href="${pageContext.request.contextPath}/mypage/mypage_sitter/coutm/${login.sitterno}">
                                <i class="fas fa-user-plus mps_menu_list1"></i>
                                <p class="mps_menu_list2">내 맘시터 채용 횟수</p>
                                <!--백엔드 연동 필요-->
                                <p class="mps_menu_list3">${workcount } 회</p>
                                <i class="fas fa-angle-right mps_menu_list4"></i>
                            </a>

                            <div style="background-color: rgb(243, 241, 241); width: 100%; height: 1px;"></div>

                            <a
                                href="${pageContext.request.contextPath}/mypage/mypage_sitter/rp/${login.sitterno}">
                                <i class="fas fa-bomb mps_menu_list1"></i>
                                <p class="mps_menu_list2">신고내역</p>
                                <!--백엔드 연동 필요-->
                                <p class="mps_menu_list3">${reportcount } 건</p>
                                <i class="fas fa-angle-right mps_menu_list4"></i>
                            </a>
                        </div>
                    </div>
                </section>


                <!--네번째 항목-->
                <section class="group4_mps">
                    <div class="row">
                        <div class="col-xs-12 mps_bottom">
                            <!--  <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/payment_list.do" class="bottom_con_in bt_cash">
                                    <p>결제 내역</p>
                                    <!--백엔드 연동 필요-->
                            <!--  <p class="bt_cash_p">1 건</p>
                                </a> -->
                            <a href="${pageContext.request.contextPath}/customer/notice_site.do" class="bottom_con_in">
                                <p>공지사항</p>
                            </a>
                            <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/ma/${login.memberno}"
                                class="bottom_con_in">
                                <p>계정관리</p>
                            </a>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <!-- on off 토글 버튼, by daye, 2020.12.07 -->
    <script type="text/javascript">
        var check = $("input[type='checkbox']");
        check.click(function () {
            $(".switch_p").toggle();
        }); 
        
        $(function() {
        	$("#mps_logout").click(function (e) {
        		var result = confirm("로그아웃 하시겠습니까?"); 
        		if(result) {  
        			location.replace("${pageContext.request.contextPath}/logout"); 
       			}
              });
        	
        	$("#switch").on("click", function() {
        		let memberno = ${login.memberno};
        		let sitterno = ${login.sitterno};
        		
        		if ($(check).is(":checked")) {
        			$.post("${pageContext.request.contextPath}/mypage/update_mjob_opening", {
        				memberno: memberno,
        				job_opening: "N",
        			}, function() {
        				var conf = alert("프로필이 비공개되었습니다.");
        				
        				
        				return location.replace("${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno="+${login.sitterno});
        				
        			});
        		} else {
        			$.post("${pageContext.request.contextPath}/mypage/update_sopening_date", {
        				sitterno: sitterno
        			});
        			
        			$.post("${pageContext.request.contextPath}/mypage/update_mjob_opening", {
        				memberno: memberno,
        				job_opening: "Y",
        			}, function() {
						var conf = alert("프로필을 공개하시겠습니까?");
        				
        				
        				return location.replace("${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno="+${login.sitterno});
        			});
        		}
            });
        });
    </script>
    
        
</body>

</html>