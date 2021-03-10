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
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/mom-guide-2.png">
                </div>
                <h4>신청서 작성하기</h4>
                <p class="guide_text"><br>돌봄이 필요한 요일, 장소, 원하는 돌봄 방식 등을 작성하게 됩니다.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/mom-guide-3.png">
                </div>
                <h4>맘시터 신청하기</h4>
                <p class="guide_text"><br>우리 동네로 검색해서, 맘에 드는 맘시터를 찾아 신청 메시지를 보내세요.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/mom-guide-4.png">
                </div>
                <h4>인터뷰 후 채용하기</h4>
                <p class="guide_text"><br>내 신청메시지에 수락한 맘시터들과 인터뷰를 진행한 뒤 맘에 드는 맘시터를 채용합니다.</p>
            </div>
        </div>
        <div>
            <div class="guide_inner">
                <div class="guide_box">
                    <img class="guide_img" src="${pageContext.request.contextPath}/assets/img/mom-guide-5.png">
                </div>
                <h4>후기 작성</h4>
                <p class="guide_text"><br>채용한 맘시터에 대한 후기를 작성하세요. 내가 작성한 후기는 맘시터 프로필에 노출툅니다.</p>
            </div>
        </div>
    </div>
    <div class="guide_go">
        <a class="giude_go_text btn" href="${pageContext.request.contextPath}/customer/question_mom.do" role="button">
            <div>
                <span class="giude_go_text">부모회원 가이드 보기></span>
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