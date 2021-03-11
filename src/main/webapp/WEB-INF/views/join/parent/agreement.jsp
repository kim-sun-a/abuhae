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
        html,
        body {
            color: #222;
            font-weight: 100;
            font-size: 1em;
            line-height: 1.375;
            padding: 0;
            margin: 0;
        }
        .container, .col-xs-12 {
            padding: 0;
            margin: 0;
        }

        .what_want {
            margin: 18px 0;
        }
        button:disabled,
        button[disabled] {
            background-color: #cccccc;
            color: #666666;
        }
    </style>
</head>

<body>
    <div id="agree" class="container">
            <div class="col-xs-12">
                <!-- xs-12로 모바일 맞춤 -->
                <h4 class="what_want">
                    맘시터 서비스 이용 동의
                </h4>
                <div class="agree_group">
                    <div class="agree_box">
                        <h4>맘시터 서비스 운영정책</h4>
                        <p>맘시터는 회원분들이 다양한 정보와 기술로 더 좋은 아이돌보미 또는 일자리(부모)를 찾고 연락하실 수 있도록 정보를 제공하는 
                            구인구직 플랫폼입니다. 본 서비스에 가입된 회원분들은 (주)아이를부탁해에 채용되거나 교육된 인력들이 아니고, 
                            시터회원과 부모회원 간의 계약을 소개/알선하지 않으므로, <span>(주)아이를부탁해는 시터회원과 부모회원 간에 발생하는 모든 문제에 
                            대한 책임이 없음을 알려드립니다.</span></p>
                    </div>
                    <br>
                    <div class="agree_box">
                        <h4>맘시터 회원의 의무</h4>
                        <p>모든 회원은 자신에게 적합한 아이돌보미 또는 일자리(부모)를 선택하여, 서로 합의한 계약조건 또는 관련 법에 의거하여 
                            성실하게 활동해야 합니다. <span>상호간 합의한 내용을 사전 조율없이 일방적으로 해지 통보할 경우, 서비스 이용약관에 따라 
                            강제 탈퇴조치 될 수 있음을 알려드립니다.</span></p>
                    </div>
                </div>
                <!--전체 동의-->
                <div class="agree_box all_check">
                    <div class="agree_check">
                        <input type="checkbox" id="all_check"><label for="all_check">전체동의</label>
                    </div>
                </div>
                <!--서비스 운영정책 의무 동의-->
                <div class="agree_box">
                    <div class="agree_check">
                        <input name="check" type="checkbox" id="agree1" class="agree" value="agree1"><label for="agree1">서비스 운영정책 및 회원의 의무 동의<span>&nbsp;(필수)</span></label>
                    </div>
                </div>
                <!--서비스 이용약관, 개인정보 수집 이용 동의-->
                <div class="agree_box">
                    <div class="agree_check">
                        <input name="check" type="checkbox" id="agree2" class="agree" value="agree2"><label for="agree2">서비스 이용약관 동의<span>&nbsp;(필수)</span></label>
                    </div>
                    <div class="agree_check">
                        <input name="check" type="checkbox" id="agree3" class="agree" value="agree3"><label for="agree3">개인정보 수집 및 이용에 관한 동의<span>&nbsp;(필수)</span></label>
                    </div>
                    <div class="agree_check">
                        <input name="check" type="checkbox" id="agree4" class="agree" value="agree4"><label for="agree4">개인정보 제3자 제공에 관한 동의<span>&nbsp;(필수)</span></label>
                    </div>
                </div>
                <br>
                <form id="addform" method="post" action="${pageContext.request.contextPath}/join/parent/account.do">
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
                    <input type="hidden" id="schedule" name="schedule" value="${schedule}">
                    <input type="hidden" id="schedule_ok" name="schedule_ok" value="${schedule_ok}">
                    <input type="hidden" id="descrip" name="description" value="${description}">
                    <button type="submit" class="next_btn" disabled>다음</button>
                </form>
            </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        $(function(){
            //올체크 상태 변경되었을 떄 이벤트 - 선아
            $("#all_check").change(function(){
                //모든 hobby의 상태를 올체크와 동일하게
                $(".agree").prop('checked', $(this).prop('checked'));
                var now = $(".next_btn").prop('disabled');
                $(".next_btn").prop('disabled', !now);
            });

            $("input[name=check]").change(function(){
                if($("input:checkbox[name=check]:checked").length == 4){
                    var now = $(".next_btn").prop('disabled');
                    $(".next_btn").prop('disabled', !now);
                }
            });
        });
    </script>
</body>

</html>