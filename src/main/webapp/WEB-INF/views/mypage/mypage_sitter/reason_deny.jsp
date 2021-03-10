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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/upd_mps_detail.css">

        <style>
            .mp_detail_tl {
                border-bottom: 1px solid #ccc;
            }
            
        </style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_deny">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/get_mom_mps.do">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">거절 사유 입력</h3>
                            </div>
                        </div>
                    </header>
                    <!-- end header -->
                    
                    <!-- content -->
                   <section class="group1_deny">
                        <div class="row">
                            <div class="col-xs-12">
                                <form action="#" id="upd_deny">
                                    <h5>거절 유형을 선택해주세요.</h5>
                                    <div class="deny_radio">
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny1" class="deny">
                                            <label for="deny1">최근에 다른 부모님과 활동을 시작하였습니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny2" class="deny">
                                            <label for="deny2">다른 부모님과 인터뷰 후, 결과를 기다리고 있습니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny3" class="deny">
                                            <label for="deny3">이동하기에 먼 거리입니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny4" class="deny">
                                            <label for="deny4">요청하신 시간에는 어렵습니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny5" class="deny">
                                            <label for="deny5">요청하신 활동은 자신있는 분야가 아닙니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny6" class="deny">
                                            <label for="deny6">아이 나이가 너무 어립니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny7" class="deny">
                                            <label for="deny7">피치 못할 사정으로 앞으로 맘시터 활동이 어렵습니다.</label>
                                        </div>
                                        <div>
                                            <input type="radio" name="reason_deny" id="deny8" class="deny">
                                            <label for="deny8">그 밖에 다른 이유로 거절합니다.</label>
                                        </div>
                                    </div>
                                    <div class="deny_text">
                                        <h5>거절 사유를 알려주세요.</h5>
                                        <p>* 개인정보(상세 주소, 연락처)를 기입할 경우, 맘시터 자격을 영구적으로 잃게 되니 유의해주세요.</p>
                                        <textarea name="reason_deny" id="" cols="30" rows="10" 
                                        placeholder="예) 저에게 신청해주셔서 감사합니다. 그런데 제가 할 수 있는 활동이 아닌 것 같습니다.ㅠㅠ"></textarea>
                                    </div>
                                    <div>
                                        <button type="submit">전송하기</button>
                                    </div>
                                </form>  
                            </div>
                        </div>
                   </section>
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="../../assets/js/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
	</body>
</html>