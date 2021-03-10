<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <!-- animaition 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" />

    <!-- job_search.css-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/job_search.css" />

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
  </head>

  <!--grid 사용시 col-xs-nn 사용-->
  <body>
    <div id="app" data-login="${login.sitterno}">
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

              <!-- detail search modal -->
              <div id="job_search_detail_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="job_search_detail_modal_Label" aria-hidden="true">
                <div class="modal_header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                  </button>
                  <h2>상세검색</h2>
                  <button id="detail_apply" class="apply_btn" type="button">적용</button>
                </div>
                <!--modal header end-->
                <!--modal content-->
                <div class="modal_content">
                  <!-- 요일 -->
                  <div class="care_day_wrap">
                    <h4>요일</h4>
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
                  <!--시간대-->
                  <!-- <div class="caretime_wrap">
                    <h4>시간대</h4>
                    <div class="time_range_group">
                      <button class="time_range"><span class="time_range_content">07 - 12시</span></button>
                      <button class="time_range"><span class="time_range_content">12 - 18시</span></button>
                      <button class="time_range"><span class="time_range_content">18 - 22시</span></button>
                    </div>
                  </div>
                  <hr /> -->
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
                  <!-- 희망 시급 -->
                  <div class="want_pay_wrap">
                    <h4 class="want_pay_title">희망시급</h4>
                    <div>
                      <div><label for="min_pay" class="pay_range">최소</label><input type="number" id="min_pay" name="min_pay" value="0" /></div>
                      <div><label for="max_pay" class="pay_range">최대</label><input type="number" id="max_pay" name="max_pay" value="0" /></div>
                    </div>
                  </div>
                  <hr />
                  <!-- 돌봄 종류 -->
                  <div class="care_type_wrap">
                    <h4>돌봄 종류</h4>
                    <div class="care_type_group">
                      <div>
                        <button type="button" id="act_type1" class="activity_type_btn" data-act="innerplay" value="innerplay"><i class="fas fa-check unselect_act_type"></i>실내놀이</button>
                        <button type="button" id="act_type2" class="activity_type_btn" data-act="guide" value="guide"><i class="fas fa-check unselect_act_type"></i>등하원돕기</button>
                        <button type="button" id="act_type3" class="activity_type_btn" data-act="read" value="read"><i class="fas fa-check unselect_act_type"></i>책읽기</button>
                        <button type="button" id="act_type4" class="activity_type_btn" data-act="outside" value="outside"><i class="fas fa-check unselect_act_type"></i>야외활동</button>
                        <button type="button" id="act_type5" class="activity_type_btn" data-act="korean" value="korean"><i class="fas fa-check unselect_act_type"></i>한글놀이</button>
                        <button type="button" id="act_type6" class="activity_type_btn" data-act="english" value="english"><i class="fas fa-check unselect_act_type"></i>영어놀이</button>
                        <button type="button" id="act_type7" class="activity_type_btn" data-act="study" value="study"><i class="fas fa-check unselect_act_type"></i>학습지도</button>
                        <button type="button" id="act_type8" class="activity_type_btn" data-act="sport" value="sport"><i class="fas fa-check unselect_act_type"></i>체육놀이</button>
                        <button type="button" id="act_type9" class="activity_type_btn" data-act="simple_cleaning" value="simple_cleaning">
                          <i class="fas fa-check unselect_act_type"></i>간단청소
                        </button>
                        <button type="button" id="act_type10" class="activity_type_btn" data-act="eat" value="eat"><i class="fas fa-check unselect_act_type"></i>밥챙겨주기</button>
                        <button type="button" id="act_type11" class="activity_type_btn" data-act="do_dish" value="do_dish"><i class="fas fa-check unselect_act_type"></i>간단설거지</button>
                        <button type="button" id="act_type12" class="activity_type_btn" data-act="long_move_in" value="long_move_in"><i class="fas fa-check unselect_act_type"></i>장기입주</button>
                        <button type="button" id="act_type13" class="activity_type_btn" data-act="short_move_in" value="short_move_in"><i class="fas fa-check unselect_act_type"></i>단기입주</button>
                      </div>
                    </div>
                  </div>
                  <hr />
                  <!-- 아이 수 -->
                  <div class="kids_count">
                    <h4>아이 수</h4>
                    <div class="kids_range">
                      <div class="kids_box">
                        <div>
                          <label for="all" class="box-radio-input"><input type="radio" name="kids" value="all" class="kids" id="all" /><i class="far fa-circle"></i> 무관</label>
                        </div>
                        <div>
                          <label for="kid" class="box-radio-input"><input type="radio" name="kids" value="1" class="kids" id="kid" /><i class="far fa-circle"></i> 1명</label>
                        </div>
                        <div>
                          <label for="kids" class="box-radio-input"><input type="radio" name="kids" value="2" class="kids" id="kids" /><i class="far fa-circle"></i> 2명</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--modal content end -->
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
                </div>
              </div>

              <div class="order_selector_group">
                <div id="total" class="total">총 ${mom_total}명</div>
                <!-- 드롭다운 -->
                <div class="dropdown clearfix order_dropdown">
                  <a id="orderby" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">프로필 업데이트 순 </a><b class="caret"></b>
                  <ul class="dropdown-menu" role="menu" aria-labelledby="orderby">
                    <!-- 아이템 항목 나열 -->
                    <li class="dr_option active" role="presentation" data-order="update"><a role="menuitem" tabindex="-1" href="#">프로필 업데이트 순</a></li>
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
                <a data-toggle="modal" href="#job_search_detail_modal">
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
    <script id="job-list-tmpl" type="text/x-handlebars-template">
      {{#each item}}
        <div class="job_item_group" data-momno="{{momno}}">
          <div class="item_body">
            <div class="profile_img_group">
              {{#ifCond isProfile null}}
              <img src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" alt="임시프로필"/>
              {{/ifCond}}
              {{#ifCond isProfile 'y'}}
              <img src="{{fileUrl}}" alt="프로필"/>
              {{/ifCond}}
              <div class="applicant_group">
                <div class="applicant">
                  {{applySt}}명 지원
                </div>
              </div>
            </div>
            <div class="profile_info_group">
              <div class="content_row">
                <div>
                  <div class="kids_count">
                    {{kids_age}} {{kids_num}}명
                  </div>
                  <div class="text_sep"></div>
                  <div class="last_update">
                    {{openingdate}}
                  </div>
                </div>
              </div>
              <div class="content_row">
                <div class="find_text">
                  {{#ifCond want_act1 'innerplay' }}실내놀이{{/ifCond}}
                  {{#ifCond want_act1 'guide' }}등하원돕기{{/ifCond}}
                  {{#ifCond want_act1 'read' }}책읽기{{/ifCond}}
                  {{#ifCond want_act1 'outside' }}야외활동{{/ifCond}}
                  {{#ifCond want_act1 'korean' }}한글놀이{{/ifCond}}
                  {{#ifCond want_act1 'english' }}영어놀이{{/ifCond}}
                  {{#ifCond want_act1 'study' }}학습지도{{/ifCond}}
                  {{#ifCond want_act1 'sport' }}체육놀이{{/ifCond}}
                  {{#ifCond want_act1 'simple_cleaning' }}간단 청소{{/ifCond}}
                  {{#ifCond want_act1 'eat' }}밥 챙겨주기{{/ifCond}}
                  {{#ifCond want_act1 'do_dish' }}간단 설거지{{/ifCond}}
                  {{#ifCond want_act1 'long_move_in' }}장기입주{{/ifCond}}
                  {{#ifCond want_act1 'short_move_in' }}단기입주{{/ifCond}}
                  {{#ifCond want_act2 'innerplay' }}실내놀이{{/ifCond}}
                  {{#ifCond want_act2 'guide' }}등하원돕기{{/ifCond}}
                  {{#ifCond want_act2 'read' }}책읽기{{/ifCond}}
                  {{#ifCond want_act2 'outside' }}야외활동{{/ifCond}}
                  {{#ifCond want_act2 'korean' }}한글놀이{{/ifCond}}
                  {{#ifCond want_act2 'english' }}영어놀이{{/ifCond}}
                  {{#ifCond want_act2 'study' }}학습지도{{/ifCond}}
                  {{#ifCond want_act2 'sport' }}체육놀이{{/ifCond}}
                  {{#ifCond want_act2 'simple_cleaning' }}간단 청소{{/ifCond}}
                  {{#ifCond want_act2 'eat' }}밥 챙겨주기{{/ifCond}}
                  {{#ifCond want_act2 'do_dish' }}간단 설거지{{/ifCond}}
                  {{#ifCond want_act2 'long_move_in' }}장기입주{{/ifCond}}
                  {{#ifCond want_act2 'short_move_in' }}단기입주{{/ifCond}}
                  {{#ifCond want_act3 'innerplay' }}실내놀이{{/ifCond}}
                  {{#ifCond want_act3 'guide' }}등하원돕기{{/ifCond}}
                  {{#ifCond want_act3 'read' }}책읽기{{/ifCond}}
                  {{#ifCond want_act3 'outside' }}야외활동{{/ifCond}}
                  {{#ifCond want_act3 'korean' }}한글놀이{{/ifCond}}
                  {{#ifCond want_act3 'english' }}영어놀이{{/ifCond}}
                  {{#ifCond want_act3 'study' }}학습지도{{/ifCond}}
                  {{#ifCond want_act3 'sport' }}체육놀이{{/ifCond}}
                  {{#ifCond want_act3 'simple_cleaning' }}간단 청소{{/ifCond}}
                  {{#ifCond want_act3 'eat' }}밥 챙겨주기{{/ifCond}}
                  {{#ifCond want_act3 'do_dish' }}간단 설거지{{/ifCond}}
                  {{#ifCond want_act3 'long_move_in' }}장기입주{{/ifCond}}
                  {{#ifCond want_act3 'short_move_in' }}단기입주{{/ifCond}}
                  맘시터 찾습니다.
                </div>
              </div>
              <div class="content_row location_group">
                <span class="location">
                  {{si}}&nbsp{{gu}}
                </span>
                <div class="text_sep"></div>
                <span class="user_name">
                  {{name}}
                </span>
                <div class="text_sep"></div>
                <span class="start_date">
                  {{{trimString schedule}}} 시작
                </span>
              </div>
              <div class="content_row">
                <i class="fas fa-won-sign"></i>
                <div class="wanted_pay">
                  희망 시급 {{payment}}원
                  {{#ifCond payment_ok 'Y'}}/협의가능{{/ifCond}}
                </div>
              </div>
            </div>
          </div>
          <hr class="divider" />
          <div class="item_footer">
            <div class="time_info_group">
              <div class="time_text_group">
                <div class="frequency">
                  {{#ifCond frequency "regular"}}정기적{{/ifCond}}
                  {{#ifCond frequency "shortTerm"}}단기{{/ifCond}}
                  {{#ifCond frequency "noplan"}}협의{{/ifCond}}
                </div>
              </div>
              <div class="care_days_group">
                {{#ifCond frequency "regular"}}
                <!-- 조건에 따라 css 색상 변환 처리 -->
                <span class="care_days {{#contains "mon" days }} care_days_sel {{/contains}}">
                  월
                </span>
                <span class="care_days {{#contains "tue" days }} care_days_sel {{/contains}}">
                  화
                </span>
                <span class="care_days {{#contains "wed" days }} care_days_sel {{/contains}}">
                  수
                </span>
                <span class="care_days {{#contains "thu" days }} care_days_sel {{/contains}}">
                  목
                </span>
                <span class="care_days {{#contains "fri" days }} care_days_sel {{/contains}}">
                  금
                </span>
                <span class="care_days {{#contains "sat" days }} care_days_sel {{/contains}}">
                  토
                </span>
                <span class="care_days {{#contains "sun" days }} care_days_sel {{/contains}}">
                  일
                </span>
                {{/ifCond}}
              </div>
            </div>
            <div class="jim_btn">
              <button class="swapHeart" data-momno="{{momno}}">
                <div class="jim">
                  <span class="glyphicon  glyphicon-heart{{#ifCond findHt 0}}-empty{{/ifCond}}" style="color: #ff7000; font-size: 20px"></span>
                </div>
              </button>
            </div>
          </div>
        </div>
      {{/each}}
    </script>
    <script>
      // Handlebars Helper
      Handlebars.registerHelper("ifCond", function (v1, v2, options) {
        if (v1 == v2) {
          return options.fn(this);
        }
        return options.inverse(this);
      });

      Handlebars.registerHelper("trimString", function (passedString) {
        let theString = passedString.substring(6, 11);
        return new Handlebars.SafeString(theString);
      });

      Handlebars.registerHelper("contains", function (needle, haystack, options) {
        needle = Handlebars.escapeExpression(needle);
        haystack = Handlebars.escapeExpression(haystack);
        return haystack.indexOf(needle) > -1 ? options.fn(this) : options.inverse(this);
      });

      let nowPage = 1; // 현재 페이지의 기본값
      let order = "openingdate";
      let login_stno = $("#app").data("login");

      // 주소 검색창에 들어갈 주소 문자열
      let full_loc = "";
      let si = "";
      let gu = "";
      let dong = "";

      // 상세 검색
      const kidsage = []; // 아이나이
      const caredays = []; // 돌봄 요일
      const time_range = []; // 돌봄 시간대
      const actList = []; // 돌봄 종류
      let min_pay = 0; // 최저 시급
      let max_pay = 0; // 최고 시급
      let kids_cnt = 0; // 아이 수

      $(function () {
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
            "${pageContext.request.contextPath}/search/job_search/",
            {
              si: si, // 시
              gu: gu, // 구
              dong: dong, // 동
            },
            function (json) {
              let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
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

        if (login_stno != "" || login_stno != 0) {
          $.get(
            "${pageContext.request.contextPath}/search/job_search/login",
            {
              order: order, // 정렬 조건
              sitterno: login_stno, // 로그인 정보
            },
            function (json) {
              let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
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
            "${pageContext.request.contextPath}/search/job_search",
            {
              order: order, // 정렬 조건
            },
            function (json) {
              let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
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
            "${pageContext.request.contextPath}/search/job_search",
            {
              order: order, // 정렬 조건
              sitterno: login_stno,
              kidsage: kidsage,
              caredays: caredays,
              time_range: time_range,
              actList: actList,
              min_pay: min_pay,
              max_pay: max_pay,
              kids_cnt: kids_cnt,
            },
            function (json) {
              let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
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

        // 돌봄 종류 버튼 클릭
        $(".activity_type_btn").click(function (e) {
          //버튼 클릭시 클래스 변경
          $(this).toggleClass("select_act_btn");
          //버튼 클릭시 text 색 변경
          $(this).find("i").toggleClass("select_act_btn");
          // GET으로 전송할 배열에 data 담기
          if ($(this).find("i").hasClass("select_act_btn") && actList.indexOf($(this).data("act")) == -1) {
            actList.push($(this).data("act"));
          }
          if ($(this).find("i").hasClass("select_act_btn") == false) {
            actList.splice(actList.indexOf($(this).data("act")), 1);
          }

          console.log(actList);
        });

        $("#detail_apply").click(function (e) {
          e.preventDefault();
          $("#job_search_detail_modal").modal("hide");
          min_pay = $("#min_pay").val(); // 최저 시급
          max_pay = $("#max_pay").val(); // 최고 시급
          console.log(min_pay);
          console.log(max_pay);
          kids_cnt = $("input[name=kids]:checked").val(); // 아이 수
          // 검색 조건은 GET 파라미터로 전송한다.
          $.get(
            "${pageContext.request.contextPath}/search/job_search",
            {
              kidsage: kidsage,
              caredays: caredays,
              actList: actList,
              min_pay: min_pay,
              max_pay: max_pay,
              kids_cnt: kids_cnt,
            },
            function (json) {
              let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
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
          $("#job_search_detail_modal .modal_content *").removeClass("select_btn_detail");
          $("#job_search_detail_modal .modal_content *").removeClass("select_text_detail");
          $("#job_search_detail_modal .modal_content *").removeClass("select_act_btn");
          $(".kids").prop("checked", false);
          $("#min_pay").val(0);
          $("#max_pay").val(0);
        });

        /** 상세 검색 end ------------------------------------------------------------------- */

        // 무한 스크롤 1218 하리
        $(window).scroll(function () {
          if (Math.round($(window).scrollTop()) + $(window).height() + 1 == $(document).height()) {
            // 이 계산식만 잘 고치면 될거같다. -> 반올림, setTimeout으로 해결! 0217
            console.log("끝에 도착함");
            nowPage++;
            // Restful API에 GET방식 요청
            setTimeout(function () {
              if (login_stno != "" || login_stno != 0) {
                $.get(
                  "${pageContext.request.contextPath}/search/job_search/login",
                  {
                    page: nowPage, // 페이지 번호는 GET 파라미터로 전송한다.
                    order: order, // 정렬 조건은 GET 파라미터로 전송한다.
                    sitterno: login_stno,
                    kidsage: kidsage,
                    caredays: caredays,
                    time_range: time_range,
                    actList: actList,
                    min_pay: min_pay,
                    max_pay: max_pay,
                    kids_cnt: kids_cnt,
                  },
                  function (json) {
                    let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
                    let template = Handlebars.compile(source); // 템플릿 코드 컴파일
                    let result = template(json); // 템플릿 컴파일 결과물에 json 전달
                    $("#result2").append(result); // 최종 결과물을 추가한다
                  }
                );
              } else {
                $.get(
                  "${pageContext.request.contextPath}/search/job_search",
                  {
                    order: order, // 정렬 조건
                    page: nowPage, // 페이지 번호는 GET 파라미터로 전송한다.
                    kidsage: kidsage,
                    caredays: caredays,
                    time_range: time_range,
                    actList: actList,
                    min_pay: min_pay,
                    max_pay: max_pay,
                    kids_cnt: kids_cnt,
                  },
                  // 현재 페이지 번호가 전체 페이지 수에 도달하기 전까지만 내용물을 추가한다
                  function (json) {
                    if (json.meta.totalPage >= nowPage) {
                      let source = $("#job-list-tmpl").html(); // 템플릿 코드 가져오기
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
        $(document).on("click", ".job_item_group", function () {
          let momno = $(this).data("momno");
          console.log(momno);
          location.href = "${pageContext.request.contextPath}/page_detail/mom_detail.do?momno=" + momno;
        });
        $(document).on("click", ".swapHeart", function (e) {
          e.stopPropagation(); // 버블링 방지 1220 하리
          let $jim = $(this);
          let momno = $(this).data("momno");
          let stno = $("#app").data("login");

          // 찜할 때 alert창과 glyphicon변형
          if (stno != "" || stno != 0) {
            if ($(this).find("span").hasClass("glyphicon-heart-empty")) {
              $(this).find("span").removeClass("glyphicon-heart-empty");
              $(this).find("span").addClass("glyphicon-heart");
              $.get("${pageContext.request.contextPath}/heart/insertMom", {
                sitterno: stno,
                momno: momno,
                jjim: "Y",
              });
              swal("찜 하기 완료!", "마이페이지 > 찜한 맘시터에서 확인할 수 있습니다.");
            }
            // 찜 취소할 때 alert창과 glyphicon변형
            else {
              $(this).find("span").addClass("glyphicon-heart-empty");
              $.get("${pageContext.request.contextPath}/heart/deleteMom", {
                sitterno: stno,
                momno: momno,
                jjim: "N",
              });
              swal("찜 하기 취소");
            }
          } else {
            swal("시터회원으로 가입 후 이용해주세요.");
          }
        }); // fin. 찜버튼 기능
      });
    </script>
  </body>
</html>
