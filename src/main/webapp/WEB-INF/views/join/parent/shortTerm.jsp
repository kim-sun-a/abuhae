<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>

<div id="short" class="container">
    <!-- xs-12로 모바일 맞춤 -->
    <h3 class="what_want">- 특정 날에만 -</h3>
    <!--특정 날 선택 daypicker-->
    <div class="calrendar_block">

    </div>
    <hr>
    

    <!--일정은 시터에게 맞출 수 잇어요-->
    <div class="jojung_box">
        <span class="jojung_check"></span>
        <span class="jojung_text">본 일정은 맘시터에 맞춰서 얼마든지 조정할 수 있어요.</span>
    </div>
    <button type="submit" class="next_btn">다음</button>
</div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--flatpickr-->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script type="text/javascript">
        $(function () {

            $(".calrendar_block").flatpickr({
                inline: true,
                dateFormat: "Y/m/d",
                minDate: "today",
                maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
                mode: "multiple", //여러개 선택 가능
                defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
            });

            
            $(".next_btn").click(function (e) {
                //e.preventDefault();
				//스케쥴 json 조립
				//시작 날짜
				var startdate = $(".calrendar_block").val();

				//빈도
				var frequency = "shortTerm";
				


				if($(".jojung_box").hasClass("box_check")==true) {
					//일정조정 가능 
					$("#schedule_ok").val("Y");
				} else {
					$("#schedule_ok").val("N");
				}

				var schedule = { 
					startdate : startdate, 
					frequency : frequency
				};
				
				var scheduleStr = JSON.stringify(schedule);
				//console.log(scheduleStr);
				var schedulerep = scheduleStr.replace(/\"/gi, '\'' );
				//console.log(schedulerep);
				$("#schedules").val(schedulerep);
               });
        });
    </script>
