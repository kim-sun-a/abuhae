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
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!-- icon 참조 -->
    <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>
    <!-- join css -->
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/assets/css/join_parent.css" />

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

        .swal-button {
            padding: 7px 19px;
            border-radius: 2px;
            background-color: #ff7000 !important;
            font-size: 12px;
            border: 1px solid #ff7000 !important;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>

<body>
    <!--modal-->
    <div id="help_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="help_modal_Label"
        aria-hidden="true">
        <!--modal dialog-->
        <div class="modal-dialog">
            <!--modal content-->
            <div class="modal-content">
                <!--제목-->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">시터에게 원하는 활동이란?</h4>
                </div>
                <!--내용-->
                <div class="modal-body">
                    <div class="act_box">
                        <div class="act_name">실내놀이</div>
                        <div class="act_desc">그림 그리기, 보드게임하기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">등하원 돕기</div>
                        <div class="act_desc">유치원 데려다주기, 데리고오기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">영어놀이</div>
                        <div class="act_desc">영어노래 부르기, 영어책 읽어주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">한글놀이</div>
                        <div class="act_desc">한글 카드 놀이, 받아쓰기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">학습지도</div>
                        <div class="act_desc">면학 분위기 조성, 숙제 도와주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">야외활동</div>
                        <div class="act_desc">놀이동산, 키즈카페 가기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">밥 챙겨주기</div>
                        <div class="act_desc">있는 반찬으로 밥 챙겨주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">책 읽기</div>
                        <div class="act_desc">아이가 좋아하는 책 읽기</div>
                    </div>
                </div>
            </div>
            <!--end modal content -->
        </div>
        <!--end modal dialog-->
    </div>
    <!--end modal-->

    <!--화면 영역-->
    <div id="act_age" class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->

            <div>
                <div class="page_dots">
                    <span class="dot now_dots"></span> <span class="dot"></span> <span class="dot"></span> <span
                        class="dot"></span> <span class="dot"></span>
                </div>

                <h3 class="what_want">
                    어떤 돌봄을 원하세요?
                    <div class="help_box">
                        <a data-toggle="modal" href="#help_modal"><button class="help_btn">
                                <span class="sr-only">도움말</span> <img
                                    src="${pageContext.request.contextPath}/assets/img/help.png" alt="도움말">
                            </button></a>
                    </div>
                    <br> <span class="sub_title">최대 3개 선택 가능</span>
                </h3>

                <div class="col-xs-12 upd_care_age_in">
                    <!-- 첫째줄-->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age11" name="want_act_check"
                                value="innerplay">
                            <label for="care_age11"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/innerplayicon_n.png"
                                    alt="실내놀이"></label>
                            <div class="care_age_text">실내놀이</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age32" name="want_act_check"
                                value="study">
                            <label for="care_age32"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/studyicon_n.png" alt="학습지도"></label>
                            <div class="care_age_text">학습지도</div>
                        </div>
                    </div>
                    <!-- 둘째줄 -->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age21" name="want_act_check"
                                value="guide">
                            <label for="care_age21"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/guideicon_n.png" alt="등하원돕기"></label>
                            <div class="care_age_text">등하원돕기</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age41" name="want_act_check"
                                value="outside">
                            <label for="care_age41"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/ousideicon_n.png" alt="야외활동"></label>
                            <div class="care_age_text">야외활동</div>
                        </div>

                    </div>
                    <!-- 셋째줄 -->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age22" name="want_act_check"
                                value="english">
                            <label for="care_age22"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/englishicon_n.png"
                                    alt="영어놀이"></label>
                            <div class="care_age_text">영어놀이</div>
                        </div>
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age23" name="want_act_check"
                                value="eat">
                            <label for="care_age23"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/eaticon_n.png" alt="밥챙겨주기"></label>
                            <div class="care_age_text">밥 챙겨주기</div>
                        </div>
                        

                        
                    </div>
                    <!-- 넷째줄 -->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age12" name="want_act_check"
                                value="korean">
                            <label for="care_age12"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/koreanicon_n.png" alt=""></label>
                            <div class="care_age_text">한글놀이</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age31" name="want_act_check"
                                value="read">
                            <label for="care_age31"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/readicon_n.png" alt=""></label>
                            <div class="care_age_text">책읽기</div>
                        </div>
                    </div>
                </div>

                <!--시터 나이대-->
                <!--돌봄 1개라도 선택하면 나타나게 하기 -> jquery로 -->
                <div id="shide" class="hide_content">
                    <hr>
                    <h3 class="what_want">어느 나이대의 시터를 찾으시나요?</h3>
                    <!--쓰고싶은 rc-slider react 기능 같다 ㅠㅠ-->
                    <!--https://slider.react-component.now.sh/-->
                    <!--check 박스로 대체-->
                    <div class="want_age_box">
                        <input type="checkbox" value="20" name="want_age" class="want_age" id="20age" >
                        <label for="20age">20대</label>
                        <input type="checkbox" value="30" name="want_age" class="want_age" id="30age"> 
                        <label for="30age">30대</label> 
                        <input type="checkbox" value="40" name="want_age" class="want_age" id="40age">
                        <label for="40age">40대</label> 
                        <input type="checkbox" value="50" name="want_age" class="want_age" id="50age"> 
                        <label for="50age">50대</label> 
                        <input type="checkbox"value="60" name="want_age" class="want_age" id="60age"> 
                        <label for="60age">60대</label>
                    </div>

                    <form id="addform" method="post" action="${pageContext.request.contextPath}/join/parent/children.do">
                        <input type="hidden" id="type" name="type" value="M">
                        <input type="hidden" id="want_act1" name="want_act1">
                        <input type="hidden" id="want_act2" name="want_act2">
                        <input type="hidden" id="want_act3" name="want_act3">
                        <input type="hidden" id="want_age" name="want_age">
                        <button class="next_btn" type="submit">다음</button>
                    </form>
                    
                </div>
            </div>
        </div>
        <!-- fin. col-xs-12 -->

    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--sweetalert plugin-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".care_age").click(function (e) {
                //e.preventDefault();
                let count = $("input:checked[name='want_act_check']").length;
                console.log(count);
                //버튼 클릭시 이미지 URL 변경
                //url 가져오기
                if (count <= 3) {
                    var img_url = $(this).next().find(".want_img").attr('src');
                    var indeximg = img_url.indexOf("_n") //잘라서 _n이 있는지 확인
                    if (indeximg > -1) {
                        var img_src = img_url.replace(/_n/, "_s");
                        $(this).next().find(".want_img").attr('src', img_src);
                    } else {
                        var img_src = img_url.replace(/_s/, "_n");
                        $(this).next().find(".want_img").attr('src', img_src);
                    }
                }


                if (count > 3) {
                    $(this).prop("checked", false);
                    //또는 this.checked=false;
                    swal({
                        text: '최대 3개의 활동을 선택해 주세요.',
                    });
                }

                //활동 1개라도 클릭시 밑에 숨겨진 항목 보여주기
                if (count > 0) {
                    //console.log(count);
                    //var hide = $(this).parent().parent().next().hasClass("siter_age_hide");
                    //console.log(hide);
                    $(this).parent().parent().parent().next().removeClass("hide_content");
                    $(this).parent().parent().parent().next().addClass("show_content");
                }


            });
            

            //활동, 나이대를 ajax post로 넘기기
            $(".next_btn").click(function (e) {
                //e.preventDefault();
                //연령대 체크 여부 검사 - 선아
                var check_list = $(".want_age:checked");
                //배열 길이가 0이라면 선택된 항목 없다 - 선아
                if (check_list.length == 0) {
                    swal({
                        text: '원하는 나이대는 필수적으로 선택해야 합니다.',
                    });
                    return false;
                }
                //원하는 나이대 값 넣기
                var chk_age = [];
                $("input[name=want_age]:checked").each(function () {
                    var chk = $(this).val();
                    chk_age.push(chk);
                });
                //원하는 활동 넣기
                var chk_arr = [];
                $("input[name=want_act_check]:checked").each(function () {
                    var chk = $(this).val();
                    chk_arr.push(chk);
                });
                var want1 = chk_arr[0];
                var want2 = chk_arr[1];
                var want3 = chk_arr[2];
                $('#want_act1').val(want1);
                $('#want_act2').val(want2);
                $('#want_act3').val(want3);
                $('#want_age').val(chk_age);
                //console.log($("#want_act").val());
                //console.log($("#want_age").val());

            });
            /*
            $("#addform").ajaxForm({
                method: "POST",
                success: function (json) {
                    //alert("success");
                    console.log(json);

                    //json에 포함된 데이터를 활용, 페이지 이동
                    if(json.rt == "OK") {
                        //var re1 = json.item.want_act;
                        //var re2 = json.item.want_age;
                        location.href = "${pageContext.request.contextPath}/join/parent/children.do";
                    }

                },
                error: function () {
                    alert("error")
                }
            });*/
        });
    </script>
</body>

</html>