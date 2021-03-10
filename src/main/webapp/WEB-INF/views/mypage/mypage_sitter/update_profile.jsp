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

<!-- 아이콘 사용 -->
<script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script> 

<!-- sweetalert 사용 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 상세페이지 css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/page_detail_for_sitter.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mps_detail.css">

<style>
	.main {
		padding: 0
	}

    .mp_detail_tl {
        margin: 0;
        padding: 0 20px 20px;
        margin-bottom: 20px;
    }

    /** 프로필 사진 여백 및 바탕 */
    
    .main .profil_photo {
        background-color: #fff;
        margin-bottom: 30px;
    }

    .main .info_text_box {
        padding-top: 30px;
    }

    /** cctv 동의 여부 탭 버튼 */

    .main .agree_cctv_tab {
        display: flex;
        justify-content: center;
    }

    .main .agree_cctv_text p {
        font-size: 0.85em;
    }

    .main .agree_cctv_choice {
        width: 50%;
        height: 126px;
        padding: 12px;
        margin: 3px;
        border: 1px solid #d5d5d5;
        font-size: 0.8em;
    }
    

    .main .agree_cctv_choice.selected {
        background-color: rgb(0, 174, 153);
        color: #fff;
    }

    .main .agree_cctv_check {
        text-align: right;
        margin-top: 37px;
        font-size: 2em;
    }

    .main .precaution_cctv {
        display: flex;
        justify-content: center;
        padding: 15px;
        color: #a7a7a7;
        font-size: 0.7em;
    }

    /** 프로필 수정 버튼 위치 조정 */

    .main .iwant_box {
        position: relative;
    }

    .main .box_name_edit_iwant {
        position: absolute;
        z-index: 100;
        color: #828282;
        font-size: 2.5em;
        right: 1%;
        top: 0;
    }

    .main .active_box {
        position: relative;
    }

    .main .box_name_edit_act {
        position: absolute;
        z-index: 100;
        color: #828282;
        font-size: 2.5em;
        right: 1%;
        top: 0;
    }

    .main .possible_age_box {
        position: relative;
    }

    .main .info_box {
        position: relative;
    }

    .main .box_name_edit_age {
        position: absolute;
        z-index: 100;
        color: #828282;
        font-size: 2.5em;
        right: 1%;
        top: 0;
    }

    .main .box_name_edit {
        position: absolute;
        z-index: 100;
        color: #828282;
        font-size: 2.5em;
        right: 1%;
        top: 0;
    }

    .main .possible_zone_box {
        position: relative;
    }

    .main .box_name_edit_zone {
        position: absolute;
        z-index: 100;
        color: #828282;
        font-size: 2.5em;
        right: 1%;
        top: 0;
    }

</style>
</head>
	
<body>		
    <div class="container">
        <div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
            <div class="main">
                <!-- header -->
                <header class="mp_detail_tl" style="border-bottom: 1px solid #ccc;">
                    <div class="row">
                        <div class="col-xs-12 mp_detail_tl_in">
                            <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do">
                                <i class="fas fa-angle-left"></i>
                            </a>
                            <h3 class="center-block">프로필 수정</h3>
                        </div>
                    </div>
                </header>
				
				<%@ include file="../../page_detail/sitter_page_detail/sitter_detail.jsp" %> 
               
               	<div class="info_box">
                    <div class="box_name">CCTV 동의여부</div>
	                    <div class="info_area">
	                        <div class="info_text_box">
	                            <div class="agree_cctv_text">
	                                <p>
	                                    동의 여부는 선택할 수 있으나, <br/>
	                                    동의한 경우 부모에게 더 많은 선택을 받게 됩니다.
	                                </p>
	                            </div>
	                            <div class="agree_cctv_tab">
	                                <div class="agree_cctv_choice selected">
	                                    <p>CCTV 촬영을 <br/> 원하지 않습니다.</p>
	                                    <div class="agree_cctv_check">
	                                        <i class="fas fa-check-circle"></i>
	                                    </div>
	                                </div>
	                                <div class="agree_cctv_choice">
	                                    <p>CCTV가 있어도 <br/> 당당히 일할 수 있습니다.</p>
	                                    <div class="agree_cctv_check hide">
	                                        <i class="fas fa-check-circle"></i>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="precaution_cctv">
	                                <p>단, 녹화된 영상을 유출 배포하지 않는 전제</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
                </div>
            </div>
        </div>
				
		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		 <!-- jquery 파일명 수정 -->
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script> 
        
        <script type="text/javascript">
            $(function() {
                /** cctv 동의 여부 탭버튼 처리 */
                $(".agree_cctv_choice").click(function(e) {
                    // background-color toggle
                    $(".agree_cctv_choice").not(this).removeClass("selected");
                    $(".agree_cctv_choice").not(this).find("div").addClass("hide");
                    // icon toggle
                    $(this).addClass("selected");
                    $(this).find("div").removeClass("hide");
                });
            });
        </script>
	</body>
</html>