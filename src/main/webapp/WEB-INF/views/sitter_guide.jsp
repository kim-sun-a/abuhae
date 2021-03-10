<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
    <!--slick slider-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick-theme.css" />

    <!-- bootstrap -->
    <!--절대 경로 수정 1220 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--section-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/section.css">

    <style type="text/css">
        .giude_go_text,
        .giude_go_text:hover {
            color: #666;
            position: relative;
            padding: 0 16px;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 700;
            display: block;
            padding: 15px 0;
        }

        .guide_go .btn:hover {
            background-color: rgba(153, 153, 153, 0.2);
        }

        .guide_go {
            background-color: #f1f1f1;
            text-align: center;
            margin-top: 10px;
        }

        .slick-dotted.slick-slider {
            margin-bottom: 60px;
        }
    </style>
</head>

<body>
    <div class="guide_slider">
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/mom-guide-1.png">
                </div>
                <a href="${pageContext.request.contextPath}/join/join.do" class="btn btn-default" role="button">회원가입하기</a>

                <p class="guide_text"><br>빠르고 간편한 회원가입을 진행해 주세요.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/sitter-guide-2.png">
                </div>
                <h4>프로필 작성하기</h4>
                <p class="guide_text"><br>내 활동 지역, 희망시급, 활동 기간 등을 상세하게 작성해 주세요.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/sitter-guide-3.png">
                </div>
                <h4>부모 지원하기</h4>
                <p class="guide_text"><br>지역과 우리동네 등으로 검색해서, 나와 맞는 부모님을 찾아 지원해보세요.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/mom-guide-4.png">
                </div>
                <h4>인터뷰 후 활동하기</h4>
                <p class="guide_text"><br>인터뷰 시, 내가 안전하게 아이를 돌볼 수 있는 환경인지 확인한 뒤 맘시터로 활동합니다.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/sitter-guide-5.png">
                </div>
                <h4>후기 작성</h4>
                <p class="guide_text"><br>맘시터도 부모님에 대한 후기를 작성하세요. 내가 작성한 후기는 부모님의 신청서에 노출됩니다.</p>
            </div>
        </div>
    </div>
    <div class="guide_go">
        <a class="giude_go_text btn" href="${pageContext.request.contextPath}/customer/question_sitter.do" role="button">
            <div>
                <span class="giude_go_text">시터회원 가이드 보기></span>
            </div>
        </a>
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--slick slider-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".guide_slider").slick({
                dots: true,
                arrows: false //옆으로 이동하는 화살표 여부
            });
        })

    </script>
</body>

</html>