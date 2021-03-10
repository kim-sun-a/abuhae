<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div id="regular" class="container">
	<h3 class="what_want">- 정기적으로 -</h3>

	<div>
		<!--돌봄 시작일-->
		<div class="calc_box">
			<div class="regu_title">돌봄 시작일</div>
			<input id="datepicker" class="date_box">
		</div>
		<hr>
		<div>
			<div class="regu_title">돌봄 요일</div>
			<div class="day_btn_group">
				<button class="day_btn" value="mon" type="button">월</button>
				<button class="day_btn" value="tue" type="button">화</button>
				<button class="day_btn" value="wen" type="button">수</button>
				<button class="day_btn" value="thu" type="button">목</button>
				<button class="day_btn" value="fri" type="button">금</button>
				<button class="day_btn" value="sat" type="button">토</button>
				<button class="day_btn" value="sun" type="button">일</button>
			</div>
		</div>
		<hr>
			<!--일정은 시터에게 맞출 수 잇어요-->
			<div class="jojung_box">
				<span class="jojung_check"></span>
				<span class="jojung_text">본 일정은 맘시터에 맞춰서 얼마든지 조정할 수 있어요.</span>
			</div>
			<button type="submit" class="next_btn">다음</button>
			
		</div>
		<!--end hide content-->
	</div>
</div>
<script>
	$(function () {
			$('#datepicker').flatpickr({
				dateFormat: "Y/m/d",
				minDate: "today",
				maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
				defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
			});
			const result1 = [];
			//요일 선택시 
			$(document).on('click', '.day_btn', function () {
				$(this).toggleClass("select_btn");


			if ($(this).hasClass("select_btn") == true) {
				var day = $(this);
				for (var i = 0; i < day.length; i++) {
					result1.push($(day[i]).val());
					//console.log(result1);
				};
			}

		});
			$(document).on('click', '.next_btn', function (e) {
				//e.preventDefault();
				//스케쥴 json 조립
				//시작 날짜
				var startdate = $(".date_box").val();
				//요일
				var day = result1;
				//빈도
				var frequency = "regular";


				if ($(".jojung_box").hasClass("box_check") == true) {
					//일정조정 가능 
					$("#schedule_ok").val("Y");
				} else {
					$("#schedule_ok").val("N");
				}

				var schedule = {
					startdate: startdate,
					frequency: frequency,
					// 배열은 아래와 같이 구조화 할 수 있습니다.
					day: day
				};

				var scheduleStr = JSON.stringify(schedule);
				//console.log(scheduleStr);
				var schedulerep = scheduleStr.replace(/\"/gi, '\'');
				//console.log(schedulerep);
				$("#schedules").val(schedulerep);
			});
			
		});

</script>