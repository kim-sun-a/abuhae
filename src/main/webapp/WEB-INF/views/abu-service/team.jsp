<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>아이를부탁해</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

    <!-- bootstrap -->
    <!--절대 경로 수정 1220 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!-- sitter_search.css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sitter_search.css" />

    <style type="text/css">

    </style>
</head>

<body>
    <div class="container">
        <div class="col-xs-12">
            <!-- xs-12로 모바일 맞춤 -->
            <div class="gallery">
                <div class="sitter_item_group">
                    <div class="item_header">
                        <div class="cert_label"><img
                                src="${pageContext.request.contextPath}/assets/img/icon-cert-label (1).png" /><span class="cert_text">
                                먹금</span></div>
                    </div>
                    <hr class="divider" />
                    <div class="item_body">
                        <div class="profile_img_group">
                            <img src="${pageContext.request.contextPath}/assets/img/team_suna.jpg" />
                            <div class="responsive_rate_group">
                                <div class="res_text">응답률</div>
                                <div class="res_rate">100</div>
                                <div class="res_text">%</div>
                            </div>
                        </div>
                        <div class="profile_info_group">
                            <div class="content_row">
                                <div>
                                    <div class="user_name">김선아</div>
                                    <div class="last_update">6일 전 작성</div>
                                </div>
                                <div class="jim_btn">
                                    <button class="btn btn-default swapHeart">
                                        <div class="jim">
                                            <span class="glyphicon glyphicon-heart-empty"
                                                style="color: #ff7000; font-size: 20px"></span>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="content_row location_group">
                                <span class="location">서울시 구로구 </span>
                            </div>
                            <div class="content_row">
                                <div class="user_age">29세</div>
                                <div class="text_sep"></div>
                                <div class="wanted_pay">희망 시급 15000원</div>
                            </div>
                            <div class="content_row">
                                <div class="review_rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="review_count">후기 155개</span>
                            </div>
                        </div>
                    </div>
                    <hr class="divider" />
                    <div class="item_footer">
                        <div class="cert_info_group">
                            <div class="cert_text_group">
                                <div class="cert_label">확인된 인증</div>
                                <div class="cert_count">2개</div>
                            </div>
                            <div class="cert_info_btn_group">
                                <div class="cert_btn">세션 마스터 인증</div>
                                <div class="cert_btn">관리자 마스터 인증</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end card-->
                <div class="sitter_item_group">
                    <div class="item_header">
                        <div class="cert_label"><img
                                src="${pageContext.request.contextPath}/assets/img/icon-cert-label (1).png" /><span class="cert_text">
                                나보다 약한 자의 말은 듣지 않는다</span></div>
                    </div>
                    <hr class="divider" />
                    <div class="item_body">
                        <div class="profile_img_group">
                            <img src="${pageContext.request.contextPath}/assets/img/team_daye.jpg" />
                            <div class="responsive_rate_group">
                                <div class="res_text">응답률</div>
                                <div class="res_rate">100</div>
                                <div class="res_text">%</div>
                            </div>
                        </div>
                        <div class="profile_info_group">
                            <div class="content_row">
                                <div>
                                    <div class="user_name">송다예</div>
                                    <div class="last_update">6일 전 작성</div>
                                </div>
                                <div class="jim_btn">
                                    <button class="btn btn-default swapHeart">
                                        <div class="jim">
                                            <span class="glyphicon glyphicon-heart-empty"
                                                style="color: #ff7000; font-size: 20px"></span>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="content_row location_group">
                                <span class="location">경기도 평택시 </span>
                            </div>
                            <div class="content_row">
                                <div class="user_age">27세</div>
                                <div class="text_sep"></div>
                                <div class="wanted_pay">희망 시급 15000원</div>
                            </div>
                            <div class="content_row">
                                <div class="review_rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="review_count">후기 155개</span>
                            </div>
                        </div>
                    </div>
                    <hr class="divider" />
                    <div class="item_footer">
                        <div class="cert_info_group">
                            <div class="cert_text_group">
                                <div class="cert_label">확인된 인증</div>
                                <div class="cert_count">2개</div>
                            </div>
                            <div class="cert_info_btn_group">
                                <div class="cert_btn">페이징 마스터 인증</div>
                                <div class="cert_btn">마이페이지 마스터 인증</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end card-->
                <div class="sitter_item_group">
                    <div class="item_header">
                        <div class="cert_label"><img
                                src="${pageContext.request.contextPath}/assets/img/icon-cert-label (1).png" /><span class="cert_text">
                                파싱몬스터</span></div>
                    </div>
                    <hr class="divider" />
                    <div class="item_body">
                        <div class="profile_img_group">
                            <img src="${pageContext.request.contextPath}/assets/img/team_hari.jpg" />
                            <div class="responsive_rate_group">
                                <div class="res_text">응답률</div>
                                <div class="res_rate">100</div>
                                <div class="res_text">%</div>
                            </div>
                        </div>
                        <div class="profile_info_group">
                            <div class="content_row">
                                <div>
                                    <div class="user_name">전하리</div>
                                    <div class="last_update">6일 전 작성</div>
                                </div>
                                <div class="jim_btn">
                                    <button class="btn btn-default swapHeart">
                                        <div class="jim">
                                            <span class="glyphicon glyphicon-heart-empty"
                                                style="color: #ff7000; font-size: 20px"></span>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="content_row location_group">
                                <span class="location">서울시 강동구 </span>
                            </div>
                            <div class="content_row">
                                <div class="user_age">25세</div>
                                <div class="text_sep"></div>
                                <div class="wanted_pay">희망 시급 15000원</div>
                            </div>
                            <div class="content_row">
                                <div class="review_rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="review_count">후기 155개</span>
                            </div>
                        </div>
                    </div>
                    <hr class="divider" />
                    <div class="item_footer">
                        <div class="cert_info_group">
                            <div class="cert_text_group">
                                <div class="cert_label">확인된 인증</div>
                                <div class="cert_count">2개</div>
                            </div>
                            <div class="cert_info_btn_group">
                                <div class="cert_btn">파싱 마스터 인증</div>
                                <div class="cert_btn">ajax 마스터 인증</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end card-->
                <div class="sitter_item_group">
                    <div class="item_header">
                        <div class="cert_label"><img
                                src="${pageContext.request.contextPath}/assets/img/icon-cert-label (1).png" /><span class="cert_text">
                                차이코프스키</span></div>
                    </div>
                    <hr class="divider" />
                    <div class="item_body">
                        <div class="profile_img_group">
                            <img src="${pageContext.request.contextPath}/assets/img/team_jiwoo.jpg" />
                            <div class="responsive_rate_group">
                                <div class="res_text">응답률</div>
                                <div class="res_rate">50</div>
                                <div class="res_text">%</div>
                            </div>
                        </div>
                        <div class="profile_info_group">
                            <div class="content_row">
                                <div>
                                    <div class="user_name">정지우</div>
                                    <div class="last_update">6일 전 작성</div>
                                </div>
                                <div class="jim_btn">
                                    <button class="btn btn-default swapHeart">
                                        <div class="jim">
                                            <span class="glyphicon glyphicon-heart-empty"
                                                style="color: #ff7000; font-size: 20px"></span>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div class="content_row location_group">
                                <span class="location">경기도 파주시 </span>
                            </div>
                            <div class="content_row">
                                <div class="user_age">23세</div>
                                <div class="text_sep"></div>
                                <div class="wanted_pay">희망 시급 15000원</div>
                            </div>
                            <div class="content_row">
                                <div class="review_rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="review_count">후기 155개</span>
                            </div>
                        </div>
                    </div>
                    <hr class="divider" />
                    <div class="item_footer">
                        <div class="cert_info_group">
                            <div class="cert_text_group">
                                <div class="cert_label">확인된 인증</div>
                                <div class="cert_count">2개</div>
                            </div>
                            <div class="cert_info_btn_group">
                                <div class="cert_btn">JSTL 마스터 인증</div>
                                <div class="cert_btn">SQL 마스터 인증</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end card-->

            </div>

        </div> <!-- fin. col-xs-12 -->
    </div>

</body>

</html>