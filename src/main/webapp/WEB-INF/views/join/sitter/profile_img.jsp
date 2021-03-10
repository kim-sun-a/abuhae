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
    <!-- 아이콘 사용 -->
    <script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script>

    <style type="text/css">
        .what_want span {
            font-size: 0.8em;
            color: #6a98f7;
        }

        .next_btn_later {
            background-color: #aeaeae;
            width: 100%;
            height: 51px;
            border-radius: 2px;
            color: #fff;
            font-size: 1.2em;
            font-weight: 600;
        }
        .modal-content {
            border-radius: 0;
        }
        .modal {
            top:8%;
            max-height: 700px;
        }
    </style>
</head>

<body>
    <!--modal-->
    <div id="help_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="help_moda_Label"
        aria-hidden="true">
        <!--modal dialog-->
        <div class="modal-dialog">
            <!--modal content-->
            <div class="modal-content">
                <!--제목-->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"> 부모님이 좋아하는 프로필 사진 올리는 방법!</h4>
                </div>
                <!--내용-->
                <div class="modal-body">
                    <div class="prof_desc">
                        <img src="${pageContext.request.contextPath}/assets/img/ex1.jpg"></img>
                        <div class="prof_guide_desc">
                            <i class="far fa-circle"></i><br>
                            <div class="age_desc">본인의 얼굴 정면이<br>나온 모습</div>
                        </div>
                    </div>
                    <div class="prof_desc">
                        <img src="${pageContext.request.contextPath}/assets/img/ex2.jpg">
                        <div class="prof_guide_desc">
                            <i class="fas fa-times"></i><br>
                            <div class="age_desc">이모티콘이<br>포함된 사진</div>
                        </div>
                    </div>
                    <div class="prof_desc">
                        <img src="${pageContext.request.contextPath}/assets/img/ex3.jpg">
                        <div class="prof_guide_desc">
                            <i class="fas fa-times"></i>
                            <div class="age_desc">얼굴이<br>가려진 경우</div>
                        </div>
                    </div>
                    <div class="prof_desc">
                        <img src="${pageContext.request.contextPath}/assets/img/ex4.jpg">
                        <div class="prof_guide_desc">
                            <i class="fas fa-times"></i>
                            <div class="age_desc">여러 명이<br>한께 찍은 경우</div>
                        </div>
                    </div>
                    <div class="prof_desc">
                        <img src="${pageContext.request.contextPath}/assets/img/ex5.jpg">
                        <div class="prof_guide_desc">
                            <i class="fas fa-times"></i>
                            <div class="age_desc">먼 거리에서<br>찍은 경우</div>
                        </div>
                    </div>
                    <div class="prof_desc">
                        <img src="${pageContext.request.contextPath}/assets/img/ex6.jpg">
                        <div class="prof_guide_desc">
                            <i class="fas fa-times"></i>
                            <div class="age_desc">인물 식별이<br>어려울 경우</div>
                        </div>
                    </div>
                    <p class="otehr_desc">이 외에도 본인이 아닌 경우, 썬글라스를 착용한 경우 등 본인 식별이 어려운 사진을 올리면 부모의 선택을 받지 못할 수도 있습니다.</p>
                </div>
            </div>
            <!--end modal content -->
        </div>
        <!--end modal dialog-->
    </div>
    <!--end modal-->
    <!--화면 영역-->
    <div id="prof_img" class="container">
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
                    <span class="dot"></span>
                </div>
                <h3 class="what_want">내 프로필 사진<span>(선택 사항)</span></h3>
                <!--이미지 업로드-->
                <div class="upload_prof">
                    <div class="prof_box">
                        <input type="file" id="file" accept="image/*" class="input_file">
                        <img id="profile_img_upload" src="${pageContext.request.contextPath}/assets/img/user.png">
                    </div>
                </div>
                <p>내 사진을 올리면 부모회원의<br>
                    선택을 <span class="select_text">5배 더 많이</span> 받을 수 있습니다.</p>
                <a data-toggle="modal" href="#help_modal"><button class="guide_prof">좋은 프로필 사진 올리는 방법!</button></a>

                <form id="addform" method="post" action="${pageContext.request.contextPath}/join/sitter/introduce.do">
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
                    <input type="hidden" id="profile_img" name="profile_img" value="N">
                    <button type="button" class="next_btn now_upload">지금 올리기</button>
                    <button type="submit" class="next_btn_later">나중에 하기</button>
                </form>
            </div>

        </div> <!-- fin. col-xs-12 -->
    </div>

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.next_btn').click(function (e) {
                e.preventDefault();
                $('#file').click();

            });

            //파일 업로드시 미리보기 0108 선아
            function upload_img(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        
                        var img_html = '<div class=prof_box><img src='+e.target.result+"></div>";
                        $('.upload_prof').append(img_html);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("#file").change(function () {
                upload_img(this);
                //이미지 업로드시 align 변경
                $(".upload_prof").css('text-align','left');
                //이미지 업로드시 지금 올리기 버튼 삭제, 나중에 올리기를 다음 내용 변경 버튼 클래스 변경 - 선아
                $(".now_upload").css('display', 'none');
                $(".next_btn_later").empty();
                $(".next_btn_later").html("다음");
                $(".next_btn_later").addClass("next_btn");
                $(".next_btn_later").removeClass("next_btn_later");
                
                //다중 업로드


            });

        });
    </script>

</body>

</html>