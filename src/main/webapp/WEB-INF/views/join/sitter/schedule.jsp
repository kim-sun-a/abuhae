<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>
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
    <!--절대 경로 수정 1220 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--join sitter 참조-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/join_sitter.css" />

    <style type="text/css">
        .what_want {
            margin-bottom: 35px;
        }
    </style>
</head>

<body>
    <div id="schedule" class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <div>
                <div class="page_dots">
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
                <h3 class="what_want">언제 활동할 수 있나요?</h3>
                    <input type="hidden" id="type" name="type" value="${type}">
                    <input type="hidden" id="want_act1" name="want_act1" value="${want_act1}">
                    <input type="hidden" id="want_act2" name="want_act2" value="${want_act2}">
                    <input type="hidden" id="want_act3" name="want_act3" value="${want_act3}">
                    <input type="hidden" id="want_age" name="want_age" value="${want_age}">
                    <input type="hidden" id="loc_si" name="si" value="${si}">
                    <input type="hidden" id="loc_gu" name="gu" value="${gu}">
                    <input type="hidden" id="loc_dong" name="dong" value="${dong}">
                    <input type="hidden" id="schedules" name="schedule">
                    <input type="hidden" id="schedule_set" name="schedule_set">
                <div id="select_group change_box">
                    <div class="schedule_box">
                        <input type="radio" name="schedule" id="schedule_set_1" class="type_select" value="1" checked>
                        <label for="schedule_set_1" class="radio_text">
                            <div>
                                <h3>월~금 종일<span>&nbsp;&nbsp;오전 8시 - 저녁 8시</span></h3>
                            </div>
                        </label>
                    </div>
                    <div class="schedule_box">
                        <input type="radio" name="schedule" id="schedule_set_2" class="type_select" value="2">
                        <label for="schedule_set_2" class="radio_text">
                            <div>
                                <h3>월~금 오전<span>&nbsp;&nbsp;오전 7시 - 오후 2시</span></h3>
                            </div>
                        </label>
                    </div>
                    <div class="schedule_box">
                        <input type="radio" name="schedule" id="schedule_set_3" class="type_select" value="3">
                        <label for="schedule_set_3" class="radio_text">
                            <div>
                                <h3>월~금 오후<span>&nbsp;&nbsp;오후 2시 - 저녁 10시</span></h3>
                            </div>
                        </label>
                    </div>
                    <div class="schedule_box">
                        <input type="radio" name="schedule" id="schedule_set_4" class="type_select" value="4">
                        <label for="schedule_set_4" class="radio_text">
                            <div>
                                <h3>주말 종일<span>&nbsp;&nbsp;오전 8시 - 저녁 8시</span></h3>
                            </div>
                        </label>
                    </div>
                    <div class="schedule_box">
                        <input type="radio" name="schedule" id="schedule_set_5" class="type_select" value="5">
                        <label for="schedule_set_5" class="radio_text">
                            <div>
                                <h3>내가 원하는 시간 직접 입력하기</h3>
                            </div>
                        </label>
                    </div>
                </div>
                <button class="next_btn">다음</button> 
            </div>

        </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //라디오 버튼에 따라 페이지 이동 위치 변경 - 선아
            $(".next_btn").on("click", function () {
                var select = $("input[name='schedule']:checked").val();
                //console.log(select);
                //선택이 안되어있을때
                if (select == '5') {
                    //ajax로 화면 전환
                    //버튼 클릭시에 내용 변경
                    //var type = $(this).val();
                    $(".change_box").empty();
                    $.ajax({
                        type: 'GET',                 //get방식으로 통신
                        url: "detail.do",    //탭의 data-tab속성의 값으로 된 html파일로 통신
                        dataType: "text",            //html형식으로 값 읽기
                        error: function () {          //통신 실패시 ㅠㅠ
                            alert('통신실패!');
                        },
                        success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                            $('.change_box').html(data);
                        }
                    });
                    
                } else {
                    location.href='payment_cctv.jsp';
                }

            });
        });
    </script>
</body>

</html>