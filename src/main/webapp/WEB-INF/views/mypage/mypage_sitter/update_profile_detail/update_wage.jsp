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
                <div class="wrap_want_wage">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">희망 시급</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content -->
                        <section class="upd_want_wage">
                            <div class="row">
                                <div class="col-xs-12 want_wage_in">
                                    <div class="wage_box one">
                                        <i class="fas fa-hand-holding-usd"></i>
                                    </div>
                                    <div class="wage_box">
                                        <input type="text" name="want_wage" id="want_wage_text" placeholder="0">
                                        <span>원/1시간</span>
                                    </div>
                                    <div class="wage_box">
                                        <input type="checkbox" id="avg_wage"> 
                                        <label for="avg_wage"> <div class="check_avg"></div> 평균시급 적용</label>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="guide_wage">
                            <ul>
                                <li>아이 1명을 돌보는 경우, <br/> = 최저시급 8,590원 이상 필수</li>
                                <li>아이 2명을 돌보는 경우, <br/> = 최저시급 8,590원x1.5배 = 12,855원 이상 필수</li>
                            </ul>
                        </section>
                    </form>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function addCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            $(function () {
                //시급 입력시 콤마 자동으로 찍히기
                $("#want_wage_text").on("blur", function () {
                    var val = $(this).val();
                    if (val.length != 0) {
                        $(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
                    }

                    if (/\D/.test(val)) {
                        val = val.replace(/\D/g, '')
                        alert('숫자만 입력가능합니다.');
                        $("#want_wage_text").val("0");
                    }
                    if (val < 8590) {
                        alert('최저시급 이상 입력해야 합니다.');
                        $("#want_wage_text").val("8590");
                    }
                    if (val > 50000) {
                        alert('시급은 최대 50000원까지 입력할 수 있습니다.');
                        $("#want_wage_text").val("8590");
                    }
                });

                //평균시급 적용 체크박스 체크 해제시 최저임금으로 설정
                $("#avg_wage").change(function(){
                    var chk = $(this).is(":checked"); //.attr('checked'); 
                    if(chk == true) {
                        $("#want_wage_text").val("8,600");
                    } else {
                        $("#want_wage_text").val("8,590");
                    }
                    
                });
            });
        </script>
	</body>
</html>