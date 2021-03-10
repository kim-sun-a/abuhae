<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>아이를 부탁해</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <!--slick slider-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/slick/slick-theme.css" />
    <!-- fontawesome(글리피콘) 적용 -->
    <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>

    <!-- sweetalert 사용 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- css 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/receipt.css" />
  </head>

  <body>
    <div id="app">
      <div class="container">
        <div class="receipt_area col-xs-12">
          <div class="receipt_title">
            <div style="margin-top: 8px; margin-right: 8px; margin-left: -16px">
              <button type="button" class="back_btn" onclick="history.back() ">
                <i class="fas fa-times"></i>
              </button>
            </div>
            <div class="receipt_title_text col-xs-10">결제내용 확인</div>
          </div>
          <!-- fin. receipt_title -->
          <div class="receipt_box">
            <div class="receipt_name_area">
              <div class="second_name">맘회원 전용</div>
              <div class="name">프리미엄 이용권</div>
            </div>
            <hr style="margin-bottom: 15px" />
            <div class="coupon_area">
              <div class="coupon_line">
                <label for="coupon">쿠폰</label>
                <select name="coupon" class="pull-right" id="coupon">
                <c:choose>
                <c:when test="${empty cpout}">
                  <option value="">쿠폰이 없습니다.</option>
				</c:when>
				<c:otherwise>
                  <%-- 조회 결과에 따른 반복 처리 --%>
                  <c:forEach var="cpout" items="${cpout}" varStatus="status">
                    <option value="${cpout.coupno}">${cpout.coup_name}</option>
                  </c:forEach>
                  </c:otherwise>
                  </c:choose>
                </select>
              </div>
              <hr style="margin-bottom: 15px" />
              <div style="margin-bottom: 20px">
                <span class="style_price_title">내역</span>
                <span id="price_dc" class="pull-right"><fmt:formatNumber value="${output.ticket_price}" pattern="#,###" />원</span>
              </div>
              <div class="buy_price">
                <span class="style_price_title">총 결제 금액</span>
                <span id="total_price" class="pull-right"><fmt:formatNumber value="${output.ticket_price}" pattern="#,###" />원</span>
              </div>
              <label id="agree_ckeck">
                <input type="checkbox" value="agree" name="agree_chck" />
                필수 유의사항 및 환불 규정을 확인하였습니다
              </label>
              <button type="button" class="buy_btn col-xs-12" id="pay">결제하기</button>
            </div>
          </div>
          <!-- fin. receipt_box -->

          <div id="myModal_agree" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <!-- .modal-dialog -->
            <div class="modal-dialog">
              <!-- .modal-content -->
              <div class="modal-content">
                <div class="modal-body">
                  <p style="text-align: center; padding-top: 10px; font-weight: bold">환불규정에 대해 동의하여 주세요</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default col-xs-6" data-dismiss="modal" id="btn_agree">확인</button>
                </div>
              </div>
              <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
          </div>
        </div>
      </div>
    </div>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#pay").click(function () {
          if ($("input:checkbox[name='agree_chck']").is(":checked") == false) {
            $("#myModal_agree").modal();
            return;
          } else {
        	  window.location = "${pageContext.request.contextPath}/buy/receipt_ok.do?tktype=" + ${output.ticket_type} + "&memberno=" + ${login.memberno} + "&tkprice=" + ${output.ticket_price};
          }
        }); // fin. 구매관련 동의 체크 여부


        // $("#mySelect").change(function () {
        //   var index = $("#mySelect option").index($("#mySelect option:selected"));
        //   if (index == 1) {
        //     $("#price_dc").html("-14,970원");
        //     $("#total_price").html("34,930원");
        //     $("#price_dc").css("color", "#ff7000");
        //   } else if (index == 2) {
        //     $("#price_dc").html("-24,950원");
        //     $("#total_price").html("24,950원");
        //     $("#price_dc").css("color", "#ff7000");
        //   } else {
        //     $("#price_dc").html("49,900원");
        //     $("#total_price").html("49,900원");
        //     $("#price_dc").css("color", "#222222");
        //   }
        // }); // fin. index안에 option 위치 값 index로 받아서 if문 따라서 할인금액, 총 금액 변경

        // $("#mySelect02").change(function () {
        //   var index = $("#mySelect02 option").index($("#mySelect02 option:selected"));
        //   if (index == 1) {
        //     $("#price_dc").html("-2000원");
        //     $("#total_price").html("47,900원");
        //     $("#price_dc").css("color", "#ff7000");
        //   } else if (index == 0) {
        //     $("#price_dc").html("49,900원");
        //     $("#total_price").html("49,900원");
        //     $("#price_dc").css("color", "#222222");
        //   } else {
        //     $("#price_dc").html("-1000원");
        //     $("#total_price").html("48,900원");
        //     $("#price_dc").css("color", "#ff7000");
        //   }
        // }); // fin. index안에 option 위치 값 index로 받아서 if문 따라서 할인금액, 총 금액 변경
      });
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--slick slider-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"></script>
  </body>
</html>
