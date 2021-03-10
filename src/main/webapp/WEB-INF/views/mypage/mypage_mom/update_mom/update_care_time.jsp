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

        <!--flatpickr-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mom_appl.css">

        <!--flatpickr-->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    

        <style type="text/css">
        /** for 후기 관리 페이지 (review.html) --------------------------------------*/
        /** 공통 for 후기 관리 */


        .flatpickr-day.selected,
		.flatpickr-day.selected:focus,
		.flatpickr-day.selected:hover {
			background-color: #ff7000;
			border-color: #ff7000;
		}

		.flatpickr-day.selected.prevMonthDay,
		.flatpickr-day.selected.nextMonthDay {
			background-color: #fff0e8;
			border-color: #fff0e8;
		}

		.flatpickr-day.today {
			border-color: #ff7000;
        }
        
        .select_btn {
            background-color: #ff7000 !important;
            position: relative !important;
            color: #fff !important;
        }

		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_ct">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_mom/update_appl.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">돌봄 기간 / 시간 변경</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content1 -->
                        <section class="group_upd_ct">
                        	<h2>돌봄 기간 / 시간 변경</h2>
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- 탭 버튼 영역 (정기적으로 / 특정한 날에만)-->
                                    <div class="upd_ct_tab">
                                        <a class="upd_ct_tab_item_link selected" href="#upd_ct_tab_page1">정기적으로</a>
                                        <a class="upd_ct_tab_item_link" href="#upd_ct_tab_page2">특정한 날에만</a>
                                    </div>
                                    <!-- end 탭 버튼 영역 -->

                                    <!-- 내용 영역 -->
                                    <div class="upd_ct_tab_panel">
                                        <div id="upd_ct_tab_page1" class="upd_ct_tab_page">
                                            <!--돌봄 시작일-->
                                            <div class="calc_box">
                                                <div class="regu_title">돌봄 시작일</div>
                                                <input id="datepicker" class="date_box">
                                            </div>
                                            <hr>
                                            <div>
                                                <div class="regu_title">돌봄 요일</div>
                                                <div class="day_btn_group">
                                                    <button class="day_btn" value="mon">월</button>
                                                    <button class="day_btn" value="tue">화</button>
                                                    <button class="day_btn" value="wen">수</button>
                                                    <button class="day_btn" value="thu">목</button>
                                                    <button class="day_btn" value="fri">금</button>
                                                    <button class="day_btn" value="sat">토</button>
                                                    <button class="day_btn" value="sun">일</button>
                                                </div>
                                            </div>
                                            <hr>
                                            <!--요일 선택시 나타내주기-->
                                            <div id="content" class="hide_content">
                                                <!--시간 선택-->
                                                <div class="time_select_box">
                                                    <div>
                                                        <!--시작 시간-->
                                                        <div class="regu_title">시작시간</div>
                                                        <!--시간-->
                                                        <div class="select_time">
                                                            <select>
                                                                <option value="10:00">오전 10:00</option>
                                                                <option value="10:30">오전 10:30</option>
                                                                <option value="11:00" selected>오전 11:00</option>
                                                                <option value="11:30">오전 11:30</option>
                                                                <option value="12:00">오전 12:00</option>
                                                                <option value="12:30">오전 12:30</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!--end select-->

                                                    <!--중간 바-->
                                                    <div class="middle_bar"></div>
                                                    <!--종료시간-->
                                                    <div>
                                                        <div>
                                                            <div class="regu_title">종료시간</div>
                                                        </div>
                                                        <div class="select_time">
                                                            <select>
                                                                <option value="20:00">오후 20:00</option>
                                                                <option value="20:30">오후 20:30</option>
                                                                <option value="21:00" selected>오후 21:00</option>
                                                                <option value="21:30">오후 21:30</option>
                                                                <option value="22:00">오후 22:00</option>
                                                                <option value="22:30">오후 22:30</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!--end select-->
                                                </div>
                                                <!--end select box-->

                                                <!--일정은 시터에게 맞출 수 잇어요-->
                                                <div class="jojung_box">
                                                    <span class="jojung_check"></span>
                                                    <span class="jojung_text">본 일정은 맘시터에 맞춰서 얼마든지 조정할 수 있어요.</span>
                                                </div>
				                            </div>
                                        </div>
                                        <div id="upd_ct_tab_page2" class="upd_ct_tab_page hide">
                                            <div class="calen">
                                                <!--특정 날 선택 daypicker-->
                                                 <div class="calrendar_block"></div>
                                            </div>
                                             <!--시간 선택-->
                                            <div class="time_select_box">
                                                <div>
                                                    <!--시작 시간-->
                                                    <div class="regu_title">시작시간</div>
                                                    <!--시간-->
                                                    <div class="select_time">
                                                        <select>
                                                            <option value="10:00">오전 10:00</option>
                                                            <option value="10:30">오전 10:30</option>
                                                            <option value="11:00" selected>오전 11:00</option>
                                                            <option value="11:30">오전 11:30</option>
                                                            <option value="12:00">오전 12:00</option>
                                                            <option value="12:30">오전 12:30</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!--end select-->

                                                <!--중간 바-->
                                                <div class="middle_bar"></div>
                                                <!--종료시간-->
                                                <div>
                                                    <div>
                                                        <div class="regu_title">종료시간</div>
                                                    </div>
                                                    <div class="select_time">
                                                        <select>
                                                            <option value="20:00">오후 20:00</option>
                                                            <option value="20:30">오후 20:30</option>
                                                            <option value="21:00" selected>오후 21:00</option>
                                                            <option value="21:30">오후 21:30</option>
                                                            <option value="22:00">오후 22:00</option>
                                                            <option value="22:30">오후 22:30</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!--end select-->
                                            </div>
                                            <!--end select box-->
                                            <!--일정은 시터에게 맞출 수 잇어요-->
                                            <div class="jojung_box">
                                                <span class="jojung_check"></span>
                                                <span class="jojung_text">본 일정은 맘시터에 맞춰서 얼마든지 조정할 수 있어요.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>   
                        <!-- end content1 -->
                    </form>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>
            $(function() {
        
                /** 직접 입력 클릭 시 텍스트 박스 나타남 */
                $(".upd_ct_tab_item_link").click(function(e) {
                    e.preventDefault();

                    $(".upd_ct_tab_item_link").not(this).removeClass("selected");
                    $(this).addClass("selected");

                    var target = $(this).attr("href");
                    $(target).removeClass("hide");
                    $(".upd_ct_tab_page").not($(target)).addClass("hide");
                });

                $('#datepicker').flatpickr({
                    dateFormat: "Y/m/d",
                    minDate: "today",
                    maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
                    defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
                });

                //요일 선택시 
                $(".day_btn").on("click", function () {
                                $(this).toggleClass("select_btn");

				var count = $(".select_btn").length;
				if (count == 0) {
					$("#content").removeClass("show_content");
					$("#content").addClass("hide_content");
				} else {
					$("#content").removeClass("hide_content");
					$("#content").addClass("show_content");
				}
            });
            
            $(".calrendar_block").flatpickr({
                inline: true,
                dateFormat: "Y/m/d",
                minDate: "today",
                maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
                defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
            });


			//일정 조정 선택
			$(".jojung_box").on("click", function () {
				$(this).toggleClass("box_check");
				$(this).find(".jojung_check").toggleClass("check_check");
			});
            });
        </script>
 
	</body>
</html>