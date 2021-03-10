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
        .modal {
            top:10%;
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
                    <h4 class="modal-title" id="myModalLabel">시터 유형 선택 도움말</h4>
                </div>
                <!--내용-->
                <div class="modal-body">
                    <div class="help_box">
                        <span>Q.</span> 선생님이면서 엄마이기도 한데... 어떡하죠?
                    </div>
                    <p class="desc">'선생님' 시터는 부모님들에게 가장 인기가 많은 유형이예요. 소중한 아이들을 좀 더 전문적으로 돌봐줄 수 있기 때문에
                        비교적 높은 시급을 받을 수 있습니다.
                    </p>
                    <hr>
                    <div class="help_box">
                        <span>Q.</span> 대학생이면서 선생님이기도 한데... 어떡하죠?

                    </div>
                    <p class="desc">'선생님' 시터는 부모님들에게 가장 인기가 많은 유형이예요. 소중한 아이들을 좀 더 전문적으로 돌봐줄 수 있기 때문에
                        비교적 높은 시급을 받을 수 있습니다.
                    </p>
                    <hr>
                    <div class="help_box">
                        <span>Q.</span> 엄마이면서 대학생이기도 한데... 어떡하죠?
                    </div>
                    <p class="desc">안정적으로 긴 돌봄시간을 원하시는 부모님들은 ‘엄마’맘시터를 선호하고, 2-3시간 놀이를 원하시는
                        부모님은 ‘대학생’ 맘시터를 선호하십니다. 젊은 ‘엄마’ 맘시터라면 두가지 장점을 모두 가질 수 있으니 인기 만점이겠죠?
                    </p>
                </div>
            </div>
            <!--end modal content -->
        </div>
        <!--end modal dialog-->
    </div>
    <!--end modal-->
    <!--화면영역-->
    <div id="type" class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <div>
                <div class="page_dots">
                    <span class="dot now_dots"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
                <h3 class="what_want">당신은 어떤분 인가요?</h3>
                <div>
                    <div class="radio_box">
                        <input type="radio" name="type" id="teacher" class="type_select" value="teacher">
                        <label for="teacher" class="radio_text">
                            <div>
                                <h3>선생님</h3>
                                <p>보육교사, 유치원정교사, 특수학교(유치원/학교) 정교사, 초등학교정교사 자격증을 보유하고 있는 경우</p>
                            </div>
                        </label>
                    </div>
                    <div class="radio_box">
                        <input type="radio" name="type" id="mom" class="type_select" value="mom">
                        <label for="mom" class="radio_text">
                            <div>
                                <h3>엄마</h3>
                                <p>본인의 아이를 키우며 육아 경험이 있는 경우</p>
                            </div>
                        </label>
                    </div>
                    <div class="radio_box">
                        <input type="radio" name="type" id="student" class="type_select" value="student">
                        <label for="student" class="radio_text">
                            <div>
                                <h3>대학생</h3>
                                <p>현재 대학교에서 재학 및 휴학 중인 경우</p>
                            </div>
                        </label>
                    </div>
                    <div class="radio_box">
                        <input type="radio" name="type" id="nomal" class="type_select" value="normal" checked>
                        <label for="nomal" class="radio_text">
                            <div>
                                <h3>일반</h3>
                                <p>위 3가지 경우에 속하지 않지만 맘시털 활동하고 싶은 경우(취업준비생, 회사원, 프리랜서 등)</p>
                            </div>
                        </label>
                    </div>
                    <!--end raido-->
                </div>
                <!--설명 모달창-->
                <a data-toggle="modal" href="#help_modal">
                    <button class="type_desc">어떤 유형을 선택해야할지 고민이신가요?</button></a>
                <!--end 설명 모달창-->
                <form id="addform" method="post" action="${pageContext.request.contextPath}/join/sitter/activity_age.do">
                    <input type="hidden" id="type" name="type" value="S">
                    <input type="hidden" id="sitter_type" name="sitter_type">
                    <button class="next_btn" type="submit">다음</button>
                </form>
            </div>
        </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script>
        $(".next_btn").click(function (e) {

            var sittertype = $('input[name="type"]:checked').val();

            $('#sitter_type').val(sittertype);
        });

    </script>
</body>

</html>