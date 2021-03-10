<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>아이를부탁해</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        
        <!-- icon 참조 -->
        <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_sitter_profile.css">

    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_img">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">내 사진 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content -->
                        <section class="introduce_text">
                            <div class="row">
                                <div class="col-xs-12 update_img_cont">
                                	<h5 class="upd_img_tl">1. 내 사진</h5>
                                    <div class="upload_prof">
                                        <div class="user_img">
                                            <input type="file" id="new_profile_img" name="new_profile_img" accept="image/*" >
                                            <label for="new_profile_img"><img src="${pageContext.request.contextPath}/assets/img/mypage_img/user.png" alt=""></label>
                                        </div>
                                    </div>
                                    <div class="guide_user_img">
                                        <p>
                                            "내 사진을 올리면 부모회원의 선택을 <br/>
                                            <span style="color: #ff7000; text-decoration: underline;">5배 더 많이</span> 받을 수 있습니다."
                                        </p>
                                    </div>
                                    <div class="example_img">
                                        <a data-toggle="modal" href="#way_upd_img">
                                            <button type="button">
                                                <i class="fas fa-lightbulb" style="color: #ffd446; font-size: 1.2em;"></i> 부모님이 좋아하는 사진 올리는 방법!
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- modal (사진 올리는 방법 )-->
                            <div id="way_upd_img" class="modal fade" tabindex="-1" role="dialog"
                            aria-labelledby="modal_label" aria-hidden="true">
                            <!-- modal dialog -->
                            <div class="modal-dialog">
                                <!-- modal content -->
                                <div class="modal-content">
                                    <!-- 제목 -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
                                            <i class="fas fa-times"></i>
                                        </button>
                                        <h4 class="modal-title" id="modalLabel" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                            부모님이 좋아하는 사진 올리는 방법!
                                        </h4>
                                    </div>
                                    <div class="modal-body" style="color: #838383;">
                                        <div class="way_upd_img_cont">
                                            <div>
                                                <img src="../../img/example_proflie_img.png" class="col-xs-6" alt="" width="150px" height="150px">
                                                <p class="col-xs-6">
                                                    <span style="color:rgb(34, 172, 135); font-size:5em">o</span>
                                                    <br> 본인 얼굴 정면이 <br> 나온 모습
                                                </p>
                                            </div>
                                            <div>
                                                <img src="../../img/example_profile2.png" class="col-xs-6" alt="" width="150px" height="150px">
                                                <p class="col-xs-6">
                                                    <span style="color:rgb(231, 73, 73); font-size:5em">x</span>
                                                    <br> 이모티콘이 <br> 포함된 사진
                                                </p>
                                            </div>  
                                            <div>
                                                <img src="../../img/example_profile6.jpg" class="col-xs-6" alt="" width="150px" height="150px">
                                                <p class="col-xs-6">
                                                    <span style="color:rgb(231, 73, 73); font-size:5em">x</span>
                                                    <br> 얼굴이 <br> 가려진 경우
                                                </p>
                                            </div> 
                                            <div>
                                                <img src="../../img/example_profile_3.png" class="col-xs-6" alt="" width="150px" height="150px">
                                                <p class="col-xs-6">
                                                    <span style="color:rgb(231, 73, 73); font-size:5em">x</span>
                                                    <br> 여러명이 <br> 함께 찍은 경우
                                                </p>
                                            </div>   
                                            <div>
                                                <img src="../../img/example_profile4.png" class="col-xs-6" alt="" width="150px" height="150px">
                                                <p class="col-xs-6">
                                                    <span style="color:rgb(231, 73, 73); font-size:5em">x</span>
                                                    <br> 먼 거리에서 <br> 찍은 경우
                                                </p>
                                            </div> 
                                            <div>
                                                <img src="../../img/example_profile5.jpg" class="col-xs-6" alt="" width="150px" height="150px">
                                                <p class="col-xs-6">
                                                    <span style="color:rgb(231, 73, 73); font-size:5em">x</span>
                                                    <br> 인물 식별이 <br> 어려운 경우
                                                </p>
                                            </div>    
                                        </div>
                                        <div class="way_upd_img_text">
                                            <p>이 외 본인이 아닌 경우, 본인 식별이 어려운 사진을 올리면 부모님의 선택을 받지 못할 수도 있습니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- end modal content -->
                            </div>
                            <!-- end modal dialog -->
                        </div>
                        <!-- end modal -->

                        </section>
                    </form>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script>
            function upload_img(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var img_html = "<div class=user_img><img src="+e.target.result+'></div>';
                        $(".upload_prof").append(img_html);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            $("#new_profile_img").change(function() {
                upload_img(this);
                $(".upload_prof").css('justify-content', 'flex-start');
            });
        </script>
	</body>
</html>