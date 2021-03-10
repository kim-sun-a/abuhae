<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
        
        <!-- icon 참조 -->
        <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mom_appl.css">
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_loc">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_mom/update_appl.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">돌봄 장소 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content1 (dropdown) -->
                        <section class="group1_upd_loc">
                            <div class="row">
                                <div class="col-xs-12 upd_loc_cont1">
                                    <!--시,도-->
                                    <div class="location_group" id="si">
                                        <div>
                                            <button class="loc_btn">서울특별시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">경기도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">인천광역시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">부산광역시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">대전광역시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">대구광역시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">울산광역시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">세종특별자치시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">광주광역시</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">강원도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">충청북도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">충청남도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">경상북도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">경상남도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">전라북도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">전라남도</button>
                                        </div>
                                        <div>
                                            <button class="loc_btn">제주특별자치도</button>
                                        </div>

                                    </div>
                                    <!--end 시-->
                                    <!--구-->
                                    <div class="location_group" id="gu">
                                        <div class="hide_content">
                                            <div>
                                                <button>강남구</button>
                                            </div>
                                            <div>
                                                <button>강동구</button>
                                            </div>
                                            <div>
                                                <button>강북구</button>
                                            </div>
                                            <div>
                                                <button>강서구</button>
                                            </div>
                                            <div>
                                                <button>관악구</button>
                                            </div>
                                            <div>
                                                <button>광진구</button>
                                            </div>
                                            <div>
                                                <button>구로구</button>
                                            </div>
                                            <div>
                                                <button>금천구</button>
                                            </div>
                                            <div>
                                                <button>노원구</button>
                                            </div>
                                            <div>
                                                <button>도봉구</button>
                                            </div>
                                            <div>
                                                <button>동대문구</button>
                                            </div>
                                            <div>
                                                <button>동작구</button>
                                            </div>
                                            <div>
                                                <button>마포구</button>
                                            </div>
                                            <div>
                                                <button>서대문구</button>
                                            </div>
                                            <div>
                                                <button>서초구</button>
                                            </div>
                                            <div>
                                                <button>성동구</button>
                                            </div>
                                            <div>
                                                <button>성북구</button>
                                            </div>
                                            <div>
                                                <button>송파구</button>
                                            </div>
                                            <div>
                                                <button>양천구</button>
                                            </div>
                                            <div>
                                                <button>영등포구</button>
                                            </div>
                                            <div>
                                                <button>용산구</button>
                                            </div>
                                            <div>
                                                <button>은평구</button>
                                            </div>
                                            <div>
                                                <button>종로구</button>
                                            </div>
                                            <div>
                                                <button>중구</button>
                                            </div>
                                            <div>
                                                <button>중랑구</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end 구-->
                                    <!--동-->
                                    <div class="location_group" id="dong">
                                        <div class="hide_content">
                                            <div>
                                                <button>가산동</button>
                                            </div>
                                            <div>
                                                <button>독산1동</button>
                                            </div>
                                            <div>
                                                <button>독산2동</button>
                                            </div>
                                            <div>
                                                <button>독산3동</button>
                                            </div>
                                            <div>
                                                <button>독산4동</button>
                                            </div>
                                            <div>
                                                <button>독산동</button>
                                            </div>
                                            <div>
                                                <button>시흥1동</button>
                                            </div>
                                            <div>
                                                <button>시흥2동</button>
                                            </div>
                                            <div>
                                                <button>시흥3동</button>
                                            </div>
                                            <div>
                                                <button>시흥4동</button>
                                            </div>
                                            <div>
                                                <button>시흥5동</button>
                                            </div>
                                            <div>
                                                <button>시흥동</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!--end 동-->
                                </div>
                            </div>

                        </section>
                    </form>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script>
            $(function () {
                //시 클릭했을 때
                $(".loc_btn").on("click", function () {
                    var select = $(this).hasClass("select_location");
                    //선택이 안되어있을때
                    if (select == false) {
                        //선택이 되어있는 요소 탐색
                        var loc = $("#si").find("button").removeClass("select_loaction");
                        //console.log(loc);
                        $(this).addClass("select_loaction");
                        //시 선택하면 gu 보이게
                        $("#gu>div").removeClass("hide_content");
                        $("#gu>div").addClass("show_content");
                    }

                });
                //구 클릭했을 때
                $("#gu button").on("click", function () {
                    var select = $(this).hasClass("select_location");
                    //선택이 안되어있을때
                    if (select == false) {
                        //선택이 되어있는 요소 탐색
                        var loc = $("#gu").find("button").removeClass("select_loaction");
                        //console.log(loc);
                        $(this).addClass("select_loaction");
                        //구 선택하면 동 보이게
                        $("#dong>div").removeClass("hide_content");
                        $("#dong>div").addClass("show_content");
                    }
                });

                //동 클릭했을때
                $("#dong button").on("click", function () {
                    var select = $(this).hasClass("select_location");
                    //선택이 안되어있을때
                    if (select == false) {
                        //선택이 되어있는 요소 탐색
                        var loc = $("#dong").find("button").removeClass("select_loaction");
                        //console.log(loc);
                        $(this).addClass("select_loaction");
                    }
                });
            });
        </script>
	</body>
</html>