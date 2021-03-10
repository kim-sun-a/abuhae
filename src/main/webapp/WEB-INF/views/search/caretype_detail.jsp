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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/caretype_detail.css" />

    <style type="text/css"></style>
  </head>

  <body>
    <div class="container-fluid">
      <div class="row">
        <!-- xs-12로 모바일 맞춤 -->
        <div class="col-xs-12">
          <!-- caretype -->
          <div id="caretype" class="d">
            <!--header-->
            <div class="ct_header">
              <a href="${pageContext.request.contextPath}/search/sitter_search.do">
                <i class="fas fa-chevron-left"></i>
              </a>
              <h2>돌봄유형 상세 설명</h2>
            </div>

            <!--header end-->
            <div class="sitter_ct_wrap">
              <div>
                <div class="title_group content_group">
                  <p>2~10세 정기 돌봄</p>
                </div>

                <div class="ct_item">
                  <div class="icon">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_School_3628460.png" />
                  </div>
                  <div class="ct_text_group">
                    <p class="main_text">주 5일 등하원</p>
                    <div>
                      <p class="sub_text">주 5일, 2~10세 아이가 기관에 가기 전후 하루 3~5시간정도</p>
                      <p class="sub_text">책임지고 돌봐줍니다. 등하원을 기본으로 등원 전이나 하원 후에</p>
                      <p class="sub_text">밥챙겨주기, 씻기기, 놀아주기 등의 활동을 합니다.</p>
                    </div>
                  </div>
                </div>
                <div class="ct_item">
                  <div class="icon">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_Toddler toy_768159.png" />
                  </div>
                  <div class="ct_text_group">
                    <p class="main_text">놀이/학습시터</p>
                    <div>
                      <p class="sub_text">시터님의 특기를 활용해 2~10세의 아이와 놀이 및</p>
                      <p class="sub_text">학습적인 시간을 보내며 돌봐줍니다.</p>
                      <p class="sub_text">주 1~4회 정기적, 혹은 단기로도 활동합니다.</p>
                    </div>
                  </div>
                </div>
              </div>
              <div>
                <div class="title_group content_group">
                  <p>신생아/영아 정기 돌봄</p>
                </div>
                <div class="ct_item">
                  <div class="icon">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_mom and daughter_3585284.png" />
                  </div>
                  <div class="ct_text_group">
                    <p class="main_text">풀타임</p>
                    <div>
                      <p class="sub_text">0~24개월 아이를 먹이고, 재우고, 놀아주며 돌봐줍니다.</p>
                      <p class="sub_text">주 5일, 하루 8~10시간 동안 책임지고 돌보며</p>
                      <p class="sub_text">최근에 신생아/영아를 돌본 경험이 있고</p>
                    </div>
                    <p class="sub_text">아이 관련 가사활동도 가능합니다.</p>
                  </div>
                </div>
                <div class="ct_item">
                  <div class="icon">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_help_2402270.png" />
                  </div>
                  <div class="ct_text_group">
                    <p class="main_text">보조</p>
                    <div>
                      <p class="sub_text">0~24개월 아이를 보호자와 함께 또는 혼자 돌봅니다.</p>
                      <p class="sub_text">최근에 신생아/영아를 돌본 경험이 있으며</p>
                      <p class="sub_text">주 1~4회 정기적, 혹은 단기로도 활동합니다.</p>
                    </div>
                  </div>
                </div>
              </div>
              <div>
                <div class="title_group content_group">
                  <p>긴급/단기 돌봄</p>
                </div>

                <div class="ct_item">
                  <div class="icon siren">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_Siren_3116161.png" />
                  </div>
                  <div class="ct_text_group">
                    <p class="main_text">긴급/단기</p>
                    <div>
                      <p class="sub_text">1~2회 또는 짧은 기간 동안만 아이를 돌봐줍니다.</p>
                      <p class="sub_text">시터 프로필에 명시된 돌봄 가능한 아이 연령과</p>
                      <p class="sub_text">활동 및 스케줄에 맞춰 활동합니다.</p>
                    </div>
                  </div>
                </div>
              </div>
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
  </body>
</html>
