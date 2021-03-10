<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
    <!--절대 경로 수정 1217 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
        
    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--join css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/join_parent.css">
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    
    <style type="text/css">
        html,
        body {
            color: #222;
            font-weight: 100;
            font-size: 1em;
            line-height: 1.375;
            padding: 0;
            margin: 0;
        }
    
        .container {
            padding: 0 !important;
        }
    
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
    
        .flatpickr-calendar.inline {
            margin: auto;
        }
    
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
    <div id="schedule" class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <form id="addform" method="post" action="${pageContext.request.contextPath}/join/parent/description.do">
                <input type="hidden" id="type" name="type" value="${type}">
                <input type="hidden" id="want_act1" name="want_act1" value="${want_act1}">
                <input type="hidden" id="want_act2" name="want_act2" value="${want_act2}">
                <input type="hidden" id="want_act3" name="want_act3" value="${want_act3}">
                <input type="hidden" id="want_age" name="want_age" value="${want_age}">
                <input type="hidden" id="kids_num" name="kids_num" value="${kids_num}">
                <input type="hidden" id="kids_age" name="kids_age" value="${kids_age}">
                <input type="hidden" id="kids_age2" name="kids_age2" value="${kids_age2}">
                <input type="hidden" id="payment" name="payment" value="${payment}">
                <input type="hidden" id="payment_ok" name="payment_ok" value="${payment_ok}">
                <input type="hidden" id="loc_si" name="si" value="${si}">
                <input type="hidden" id="loc_gu" name="gu" value="${gu}">
                <input type="hidden" id="loc_dong" name="dong" value="${dong}">
                <input type="hidden" id="schedules" name="schedule">
                <input type="hidden" id="schedule_ok" name="schedule_ok">
                <div class="change_box">
                    <div class="page_dots">
                        <span class="dot now_dots"></span>
                        <span class="dot now_dots"></span>
                        <span class="dot now_dots"></span>
                        <span class="dot now_dots"></span>
                        <span class="dot"></span>
                    </div>
                    <h3 class="what_want">언제 돌봐드릴까요?</h3>
                    <button class="when_btn" value="regular">정기적으로</button>
                    <button class="when_btn" value="shortTerm">특정 날에만</button>
                    <button class="when_btn" value="noplan">아직 정확한 계획은 없어요.</button>
                </div>
                
            </form>
        </div><!-- fin. col-xs-12 -->
    </div> 
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script type="text/javascript">
        $(function () {
            $(".when_btn").on("click", function () {
                //버튼 클릭시에 내용 변경
                var type = $(this).val();
                $(".change_box").empty();
                $.ajax({
                    type: 'GET',                 //get방식으로 통신
                    url: type + ".do",    		 //탭의 data-tab속성의 값으로 된 html파일로 통신
                    dataType: "text",            //html형식으로 값 읽기
                    error: function () {         //통신 실패시 
                    },
                    success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                        $('.change_box').html(data);
                    }
                });
            });

            
			//일정 조정 선택
			$(document).on('click', '.jojung_box', function () {
				$(this).toggleClass("box_check");
				$(this).find(".jojung_check").toggleClass("check_check");

			});
        });
    </script>
</body>
        
</html>