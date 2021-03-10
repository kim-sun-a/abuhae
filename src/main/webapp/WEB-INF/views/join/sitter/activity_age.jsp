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
    <link rel="apple-touch-icon-precomposed" href=${pageContext.request.contextPath}/assets/ico/favicon.ico" />

    <!-- bootstrap -->
    <!--절대 경로 수정 1220 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--join sitter 참조-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/join_sitter.css" />
    <!-- 아이콘 사용 -->
    <script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script>

    <style type="text/css">
        .fa-3x {
            font-size: 2.0em;
        }

        .fa-3x {
            display: block;
            width: 100%;
        }

        #help_modal1 .modal {
            top:20%;
        }
        button:disabled,
        button[disabled] {
            background-color: #cccccc;
            color: #666666;
        }
    </style>
</head>

<body>
    <!--modal-->
    <div id="help_modal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="help_modal_Label"
        aria-hidden="true">
        <!--modal dialog-->
        <div class="modal-dialog">
            <!--modal content-->
            <div class="modal-content">
                <!--제목-->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"> 돌봄 가능 연령이란?</h4>
                </div>
                <!--내용-->
                <div class="modal-body">
                    <div class="act_box">
                        <div class="age_type">신생아&nbsp;<span>0~6개월</span></div>
                        <div class="age_desc">제 몸을 못 가누는 아주 작은 아이로 수유하기, 재우기, 목욕시키기가 주 활동입니다.</div>
                    </div>
                    <div class="act_box">
                        <div class="age_type">영아&nbsp;<span>7~36개월</span></div>
                        <div class="age_desc">기어가거나 걸을 수 있는 아이로 이유식/밥 먹이기, 기저귀 갈아주기, 감각 활동하기가 주 활동입니다.</div>
                    </div>
                    <div class="act_box">
                        <div class="age_type">유아&nbsp;<span>4-7세</span></div>
                        <div class="age_desc">활동성이 매우 높은 시기의 아이들로 보통 어린이집/유치원에 다닙니다. 등하원 돕기, 책 읽어주기, 놀아주기등이 주 활동입니다.</div>
                    </div>
                    <div class="act_box">
                        <div class="age_type">초등학생</div>
                        <div class="age_desc">초등학교 1~6학년 아이들로 등하교 돕기, 숙제 도와주기, 전문 학습하기 등이 주 활동입니다.</div>
                    </div>
                </div>
            </div>
            <!--end modal content -->
        </div>
        <!--end modal dialog-->
    </div>
    <!--end modal-->
    <!--modal-->
    <div id="help_modal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="help_modal_Label"
        aria-hidden="true">
        <!--modal dialog-->
        <div class="modal-dialog">
            <!--modal content-->
            <div class="modal-content">
                <!--제목-->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">어떤 활동이 있나요?</h4>
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
                        <div class="act_name">책 읽기</div>
                        <div class="act_desc">아이가 좋아하는 책 읽기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">야외활동</div>
                        <div class="act_desc">놀이동산, 키즈카페 가기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">한글놀이</div>
                        <div class="act_desc">한글 카드 놀이, 받아쓰기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">영어놀이</div>
                        <div class="act_desc">영어노래 부르기, 영어책 읽어주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">학습지도</div>
                        <div class="act_desc">면학 분위기 조성, 숙제 도와주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">체육놀이</div>
                        <div class="act_desc">공놀이, 놀이터 나가기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">간단 청소</div>
                        <div class="act_desc">아이 장난감 치우기, 청소기 돌리기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">밥 챙겨주기</div>
                        <div class="act_desc">있는 반찬으로 밥 챙겨주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">간단 설거지</div>
                        <div class="act_desc">젖병 세척, 아이먹은 그릇 씻기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">장기입주</div>
                        <div class="act_desc">함께 살면서 종일 돌봐주기</div>
                    </div>
                    <div class="act_box">
                        <div class="act_name">단기입주</div>
                        <div class="act_desc">2-3일 종일 돌봐주기</div>
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
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
                <h3 class="what_want">어떤 아이를 돌볼 수 있나요?
                    <div class="help_box">
                        <a data-toggle="modal" href="#help_modal1"><button class="help_btn">
                                <span class="sr-only">도움말</span>
                                <img src="${pageContext.request.contextPath}/assets/img/help.png" alt="도움말">
                            </button></a>
                    </div>
                </h3>

                <!--아이 연령 선택-->
                <div class="col-xs-12 upd_care_age_in">
                    <div class="care_age_btn">
                        <input type="checkbox" id="care_age1" name="want_age" value="got_baby">
                        <label for="care_age1"><i class="fas fa-baby fa-3x act_btn"></i></label>
                        <div class="care_age_text">신생아</div>
                    </div>

                    <div class="care_age_btn">
                        <input type="checkbox" id="care_age2" name="want_age" value="baby">
                        <label for="care_age2"><i class="fas fa-baby-carriage fa-3x"></i></label>
                        <div class="care_age_text">영아</div>
                    </div>

                    <div class="care_age_btn">
                        <input type="checkbox" id="care_age3" name="want_age" value="children">
                        <label for="care_age3"><i class="fas fa-child fa-3x"></i></label>
                        <div class="care_age_text">유아</div>
                    </div>

                    <div class="care_age_btn">
                        <input type="checkbox" id="care_age4" name="want_age" value="element">
                        <label for="care_age4"><i class="fas fa-school fa-3x"></i></label>
                        <div class="care_age_text">초등학생</div>
                    </div>
                </div>

                <h3 class="what_want">어떤 활동을 할 수 있나요?
                    <div class="help_box">
                        <a data-toggle="modal" href="#help_modal2"><button class="help_btn">
                                <span class="sr-only">도움말</span>
                                <img src="${pageContext.request.contextPath}/assets/img/help.png" alt="도움말">
                            </button></a>
                    </div>
                    <br> <span class="sub_title">최대 3개 선택 가능</span>
                </h3>

                <!--돌봄 유형 선택-->
                <div class="col-xs-12 upd_care_age_in">
                    <!-- 첫째줄-->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age11" name="want_act_check"
                                value="innerplay">
                            <label for="care_age11"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/innerplayicon_n.png"
                                    alt=""></label>
                            <div class="care_age_text">실내놀이</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age12" name="want_act_check"
                                value="korean">
                            <label for="care_age12"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/koreanicon_n.png" alt=""></label>
                            <div class="care_age_text">한글놀이</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age13" name="want_act_check"
                                value="simple_cleaning">
                            <label for="care_age13"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/cleanicon_n.png" alt=""></label>
                            <div class="care_age_text">간단청소</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age14" name="want_act_check"
                                value="long_move_in">
                            <label for="care_age14"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/longhouseicon_n.png"
                                    alt=""></i></label>
                            <div class="care_age_text">장기입주</div>
                        </div>
                    </div>
                    <!-- 둘째줄 -->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age21" name="want_act_check"
                                value="guide">
                            <label for="care_age21"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/guideicon_n.png" alt=""></label>
                            <div class="care_age_text">등하원돕기</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age22" name="want_act_check"
                                value="english">
                            <label for="care_age22"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/englishicon_n.png"
                                    alt=""></label>
                            <div class="care_age_text">영어놀이</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age23" name="want_act_check"
                                value="eat">
                            <label for="care_age23"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/eaticon_n.png" alt=""></label>
                            <div class="care_age_text">밥 챙겨주기</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age24" name="want_act_check"
                                value="short_move_in">
                            <label for="care_age24"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/houseicon_n.png"
                                    alt=""></i></label>
                            <div class="care_age_text">단기입주</div>
                        </div>
                    </div>
                    <!-- 셋째줄 -->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age31" name="want_act_check"
                                value="read">
                            <label for="care_age31"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/readicon_n.png" alt=""></label>
                            <div class="care_age_text">책읽기</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age32" name="want_act_check"
                                value="study">
                            <label for="care_age32"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/studyicon_n.png" alt=""></label>
                            <div class="care_age_text">학습지도</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age33" name="want_act_check"
                                value="do_dish">
                            <label for="care_age33"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/dishicon_n.png" alt=""></label>
                            <div class="care_age_text">간단설거지</div>
                        </div>
                    </div>
                    <!-- 넷째줄 -->
                    <div class="age_line">
                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age41" name="want_act_check"
                                value="outside">
                            <label for="care_age41"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/ousideicon_n.png" alt=""></label>
                            <div class="care_age_text">야외활동</div>
                        </div>

                        <div class="care_age_btn">
                            <input type="checkbox" class="care_age" id="care_age42" name="want_act_check"
                                value="sport">
                            <label for="care_age42"><img class="want_img"
                                    src="${pageContext.request.contextPath}/assets/img/ballicon_n.png" alt=""></label>
                            <div class="care_age_text">체육놀이</div>
                        </div>
                    </div>
                </div>
                <form id="addform" method="post" action="${pageContext.request.contextPath}/join/sitter/location.do">
                    <input type="hidden" id="type" name="type" value="S">
                    <input type="hidden" id="sitter_type" name="sitter_type" value="${sitter_type}">
                    <input type="hidden" id="want_act1" name="want_act1">
                    <input type="hidden" id="want_act2" name="want_act2">
                    <input type="hidden" id="want_act3" name="want_act3">
                    <input type="hidden" id="want_age" name="want_age">
                    <button class="next_btn" type="submit" disabled>다음</button>
                </form>

            </div>
        </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--sweetalert plugin-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function () {

            let count1 =0;
            let count2 =0;

            //활동 버튼 클릭
            $(".care_age").click(function (e) {
                //e.preventDefault();
                count1 = $("input:checked[name='want_act_check']").length;
                count2 = $("input:checked[name='want_age']").length;
                console.log(count1);
                //버튼 클릭시 이미지 URL 변경
                //url 가져오기
                if (count1 <= 3) {
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


                if (count1 > 3) {
                    $(this).prop("checked", false);
                    //또는 this.checked=false;
                    swal({
                        text: '최대 3개의 활동을 선택해 주세요.',
                    });
                };

                 //disable 풀어주기
                if (count1 != 0 && count2 != 0) {
                    $(".next_btn").prop('disabled', false);
                };
            });

            

                $(".next_btn").click(function (e) {
                    //e.preventDefault();
                    //원하는 연령대 넣기
                    var chk_age = [];
                    $("input[name=want_age]:checked").each(function () {
                        var chk = $(this).val();
                        chk_age.push(chk);
                    });

                    //원하는 활동값 넣기
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



            });

            });
    </script>
</body>

</html>