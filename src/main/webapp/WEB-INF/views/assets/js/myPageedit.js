function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function () {

    //프로필 업로드 
    function upload_img(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img_html = "<div class=user_img><img src=" + e.target.result + '></div>';
                $(".upload_prof").append(img_html);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#new_profile_img").change(function () {
        upload_img(this);
        $(".upload_prof").css('justify-content', 'flex-start');
    });


    //프로필 제목 업데이트
    /** 직접 입력 클릭 시 텍스트 박스 나타남 */
    $("#mom_appl_title").change(function () {
        var appl_title = $(this).val();
        if (appl_title == 'jikjub') {
            $(".mom_appl_title_text").removeClass("hide");
        } else {
            $(".mom_appl_title_text").addClass("hide");
        }
        //셀렉박스에 있는 값 input에 넣기    -->> DB로 가야할 값 2
        $("#appl_title").val(appl_title);
    });

    $("#updateApplytitle").click(function(e){
        e.preventDefault();
    	//셀렉트 박스 값 가져오기
        var title = $("#mom_appl_title option:selected").val();
        if(title=='jikjub'){
            var jikjub = $("#mom_appl_title option:selected").val();
            $("#appl_title").val(jikjub);
            console.log(jikjub);
        } else {
            $("#appl_title").val(title);
            console.log(title);
        }
        

    });


    //체크박스 값 가져오기
    const wantage = [];
    //원하는 연령대 수정하기 버튼 클릭시
    $("#updateWantAge").click(function(){
        //연령대 체크 여부 검사 - 선아
        var check_list = $(".sitter_age:checked");
        //배열 길이가 0이라면 선택된 항목 없다 - 선아
        if (check_list.length == 0) {
            swal({
                text: '수정할 나이대를 선택해 주세요.',
            });
            return false;
        }
        
        $("input[name=sitter_age]:checked").each(function (i) {
            wantage.push($(this).val());
        });

        $("#want_age").val(wantage);
    });


    var si, gu, dong;
    //시 클릭했을 때
    $(".loc_btn").on("click", function () {
        var select = $(this).hasClass("select_location");
    //선택이 안되어있을때
        if (select == false) {
            //선택이 되어있는 요소 탐색
            var loc = $("#si").find("button").removeClass("select_loaction");
            //console.log(loc);
            $(this).addClass("select_loaction");
            si = $(this).text()
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
            gu = $(this).text();
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
            dong = $(this).text();
        }
    });
    //지역 수정하기 버튼을 눌렀을 경우
    $("#updateLoaction").click(function (e) {
        //시
        $('#si').val(si);
        //구
        $('#gu').val(gu);
        //동
        $('#dong').val(dong);
        });





    var type;
    /** 스케쥴 빈도 버튼 클릭 */
    $(".upd_ct_tab_item_link").on("click", function () {
        //버튼 클릭시에 내용 변경
        type = $(this).val();
        $(this).addClass("select");
        $.ajax({
            type: 'GET',                 //get방식으로 통신
            url: "${pageContext.request.contextPath}/join/parent/"+type + ".do",   
            dataType: "text",            //html형식으로 값 읽기
            error: function () {          //통신 실패시 ㅠㅠ
                alert('통신실패!');
            },
            success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                $('.change_box').html(data);
            }
        });
    });
    //정기적으로의 날짜 선택
    $('#datepicker').flatpickr({
        dateFormat: "Y-m-d",
        minDate: "today",
        maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
        defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
    });
    //특정날의 달력
    $(".calrendar_block").flatpickr({
        inline: true,
        dateFormat: "Y-m-d",
        minDate: "today",
        maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
        mode: "multiple", //여러개 선택 가능
        defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
    });

    const wantday = [];
    //요일 선택시 
    $(document).on('click', '.day_btn', function () {
        $(this).toggleClass("select_btn");


        if($(this).hasClass("select_btn")==true){
            var day = $(this);
            for (var i = 0; i < day.length; i++) {
                wantday.push($(day[i]).val());
            //console.log(result1);
        };
        }
        
    });
    //일정 조정 선택
    $(document).on('click', '.jojung_box', function () {
        $(this).toggleClass("box_check");
        $(this).find(".jojung_check").toggleClass("check_check");

    });
    $(document).on('click', '.updateSchedule', function (e) {
        e.preventDefault();
        //스케쥴 json 조립
        //시작 날짜
        var startdate = $(".date_box").val();
        //요일
        var day = wantday;
        //빈도
        var frequency = type;
        startdate = startdate.replace(/\//gi, '-');


        if ($(".jojung_box").hasClass("box_check") == true) {
            //일정조정 가능 
            $("#schedule_ok").val("Y");
        } else {
            $("#schedule_ok").val("N");
        }
        if(type=='regular'){
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
            $("#schedule").val(schedulerep);
        } else {
            var selectdate = $(".calrendar_block").val();

            //빈도
            var frequency = type;

            if($(".jojung_box").hasClass("box_check")==true) {
                //일정조정 가능 
                $("#schedule_ok").val("Y");
            } else {
                $("#schedule_ok").val("N");
            }

            var schedule = { 
                selectdate : selectdate, 
                frequency : frequency
            };
            
            var scheduleStr = JSON.stringify(schedule);
            //console.log(scheduleStr);
            var schedulerep = scheduleStr.replace(/\"/gi, '\'' );
            //console.log(schedulerep);
            $("#schedule").val(schedulerep);
        }
        
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
        dateFormat: "Y-m-d",
        minDate: "today",
        maxDate: new Date().fp_incr(30), //지금으로부터 30일 이내
        defaultDate: new Date().fp_incr(6) //지금으로부터 6일이 기본
    });


    //일정 조정 선택
    $(".jojung_box").on("click", function () {
        $(this).toggleClass("box_check");
        $(this).find(".jojung_check").toggleClass("check_check");
    });

    $("#updateSchedule").click(function(){

    });


    //시급 입력시 콤마 자동으로 찍히기
    $("#payment_input").on("blur", function () {
        var val = $(this).val();
        if (val.length != 0) {
            $(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
        }

        if (/\D/.test(val)) {
            val = val.replace(/\D/g, '')
            alert('숫자만 입력가능합니다.');
            $("#payment_input").val("0");
        }
        if (val < 8590) {
            val = 8590;
            alert('최저시급 이상 입력해야 합니다.');
            $("#payment_input").val("8590");

        }
    });


    //아이명수 클릭시 버튼 색상 바뀜
    $(".childeren_num1, .childeren_num2").on("click", function () {
        var select = $(this).hasClass("childeren_num1");

        //num1 클릭했을 때
        if (select) {
            //버튼 색상 적용
            $(this).removeClass("btn_children_off");
            $(this).addClass("btn_children_on");
            $(this).next().removeClass("btn_children_on");
            $(this).next().addClass("btn_children_off");
            ;

        } else {
            //num2 클릭했을 때
            $(this).removeClass("btn_children_off");
            $(this).addClass("btn_children_on");
            $(this).prev().removeClass("btn_children_on");
            $(this).prev().addClass("btn_children_off");
        }

        $(".noselect_title").empty();
        //버튼 클릭시에 내용 변경
        /**var test = $(this).attr('data-tab');
        $.ajax({
            type: 'GET',                 //get방식으로 통신
            url: test + ".html",    //탭의 data-tab속성의 값으로 된 html파일로 통신
            dataType: "html",            //html형식으로 값 읽기
            error: function () {          //통신 실패시 ㅠㅠ
                alert('통신실패!');
            },
            success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                $('.select_title').html(data);
            }
        });*/

    });


    //활동 버튼 클릭
    $(".care_age").click(function (e) {
        //버튼 클릭시 이미지 URL 변경
        //url 가져오기
        var img_url = $(this).next().find(".want_img").attr('src');
        var indeximg = img_url.indexOf("_n") //잘라서 _n이 있는지 확인
        if (indeximg > -1) {
            var img_src = img_url.replace(/_n/, "_s");
            $(this).next().find(".want_img").attr('src', img_src);
        } else {
            var img_src = img_url.replace(/_s/, "_n");
            $(this).next().find(".want_img").attr('src', img_src);
        }
    });

    //활동 버튼 클릭
    $(".care_age").click(function (e) {
        //버튼 클릭시 이미지 URL 변경
        //url 가져오기
        var img_url = $(this).next().find(".want_img").attr('src');
        var indeximg = img_url.indexOf("_n") //잘라서 _n이 있는지 확인
        if (indeximg > -1) {
            var img_src = img_url.replace(/_n/, "_s");
            $(this).next().find(".want_img").attr('src', img_src);
        } else {
            var img_src = img_url.replace(/_s/, "_n");
            $(this).next().find(".want_img").attr('src', img_src);
        }
    });



    /** 직접 입력 클릭 시 텍스트 박스 나타남 */
    $(".child_num").click(function (e) {
        e.preventDefault();

        /** $(".upd_ct_tab_item_link").not(this).removeClass("selected");
         $(this).addClass("selected"); */

        var target = $(this).attr("href");
        $(target).removeClass("hide");
        $(".select_title").not($(target)).addClass("hide");
    });

    
});
