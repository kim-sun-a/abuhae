<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>아이를부탁해</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />

    <!-- fontawesome(글리피콘) 적용 -->
    <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>

    <!-- css 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/caretype_sitter.css" />

    <style type="text/css"></style>
  </head>

  <body>
    <div class="container">
      <div class="row">
        <!-- xs-12로 모바일 맞춤 -->
        <div class="container-fluid col-xs-12">
          <!-- caretype -->
          <div id="caretype" class="">
            <!--header-->
            <div class="ct_header">
              <a href="${pageContext.request.contextPath}/search/sitter_search.do">
                <i class="fas fa-chevron-left"></i>
              </a>
              <h2>돌봄유형 선택</h2>
            </div>
            <!--header end-->
            <div class="sct_wrap">
              <div class="sitter_ct_wrap">
                <div class="title_group">
                  <div class="title">
                    <span class="title_text">어떤 돌봄이 필요하세요?</span>
                    <a href="${pageContext.request.contextPath}/search/caretype_detail.do"><i class="fas fa-question-circle"></i></a>
                  </div>
                  <p class="title_desc">돌봄유형을 선택하시면, 맞춤 시터를 보여드려요</p>
                </div>
                <div>
                  <div class="title_group content_group">
                    <p>2~10세 정기 돌봄</p>
                  </div>
                  <div class="ct_group">
                    <div class="ct_item">
                      <div class="icon">
                        <img src="${pageContext.request.contextPath}/assets/img/noun_School_3628460.png" />
                      </div>
                      <div class="ct_text_group">
                        <p class="main_text">주 5일 등하원</p>
                        <p class="sub_text">기관 전/후 등하원 및 돌봄</p>
                      </div>
                    </div>
                    <div class="ct_item">
                      <div class="icon">
                        <img src="${pageContext.request.contextPath}/assets/img/noun_Toddler toy_768159.png" />
                      </div>
                      <div class="ct_text_group">
                        <p class="main_text">놀이/학습시터</p>
                        <p class="sub_text">주 1~4일 또는 짧은 시간</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="title_group content_group">
                    <p>신생아/영아 정기 돌봄</p>
                  </div>
                  <div class="ct_group">
                    <div class="ct_item">
                      <div class="icon">
                        <img src="${pageContext.request.contextPath}/assets/img/noun_mom and daughter_3585284.png" />
                      </div>
                      <div class="ct_text_group">
                        <p class="main_text">풀타임</p>
                        <p class="sub_text">주 5일 평균 8시간 이상</p>
                      </div>
                    </div>
                    <div class="ct_item">
                      <div class="icon">
                        <img src="${pageContext.request.contextPath}/assets/img/noun_help_2402270.png" />
                      </div>
                      <div class="ct_text_group">
                        <p class="main_text">보조</p>
                        <p class="sub_text">주 1~4일 또는 짧은 시간</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="title_group content_group">
                    <p>긴급/단기 돌봄</p>
                  </div>
                  <div class="ct_group">
                    <div class="ct_item">
                      <div class="icon siren">
                        <img src="${pageContext.request.contextPath}/assets/img/noun_Siren_3116161.png" />
                      </div>
                      <div class="ct_text_group">
                        <p class="main_text">긴급/단기</p>
                        <p class="sub_text">하루 또는 며칠만 급하게 필요할 때</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <button type="button" class="all_btn">모든 돌봄유형 보기</button>
            </div>
          </div>
          <!-- caretype end -->
        </div>
        <!--end row-->
      </div>
    </div>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(function () {
        $(".icon").click(function (e) {
          $(this).addClass("selected_icon");
          location.href = "${pageContext.request.contextPath}/search/sitter_search.do";
        });

        $(".all_btn").click(function (e) {
          e.preventDefault();
          location.href = "${pageContext.request.contextPath}/search/sitter_search.do";
        });
      });
    </script>
  </body>
</html>
