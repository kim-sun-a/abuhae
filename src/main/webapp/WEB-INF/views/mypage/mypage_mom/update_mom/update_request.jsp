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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mom_appl.css">
        <style type="text/css">
        
        

		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_request">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl" style="border-bottom: 1px solid #ccc;">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_mom/update_appl.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">그 외 요청사항</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <section class="group1_upd_req">
                            <div class="row">
                                <div class="col-xs-12 upd_care_age_in">
                                    <div class="request_box">
                                        <h4>원하는 맘시터 성별</h4>
                                        <div class="choice_gender">
                                            <input type="radio" id="gender_f" name="s_gender" value="F">
                                            <label for="gender_f">여자</label>
                                            <input type="radio" id="gender_m" name="s_gender" value="M">
                                            <label for="gender_m">남자</label>
                                            <input type="radio" id="gender_n" name="s_gender" value="N">
                                            <label for="gender_n">무관</label>
                                        </div>
                                    </div>
                                    <div class="request_box">
                                        <h4>
                                            인터뷰 방식
                                            <a href="#interview_modal" data-toggle="modal"><i class="fas fa-question-circle"></i></a>
                                        </h4>
                                        <div class="choice_interview">
                                            <input type="radio" id="call" name="type_interview" value="call">
                                            <label for="call">전화 인터뷰</label>
                                            <input type="radio" id="face" name="type_interview" value="face">
                                            <label for="face">대면 인터뷰</label>
                                            <input type="radio" id="text" name="type_interview" value="test">
                                            <label for="text">시범 채용 </label>
                                        </div>
                                    </div>
                                    <div class="request_box">
                                        <h4>돌보는 방식</h4>
                                        <div class="choice_care">
                                            <div>
                                                <input type="radio" id="type_care1" name="type_care" value="1">
                                                <label for="type_care1">부모 대신 혼자 돌봐주세요.</label>
                                            </div>
                                            <div>
                                                <input type="radio" id="type_care2" name="type_care" value="2">
                                                <label for="type_care2">엄마 아빠와 함께 돌봐주세요.</label>
                                            </div>
                                            <div>
                                                <input type="radio" id="type_care3" name="type_care" value="3">
                                                <label for="type_care3">할머니(할아버지)와 함께 도와주세요.</label>
                                            </div>
                                            <div>
                                                <input type="radio" id="type_care4" name="type_care" value="4">
                                                <label for="type_care4">이모님(도우미)과 함께 도와주세요.</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>

                    <!-- modal -->
                    <div id="interview_modal" class="modal fade" tabindex="-1" role="dialog" 
                    aria-labelledby="modalLabel" aria-hidden="true">
                        <!-- mocal-dialog -->
                        <div class="modal-dialog">
                            <!-- modal-content -->
                            <div class="modal-content">
                                <!--제목-->
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    style="padding: 10px 0;">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <h4 class="modal-title" id="modalLabel" 
                                    style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                        인터뷰 방식이란?
                                    </h4>
                                </div>
                                
                                <!-- 내용 -->
                                <div class="modal-body">
                                    <div class="way_interview">
                                        <h4>전화 인터뷰</h4>
                                        <p>시터에게 전화하여 근무조건이 맞는지 말은 잘 통하는지 간단하게 확인</p>
                                    </div>
                                    <div class="way_interview">
                                        <h4>대면 인터뷰</h4>
                                        <p>
                                            맘시터가 부모회원 집으로 방문하여 30분 정도 서로 얼굴을 보며 근무 조건과 성향을 확인
                                            (5천원 ~ 1만원 현장 지급)
                                        </p>
                                    </div>
                                    <div class="way_interview">
                                        <h4>시범 채용</h4>
                                        <p>맘시터가 부모회원 집으로 방문하여 부모가 옆에 있을 때
                                            1~2시간 아이를 직접 돌보며 아이와 잘 맞는지 확인
                                            (희망시급에 따른 활동비 현장지급)</p>
                                    </div>
                                </div>
                            </div>
                            <!-- //modal-content end -->
                        </div>
                        <!-- //modal-dailog end-->
                    </div>
                    <!-- // modal end -->
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script>
             $(function () {
            //활동 버튼 클릭
            $(".care_age").click(function (e) {
                //버튼 클릭시 이미지 URL 변경
                //url 가져오기
                var img_url = $(this).next().find(".want_img").attr('src');
                var indeximg = img_url.indexOf("_n") //잘라서 _n이 있는지 확인
                if (indeximg > -1) {
                    var img_src = img_url.replace(/_n/, "_s");
                    $(this).next().find(".want_img").attr('src', img_src);
                } else {
                    var img_src = img_url.replace(/_s/, "_n");
                    $(this).next().find(".want_img").attr('src', img_src);
                }


            });
        });
        </script>
	</body>
</html>