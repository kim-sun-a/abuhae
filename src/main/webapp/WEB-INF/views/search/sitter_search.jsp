<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no shrink-to-fit=no" />
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

    <!-- animaition 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" />

    <!-- sitter_search.css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/sitter_search.css" />

    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <!-- ajax Helper -->
    <script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/ajax/ajax_helper.css" />

    <!-- Handlebar CDN 참조 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <!-- sweetalert 사용 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript">
      function random(n1, n2) {
        return parseInt(Math.random() * (n2 - n1 + 1)) + n1;
      }

      $(function () {
        // 헤더 메뉴 load처리 1224 하리
        // $("#menu").load("/ezen-android2020-2/index_header.html"); - 210124 include 변경

        // 시터 타이틀 랜덤 출력 0206 하리 (반복문 돌아서 안되는듯..)
        let num = random(0, 3);
        let title = ["믿음직한 시터", "든든한 시터", "약속된 시터", "보장된 시터"];
        $(document).on("scroll", ".sitter_item_group", function () {
          $(".cert_text").html(title[random(0, 3)]);
        });
      });
    </script>
  </head>

  <!--grid 사용시 col-xs-nn 사용-->
  <body>
    <div id="app" data-login="${login.momno}">
      <div class="container">
        <div id="menu">
          <c:if test="${isLogin ==true }">
            <c:choose>
              <c:when test="${fn:contains(loginType, 'M')}"> <%@ include file="../index_header_login_mom.jsp"%> </c:when>
              <c:when test="${fn:contains(loginType, 'S')}"> <%@ include file="../index_header_login_sitter.jsp"%> </c:when>
            </c:choose>
          </c:if>
          <c:if test="${isLogin == null }"> <%@ include file="../index_header.jsp"%> </c:if>
        </div>
        <!-- search -->
        <div id="search">
          <div class="container-fluid col-xs-12">
            <div class="search_wrap">
              <!-- location modal -->
              <div id="location_modal" class="modal col-xs-12" data-toggle="tab" tabindex="-1" role="dialog" aria-labelledby="location_label" aria-hidden="true">
                <div class="location_header">
                  <button class="reset" type="reset" id="reset_loc">
                    <i class="fas fa-undo-alt"></i>
                  </button>
                  <h1>돌봄 지역</h1>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
                <!--지역 선택-->
                <div id="location_box" method="get">
                  <!--시,도-->
                  <div class="location_group" id="si">
                    <div>
                      <button class="loc_btn">서울특별시</button>
                    </div>
                    <div>
                      <button class="loc_btn">경기도</button>
                    </div>
                    <div>
                      <button class="loc_btn">인천광역시</button>
                    </div>
                    <div>
                      <button class="loc_btn">부산광역시</button>
                    </div>
                    <div>
                      <button class="loc_btn">대전광역시</button>
                    </div>
                    <div>
                      <button class="loc_btn">대구광역시</button>
                    </div>
                    <div>
                      <button class="loc_btn">울산광역시</button>
                    </div>
                    <div>
                      <button class="loc_btn">세종특별자치시</button>
                    </div>
                    <div>
                      <button class="loc_btn">광주광역시</button>
                    </div>
                    <div>
                      <button class="loc_btn">강원도</button>
                    </div>
                    <div>
                      <button class="loc_btn">충청북도</button>
                    </div>
                    <div>
                      <button class="loc_btn">충청남도</button>
                    </div>
                    <div>
                      <button class="loc_btn">경상북도</button>
                    </div>
                    <div>
                      <button class="loc_btn">경상남도</button>
                    </div>
                    <div>
                      <button class="loc_btn">전라북도</button>
                    </div>
                    <div>
                      <button class="loc_btn">전라남도</button>
                    </div>
                    <div>
                      <button class="loc_btn">제주특별자치도</button>
                    </div>
                  </div>
                  <!--end 시-->
                  <!--구-->
                  <div class="location_group" id="gu">
                    <div class="hide_content">
                      <div>
                        <button>강남구</button>
                      </div>
                      <div>
                        <button>강동구</button>
                      </div>
                      <div>
                        <button>강북구</button>
                      </div>
                      <div>
                        <button>강서구</button>
                      </div>
                      <div>
                        <button>관악구</button>
                      </div>
                      <div>
                        <button>광진구</button>
                      </div>
                      <div>
                        <button>구로구</button>
                      </div>
                      <div>
                        <button>금천구</button>
                      </div>
                      <div>
                        <button>노원구</button>
                      </div>
                      <div>
                        <button>도봉구</button>
                      </div>
                      <div>
                        <button>동대문구</button>
                      </div>
                      <div>
                        <button>동작구</button>
                      </div>
                      <div>
                        <button>마포구</button>
                      </div>
                      <div>
                        <button>서대문구</button>
                      </div>
                      <div>
                        <button>서초구</button>
                      </div>
                      <div>
                        <button>성동구</button>
                      </div>
                      <div>
                        <button>성북구</button>
                      </div>
                      <div>
                        <button>송파구</button>
                      </div>
                      <div>
                        <button>양천구</button>
                      </div>
                      <div>
                        <button>영등포구</button>
                      </div>
                      <div>
                        <button>용산구</button>
                      </div>
                      <div>
                        <button>은평구</button>
                      </div>
                      <div>
                        <button>종로구</button>
                      </div>
                      <div>
                        <button>중구</button>
                      </div>
                      <div>
                        <button>중랑구</button>
                      </div>
                    </div>
                  </div>
                  <!--end 구-->
                  <!--동-->
                  <div class="location_group" id="dong"></div>
                  <!--end 동-->
                </div>
                <!-- col-xs-12 end -->
              </div>
              <!-- location modal end -->

              <!-- activity type modal -->
              <div id="activity_type_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="activity_type_modal_Label" aria-hidden="true">
                <!--modal header-->

                <div class="modal_header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                  </button>
                  <h2>원하는 활동 선택</h2>
                  <button id="act_apply" class="apply_btn" type="button">적용</button>
                </div>

                <!--modal header end-->
                <!--modal content-->
                <div class="modal_content">
                  <!--돌봄 유형 선택-->
                  <div class="want_act_box">
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check1" class="act_btn" name="check_ab" value="innerplay" data-act="innerplay" />
                        <label for="check1" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/innerplayicon_n.png" />
                          <div class="want_text">실내놀이</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check2" class="act_btn" name="check_ab" value="guide" data-act="guide" />
                        <label for="check2" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/guideicon_n.png" />
                          <div class="want_text">등하원돕기</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check3" class="act_btn" name="check_ab" value="read" data-act="read" />
                        <label for="check3" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/readicon_n.png" />
                          <div class="want_text">책읽기</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check4" class="act_btn" name="check_ab" value="outside" data-act="outside" />
                        <label for="check4" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/ousideicon_n.png" />
                          <div class="want_text">야외활동</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check5" class="act_btn" name="check_ab" value="korean" data-act="korean" />
                        <label for="check5" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/koreanicon_n.png" />
                          <div class="want_text">한글놀이</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check6" class="act_btn" name="check_ab" value="english" data-act="english" />
                        <label for="check6" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/englishicon_n.png" />
                          <div class="want_text">영어놀이</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check7" class="act_btn" name="check_ab" value="study" data-act="study" />
                        <label for="check7" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/studyicon_n.png" />
                          <div class="want_text">학습지도</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check8" class="act_btn" name="check_ab" value="sport" data-act="sport" />
                        <label for="check8" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/ballicon_n.png" />
                          <div class="want_text">체육놀이</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check9" class="act_btn" name="check_ab" value="simple_cleaning" data-act="simple_cleaning" />
                        <label for="check9" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/cleanicon_n.png" />
                          <div class="want_text">간단 청소</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check10" class="act_btn" name="check_ab" value="eat" data-act="eat" />
                        <label for="check10" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/eaticon_n.png" />
                          <div class="want_text">밥 챙겨주기</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check11" class="act_btn" name="check_ab" value="do_dish" data-act="do_dish" />
                        <label for="check11" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/dishicon_n.png" />
                          <div class="want_text">간단 설거지</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check12" class="act_btn" name="check_ab" value="long_move_in" data-act="long_move_in" />
                        <label for="check12" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/longhouseicon_n.png" />
                          <div class="want_text">장기입주</div></label
                        >
                      </div>
                    </div>
                    <div class="want_btn">
                      <div>
                        <input type="checkbox" id="check13" class="act_btn" name="check_ab" value="short_move_in" data-act="short_move_in" />
                        <label for="check13" class="want_label"
                          ><img class="want_img" src="${pageContext.request.contextPath}/assets/img/houseicon_n.png" />
                          <div class="want_text">단기입주</div></label
                        >
                      </div>
                    </div>
                  </div>
                  <!--end modal content -->
                  <!--modal footer-->
                  <div class="modal_footer">
                    <button id="act_reset" class="reset" type="reset">
                      <i class="fas fa-undo-alt"></i>
                      <h2>초기화</h2>
                    </button>
                  </div>
                  <!--modal footer end-->
                </div>
                <!--end modal dialog-->
              </div>
              <!-- activity type modal end -->

              <!-- detail search modal -->
              <div id="sitter_search_detail_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="sitter_search_detail_modal_Label" aria-hidden="true" method="get">
                <div class="modal_header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                  </button>
                  <h2>상세검색</h2>
                  <button id="detail_apply" class="apply_btn" type="subimt">적용</button>
                </div>
                <!--modal header end-->
                <!--modal content-->
                <div class="modal_content">
                  <!-- 아이 나이 -->
                  <div class="children_age_wrap">
                    <h4>아이 나이</h4>
                    <div class="age_line">
                      <button class="ages" data-age="got_baby">
                        <div style="margin-bottom: -10px">
                          <i class="fas fa-baby fa-3x"></i>
                        </div>
                        <br />
                        <span>신생아</span>
                      </button>
                      <button class="ages" data-age="baby">
                        <div style="margin-bottom: -10px">
                          <i class="fas fa-baby-carriage fa-3x"></i>
                        </div>
                        <br />
                        <span>영아</span>
                      </button>
                      <button class="ages" data-age="children">
                        <div style="margin-bottom: -10px">
                          <i class="fas fa-child fa-3x"></i>
                        </div>
                        <br />
                        <span>유아</span>
                      </button>
                      <button class="ages" data-age="element">
                        <div style="margin-bottom: -10px">
                          <i class="fas fa-school fa-3x"></i>
                        </div>
                        <br />
                        <span>초등학생</span>
                      </button>
                    </div>
                  </div>
                  <hr />
                  <!-- 돌봄 요일 -->
                  <div class="care_day_wrap">
                    <h4>돌봄 요일</h4>
                    <div class="care_day_group">
                      <button class="care_day" data-day="mon"><div>월</div></button>
                      <button class="care_day" data-day="tue"><div>화</div></button>
                      <button class="care_day" data-day="wed"><div>수</div></button>
                      <button class="care_day" data-day="thu"><div>목</div></button>
                      <button class="care_day" data-day="fri"><div>금</div></button>
                      <button class="care_day" data-day="sat"><div>토</div></button>
                      <button class="care_day" data-day="sun"><div>일</div></button>
                    </div>
                  </div>
                  <hr />
                  <!-- 맘시터 유형 -->
                  <div class="sitter_type_wrap">
                    <h4>맘시터 유형</h4>
                    <div class="sitter_type_group">
                      <div>
                        <button class="sitter_type" data-sttype="mom">
                          <div>
                            <i class="fas fa-circle"></i>
                            <span class="sitter_type_content">엄마 맘시터</span>
                          </div>
                        </button>
                        <button class="sitter_type" data-sttype="teacher">
                          <div>
                            <i class="fas fa-circle"></i>
                            <span class="sitter_type_content">선생님 맘시터</span>
                          </div>
                        </button>
                      </div>
                      <div>
                        <button class="sitter_type" data-sttype="student">
                          <div>
                            <i class="fas fa-circle"></i>
                            <span class="sitter_type_content">대학생 맘시터</span>
                          </div>
                        </button>
                        <button class="sitter_type" data-sttype="normal">
                          <div>
                            <i class="fas fa-circle"></i>
                            <span class="sitter_type_content">일반 맘시터</span>
                          </div>
                        </button>
                      </div>
                    </div>
                  </div>
                  <hr />
                  <!-- 원하는 맘시터 나이대 -->
                  <div class="sitter_age">
                    <h4>원하는 맘시터 나이대</h4>
                    <div class="age_range">
                      <div class="want_age_box">
                        <input type="checkbox" value="20" class="want_age" name="want_age" id="20age" data-wtage="20" /> <label for="20age">20대</label>
                        <input type="checkbox" value="30" class="want_age" name="want_age" id="30age" data-wtage="30" /> <label for="30age">30대</label>
                        <input type="checkbox" value="40" class="want_age" name="want_age" id="40age" data-wtage="40" /> <label for="40age">40대</label>
                        <input type="checkbox" value="50" class="want_age" name="want_age" id="50age" data-wtage="50" /> <label for="50age">50대</label>
                        <input type="checkbox" value="60" class="want_age" name="want_age" id="60age" data-wtage="60" /> <label for="60age">60대</label>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end modal content -->
                <!--modal footer-->
                <div class="modal_footer">
                  <button id="reset_detail" class="reset" type="reset">
                    <i class="fas fa-undo-alt"></i>
                    <h2>초기화</h2>
                  </button>
                </div>
                <!--modal footer end-->
              </div>
              <!-- detail search modal end -->

              <div id="like_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="like_modal_label" aria-hidden="true">
                <!-- .modal-dialog -->
                <div class="modal-dialog">
                  <!-- .modal-content -->
                  <div class="modal-content">
                    <div id="modal-body">
                      <p style="text-align: center; padding-top: 10px; font-weight: bold">찜하기 완료!</p>
                      <p style="text-align: center; padding-top: 10px">마이페이지 > 찜한 맘시터에서 확인할 수 있습니다.</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal" id="modal_ok" style="text-align: center">확인</button>
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- modal end --------------------------------------------------------------------------------------------------------------------->

              <div class="search_filter_wrap">
                <div class="search_filter_group">
                  <div class="location_filter">
                    <a data-toggle="modal" href="#location_modal">
                      <div>
                        <i class="fas fa-search"></i>
                        <p id="full_location">돌봄 지역을 선택해주세요</p>
                      </div>
                    </a>
                  </div>
                  <!-- <div class="caretype_filter">
                    <a href="${pageContext.request.contextPath}/search/caretype_sitter.do">
                      <img src="${pageContext.request.contextPath}/assets/img/p-search-caretype (1).png" />
                      <p>모든 돌봄유형</p>
                    </a>
                  </div> -->
                </div>
              </div>
              <div class="activity_type_wrap">
                <a data-toggle="modal" href="#activity_type_modal">
                  <div class="abtn_wrap">
                    <div class="activity_type_btn_group">
                      <input type="checkbox" id="act_type1" class="activity_type_btn" value="innerplay" />
                      <label for="act_type1" class="act_label">실내놀이 </label>
                      <input type="checkbox" id="act_type2" class="activity_type_btn" value="guide" />
                      <label for="act_type2" class="act_label">등하원 돕기 </label>
                      <input type="checkbox" id="act_type3" class="activity_type_btn" value="read" />
                      <label for="act_type3" class="act_label">책 읽기 </label>
                      <input type="checkbox" id="act_type4" class="activity_type_btn" value="outside" />
                      <label for="act_type4" class="act_label">야외활동 </label>
                      <input type="checkbox" id="act_type5" class="activity_type_btn" value="korean" />
                      <label for="act_type5" class="act_label">한글놀이 </label>
                      <input type="checkbox" id="act_type6" class="activity_type_btn" value="english" />
                      <label for="act_type6" class="act_label">영어놀이 </label>
                      <input type="checkbox" id="act_type7" class="activity_type_btn" value="study" />
                      <label for="act_type7" class="act_label">학습지도 </label>
                      <input type="checkbox" id="act_type8" class="activity_type_btn" value="sport" />
                      <label for="act_type8" class="act_label">체육놀이 </label>
                      <input type="checkbox" id="act_type9" class="activity_type_btn" value="simple_cleaning" />
                      <label for="act_type9" class="act_label">간단청소 </label>
                      <input type="checkbox" id="act_type10" class="activity_type_btn" value="eat" />
                      <label for="act_type10" class="act_label">밥챙겨주기 </label>
                      <input type="checkbox" id="act_type11" class="activity_type_btn" value="do_dish" />
                      <label for="act_type11" class="act_label">간단설거지 </label>
                      <input type="checkbox" id="act_type12" class="activity_type_btn" value="long_move_in" />
                      <label for="act_type12" class="act_label">장기입주 </label>
                      <input type="checkbox" id="act_type13" class="activity_type_btn" value="short_move_in" />
                      <label for="act_type13" class="act_label">단기입주 </label>
                    </div>
                    <button class="tab_index"><img src="${pageContext.request.contextPath}/assets/img/p-search-activity (1).png" /></button>
                  </div>
                </a>
              </div>
              <div class="order_selector_group">
                <div id="total" class="total">총 ${st_total}명</div>
                <!-- 드롭다운 -->
                <div class="dropdown clearfix order_dropdown">
                  <a id="orderby" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">후기 순 </a><b class="caret"></b>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="orderby">
                    <!-- 아이템 항목 나열 -->
                    <li class="dr_option" role="presentation" data-order="update"><a role="menuitem" tabindex="-1" href="#">프로필 업데이트 순</a></li>
                    <li class="dr_option active" role="presentation" data-order="review"><a role="menuitem" tabindex="-1" href="#">후기 순</a></li>
                    <li class="dr_option" role="presentation" data-order="response"><a role="menuitem" tabindex="-1" href="#">응답률 순</a></li>
                    <li class="dr_option" role="presentation" data-order="lowpay"><a role="menuitem" tabindex="-1" href="#">시급 낮은 순</a></li>
                    <li class="dr_option" role="presentation" data-order="highpay"><a role="menuitem" tabindex="-1" href="#">시급 높은 순</a></li>
                  </ul>
                </div>
                <!-- 드롭다운 end-->
              </div>
              <!-- 카드영역 -->

              <!-- 카드영역 end -->
              <div id="result"></div>
              <div id="result2"></div>

              <div>
                <a data-toggle="modal" href="#sitter_search_detail_modal">
                  <button class="detail_btn">상세 검색</button>
                </a>
              </div>
            </div>
          </div>
        </div>
        <!-- search end-->
      </div>
      <!-- col-xs-12 end -->
    </div>
    <!--row end-->
    <!-- Handlebar 템플릿 코드 -->
    <script id="total-tmpl" type="text/x-handlebars-template">
      <div id="total" class="total">
        총 {{totalCount}}명
      </div>
    </script>
    <script id="sitter-list-tmpl" type="text/x-handlebars-template">
        {{#each item}}
        <div id="order">
          <div id="sitter_item_group" class="sitter_item_group" data-stno="{{sitterno}}">
            <div class="item_header">
              <div class="cert_label">
                <span id="sitter_title" class="cert_text">
                {{#ifCond resino 0}}
                  인증이 없습니다.
                {{else}}
                  믿음직한 시터
                {{/ifCond}}</span>
              </div>
            </div>
            <hr class="divider" />
            <div class="item_body">
              <div class="profile_img_group">
                {{#ifCond isProfile null}}
                <img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" alt="임시프로필"/>
                {{/ifCond}}
                {{#ifCond isProfile 'y'}}
                <img src="{{fileUrl}}" alt="프로필"/>
                {{/ifCond}}
                <div class="responsive_rate_group">
                  <div class="res_text">응답률</div>
                  <div class="res_rate">{{answer}}</div>
                  <div class="res_text">%</div>
                </div>
              </div>
              <div class="profile_info_group">
                <div class="content_row">
                  <div>
                    <div class="user_name">{{name}}</div>
                    <div class="last_update">{{openingdate}}작성</div>
                  </div>
                  <div class="jim_btn">
                    <button class="swapHeart" data-stno="{{sitterno}}">
                      <div class="jim">
                        <span class="glyphicon  glyphicon-heart{{#ifCond findHt 0}}-empty{{/ifCond}}" style="color: #ff7000; font-size: 20px"></span>
                      </div>
                    </button>
                  </div>
                </div>
                <div class="content_row location_group">
                  <span class="location">{{si}}&nbsp{{gu}}&nbsp{{dong}}</span>
                </div>
                <div class="content_row">
                  <div class="user_age">{{birthdate}}세</div>
                  <div class="text_sep"></div>
                  <div class="wanted_pay">희망 시급 {{payment}}원
                  {{#ifCond payment_ok 'Y'}}
                    / 협의가능
                  {{/ifCond}}</div>

                </div>
                <div class="content_row">
                  {{#ifCond rev_rate 0}}
                  <div class="rev_rate">
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                  </div>
                  {{/ifCond}}
                  {{#ifCond rev_rate 1}}
                  <div class="rev_rate">
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                  </div>
                  {{/ifCond}}
                  {{#ifCond rev_rate 2}}
                  <div class="rev_rate">
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                  </div>
                  {{/ifCond}}
                  {{#ifCond rev_rate 3}}
                  <div class="rev_rate">
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                  </div>
                  {{/ifCond}}
                  {{#ifCond rev_rate 4}}
                  <div class="rev_rate">
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
                  </div>
                  {{/ifCond}}
                  {{#ifCond rev_rate 5}}
                  <div class="rev_rate">
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                    <span style="color: #ff7000;"><i class="fas fa-star"></i></span>
                  </div>
                  {{/ifCond}}
                  <span class="review_count">후기 {{rev_count}}개</span>
                </div>
              </div>
            </div>

          </div>
      {{/each}}
    </script>
    <script>
      Handlebars.registerHelper("ifCond", function (v1, v2, options) {
        if (v1 === v2) {
          return options.fn(this);
        }
        return options.inverse(this);
      });
      Handlebars.registerHelper("decimal", function (number) {
        return formatDecimal(number);
      });
      let nowPage = 1; // 현재 페이지의 기본값
      let order = "openingdate";
      let login_momno = $("#app").data("login");
      // 원하는 활동
      let actList = [];
      // 주소 검색
      let full_loc = "";
      let si = "";
      let gu = "";
      let dong = "";
      // 상세검색
      let kidsage = []; // 아이나이
      let caredays = []; // 돌봄 요일
      let time_range = []; // 돌봄 시간대
      let sitter_type = []; // 맘시터 유형
      let want_age = []; // 시터나이

      $(function () {
        /** 원하는 활동 선택 ------------------------------------------------------------------- */
        //활동 버튼 클릭
        $(".act_btn").click(function (e) {
          let cnt = $("input:checked[name='check_ab']").length;

          if (cnt < 4) {
            //버튼 클릭시 text 색 변경
            $(this).next().find(".want_text").toggleClass("select_text");
            //버튼 클릭시 이미지 URL 변경
            //url 가져오기
            let img_url = $(this).next().find(".want_img").attr("src");
            let indeximg = img_url.indexOf("_n"); //잘라서 _n이 있는지 확인
            if (indeximg > -1) {
              let img_src = img_url.replace(/_n/, "_s");
              $(this).next().find(".want_img").attr("src", img_src);
            } else {
              let img_src = img_url.replace(/_s/, "_n");
              $(this).next().find(".want_img").attr("src", img_src);
            }
          } else {
            alert("선택은 3개까지 가능합니다.");
            // 이미지 찾기
            let $img = $(".want_img");
            // 이미지 길이
            let length = $img.length;
            // console.log(length);

            for (let i = 0; i < length; i++) {
              let img_url = $img.eq(i).attr("src");
              let img_src = img_url.replace(/_s/, "_n");
              $(".want_img").eq(i).attr("src", img_src);
            }
            $(".act_btn").prop("checked", false);
            $(".want_text").removeClass("select_text");
            $(".act_label").removeClass("select_act_type");
            $(".act_label").removeClass("unselect_act_type");
          }
        });

        $(".act_btn").change(function change_btn(e) {
          e.preventDefault();
          const checked = $(".act_btn:checked");
          const act_btn = $(".activity_type_btn");
          const result1 = [];
          const result2 = [];

          for (let i = 0; i < checked.length; i++) {
            result1.push($(checked[i]).val());
          }

          console.log(result1);

          for (let i = 0; i < act_btn.length; i++) {
            result2.push($(act_btn[i]).val());
          }

          //console.log(result2);

          for (let i = 0; i < result1.length; i++) {
            for (let j = 0; j < result2.length; j++) {
              if (result1[i] == result2[j]) {
                $(".act_label").eq(j).addClass("select_act_type");
              }
            }
          }
          //console.log($(".act_label").eq(j).hasClass("select_act_type"));
          //활동 버튼 반영 1221 하리
          $("#act_apply").click(function (e) {
            e.preventDefault();
            $("#activity_type_modal").modal("hide");
            const act_btn = $(".activity_type_btn");
            const result2 = [];

            for (let i = 0; i < act_btn.length; i++) {
              result2.push($(act_btn[i]).val());
            }

            for (let i = 0; i < result2.length; i++) {
              if (!$(".act_label").eq(i).hasClass("select_act_type")) {
                $(".act_label").eq(i).addClass("unselect_act_type");
              }
            }

            let result3 = [];

            $("input[name=check_ab]:checked").each(function (i) {
              result3.push($(this).val());
            });

            console.log(result3);
            actList = result3;
            console.log(actList);
            // 검색 조건은 GET 파라미터로 전송한다.
            $.get(
              "${pageContext.request.contextPath}/search/sitter_search",
              {
                actList: actList,
              },
              function (json) {
                let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
                let template = Handlebars.compile(source); // 템플릿 코드 컴파일
                let result = template(json); // 템플릿 컴파일 결과물에 json 전달
                $("#result").empty(); // 결과물 초기화
                $("#result2").empty(); // 결과물 초기화
                $("#result").append(result); // 최종 결과물을 추가한다

                let total = $("#total-tmpl").html(); // 템플릿 코드 가져오기
                let tt_template = Handlebars.compile(total); // 템플릿 코드 컴파일
                let tt_result = tt_template(json); // 템플릿 컴파일 결과물에 json 전달
                $("#total").html(tt_result); // 최종 결과물을 추가한다
              }
            );
          });

          // 리셋 버튼 0109 하리
          $("#act_reset").click(function (e) {
            e.preventDefault();

            // 이미지 찾기
            let $img = $(".want_img");
            // 이미지 길이
            let length = $img.length;
            // console.log(length);

            for (let i = 0; i < length; i++) {
              let img_url = $img.eq(i).attr("src");
              let img_src = img_url.replace(/_s/, "_n");
              $(".want_img").eq(i).attr("src", img_src);
            }

            $(".act_btn").prop("checked", false);
            $(".want_text").removeClass("select_text");
            $(".act_label").removeClass("select_act_type");
            $(".act_label").removeClass("unselect_act_type");
          });
        });

        $(".activity_type_wrap").click(function (e) {
          $(".act_label").removeClass("select_act_type");
          $(".act_label").removeClass("unselect_act_type");
          // 이미지 찾기
          let $img = $(".want_img");
          // 이미지 길이
          let length = $img.length;
          // console.log(length);

          for (let i = 0; i < length; i++) {
            let img_url = $img.eq(i).attr("src");
            let img_src = img_url.replace(/_s/, "_n");
            $(".want_img").eq(i).attr("src", img_src);
          }

          $(".act_btn").prop("checked", false);
          $(".want_text").removeClass("select_text");
        });
        /** 주소 선택 모달 ------------------------------------------------------------------- */
        //시 클릭했을 때
        $(".loc_btn").on("click", function (e) {
          e.preventDefault();
          let select = $(this).hasClass("select_location");
          //선택이 안되어있을때
          if (select == false) {
            //선택이 되어있는 요소 탐색
            let loc = $("#si").find("button").removeClass("select_loaction");
            //console.log(loc);
            $(this).addClass("select_loaction");
            si = "";
            si += $(this).html();
            //시 선택하면 gu 보이게
            $("#gu>div").removeClass("hide_content");
            $("#gu button").removeClass("hide_content");
            $("#gu>div").addClass("show_content");
          }
        });
        //구 클릭했을 때
        $("#gu button").on("click", function (e) {
          e.preventDefault();
          let html = "";
          gu = $(this).html();
          //console.log(gu);
          let select = $(this).hasClass("select_location");
          if (select == false) {
            let loc = $("#gu").find("button").removeClass("select_loaction hide_content");
            $(this).addClass("select_loaction");
            gu = "";
            gu += $(this).html();
          }
          // 로컬의 JSON 파일 읽어오기 0224 hari
          // 스프링 프로젝트에서 설정한 리소스 폴더에서만 가져올 수 있다. 다른 폴더에서는 안됨
          $.getJSON("${pageContext.request.contextPath}/assets/location.json", function (loc) {
            //console.log(loc[gu]);
            // JSON의 value가 array일 경우 ['key']로 전체를 읽어올 수 있다.
            let dong = loc[gu];
            html += '<div class="hide_content">';
            for (let i = 0; i < dong.length; i++) {
              html += "<div><button class='dong_btn'>";
              html += dong[i];
              html += "</button></div>";
            }
            html += "</div>";
            //console.log(html);
            $("#dong").empty();
            $("#dong").append(html);
            //선택이 안되어있을때
            if (select == false) {
              //선택이 되어있는 요소 탐색
              // let loc = $("#gu").find("button").removeClass("select_loaction hide_content");
              //console.log(loc);
              $(this).addClass("select_loaction");
              //구 선택하면 동 보이게
              $("#dong>div").removeClass("hide_content");
              $("#dong>div").addClass("show_content");
            }
          });
        });

        //동 클릭했을때
        $(document).on("click", ".dong_btn", function (e) {
          e.preventDefault();
          dong = "";
          dong += $(this).html();
          full_loc = si + " " + gu + " " + dong;
          $("#full_location").html(full_loc);
          console.log(full_loc);
          $("#location_modal").modal("hide");
          $.get(
            "${pageContext.request.contextPath}/search/sitter_search/",
            {
              si: si, // 시
              gu: gu, // 구
              dong: dong, // 동
            },
            function (json) {
              let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
              let template = Handlebars.compile(source); // 템플릿 코드 컴파일
              let result = template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#result").empty(); // 결과물 초기화
              $("#result2").empty(); // 결과물 초기화
              $("#result").append(result); // 최종 결과물을 추가한다

              let total = $("#total-tmpl").html(); // 템플릿 코드 가져오기
              let tt_template = Handlebars.compile(total); // 템플릿 코드 컴파일
              let tt_result = tt_template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#total").html(tt_result); // 최종 결과물을 추가한다
            }
          );
        });

        // 리셋 0109 하리
        $("#reset_loc").on("click", function (e) {
          e.preventDefault();
          $(".loc_btn").removeClass("select_loaction");
          $("#gu button").removeClass("select_loaction");
          $("#gu button").addClass("hide_content");
          $("#dong button").removeClass("select_loaction");
          $("#dong button").addClass("hide_content");
          $("#full_location").html("돌봄 지역을 선택해주세요");
        });
        /** 주소 선택 모달 end ------------------------------------------------------------------- */

        if (login_momno != "" || login_momno != 0) {
          $.get(
            "${pageContext.request.contextPath}/search/sitter_search/login",
            {
              order: order, // 정렬 조건
              momno: login_momno, // 로그인 정보
            },
            function (json) {
              let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
              let template = Handlebars.compile(source); // 템플릿 코드 컴파일
              let result = template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#result").empty(); // 결과물 초기화
              $("#result2").empty(); // 결과물 초기화
              $("#result").append(result); // 최종 결과물을 추가한다

              let total = $("#total-tmpl").html(); // 템플릿 코드 가져오기
              let tt_template = Handlebars.compile(total); // 템플릿 코드 컴파일
              let tt_result = tt_template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#total").html(tt_result); // 최종 결과물을 추가한다
            }
          );
        } else {
          $.get(
            "${pageContext.request.contextPath}/search/sitter_search",
            {
              order: order, // 정렬 조건
            },
            function (json) {
              let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
              let template = Handlebars.compile(source); // 템플릿 코드 컴파일
              let result = template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#result").empty(); // 결과물 초기화
              $("#result2").empty(); // 결과물 초기화
              $("#result").append(result); // 최종 결과물을 추가한다

              let total = $("#total-tmpl").html(); // 템플릿 코드 가져오기
              let tt_template = Handlebars.compile(total); // 템플릿 코드 컴파일
              let tt_result = tt_template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#total").html(tt_result); // 최종 결과물을 추가한다
            }
          );
        }

        // 드롭다운 선택 - 0109 하리
        $(".dr_option").click(function () {
          $(this).addClass("active");
          $(".dr_option").not(this).removeClass("active");
          $("#orderby").html($(this).find("a").html());

          // 정렬 조건 지정 0212
          let current = $(this);
          order = current.data("order");
          console.log(order);
          nowPage = 1;
          $.get(
            "${pageContext.request.contextPath}/search/sitter_search",
            {
              order: order, // 정렬 조건
              momno: login_momno,
              kidsage: kidsage,
              caredays: caredays,
              sitter_type: sitter_type,
              sitter_age: want_age,
              si: si, // 시
              gu: gu, // 구
              dong: dong, // 동
              actList: actList,
            },
            function (json) {
              let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
              let template = Handlebars.compile(source); // 템플릿 코드 컴파일
              let result = template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#result").empty(); // 결과물 초기화
              $("#result2").empty(); // 결과물 초기화
              $("#result").append(result); // 최종 결과물을 추가한다

              let total = $("#total-tmpl").html(); // 템플릿 코드 가져오기
              let tt_template = Handlebars.compile(total); // 템플릿 코드 컴파일
              let tt_result = tt_template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#total").html(tt_result); // 최종 결과물을 추가한다
            }
          );
        });

        /** 상세 검색 ------------------------------------------------------------------- */

        // 아이나이 버튼 클릭
        $(".ages").click(function (e) {
          //버튼 클릭시 클래스 변경
          $(this).toggleClass("select_btn_detail");
          //버튼 클릭시 text 색 변경
          $(this).find("i").toggleClass("select_text_detail");
          $(this).find("span").toggleClass("select_text_detail");
          // GET으로 전송할 배열에 data 담기
          if ($(this).find("span").hasClass("select_text_detail") && kidsage.indexOf($(this).data("age")) == -1) {
            kidsage.push($(this).data("age"));
          }
          if ($(this).find("span").hasClass("select_text_detail") == false) {
            kidsage.splice(kidsage.indexOf($(this).data("age")), 1);
          }

          console.log(kidsage);
        });

        // 돌봄요일 버튼 클릭
        $(".care_day").click(function (e) {
          //버튼 클릭시 클래스 변경
          $(this).toggleClass("select_btn_detail");
          //버튼 클릭시 text 색 변경
          $(this).find("div").toggleClass("select_text_detail");
          // GET으로 전송할 배열에 data 담기
          if ($(this).find("div").hasClass("select_text_detail") && caredays.indexOf($(this).data("day")) == -1) {
            caredays.push($(this).data("day"));
          }
          if ($(this).find("div").hasClass("select_text_detail") == false) {
            caredays.splice(caredays.indexOf($(this).data("day")), 1);
          }

          console.log(caredays);
        });

        // 돌봄 시간대 버튼 클릭
        $(".time_range").click(function (e) {
          //버튼 클릭시 클래스 변경
          $(this).toggleClass("select_btn_detail");
          //버튼 클릭시 text 색 변경
          $(this).find("span").toggleClass("select_text_detail");
          // GET으로 전송할 배열에 data 담기
          if ($(this).find("span").hasClass("select_text_detail") && time_range.indexOf($(this).data("time")) == -1) {
            time_range.push($(this).data("time"));
          }
          if ($(this).find("span").hasClass("select_text_detail") == false) {
            time_range.splice(time_range.indexOf($(this).data("time")), 1);
          }

          console.log(time_range);
        });

        // 맘시터 유형 버튼 클릭
        $(".sitter_type").click(function (e) {
          //버튼 클릭시 클래스 변경
          $(this).toggleClass("select_btn_detail");
          //버튼 클릭시 text 색 변경
          $(this).find("span").toggleClass("select_text_detail");
          // GET으로 전송할 배열에 data 담기
          if ($(this).find("span").hasClass("select_text_detail") && sitter_type.indexOf($(this).data("sttype")) == -1) {
            sitter_type.push($(this).data("sttype"));
          }
          if ($(this).find("span").hasClass("select_text_detail") == false) {
            sitter_type.splice(sitter_type.indexOf($(this).data("sttype")), 1);
          }
          console.log(sitter_type);
        });

        $("#detail_apply").click(function (e) {
          e.preventDefault();
          $("#sitter_search_detail_modal").modal("hide");
          // 검색 조건은 GET 파라미터로 전송한다.
          // 맘시터 나이대 체크박스
          $("input[name=want_age]:checked").each(function () {
            let chk = $(this).val();
            want_age.push(chk);
          });
          console.log(want_age);
          $.get(
            "${pageContext.request.contextPath}/search/sitter_search",
            {
              kidsage: kidsage,
              caredays: caredays,
              time_range: time_range,
              sitter_type: sitter_type,
              sitter_age: want_age,
            },
            function (json) {
              let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
              let template = Handlebars.compile(source); // 템플릿 코드 컴파일
              let result = template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#result").empty(); // 결과물 초기화
              $("#result2").empty(); // 결과물 초기화
              $("#result").append(result); // 최종 결과물을 추가한다

              let total = $("#total-tmpl").html(); // 템플릿 코드 가져오기
              let tt_template = Handlebars.compile(total); // 템플릿 코드 컴파일
              let tt_result = tt_template(json); // 템플릿 컴파일 결과물에 json 전달
              $("#total").html(tt_result); // 최종 결과물을 추가한다
            }
          );
        });

        // 리셋 버튼 0109 하리
        $("#reset_detail").click(function (e) {
          e.preventDefault();
          $("#sitter_search_detail_modal .modal_content *").removeClass("select_btn_detail");
          $("#sitter_search_detail_modal .modal_content *").removeClass("select_text_detail");
          $(".ins_check").prop("checked", false);
          $(".want_age").prop("checked", false);
        });

        /** 상세 검색 end ------------------------------------------------------------------- */

        // 무한 스크롤 1218 하리
        $(window).scroll(function () {
          if (Math.round($(window).scrollTop()) + $(window).height() == $(document).height()) {
            console.log("끝에 도착함");
            nowPage++;
            // Restful API에 GET방식 요청
            setTimeout(function () {
              if (login_momno != "" || login_momno != 0) {
                $.get(
                  "${pageContext.request.contextPath}/search/sitter_search/login",
                  {
                    order: order, // 정렬 조건
                    page: nowPage, // 페이지 번호는 GET 파라미터로 전송한다.
                    momno: login_momno,
                    kidsage: kidsage,
                    caredays: caredays,
                    sitter_type: sitter_type,
                    sitter_age: want_age,
                    si: si, // 시
                    gu: gu, // 구
                    dong: dong, // 동
                    actList: actList,
                  },
                  function (json) {
                    let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
                    let template = Handlebars.compile(source); // 템플릿 코드 컴파일
                    let result = template(json); // 템플릿 컴파일 결과물에 json 전달
                    $("#result2").append(result); // 최종 결과물을 추가한다
                  }
                );
              } else {
                $.get(
                  "${pageContext.request.contextPath}/search/sitter_search",
                  {
                    order: order, // 정렬 조건
                    page: nowPage, // 페이지 번호는 GET 파라미터로 전송한다.
                    kidsage: kidsage,
                    caredays: caredays,
                    sitter_type: sitter_type,
                    sitter_age: want_age,
                    si: si, // 시
                    gu: gu, // 구
                    dong: dong, // 동
                    actList: actList,
                  },
                  // 현재 페이지 번호가 전체 페이지 수에 도달하기 전까지만 내용물을 추가한다
                  function (json) {
                    if (json.meta.totalPage >= nowPage) {
                      let source = $("#sitter-list-tmpl").html(); // 템플릿 코드 가져오기
                      let template = Handlebars.compile(source); // 템플릿 코드 컴파일
                      let result = template(json); // 템플릿 컴파일 결과물에 json 전달
                      $("#result2").append(result); // 최종 결과물을 추가한다
                    }
                  }
                );
              }
            }, 1000);
          }
        });

        $(document).on("click", ".sitter_item_group", function () {
          let stno = $(this).data("stno");
          console.log(stno);
          location.href = "${pageContext.request.contextPath}/page_detail/sitter_detail.do?sitterno=" + stno;
        });
        $(document).on("click", ".swapHeart", function (e) {
          e.stopPropagation(); // 버블링 방지 1220 하리
          let $jim = $(this);
          let stno = $(this).data("stno");
          let momno = $("#app").data("login");

          // 찜할 때 alert창과 glyphicon변형
          if (momno != "" || momno != 0) {
            if ($(this).find("span").hasClass("glyphicon-heart-empty")) {
              $(this).find("span").removeClass("glyphicon-heart-empty");
              $(this).find("span").addClass("glyphicon-heart");
              $.get("${pageContext.request.contextPath}/heart/insertSt", {
                sitterno: stno,
                momno: momno,
                jjim: "Y",
              });
              swal("찜 하기 완료!", "마이페이지 > 찜한 맘시터에서 확인할 수 있습니다.");
            }
            // 찜 취소할 때 alert창과 glyphicon변형
            else {
              $(this).find("span").addClass("glyphicon-heart-empty");
              $.get("${pageContext.request.contextPath}/heart/deleteSt", {
                sitterno: stno,
                momno: momno,
                jjim: "N",
              });
              swal("찜 하기 취소");
            }
          } else {
            swal("맘회원으로 가입 후 이용해주세요.");
          }
        }); // fin. 찜버튼 기능
      });
    </script>
  </body>
</html>
