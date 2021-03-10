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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mps_detail.css">
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_agree_service">
                    <!-- header -->
                    <header class="mp_detail_tl" style="border-bottom: 1px solid #ccc;">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/ma/${login.memberno}">
                                    <i class="fas fa-angle-left"></i>
                                </a>
                                <h3 class="center-block">아부해 이용 동의</h3>
                            </div>
                        </div>
                    </header>

                    <!-- content -->
                    <section class="gorup1_agree_service">
                        <div class="agree_service_con1">
                            <div>
                                <h5>아부해 서비스 운영 정책</h5>
                                <p>
                                    아부해는 회원분들이 다양한 정보와 기술로 더 좋은 아이돌보미 또는 일자리(부모)를
                                    찾고 연락하실 수 있도록 정보를 제공하는 구인구직 플랫폼입니다. 본 서비스에 가입된 회원분들은
                                    (주)아이편한세상에 채용되거나 교육된 인력들이 아니고, 시터회원과 부모회원 간의
                                    계약을 소개/알선하지 않으므로, <span style="color: #ff7000;">(주)아이편한세상은 시터회원과 부모회원 간에
                                        발생하는 모든 문제에 대한 책임이 없음을 알려드립니다.
                                    </span>
                                </p>
                            </div>
                            <div>
                                <h5>아부해 회원의 의무</h5>
                                <p>
                                    모든 회원은 자신에게 적합한 아이돌보미 또는 일자리(부모)를 선택하여,
                                    서로 합의한 계약조건 또는 관련 법에 의거하여 성실하게 활동해야 합니다.
                                    <span style="color: #ff7000;">상호간 협의 내용을 사전에 조율없이 일방적으로
                                    해지통보할 경우, 서비스 이용 약관에 따라 강제 탈퇴 조치 될 수 있음을 알려드립니다.</span>
                                </p>
                            </div>
                        </div>
                        <div class="type_agree">
                            <div>
                                <p>서비스 운영정책 및 회원 의무 동의 <span style="color: #ff7000;">(필수)</span></p>
                            </div>
                            <hr>
                            <div>
                                <p>서비스 이용약관 동의 <span style="color: #ff7000;">(필수)</span></p>
                            </div>
                            <hr>
                            <div>
                                <p>개인정보 수집 및 이용에 관한 동의 <span style="color: #ff7000;">(필수)</span></p>
                            </div>
                            <hr>
                            <div>
                                <p>개인정보 제3자 제공에 관한 동의 <span style="color: #ff7000;">(필수)</span></p>
                            </div>
                            <hr>
                            <div>
                                <p>마켓팅, 프로모션, 광고 목적의 개인정보 이용 동의 <span style="color: #838383;">(선택)</span></p>
                            </div>
                            <hr>
                            <div>
                                <p>서비스 개인정보취급방침</p>
                            </div>
                            <hr>
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