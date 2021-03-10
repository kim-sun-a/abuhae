<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <% %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sitter_ticket.css" />
  </head>

  <body>
    <div id="app">
      <div class="container">
        <div class="sitter_buy_area col-xs-12">
          <div>
            <div class="sitter_buy_title">
              <div class="sitter_title">
                <strong>맘시터 지원권</strong>
              </div>
              <div class="sitter_buy_title_text">
                <div>
                  일자리에 직접 지원하거나
                  <br />무제한으로 수락/조율할 수 있어요!
                </div>
              </div>
            </div>
            <!-- fin. sitter_buy_title -->
            <div class="sitter_buy_box">
              <div class="sitter_buy_box_left col-xs-6" id="button_30ea">
                <div class="title_block">
                  <p>베이직</p>
                </div>
                <div class="img_block">
                  <span><i class="fas fa-ticket-alt fa-5x"></i></span>
                </div>
                <div class="apply_block">
                  <p>지원 횟수</p>
                  <p class="month30ea">월 30회</p>
                  <p class="month_desc">(하루 1회)</p>
                </div>
                <div class="price_block">
                  <p>적립금/쿠폰 사용불가</p>
                  <p>1개월 4,900원</p>
                </div>
                <div class="sale_block">
                  <p>0% 절약!</p>
                </div>
              </div>
              <div class="sitter_buy_box_right col-xs-6" id="button_300ea">
                <div class="title_block">
                  <p>프리미엄</p>
                </div>
                <div class="img_block" id="img_block_300ea">
                  <span><i class="fas fa-ticket-alt fa-5x"></i></span>
                </div>
                <div class="apply_block">
                  <p>지원 횟수</p>
                  <p class="month300ea">월 300회</p>
                  <p class="month_desc">(하루 10회)</p>
                </div>
                <div class="price_block">
                  <p id="price_block">49,000원</p>
                  <p>1개월 29,900원</p>
                </div>
                <div class="sale_block_vip">
                  <p>-39% 절약!</p>
                </div>
              </div>
            </div>
            <!-- fin. sitter_buy_box -->
            <button type="button" class="buy_btn">
              <p class="buy_btn_style">구매하기</p>
            </button>
            <button type="button" class="buy_btn_other">
              <p class="buy_btn_style">자세히 보기</p>
            </button>
            <div class="sitter_buy_desc_area">
              <div class="product_title">
                <span class="product_style">
                  <strong>맘시터 안전 보험 (3개월)</strong>
                </span>
              </div>
              <div class="sitter_buy_title_text">
                <div>
                  아이 돌보다가 안전 사고라도
                  <br />날까봐 불안하셨나요?
                </div>
              </div>
            </div>
          </div>
          <!-- fin. sitter_buy_desc_area -->
          <div class="product_block">
            <div id="thumbnail">
              <img src="${pageContext.request.contextPath}/img/safe.png" width="50" height="50" alt="보험 썸네일" />
            </div>
            <div class="product_content">
              <div class="product_name">맘시터 안전 보험 (3개월)</div>
              <div class="product_price">9,500원</div>
              <div class="product_desc">
                <strong>대인 최대 1억 2천만원 한도, 대물 최대 1천만원 한도 보장</strong>
                (대인, 대물 자기 부담금 30만원) 맘시터를 통해 매칭되어 아이를 돌보다가 나의 과실로 인해 발생하는 제 3자 (부모회원, 돌봤던 아이 등)의 피해(손해)를 KB손해보험에서 보장합니다.
              </div>
              <div class="product_btn">
                <button type="button" class="more_btn">자세히 보기</button>
                <button type="button" class="product_buy_btn">구매하기</button>
              </div>
            </div>
          </div>
        </div>
        <!-- fin. sitter_buy_area -->
      </div>
    </div>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
      $(function () {
        $("#button_30ea").click(function () {
          $("#button_30ea").css({
            border: "2px solid #ff7000",
            "background-color": "#fff",
            "border-radius": "8px",
          });
          $("#button_300ea").css({
            border: "none",
            "background-color": "#fff",
          });
        });

        $("#button_300ea").click(function () {
          $("#button_300ea").css({
            border: "2px solid #ff7000",
            "background-color": "#fff",
            "border-radius": "8px",
          });
          $("#button_30ea").css({
            border: "none",
            "background-color": "#fff",
          });
        });
      });
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--slick slider-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"></script>
  </body>
</html>
