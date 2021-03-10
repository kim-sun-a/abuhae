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
        <style type="text/css">
         
        /** for 후기 관리 페이지 (review.html) --------------------------------------*/
        /** 공통 for 후기 관리 */
        

		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_experience">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">자기소개 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content -->
                        <section class="introduce_text">
                            <div class="row">
                                <div class="col-xs-12">
                                    <textarea name="introduce" id="introduce" cols="30" rows="10"
                                    placeholder="자기소개 작성 시 부모님에게 2배 더 많은 신청을 받게 됩니다."></textarea>
                                    <div class="intro_ban">
                                        <div><i class="fas fa-ban"></i></div>
                                        <p>자기소개 내용에 연락처, 이메일 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</p>
                                    </div>
                                    <a href="#introduce_modal" data-toggle="modal"><span>다른 맘시터 자기소개 내용 확인하기</span></a>
                                </div>
                            </div>

                        </section>
                    </form>

                    <!-- modal -->
                    <div id="introduce_modal" class="modal fade" tabindex="-1" role="dialog" 
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
                                       다른 맘시터 자기소개
                                    </h4>
                                </div>
                                
                                <!-- 내용 -->
                                <div class="modal-body" style="background-color: #eee;">
                                    <div style="text-align: center;">
                                        <p style="color: #838383;">아래 내용을 참고하여 작성해보세요 :)</p>
                                    </div>
                                    <div style="background-color: #ffffff; padding: 10px 10px; margin-bottom: 20px;">
                                        <p>
                                            <span style="font-size: 1em; font-weight: bold; color: #777;">선생님 맘시터</span> ㅣ <span style="font-size: 0.8em;">송○예 ㅣ 27세</span>
                                        </p>
                                        <p>
                                            저는 밝고 활발하며 적극적인 성격을 지니고 있습니다. <mark> ○○대학교 유아교육학과</mark>
                                            서 아동사회학 드으이 여러 과목들을 배웠습니다. 평소 약속을 중요하게 생각하는 
                                            성격이라 <mark>한번 정한 약속은 꼭 지킬 수 있도록 노력하겠습니다.</mark>
                                        </p>
                                    </div>
                                    <div style="background-color: #ffffff; padding: 10px 10px;">
                                        <p>
                                            <span style="font-size: 1em; font-weight: bold; color: #777;">엄마 맘시터</span> ㅣ <span style="font-size: 0.8em;">남○재ㅣ 50세</span>
                                        </p>
                                        <p>
                                            현재 <mark>두 아들을 잘 키워내고</mark> 대학까지 무사히 보냈습니다. 
                                            아이들을 워낙 좋아하고 잘 돌볼 수 있는 자신이 있어서 맘시터로 활동하고 있습니다. 내 아들같이
                                            사랑으로 돌보겠습니다.^^
                                        </p>
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