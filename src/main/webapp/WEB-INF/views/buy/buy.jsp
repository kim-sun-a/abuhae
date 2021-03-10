<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <!-- animaition 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" />
    <!--section-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/section.css" />
    <!-- css 적용 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/buy.css" />
    <!-- jQuery  -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- Javascript -->
    <script type="text/javascript">
      $(function () {
        $(".tabmenu").click(function () {
          var activeTab = $(this).attr("data-tab");
          $("#default").css({
            "background-color": "#e7e7e7",
            color: "#888",
          });
          $("#tab02").css({
            "background-color": "#e7e7e7",
            color: "#888",
          });
          $(this).css({
            "background-color": "#fff",
            color: "#ff7000",
          });
          $.ajax({
            type: "GET", //get방식으로 통신
            url: activeTab + ".do", //탭의 data-tab속성의 값으로 된 jsp파일로 통신
            dataType: "html", //html형식으로 값 읽기
            error: function () {
              //통신 실패시 ㅠㅠ
              alert("통신실패!");
            },
            success: function (data) {
              //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
              $("#tabcontent").html(data);
            },
          });
        });
        $("#default").click();

        //모달의 로그인 버튼 클릭시
        $("#login_btn").on("click", function () {
          location.replace("${pageContext.request.contextPath}/login/login.jsp");
        });

        //모달의 회원가입 버튼 클릭시
        $("#go_to_join").on("click", function () {
          location.replace("${pageContext.request.contextPath}/join/join.jsp");
        });
      });
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--slick slider-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"></script>
  </head>

  <body>
    <div id="app">
      <div class="container col-xs-12">
        <header>
          <div id="menu">
            <c:if test="${isLogin ==true }">
              <c:choose>
                <c:when test="${fn:contains(loginType, 'M')}"> <%@ include file="../index_header_login_mom.jsp"%> </c:when>
                <c:when test="${fn:contains(loginType, 'S')}"> <%@ include file="../index_header_login_sitter.jsp"%> </c:when>
              </c:choose>
            </c:if>
            <c:if test="${isLogin == null }"> <%@ include file="../index_header.jsp"%> </c:if>
          </div>
        </header>
        <!-- header end-->
        <div class="buy_tab_box">
          <div class="tab_area">
            <div class="tab_main">
              <div class="tab_menu">
                <div data-tab="mom_ticket" class="tabmenu col-xs-6" id="default">
                  <p id="tab01_p">부모회원 전용</p>
                </div>
                <div data-tab="sitter_ticket" class="tabmenu col-xs-6" id="tab02">
                  <p id="tab02_p">시터회원 전용</p>
                </div>
              </div>
              <div id="tabcontent"><!-- tab 내용부분 --></div>
            </div>
          </div>
          <!-- fin. tab_area -->
        </div>
        <!-- fin. buy_tab_box -->
        <div class="footer col-xs-12">
          <div class="footer_area">
            <>
            <div class="footer_line">
              <h5><strong>필수 유의사항</strong></h5>
              <ul>
                <li>
                  연장/환불 요청은 기간 만료 후 7일 이내에만 가능하며, 환불의 경우
                  <br />
                  요청한 즉시 무제한 이용권 기간이 중단됩니다.
                </li>
                <li>
                  환불 요청 가능 시간은 평일 10:00 ~ 18:00시 입니다.
                  <br />
                  (점심시간 12:00 ~ 13:00 제외 / 주말,공휴일 제외)
                </li>
                <li>
                  무제한 이용권은 결제 시점부터 바로 사용 가능하며 임의로 이용권
                  <br />
                  기간을 정지하는 기능은 제공되지 않습니다.
                </li>
                <li>
                  타인과 무제한 이용권을 공유하거나, 업체에서 이용하는 것은 엄격히
                  <br />
                  금지하여 "재가입 불가 탈퇴" 처리하고 있으니 유의해주세요.
                </li>
                <li>결제되는 금액은 VAT 포함 가격입니다.</li>
              </ul>
            </div>
            <div class="footer_line">
              <h5><strong>환불 처리 규정 안내</strong></h5>
              <ol>
                <li>
                  <span>
                    <strong>환불이 가능한 경우</strong>
                    <br />
                    무제한 이용권을 구해하신 후 아래 기준에
                    <strong>모두 해당되실 경우</strong>
                    <br />
                    100% 연장/환불을 진행해드립니다.
                    <span class="ol_li_span">
                      - 시터회원에게 인터뷰 신청 후 수락 or 조율 회신을 1건도 받지 못하신 경우
                      <br />
                      - 시터회원의 인터뷰 지원에 수락 회신을 1건도 하지 않으신 경우
                    </span>
                  </span>
                </li>
                <li style="margin-top: 8px">
                  <span>
                    <strong>환불이 불가능한 경우</strong>
                    <br />
                    무제한 이용권을 구해하신 후 아래 기준에
                    <strong>1개라도 해당되실 경우</strong>
                    <br />
                    100% 연장/환불을 불가합니다.
                    <span class="ol_li_span">
                      - 시터회원에게 인터뷰 신청 후 수락 or 조율 회신을 1건 이상 받으신 경우
                      <br />
                      - 시터회원의 인터뷰 지원에 수락 회신을 1건 이상 하신 경우
                    </span>
                  </span>
                </li>
                <li style="margin-top: 8px">
                  <span>
                    환불 금액은 쿠폰 및 적립금 사용을 제외한 결제 금액만 해당됩니다.
                    <button type="button" class="ol_li_btn">쿠폰/적립금 유의사항 확인하기</button>
                  </span>
                </li>
                <li style="margin-top: 8px">
                  <span>
                    3개월권 및 6개월권은 이미 할인이 적용된 금액으로, 1개월 내
                    <br />
                    연락처를 한 번이라도 받은 경우에 한해 1개월권 원금액을 제외하고
                    <br />
                    나머지 금액에 대해 부분 환불됩니다.
                  </span>
                </li>
                <li style="margin-top: 8px">
                  <span>
                    환불 요청이 접수되면 처리 완료 기간까지 영업일 기준(주말 제외)
                    <br />
                    최대 7일까지 소요될 수 있습니다.
                  </span>
                </li>
              </ol>
            </div>
            <div class="footer_line">
              <h5><strong>환불 불가 안내</strong></h5>
              <ol>
                <li>
                  <span>
                    1개월 무제한 이용권은 서비스 이용을 위한 최소 결제 상품이므로
                    <br />
                    남은 기간에 대한 부분 환불은 불가합니다.
                  </span>
                </li>
                <li style="margin-top: 8px">
                  <span> 맘시터 환불 처리 규정에 부합하지 않은 경우 환불이 불가합니다. </span>
                </li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
