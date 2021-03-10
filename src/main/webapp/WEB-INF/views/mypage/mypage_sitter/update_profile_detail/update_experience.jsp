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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_sitter_profile.css">
        <style type="text/css">
            .datepicker {
                display: flex;
                justify-content: space-around;
                font-size: 1.1em;
            }

            .datepicker input[type="text"] {
                border: 0;
                color: #ff7000;
                text-align: center;
                margin-bottom: 50px;
            }   
        </style>
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
                                    <h3 class="center-block">관련 경험 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <section>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="con" style="text-align: center; padding: 20px 0;">
                                        <p>
                                            아이를 키운 경험부터 사촌과 놀아준 경험까지, <br/>
                                            아이와 돌봄에 관련된 경험이라면 무엇이든지 적어주세요.
                                        </p>
                                    </div>

                                    <div id="con1" class="con1"></div>

                                    <button id="exp_btn" type="button" data-tab="experience_form">+ 경험 내용 추가하기</button>
                                </div>
                            </div>
                        </section>       
                    </form>
                    
                </div>
            </div>
        </div>

        <!-- Handlebars template-->
        <script type="text/x-handlebars-template" id="list-item-tmpl">
            <div class="exp_cont">
                <label for="type_exp" style="font-size: 1.1em; margin-bottom: 10px;">
                    {{title1}}</label>
                 <input type="text" id="type_exp" name="type_exp" placeholder="예) 키즈카페, 교육기관, 봉사활동">
            </div>
            <div class="exp_list">
                <h4 style="font-size: 1.1em; font-weight: bold;">{{title2}}</h4>
                <div class="datepicker">
                    <input type="text" name="startdate" class="startDate" required />
                    <span><i class="fas fa-long-arrow-alt-right"></i></span>
                    <input type="text" name="enddate" class="endDate" required>
                </div>
            </div>
			<script>
					$('.startDate').flatpickr({
                        dateFormat: "Y.m.d",
                        maxDate: new Date().fp_incr(30),
                        defaultDate: new Date(),
                    });

                   	 $('.endDate').flatpickr({
                        dateFormat: "Y.m.d",
                        maxDate: new Date().fp_incr(30),
                        defaultDate: new Date(),
                    });
			</script>
        </script>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/handlebars/handlebars-v4.0.11.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

        <script>
            // 버튼 클릭 시, 경험 내용, 경험기간 form 추가됨 
            /** 시도해본 방법 : 
             * ajax로 html 페이지 불러오기 -> 여러번 불러올 수 없음.
             *  clone()함수로 요소 복사하기  -> 이전의 내용이 복사됨 (내용 초기화시, flatpickr까지 사라짐) 
             *  버튼 클릭 시 동적 요소 생성 */
            var content = {
                title1 : "경험 내용",
                title2 : "경험 기간"
            };

            $(function() {
            	$("#exp_btn").click(function() {
            		
            		/**
            		$('.startDate').flatpickr({
                        dateFormat: "Y.m.d",
                        maxDate: new Date().fp_incr(30),
                        defaultDate: new Date(),
                    });

                   	 $('.endDate').flatpickr({
                        dateFormat: "Y.m.d",
                        maxDate: new Date().fp_incr(30),
                        defaultDate: new Date(),
                    });
                   	 여기에 들어가도 동작함.
                   	 */
            		
                    
                    var template = Handlebars.compile($("#list-item-tmpl").html());
                    var html = template(content); 
                        
                    $("#con1").append(html);
                });
            });
        </script>
	</body>
</html>