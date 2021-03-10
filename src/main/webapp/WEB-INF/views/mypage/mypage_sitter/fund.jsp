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
                <div class="wrap_fund center-block">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">
                                    내 적립금
                                    <a data-toggle="modal" href="#caution_fund">
                                        <i class="fas fa-question-circle" style="color: #b6b5b5; font-size: 1.1em;"></i>
                                    </a>
                                </h3>
                            </div>
                        </div>
                        <!-- 내 적립금 / 쿠폰 유의사항 모달 -->
                         <!-- 쿠폰유의사항 모달 -->
                         <div id="caution_fund" class="modal fade" tabindex="-1" role="dialog"
                         aria-labelledby="modal_label" aria-hidden="true">
                             <!-- modal dialog -->
                             <div class="modal-dialog">
                                 <!-- modal content -->
                                 <div class="modal-content">
                                     <!-- 제목 -->
                                     <div class="modal-header">
                                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
                                             <i class="fas fa-times"></i>
                                         </button>
                                         <h4 class="modal-title" id="modalLabel" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                             적립금/쿠폰 유의사항
                                         </h4>
                                     </div>
                                     <div class="modal-body" style="color: #838383;">
                                         <h5 style="font-weight: bold;">적립금 유의사항</h5>
                                         <br/>
                                         <ul style="list-style: outside; margin-left: 20px;">
                                             <li class="fund_caution">적립금은 이용권/프리미엄 지원권 결제하기에서 1,000단위로 사용하실 수 있습니다.(단, 베이직 지원권 및 맘시터 안전 보험은 적립금을 적용할 수 없습니다.)</li>
                                             <li class="fund_caution">이용권/프리미엄 지원권 구매시 쿠폰 또는 적립금을 사용하여 할인을 받더라도 최소 1,000원 이상은 결제하셔야 합니다.</li>
                                             <li class="fund_caution">적립금 유효기간은 2년이며, 유효기간이 지나면 해당 적립금은 자동 소멸됩니다.</li>
                                             <li class="fund_caution">적립금 사용시, 유효기간이 가장 적게 남은 적립금부터 자동으로 사용됩니다.</li>
                                             <li class="fund_caution">이용권/프리미엄 지원권 환불 시 사용한 적립금은 재적립되지 않으며 적립금/쿠폰 금액을 제외한 금액만 환불 가능합니다.</li>
                                             <li class="fund_caution">만료일 기준 6개월이 지난 적립금은 내역에서 삭제됩니다.</li>
                                             <li class="fund_caution">회원탈퇴시, 보유한 적립금은 자동 소멸됩니다.</li>
                                             <li class="fund_caution">부정한 방법으로 적립금을 사용할 경우 해당 결제건 전체가 취소(직권취소)될 수 있으며, 재가입 불가 회원탈퇴 처리될 수 있습니다.</li>
                                         </ul>
                                         <br/>
                                         <h5 style="font-weight: bold;">쿠폰사용 유의사항</h5>
                                         <br/>
                                         <ul style="list-style: outside; margin-left: 20px;">
                                             <li class="fund_caution">쿠폰은 이용권/프리미엄 지원권 결제하기에서 사용하실 수 있습니다.(단, 베이직 지원권 및 맘시터 안전 보험은 쿠폰을 적용할 수 없습니다.)</li>
                                             <li class="fund_caution">모든 쿠폰은 중복사용이 불가하며 결제건당 1장만 사용할 수 있습니다.</li>
                                             <li class="fund_caution">이용권/프리미엄 지원권 환불 시 사용한 쿠폰은 재발급되지 않으며, 적립금/쿠폰 금액을 제외한 금액만 환불 가능합니다.</li>
                                             <li class="fund_caution">부정한 방법으로 쿠폰을 사용할 경우 해당 결제건 전체가 취소(직권취소)될 수 있으며, 재가입 불가 회원탈퇴 처리될 수 있습니다.</li>
                                             <li class="fund_caution">만료일 기준 6개월이 지난 쿠폰은 내역에서 삭제됩니다.</li>
                                         </ul>
                                     </div>
                                 </div>
                                 <!-- end modal content -->
                             </div>
                             <!-- end modal dialog -->
                         </div>
                         <!--end modal-->
                    </header>
                    <!-- end header -->
    
                    <!-- content1 -->
                    <section class="group1_fund">
                        <div class="row">
                            <div class="col-xs-12 fund_con_in">
                                <div class="con_in_item">
                                    <div class="item_list">
                                        <div class="list_money">
                                            <h3>1500 원</h3>
                                        </div>
                                        <div class="list_char">
                                            <h4>사용 가능 적립금</h4>
                                        </div>
                                    </div>
                                    <div class="item_line"></div>
                                    <div class="item_list">
                                        <div class="list_money">
                                            <h3>0 원</h3>
                                        </div>
                                        <div class="list_char">
                                            <h4>당월 소멸 예정 적립금</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="use_button">
                                    <button type="button" class="center-block">
                                        <a href="${pageContext.request.contextPath}/buy/buy.do">적립금 사용하기</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- end content1 -->

                    <!-- content2 -->
                    <section class="group2_fund">
                        <div class="row">
                            <div class="col-xs-12 fund_tab">
                                <!-- 탭 버튼 영역 -->
                                <ul class="fund_tab_button">
                                    <li id="button1" class="fund_tab_button_item fi_selected">
                                        <a class="fund_tab_button_item_link selected" href="#fund_tab_page_1">적립</a>
                                    </li>
                                    <li id="button2" class="fund_tab_button_item">
                                        <a class="fund_tab_button_item_link" href="#fund_tab_page_2">사용</a>
                                    </li>
                                    <li id="button3" class="fund_tab_button_item">
                                        <a class="fund_tab_button_item_link" href="#fund_tab_page_3">소멸예정</a>
                                    </li>
                                </ul>
                                <!-- end 탭 버튼 영역-->

                                <!-- 내용 영역 -->
                                <div class="fund_tab_panel">
                                    <div id="fund_tab_page_1">
                                        <div class="fund_money">
                                            <div class="icon_fund col-xs-2"><i class="fas fa-money-check-alt"></i></div>
                                            <div class="money_cont col-xs-6">
                                                <p>3시간 이내 응답 <br> <span style="color: #838383; font-size: 0.8em;">2020.06.01</span></p>
                                            </div>
                                            <div class="how_much col-xs-4">
                                                <p>+500원 <br> 적립</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="fund_money">
                                            <div class="icon_fund col-xs-2"><i class="fas fa-money-check-alt"></i></div>
                                            <div class="money_cont col-xs-6">
                                                <p>3시간 이내 응답 <br> <span style="color: #838383; font-size: 0.8em;">2020.06.01</span></p>
                                            </div>
                                            <div class="how_much col-xs-4">
                                                <p>+500원 <br> 적립</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="fund_money">
                                            <div class="icon_fund col-xs-2"><i class="fas fa-money-check-alt"></i></div>
                                            <div class="money_cont col-xs-6">
                                                <p>3시간 이내 응답 <br> <span style="color: #838383; font-size: 0.8em;">2020.06.01</span></p>
                                            </div>
                                            <div class="how_much col-xs-4">
                                                <p>+500원 <br> 적립</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="fund_tab_page_2" class="hide">
                                        <i class="fas fa-sad-cry"></i>
                                        <p>사용내역이 없습니다.</p>
                                    </div>
                                    <div id="fund_tab_page_3" class="hide">
                                        <i class="fas fa-sad-cry"></i>
                                        <p>소멸예정내역이 없습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

        <script>
            $(function() {
              /** 탭 버튼 클릭 기능 */
                $(".fund_tab_button_item").click(function(e) {
                    e.preventDefault();
                    $(".fund_tab_button_item").not(this).removeClass("fi_selected");
                    $(this).addClass("fi_selected");

                    $(".fund_tab_button_item").not(this).find("a").removeClass("selected");
                    $(this).find("a").addClass("selected");

                    var target2 = $(this).find("a").attr("href");
                    $(target2).removeClass("hide");
                    $(".fund_tab_panel > div").not($(target2)).addClass("hide");
                });            
            });
        </script>
	</body>
</html>