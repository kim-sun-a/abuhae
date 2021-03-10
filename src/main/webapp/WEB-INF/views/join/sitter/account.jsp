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
        .container {
            padding: 0;
        }
        
        .col-xs-12 {
            margin: 48px 0;
        }

        .error {
            color: red !important;
            border-color: red !important;
            font-size: 0.75em !important;
        }
        button:disabled,
        button[disabled] {
            background-color: #cccccc;
            color: #666666;
        }
    </style>
</head>

<body>
    <div id="account" class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <div>
                <header class="account_header">
                    <img src="${pageContext.request.contextPath}/assets/img/parent_join_end.png">
                    <h4 class="account_title">
                        일자리를 찾기 위한 내용 작성이 끝났습니다.<br>
                        이제, 마지막 내용만 작성하시면 가입이 완료됩니다.
                    </h4>
                </header>
                <form id="join_form" action="${pageContext.request.contextPath}/join/sitter/add_ok">
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
                    <input type="hidden" id="intro" name="introduce" value="${introduce}">
                    <div class="input_box">
                        <div class="input_group">
                            <label for="user_id">아이디</label>&nbsp;&nbsp;<label class="error" for="user_id"
                                generated="true" style="display:none;"></label>
                            <div class="input_elem">
                                <input type="text" id="user_id" name="user_id" class="acco_input" maxlength="20"
                                    placeholder="영문 또는 숫자 6~20자리를 입력해주세요.">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="user_pw">비밀번호</label>&nbsp;&nbsp;<label class="error" for="user_pw"
                                generated="true" style="display:none;"></label>
                            <div class="input_elem">
                                <input type="password" id="user_pw" name="user_pw" class="acco_input"
                                    placeholder="6자리 이상 입력해주세요.">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="user_pw_re">비밀번호 재입력</label>&nbsp;&nbsp;<label class="error" for="user_pw_re"
                                generated="true" style="display:none;"></label>
                            <div class="input_elem">
                                <input type="password" id="user_pw_re" name="user_pw_re" class="acco_input"
                                    placeholder="비밀번호를 다시 한 번 입력해주세요.">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="name">이름</label>&nbsp;&nbsp;<label class="error" for="name" generated="true"
                                style="display:none;"></label>
                            <div class="input_elem">
                                <input type="text" id="name" name="name" class="acco_input"
                                    placeholder="이름은 한글로만 입력해 주세요.">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="email">이메일</label>&nbsp;&nbsp;<label class="error" for="email" generated="true"
                                style="display:none;"></label>
                            <div class="input_elem">
                                <input type="email" id="email" name="email" class="acco_input"
                                    placeholder="이메일을 입력해 주세요.">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="tel">휴대폰번호</label>&nbsp;&nbsp;<label class="error" for="tel" generated="true"
                                style="display:none;"></label>
                            <div class="input_elem">
                                <input type="tel" id="tel" name="tel" class="acco_input" placeholder="휴대전화번호를 입력해 주세요.">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="birthdate">생년월일</label>&nbsp;&nbsp;<label class="error" for="birthdate"
                                generated="true" style="display:none;"></label>
                            <div class="input_elem">
                                <input type="date" id="birthdate" name="birthdate" class="acco_input">
                            </div>
                        </div>
                        <div class="input_group">
                            <label for="gender">성별</label>&nbsp;&nbsp;<label class="error" for="gender"
                                generated="true" style="display:none;"></label>
                            <div class="input_elem">
                                <input type="radio" id="gender1" name="gender" value="F" checked><label for="gender1">여자</label>
                                <input type="radio" id="gender2" name="gender" value="M"><label for="gender2">남자</label>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="next_btn" disabled>다음</button>
                </form>
                <!--end inputbox-->
                
            </div>
        </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--validate플러그인 참조-->
    <script src="${pageContext.request.contextPath}/assets/plugin/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugin/validate/additional-methods.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
    <script type="text/javascript">
        $(function () {

            //유효성 검사 추가 함수
            $.validator.addMethod("kor", function (value, element) {
                return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
            });

            $.validator.addMethod("phone", function (value, element) {
                return this.optional(element) ||
                    /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) ||
                    /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
            });
            
            //가입 정보 입력시 유효성 검사 - 선아
            $("#join_form").validate({
                //입력 검사 규칙
                rules: {
                    //아이디 필수 +알파벳,숫자 조합만 허용
                    user_id: { required: true, alphanumeric: true },
                    //비밀번호 필수+글자수 길이제한
                    user_pw: { required: true, minlength: 6, maxlength: 20 },
                    //비밀번호 확인, 필수+특정항목과 일치(id로 연결)
                    user_pw_re: { required: true, equalTo: "#user_pw" },
                    //이름 필수
                    name: { required: true, kor: true },
                    //이메일 필수, 이메일 형식 일치
                    email: { required: true, email: true },
                    //연락처 필수
                    tel: { required: true, phone: true },
                    //생년월일 필수 + 날짜형식 일치
                    birthdate: { required: true, date: true }
                },
                messages: {
                    user_id: {
                        required: "아이디를 입력하세요.",
                        alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다."
                    },
                    user_pw: {
                        required: "비밀번호를 입력하세요.",
                        minlength: "비밀번호는 6글자 이상 입력하셔야 합니다.",
                        maxlength: "비밀번호는 최대 20자까지 가능합니다."
                    },
                    user_pw_re: {
                        required: "비밀번호 확인값을 입력하세요.",
                        equalTo: "비밀번호가 일치하지 않습니다."
                    },
                    name: {
                        required: "이름을 입력하세요.",
                        kor: "이름은 한글만 입력 가능합니다."
                    },
                    email: {
                        required: "이메일을 입력하세요.",
                        email: "이메일 형식이 잘못되었습니다."
                    },
                    tel: {
                        required: "연락처를 입력하세요.",
                        phone: "연락처 형식이 잘못되었습니다."
                    },
                    birthdate: {
                        required: "생년월일을 입력하세요.",
                        date: "생년월일의 형식이 잘못되었습니다."
                    }
                }

            }); //end validate

            //입력요소 전부 입력 완료시 버튼 활성화
            $("input").on("blur", function () {
                var gender = $('input[name="gender"]:checked').val();
                if ($("#user_id").val() != '' && $("#user_pw").val() != '' && $("#user_pw_re").val() != '' && $("#name").val() != '' && $("#email").val() != '' && $("#tel").val() != '' && $("#birthdate").val() != '') {
                    $(".next_btn").prop("disabled", false);
                };
            });

            $(".next_btn").click(function (e) {
                $("#join_form").ajaxForm({
                //전송 메서드 지정
                method: "POST",
                success: function(json) {
                    console.log(json);
                    if(json.rt=="OK") {
                        window.location="${pageContext.request.contextPath}/join/sitter/success.do";
                    }
                    if(json.rt=="id") {
                        alert("이미 등록된 id입니다.");
                    }
                    if(json.rt=="email") {
                        alert("이미 가입된 email입니다.");
                    }
                    if(json.rt=="phone") {
                        alert("이미 가입된 핸드폰 번호입니다.");
                    }
                }
            });
            });
    });

    </script>
</body>

</html>