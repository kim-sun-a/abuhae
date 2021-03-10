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
                <div class="wrap_choice_care">
                     <!-- header -->
                     <header class="mp_detail_tl" style="border-bottom: 1px solid #ccc;">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">돌봄유형 선택</h3>
                            </div>
                        </div>
                    </header>

                    <!-- content -->
                    <form id="choice_care_form" action="#">
                        <section class="choice_care_cont">
                            <div class="row">
                                <div class="col-xs-12 care_form_in">
                                    <h4>선호하는 유형을 선택해주세요</h4>

                                    <div class="care_box">
                                        <div class="care_list">
                                            <input type="radio" class="kind_care" id="kind_care1" name="kind_care" value="1">
                                            <label for="kind_care1"> 신생아/영아 풀타임 돌봄</label>
                                        </div>
                                        <p id="kind_care_cont1" class="guide_care hide" >
                                            - 0~24개월 아이를 먹이고, 재우고, 놀아주는 활동 <br/>
                                            - 보통 주5일 하루 8~10시간 책임지고 돌봄 필요 <br/>
                                            - 아이 관련 가사활동 필수 <br/>
                                        </p>
                                    </div>

                                    <div class="care_box">
                                        <div class="care_list">
                                            <input type="radio" class="kind_care" id="kind_care2" name="kind_care" value="2">
                                            <label for="kind_care2"> 등하원 돌봄</label>
                                        </div>
                                        <p id="kind_care_cont2" class="guide_care hide" >
                                            - 2~10세 아이를 기관에 가기 전후에는 돌보는 활동 <br/> 
                                            - 보통 주5일 하루 3~5시간 책임지고 돌봄 필요 <br/>
                                            - 등하원, 밥 챙겨주기, 씻기기, 놀아주기 활동 포함 <br/>
                                        </p>
                                    </div>

                                    <div class="care_box">
                                        <div class="care_list">
                                            <input type="radio" class="kind_care" id="kind_care3" name="kind_care" value="3">
                                            <label for="kind_care3"> 신생아/영아 보조 돌봄</label>
                                        </div>
                                        <p id="kind_care_cont3" class="guide_care hide" >
                                            - 0~24개월 아이를 보호자와 함께 또는 혼자 돌봄 <br/>
                                            - 최근 0~12개월 돌본 경험 1주일 이상 필수 <br/>
                                            - 주 1~4회 정기적으로 또는 단기로 2~4시간 활동 <br/>
                                        </p>
                                    </div>

                                    <div class="care_box">
                                        <div class="care_list">
                                            <input type="radio" class="kind_care" id="kind_care4" name="kind_care" value="4">
                                            <label for="kind_care4"> 놀이/학습 돌봄</label>
                                        </div>
                                        <p id="kind_care_cont4" class="guide_care hide" >
                                            - 2~10세 아이와 특기를 활용해서 즐겁고 학습적인 시간을 보내는 활동 <br/>
                                            - 주 1~4회 정기적으로 또는 단기로 2~4시간 활동 <br/>
                                        </p>
                                    </div>

                                    <div class="care_box">
                                         <div class="care_list">
                                            <input type="radio" class="kind_care" id="kind_care5" name="kind_care" value="5">
                                            <label for="kind_care5"> 긴급/단기 돌봄</label>
                                        </div>
                                        <p id="kind_care_cont5" class="guide_care hide" >
                                            - 정기 방문이 아닌 1~2회 또는 짧은 기간 동안만 돌봄 활동 <br/>
                                            - 프로필에 돌봄 가능한 아이 연령과 활동 명시 필요 <br/>
                                        </p>
                                    </div>  
                                </div>
                            </div>
                        </section>
                        <section class="care_button">
                            <div class="row">
                                <div class="col-xs-12">
                                    <button type="submit">전송하기</button>
                                </div>
                            </div>
                        </section>
                    </form>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="../../../assets/js/jquery.min.js"></script>
        <script src="../../../assets/js/bootstrap.min.js"></script>

        <script>
            $(function() {
                /** 라디오 버튼 클릭시 아코디언 형식으로 내용이 나타는 기능 */
                $(".kind_care").click(function(e) {
                    var value = $(".kind_care:checked").val();
                    
                    if(value == 1) {
                        $("#kind_care_cont1").removeClass("hide");
                    } else {
                        $("#kind_care_cont1").addClass("hide");
                    }

                    if(value == 2) {
                        $("#kind_care_cont2").removeClass("hide");
                    } else {
                        $("#kind_care_cont2").addClass("hide");
                    }

                    if(value == 3) {
                        $("#kind_care_cont3").removeClass("hide");
                    } else {
                        $("#kind_care_cont3").addClass("hide");
                    }

                    if(value == 4) {
                        $("#kind_care_cont4").removeClass("hide");
                    } else {
                        $("#kind_care_cont4").addClass("hide");
                    }

                    if(value == 5) {
                        $("#kind_care_cont5").removeClass("hide");
                    } else {
                        $("#kind_care_cont5").addClass("hide");
                    }
                }); 

            });
        </script>
	</body>
</html>