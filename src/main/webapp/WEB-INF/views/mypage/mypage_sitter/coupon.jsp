<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="wrap_coupon">
                     <!-- header -->
                     <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${out.sitterno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">내 쿠폰함 <span style="color: #ff7000;">1장</span></h3>
                            </div>
                        </div>
                    </header>
                    <!-- end header -->

                    <!-- content1 -->
                    <section class="group1_coupon">
                        <div class="row">
                            <div class="col-xs-12 coupon_cont1">
                                <a data-toggle="modal" href="#caution_coupon">
                                    <i class="fas fa-exclamation-circle"></i>
                                    쿠폰 유의 사항을 확인해 주세요
                                    <i class="fas fa-angle-right"></i>
                                </a>
                            </div>
                        </div>
                        <!-- 쿠폰유의사항 모달 -->
                        <div id="caution_coupon" class="modal fade" tabindex="-1" role="dialog"
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
                        <!-- end modal -->
                    </section>
                    <!-- end section1 -->

                    <!-- content2 -->
                    <section class="group2_coupon">
                        <div class="row">
                            <c:choose>
                            	<c:when test="${output == null }">
                            		<p>조회 결과가 없습니다.</p>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="item" items="${output}" varStatus="status">
                            			<div class="col-xs-12 coupon_cont2">
			                                <a href="${pageContext.request.contextPath}/buy/buy.do?${item.sitterno}" class="use_btn">
			                                    <button type="button">쿠폰 사용하러 가기 <i class="fas fa-angle-right"></i></button>
			                                </a>
			                                <div class="coupon_list">
			                                    <div class="coupon_cont">
			                                        <p>${item.coup_name }</p>
			                                        <p class="discount_amount">${item.coup_price}원 할인권</p>
			                                        <p>${item.reg_date } ~ ${item.exp_date}</p>
			                                    </div>
			                                    <div class="expire">
			                                        <p>사용 가능</p>
			                                    </div>
			                                </div>
			                            </div>
                            		</c:forEach>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </section>
                    <!-- end content2 -->

                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	</body>
</html>