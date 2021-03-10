<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
<div class="container">
    <!-- xs-12로 모바일 맞춤 -->
    <div>
        <p class="noplan_text">
            <span class="noplan_grey">아직 정확환 시간 계획이 없더라도,</span>
            <br>
            만나보고 싶은 시간을 선택하면
            <br>
            시터에게 <span class="noplan_orange">무료</span>로 지원을 받을 수 있습니다.
        </p>
    </div>
    <div class="noplan_wrap">
        <!--원하는 시간 선택-->
        <div class="noplan_schedule">
            <img src="${pageContext.request.contextPath}/assets/img/time_img.png" class="time_bar" alt="시간">
            <div class="noplan_check_box">
                <div class="title">평일</div>
                <div class="time_box"><button class="time_btn" type="button" value="wek_morning">아침</button></div>
                <div class="time_box"><button class="time_btn" type="button" value="wek_launch">점심</button></div>
                <div class="time_box"><button class="time_btn" type="button" value="wek_evning">저녁</button></div>
            </div>
            <div class="noplan_check_box">
                <div class="title">주말</div>
                <div class="time_box"><button class="time_btn" type="button" value="end_morning">아침</button></div>
                <div class="time_box"><button class="time_btn" type="button" value="end_launch">점심</button></div>
                <div class="time_box"><button class="time_btn" type="button" value="end_evning">저녁</button></div>
            </div>
        </div>

        <button type="submit" class="next_btn">다음</button>
    </div>
</div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            const result1 = [];
            $(".time_btn").on("click", function(){
                $(this).toggleClass("select_btn");
                //선택이 됐으면
                if($(this).hasClass("select_btn")==true){
                    var time = $(this);
                    for (var i = 0; i < time.length; i++) {
					result1.push($(time[i]).val());
					//console.log(result1);
				};
                }
                
            });

            
            $(".next_btn").click(function (e) {
                //e.preventDefault();
				//스케쥴 json 조립
				//원하는 시간
				var wanttime = result1;

				//빈도
				var frequency = "noplan";



				if($(".jojung_box").hasClass("box_check")==true) {
					//일정조정 가능 
					$("#schedule_ok").val("Y");
				} else {
					$("#schedule_ok").val("N");
				}

				var schedule = { 
					wanttime : wanttime, 
					frequency : frequency, 
				};
				
				var scheduleStr = JSON.stringify(schedule);
				//console.log(scheduleStr);
				var schedulerep = scheduleStr.replace(/\"/gi, '\'' );
				//console.log(schedulerep);
				$("#schedules").val(schedulerep);



                });
        });
    </script>

