<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %>

<!-- header css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/index_header.css" />

<div id="header">
  <!-- header : 하리-->
  <header>
    <div class="header_wrap col-xs-12">
      <div class="header">
        <div class="flex_row main_menu">
          <!-- 메뉴 모달 열기-->
          <a data-toggle="modal" href="#menu_modal">
            <p><i class="fas fa-bars"> </i></p>
          </a>

          <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/assets/img/logo(1).png" class="logo" />
          </a>
        </div>
        <div class="flex_row">
          <a href="${pageContext.request.contextPath}/join/join.do"><button id="header_join" class="join">가입하기</button></a>
          <i id="header_search" class="fas fa-search header_search_btn"></i>
        </div>
      </div>
    </div>
    <div class="searchbar_wrap" style="display: none">
      <div class="search_block search_sitter"><img src="${pageContext.request.contextPath}/assets/img/header_sittersearch.png" />맘시터 찾기</div>
      <div class="search_block search_job"><img src="${pageContext.request.contextPath}/assets/img/header_jobsearch.png" />일자리 찾기</div>
    </div>
  </header>
  <!-- header end-->

  <!-- modal -->

  <div id="menu_modal" class="modal col-xs-12 fade" data-toggle="tab" tabindex="-1" role="dialog" aria-labelledby="menu_modal_label" aria-hidden="true">
    <!-- modal content-->
    <div class="modal_content col-xs-9">
      <!-- modal header -->
      <div class="modal_group">
        <div class="modal_header">
          <a href="#" id="login_btn"
            ><button type="button" class="modal_btn">
              <p class="login_btn">로그인</p>
            </button></a
          >
          <a href="#" id="join_btn"
            ><button type="button" class="modal_btn">
              <p class="join_btn">회원가입</p>
            </button></a
          >
        </div>
        <!-- modal header end-->

        <!-- modal body-->
        <div class="modal_body">
          <div class="sitter_search">
            <a href="#" id="stsc_btn">
              <img src="${pageContext.request.contextPath}/assets/img/index-sittersearch.png" />
              <p>맘시터 찾기</p>
            </a>
          </div>

          <div class="job_search">
            <a href="#" id="jobsc_btn">
              <img src="${pageContext.request.contextPath}/assets/img/index-jobsearch.png" />
              <p>일자리 찾기</p>
            </a>
          </div>
        </div>
      </div>
      <!-- modal body end-->
      <div class="divider"></div>
      <!-- modal footer -->
      <div class="modal_footer modal_group">
        <a href="#" id="buy_btn">
          <p>이용권 / 지원권 구매</p>
        </a>
        <a href="#" id="intro_btn">
          <p>서비스 소개</p>
        </a>
        <a href="#" id="notice_btn">
          <p>공지사항</p>
        </a>
        <a href="#" id="cus_btn">
          <p>고객센터</p>
        </a>
        <!-- 프론트 테스트용 임시 링크 -->
        <!-- <br />
        <br />
        <p style="color: red">프론트 테스트용 임시 링크</p>
        <a href="#" id="mommp">
          <p>맘 마이페이지</p>
        </a>
        <a href="#" id="stmp">
          <p>시터 마이페이지</p>
        </a>
        <a href="#" id="manpg">
          <p>관리자페이지</p>
        </a> -->
        <!-- 프론트 테스트용 임시 링크 끝-->
      </div>

      <!-- modal footer end -->
    </div>
    <!-- modal content end-->
  </div>
  <!-- modal end -->
</div>

<script>
  $(function () {
    $("#login_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/login/login.do");
    });
    $("#join_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/join/join.do");
    });
    $("#stsc_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/search/sitter_search.do");
    });
    $("#jobsc_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/search/job_search.do");
    });
    $("#intro_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/abu-service/introduce.do");
    });
    $("#buy_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/buy/buy.do");
    });
    $("#notice_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/customer/notice_site.do");
    });
    $("#cus_btn").click(function (e) {
      location.replace("${pageContext.request.contextPath}/customer/customer_center.do");
    });
    // 프론트 테스트용 임시 링크
    // $("#mommp").click(function (e) {
    //   location.replace("${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do");
    // });
    // $("#stmp").click(function (e) {
    //   location.replace("${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do");
    // });
    // $("#manpg").click(function (e) {
    //   location.replace("${pageContext.request.contextPath}/admin/admin_login.do");
    // });
    //프론트 테스트용 임시 링크 끝
  });
</script>
<script>
  //검색바 클릭시 밑에 찾기 아이콘
  $(function () {
    $("#header_search").on("click", function () {
      $(".searchbar_wrap").slideToggle(300);
    });

    $(".search_sitter").click(function () {
      location.href = "${pageContext.request.contextPath}/search/sitter_search.do";
    });
    $(".search_job").click(function () {
      location.href = "${pageContext.request.contextPath}/search/job_search.do";
    });
  });
</script>
