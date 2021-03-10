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

        <!--flatpickr-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mom_appl.css">
    

        <style type="text/css">
        /** for 후기 관리 페이지 (review.html) --------------------------------------*/
        /** 공통 for 후기 관리 */


        

		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_sage">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl" style="border-bottom: 1px solid #eee;">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_mom/update_appl.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">원하는 시터나이 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content1 -->
                        <section class="want_age_box">
                            <div class="row">
                                <div class="col-xs-12 age_box_cont">
                                    <input type="checkbox" name="sitter_age" id="sage20" class="sitter_age" value="20">
                                    <label for="sage20"><div class="check_age"></div> 20대</label>
                                    <input type="checkbox" name="sitter_age" id="sage30" class="sitter_age" value="30">
                                    <label for="sage30"><div class="check_age"></div> 30대</label>
                                    <input type="checkbox" name="sitter_age" id="sage40" class="sitter_age" value="40">
                                    <label for="sage40"><div class="check_age"></div> 40대</label>
                                    <input type="checkbox" name="sitter_age" id="sage50" class="sitter_age" value="50">
                                    <label for="sage50"><div class="check_age"></div> 50대</label>
                                    <input type="checkbox" name="sitter_age" id="sage60" class="sitter_age" value="60">
                                    <label for="sage60"><div class="check_age"></div> 60대</label>
                                </div>
                            </div>
                        </section>
                    </form>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>
            $(function() {
                /** 직접 입력 클릭 시 텍스트 박스 나타남 */
                $("#mom_appl_title").change(function() {
                    var value = $(this).val();
                    if (value==5) {
                        $(".mom_appl_title_text").removeClass("hide");
                    } else {
                        $(".mom_appl_title_text").addClass("hide");
                    }
                });
            });
        </script>
 
	</body>
</html>