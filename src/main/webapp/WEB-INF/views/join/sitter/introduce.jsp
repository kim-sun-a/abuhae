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
    <!--fontawwsome-->
    <script src="https://kit.fontawesome.com/ac95729007.js" crossorigin="anonymous"></script>

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--join sitter 참조-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/join_sitter.css" />
    <!-- fontawesome(글리피콘) 적용 -->
    <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>

    <style type="text/css">
        .what_want span {
            font-size: 0.8em;
            color: #6a98f7;
        }

        .what_want {
            margin-bottom: 25px;
        }

        .container {
            margin: auto;
            padding: 0;
        }
    </style>
</head>

<body>
    <!-- activity type modal -->
    <div id="other_introduce_modal" class="modal fade" tabindex="-1" role="dialog"
        aria-labelledby="other_introduce_modal_Label" aria-hidden="true">
        <!--modal header-->
        <div class="modal_header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="fas fa-times"></i>
            </button>
            <h2>다른 맘시터 자기소개</h2>
        </div>
        <!--modal header end-->
        <!--modal content-->
        <div class="modal_content">
            <div class="intro_text">아래 내용을 참고하여 작성해보세요 :)</div>
            <!--돌봄 유형 선택-->
            <div>
                <div class="intro_ex_box">
                    <div class="intro_ex_title">
                        <div class="img_cir">
                        <img src="${pageContext.request.contextPath}/assets/img/ex1.jpg" alt="예제" class="intro_img">
                        </div>
                        <div>
                            <strong>선생님 맘시터</strong><br>
                            <span>김O현<span class="side_bar"></span>32세<span class="side_bar"></span><img src="${pageContext.request.contextPath}/assets/img/star.png" alt="평점"></span>
                        </div>
                    </div>
                    <p class="intro_ex_desc">
                        저는 밝고 활발하며 적극적인 성격을 지니고 있습니다. ○○대학교 <span class="highlight">유아교육학과에서 아동사회학</span>등의 여러 과목들을 배웠습니다. 평소 약속을 중요하게 생각하는 성격이라 <span class="highlight">한번 정한 약속은 꼭 지킬 수 있도록 노력하겠습니다.</span>믿고 맡겨주세요~!
                    </p>
                </div>
                <div class="intro_ex_box">
                    <div class="intro_ex_title">
                        <div class="img_cir">
                        <img src="${pageContext.request.contextPath}/assets/img/ex1.jpg" alt="예제" class="intro_img">
                        </div>
                        <div>
                            <strong>엄마 맘시터</strong><br>
                            <span>김O희<span class="side_bar"></span>52세<span class="side_bar"></span><img src="${pageContext.request.contextPath}/assets/img/star.png" alt="평점"></span>
                        </div>
                    </div>
                    <p class="intro_ex_desc">
                        현재 <span class="highlight">두 아들을 잘 키워내고</span> 대학까지 무사히 보냈습니다. 아이들을 워낙 좋아하고 잘 돌볼 수 있는 자신이 있어 맘시터로 활동하고 있습니다. 내 아들 같이 사랑으로 돌보겠습니다.^^
                    </p>
                </div>
                <div class="intro_ex_box">
                    <div class="intro_ex_title">
                        <div class="img_cir">
                        <img src="${pageContext.request.contextPath}/assets/img/ex1.jpg" alt="예제" class="intro_img">
                        </div>
                        <div>
                            <strong>대학생 맘시터</strong><br>
                            <span>이O영<span class="side_bar"></span>24세<span class="side_bar"></span><img src="${pageContext.request.contextPath}/assets/img/star.png" alt="평점"></span>
                        </div>
                    </div>
                    <p class="intro_ex_desc">
                        저는 ○○대학교에서 ○○공부를 하고 있는 대 학생 맘시터 입니다.<span class="highlight">키즈카페에서 아르바이트</span>를 하며 아이들과 어떻게 대화하고  소통해야하는지 많이 배울 수 있었습니다. 아이들에게 즐거움을 만들어주는 사촌언니같은 맘시터가 되겠습니다.^^
                    </p>
                </div>
                <div class="intro_ex_box">
                    <div class="intro_ex_title">
                        <div class="img_cir">
                        <img src="${pageContext.request.contextPath}/assets/img/ex1.jpg" alt="예제" class="intro_img">
                        </div>
                        <div>
                            <strong>일반 맘시터</strong><br>
                            <span>황O지<span class="side_bar"></span>32세<span class="side_bar"></span><img src="${pageContext.request.contextPath}/assets/img/star.png" alt="평점"></span>
                        </div>
                    </div>
                    <p class="intro_ex_desc">
                        저는 아이들을 너무 좋아해서 맘시터로 활동하게 되었습니다. <span class="highlight">현재 교회 유아부 선생님으로 활동</span>하면서 아이들과 꾸준히 소통하고 있고,  틈틈히 <span class="highlight">고아원에 봉사활동</span>을 다니고 있습니다. ^^  아이를 사랑하는 마음으로 내 동생처럼 안전하게 돌봐드리겠습니다.
                    </p>
                </div>
            </div>
            <!--end modal content -->
        </div>
        <!--end modal dialog-->
    </div>
    <!-- activity type modal end -->
    <!--화면 영역-->
    <div id="introduce" class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <div>
                <div class="page_dots">
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                    <span class="dot now_dots"></span>
                </div>
                <h3 class="what_want">간단 자기소개<span>(선택 사항)</span></h3>
                <textarea id="intotext" placeholder="간단한 자기소개 작성 시 부모님에게 2배 더 많은 신청을 받게 됩니다." class="desc_textarea"
                    maxlength="1000"></textarea>
                <p class="warning">
                    <i class="fas fa-times"></i><span>&nbsp;&nbsp;자기소개 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로
                        잃게됩니다.</span>
                </p>

                <a data-toggle="modal" href="#other_introduce_modal"><p class="other_intro">다른 시터 자기소개 내용 확인하기</p></a>

                <form id="addform" method="post" action="${pageContext.request.contextPath}/join/sitter/agreement.do">
                    <input type="hidden" id="type" name="type" value="${type}">
                    <input type="hidden" id="sitter_type" name="sitter_type" value="${sitter_type}">
                    <input type="hidden" id="want_act1" name="want_act1" value="${want_act1}">
                    <input type="hidden" id="want_act2" name="want_act2" value="${want_act2}">
                    <input type="hidden" id="want_act3" name="want_act3" value="${want_act3}">
                    <input type="hidden" id="want_age" name="want_age" value="${want_age}">
                    <input type="hidden" id="loc_si" name="si" value="${si}">
                    <input type="hidden" id="loc_gu" name="gu" value="${gu}">
                    <input type="hidden" id="loc_dong" name="dong" value="${dong}">
                    <input type="hidden" id="schedule" name="schedule" value="${schedule}">
                    <input type="hidden" id="payment" name="payment" value="${payment}">
                    <input type="hidden" id="cctv" name="cctv" value="${cctv}">
                    <input type="hidden" id="intro" name="introduce">
                    <button type="submit" class="next_btn">나중에 입력할게요.</button>
                </form>
            </div>


        </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var intotext = null;
            $("#intotext").on("keyup", function(){
                $(".next_btn").empty();
                $(".next_btn").html("다음");
                intotext = $(this).val();
            });

            $(".next_btn").click(function (e) {
                //e.preventDefault();
                $("#intro").val(intotext);
                });
        });

    </script>
</body>

</html>