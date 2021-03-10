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
        
        <style>
            h4 {
                display: block;
                text-align: left;
                font-size: 0.9em;
                color: #666;
                margin: 34px 0 11px;
            }

            .payment_box i {
                font-size: 1.2em;
                color: #838383;
            }
        </style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_profile_cont">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_mom/update_appl.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">아이정보/희망시급 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content1 -->
                        <section class="group_upd_img">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="number_children_wrap">
                                        <button class="childeren_num1 btn_children_off" data-tab="select_one">1명</button>
                                        <button class="childeren_num2 btn_children_off" data-tab="select_two">2명</button>
                                    </div>
                                    <!--동적 요소 위치-->
                                    <div class="title">
                                        <!--아이 명수 선택 안 할시 띄우기-->
                                        <!--아이 명수 셀렉하면 동적 요소로 타이틀 변경-->
                                        <div class="noselect_title">
                                            안전한 아이 돌봄 서비스를 위해
                                            <br>
                                            시터 1명이 최대 2명까지 돌볼 수 있습니다.
                                        </div>
                                        <div class="select_title">
                                        </div>
                                    </div>
                                    <!--버튼 select시 공지내용 변경 - ajax-->
                                    
                                    <!--end 동적 요소 위치-->
                                </div>
                            </div>
                        </section>   
                        <!-- end content1 -->
                    </form>

                    <!-- modal -->
                    <div id="child_modal" class="modal fade" tabindex="-1" role="dialog" 
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
                                style="font-size: 1.2em; font-weight: bold; padding: 10px 0; color: #000;">
                                    아래 시급 기준을 확인해주세요.
                                </h4>
                            </div>
                            
                            <!-- 내용 -->
                            <div class="modal-body">
                                <div style="margin-bottom: 20px;">
                                    <h5 style="font-weight: bold; margin-bottom: 10px;">돌봄 아이 시급 1명일 경우</h5>
                                    <p style="color: #838383; font-size: 0.9em;">최저시급 8,720원 이상 필수</p>
                                </div>
                                <div style="margin-bottom: 20px;">
                                    <h5 style="font-weight: bold; margin-bottom: 10px;">돌봄 아이 시급 2명일 경우</h5>
                                    <p style="color: #838383; font-size: 0.9em;">최저시급 8,720 x 1.5배인 13,000원 이상 필수</p>
                                </div>
                            </div>
                        </div>
                        <!-- //modal-content end -->
                    </div>
                    <!-- //modal-dailog end-->
                </div>
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

        <script type="text/javascript">
            function addCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            $(function () {
                //시급 입력시 콤마 자동으로 찍히기
                $("#payment_input").on("blur", function () {
                    var val = $(this).val();
                    if (val.length != 0) {
                        $(this).val(addCommas($(this).val().replace(/[^0-9]/g, "")));
                    }
    
                    if (/\D/.test(val)) {
                        val = val.replace(/\D/g, '')
                        alert('숫자만 입력가능합니다.');
                        $("#payment_input").val("0");
                    }
                    if (val < 8590) {
                        val = 8590;
                        alert('최저시급 이상 입력해야 합니다.');
                        $("#payment_input").val("8590");
    
                    }
                });
    
    
                //아이명수 클릭시 버튼 색상 바뀜
                $(".childeren_num1, .childeren_num2").on("click", function () {
                    var select = $(this).hasClass("childeren_num1");
    
                    //num1 클릭했을 때
                    if (select) {
                        //버튼 색상 적용
                        $(this).removeClass("btn_children_off");
                        $(this).addClass("btn_children_on");
                        $(this).next().removeClass("btn_children_on");
                        $(this).next().addClass("btn_children_off");
                        ;
    
                    } else {
                        //num2 클릭했을 때
                        $(this).removeClass("btn_children_off");
                        $(this).addClass("btn_children_on");
                        $(this).prev().removeClass("btn_children_on");
                        $(this).prev().addClass("btn_children_off");
                    }
    
                    $(".noselect_title").empty();
                    //버튼 클릭시에 내용 변경
                    var test = $(this).attr('data-tab');
                    $.ajax({
                        type: 'GET',                 //get방식으로 통신
                        url: test + ".html",    //탭의 data-tab속성의 값으로 된 html파일로 통신
                        dataType: "html",            //html형식으로 값 읽기
                        error: function () {          //통신 실패시 ㅠㅠ
                            alert('통신실패!');
                        },
                        success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                            $('.select_title').html(data);
                        }
                    });
    
                });
    
            });
    
        </script>
        
	</body>
</html>