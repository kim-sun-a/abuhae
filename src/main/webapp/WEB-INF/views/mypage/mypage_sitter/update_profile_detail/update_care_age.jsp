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
                <div class="wrap_care_age">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">돌봄 가능 연령 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content -->
                        <section class="upd_care_age_cont">
                            <div class="row">
                                <div class="col-xs-12 care_age_cont_in">
                                    <h4>
                                        돌봄 가능 연령 
                                        <a href="#age_modal" data-toggle="modal"><i class="fas fa-question-circle"></i></a> 
                                    </h4>
                                    <br/>
                                    <p>현재 신생아/영아 풀타임 돌봄유형이므로 신생아/영아 중 1개 아이 연령은 필수로 선택되어야 합니다.</p>
                                </div>
                            </div>
                        </section>

                        <section class="upd_care_age">
                            <div class="row">
                                <div class="col-xs-12 upd_care_age_in">
                                    <div class="care_age_btn">
                                        <input type="checkbox" id="care_age1" name="want_care_age" value="babyage1">
                                        <label for="care_age1"><i class="fas fa-baby fa-3x act_btn"></i></label>
                                        <div class="care_age_text">신생아</div>
                                    </div>
        
                                    <div class="care_age_btn">
                                        <input type="checkbox" id="care_age2" name="want_care_age" value="babyage2">
                                        <label for="care_age2"><i class="fas fa-baby-carriage fa-3x"></i></label>
                                        <div class="care_age_text">영아</div>
                                    </div>
        
                                    <div class="care_age_btn">
                                        <input type="checkbox" id="care_age3" name="want_care_age" value="babyage3">
                                        <label for="care_age3"><i class="fas fa-child fa-3x"></i></label>
                                        <div class="care_age_text">유아</div>
                                    </div>
        
                                    <div class="care_age_btn">
                                        <input type="checkbox" id="care_age4" name="want_care_age" value="babyage2">
                                        <label for="care_age4"><i class="fas fa-school fa-3x"></i></label>
                                        <div class="care_age_text">초등학생</div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>

                    <!-- modal -->
                    <div id="age_modal" class="modal fade" tabindex="-1" role="dialog" 
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
                                        돌봄 가능 연령이란?
                                    </h4>
                                </div>
                                
                                <!-- 내용 -->
                                <div class="modal-body">
                                    <div style="margin-bottom: 25px;">
                                        <h5><span style="color: #ff7000;">신생아</span> <span style="color: #929292;">0-6개월</span></h5>
                                        <p style="font-size: 0.8em; margin-top: 10px;">제 몸을 못 가누는 아주 작은 아이로, 수유하기, 재우기, 목욕시키기가 주 활동입니다.</p>
                                    </div>
                                    <div style="margin-bottom: 25px;">
                                        <h5><span style="color: #ff7000;">영아</span> <span style="color: #929292;">7-36개월</span></h5>
                                        <p style="font-size: 0.8em; margin-top: 10px;">기어가거나 걸을 수 있는 아이로 이유식/밥 먹이기, 기저귀 갈아주기, 감각 활동하기가 주 활동입니다.</p>
                                    </div>
                                    <div style="margin-bottom: 25px;">
                                        <h5><span style="color: #ff7000;">유아</span> <span style="color: #929292;">4-7세</span></h5>
                                        <p style="font-size: 0.8em; margin-top: 10px;">활동성이 매우 높은 시기의 아이들롤 보통 어린이집/유치원에 다닙니다. 등하원 돕기, 책 읽어주기, 놀아주기 등이 주 활동입니다.</p>
                                    </div>
                                    <div>
                                        <h5><span style="color: #ff7000;">초등학생</span></h5>
                                        <p style="font-size: 0.8em; margin-top: 10px;">초등학교 1~6학년 아이들로 등하교돕기, 숙제 도와주기, 전문 학습하기 등이 주 활동입니다.</p>
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
	</body>
</html>