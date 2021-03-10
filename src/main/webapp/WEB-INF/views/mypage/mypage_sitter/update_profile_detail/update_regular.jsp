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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_sitter_profile.css">

        <!--flatpickr-->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <style type="text/css">

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
		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_regular">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">활동 가능 시간 변경</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content1 -->
                        <section class="start_job">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h4 class="regular_tl">활동 시작일</h4>
                                    <input type="text" name="start_date" id="datepicker" class="startdate center-block">
                                </div>
                            </div>
                        </section>

                        <hr/>

                        <!-- content2 -->
                        <section class="available_days">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="choose_day_title">
                                        <h4 class="regular_tl">활동 요일</h4>
                                    </div>
                                    <div class="available_days_in">
                                        <input type="checkbox" name="workdays" id="workday1" class="workdays" value="mon">
                                        <label for="workday1">월</label>
                        
                                        <input type="checkbox" name="workdays" id="workday2" class="workdays" value="tue">
                                        <label for="workday2">화</label>
                                
                                        <input type="checkbox" name="workdays" id="workday3" class="workdays" value="wed">
                                        <label for="workday3">수</label>
                        
                                        <input type="checkbox" name="workdays" id="workday4" class="workdays" value="thur">
                                        <label for="workday4">목</label>
                                
                                        <input type="checkbox" name="workdays" id="workday5" class="workdays" value="fri">
                                        <label for="workday5">금</label>
                                
                                        <input type="checkbox" name="workdays" id="workday6" class="workdays" value="sat">
                                        <label for="workday6">토</label>
                                
                                        <input type="checkbox" name="workdays" id="workday7" class="workdays" value="sun">
                                        <label for="workday7">일</label>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <hr/>

                        <!-- content3 -->
                        <section class="work_term">
                            <div class="row">
                                <div class="col-xs-12">
                                    <h4 class="regular_tl">이 일정으로 얼마동안 일할 수 있나요?</h4>
                                </div>
                            </div>
                            <div class="term_list">
                                <input type="radio" name="workterm" class="workterm" id="workterm1" value="1week">
                                <label for="workterm1">1주일 이상</label>

                                <input type="radio" name="workterm" class="workterm" id="workterm2" value="1month">
                                <label for="workterm2">1개월 이상</label>
                                
                                <input type="radio" name="workterm" class="workterm" id="workterm3" value="3month">
                                <label for="workterm3">3개월 이상</label>

                                <input type="radio" name="workterm" class="workterm" id="workterm4" value="6month">
                                <label for="workterm4">6개얼 이상</label>
                            </div>

                            <div id="result"></div>
                        </section>                        
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
                $('.startdate').flatpickr({
                dateFormat: "Y.m.d",
                minDate: "today",
                maxDate: new Date().fp_incr(30),
                defaultDate: new Date()
                });
            });
        </script>
 
	</body>
</html>