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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mom_appl.css">
        <style type="text/css">
        
        /** for 후기 관리 페이지 (review.html) --------------------------------------*/
        /** 공통 for 후기 관리 */
        .wrap_update_activity {
            padding: 20px 20px;
            margin: 0 auto;
            max-width: 600px;
        }

        .upd_care_age_in {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            width: 100%;
        }

        .care_age_btn {
            text-align: center;
            margin: 10px 0;
            box-sizing: content-box;
            position: relative;
        }

        .care_age_btn input[type="checkbox"]+label {
            position: relative;
            border: 0;
            outline: 0;
            text-decoration: none;
            margin: 0;
            padding: 0;
            padding-top: 10px;
            line-height: 36px;
            color: #d9d9d9;
            background-color: #efefef;
            transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
            text-align: center;
            width: 56px;
            height: 56px;
            border-radius: 56px;
        }

        .care_age_btn input[type="checkbox"]+label img {
            width: 38px;
            height: 38px;
        }

        .care_age_btn input[type="checkbox"]:checked+label {
            background-color: #ff7000;
            position: relative;
            color: #fff;
        }

        .care_age_text {
            color: #878787;
            font-weight: 600;
            margin-top: 17px;
            text-align: center;
        }

        .care_age_btn input[type='checkbox'] {
            display: none;
        }

        .care_age_cont_in {
            padding-top: 30px;
            color: #919191;
        }


		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_update_activity">
                    <form action="#">
                         <!-- header -->
                        <header class="mp_detail_tl">
                            <div class="row">
                                <div class="col-xs-12 mp_detail_tl_in">
                                    <a href="${pageContext.request.contextPath}/mypage/mypage_mom/update_appl.do">
                                        <i class="fas fa-times"></i>
                                    </a>
                                    <h3 class="center-block">원하는 활동 수정</h3>
                                    <button type="submit">저장</button>
                                </div>
                            </div>
                        </header>

                        <!-- content -->
                        <section class="upd_care_age_cont">
                            <div class="row">
                                <div class="col-xs-12 care_age_cont_in">
                                    <h4>원하는 활동이란<a href="#mom_activity_modal" data-toggle="modal"><i class="fas fa-question-circle" style="margin-left: 10px; color: #919191;"></i></a></h4>
                                    <br/>
                                </div>
                            </div>
                        </section> 

                        <section class="upd_care_age">
                            <div class="row">
                                <div class="col-xs-12 upd_care_age_in">
                                    <!-- 첫째줄-->
                                    <div class="age_line">
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age11" name="want_care_age" value="babyage1">
                                            <label for="care_age11"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/innerplayicon_n.png" alt=""></label>
                                            <div class="care_age_text">실내놀이</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age12" name="want_care_age" value="babyage2">
                                            <label for="care_age12"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/koreanicon_n.png" alt=""></label>
                                            <div class="care_age_text">한글놀이</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age13" name="want_care_age" value="babyage3">
                                            <label for="care_age13"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/cleanicon_n.png" alt=""></label>
                                            <div class="care_age_text">간단청소</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age14" name="want_care_age" value="babyage2">
                                            <label for="care_age14"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/longhouseicon_n.png" alt=""></i></label>
                                            <div class="care_age_text">장기입주</div>
                                        </div>
                                    </div>
                                    <!-- 둘째줄 -->
                                    <div class="age_line">
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age21" name="want_care_age" value="babyage1">
                                            <label for="care_age21"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/guideicon_n.png" alt=""></label>
                                            <div class="care_age_text">등하원돕기</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age22" name="want_care_age" value="babyage2">
                                            <label for="care_age22"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/englishicon_n.png" alt=""></label>
                                            <div class="care_age_text">영어놀이</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age23" name="want_care_age" value="babyage3">
                                            <label for="care_age23"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/eaticon_n.png" alt=""></label>
                                            <div class="care_age_text">밥 챙겨주기</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age24" name="want_care_age" value="babyage2">
                                            <label for="care_age24"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/houseicon_n.png" alt=""></i></label>
                                            <div class="care_age_text">단기입주</div>
                                        </div>
                                    </div>
                                    <!-- 셋째줄 -->
                                    <div class="age_line">
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age31" name="want_care_age" value="babyage1">
                                            <label for="care_age31"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/readicon_n.png" alt=""></label>
                                            <div class="care_age_text">책읽기</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age32" name="want_care_age" value="babyage2">
                                            <label for="care_age32"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/studyicon_n.png" alt=""></label>
                                            <div class="care_age_text">학습지도</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age33" name="want_care_age" value="babyage3">
                                            <label for="care_age33"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/dishicon_n.png" alt=""></label>
                                            <div class="care_age_text">간단설거지</div>
                                        </div>
                                    </div>
                                    <!-- 넷째줄 -->
                                    <div class="age_line">
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age41" name="want_care_age" value="babyage1">
                                            <label for="care_age41"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/ousideicon_n.png" alt=""></label>
                                            <div class="care_age_text">야외활동</div>
                                        </div>
            
                                        <div class="care_age_btn">
                                            <input type="checkbox" class="care_age" id="care_age42" name="want_care_age" value="babyage2">
                                            <label for="care_age42"><img class="want_img" src="${pageContext.request.contextPath}/assets/img/ballicon_n.png" alt=""></label>
                                            <div class="care_age_text">체육놀이</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>

                    <!-- modal -->
                    <div id="mom_activity_modal" class="modal fade" tabindex="-1" role="dialog" 
                    aria-labelledby="modalLabel" aria-hidden="true">
                        <!-- mocal-dialog -->
                        <div class="modal-dialog">
                            <!-- modal-content -->
                            <div class="modal-content">
                                 <!--제목-->
                                 <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    style="padding: 10px 0;">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <h4 class="modal-title" id="modalLabel" 
                                    style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                        원하는 활동이란?
                                    </h4>
                                </div>
                                
                                <!-- 내용 -->
                                <div class="modal-body" style="padding: 20px 20px;">
                                    <div><span style="font-size: 0.9em; font-weight: bold;">실내놀이</span> <span style="font-size: 0.8em; color: #777;">그림 그리기, 게임하기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">등하원 돕기</span> <span style="font-size: 0.8em; color: #777;">유치원 데려다주기, 데리고오기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">책 읽기</span> <span style="font-size: 0.8em; color: #777;">아이가 좋아하는 책 읽어주기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">야외활동</span> <span style="font-size: 0.8em; color: #777;">놀이동산, 키즈카페 가기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">한글놀이</span> <span style="font-size: 0.8em; color: #777;">한글 카드놀이, 받아쓰기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">영어놀이</span> <span style="font-size: 0.8em; color: #777;">영어노래 부르기, 영어책 읽어주기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">학습지도</span> <span style="font-size: 0.8em; color: #777;">면학분위기 조성, 숙제 도와주기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">체육놀이</span> <span style="font-size: 0.8em; color: #777;">공놀이, 놀이터 나가기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">간단 청소</span> <span style="font-size: 0.8em; color: #777;">아이 장난감 치우기, 청소기 돌리기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">밥 챙겨주기</span> <span style="font-size: 0.8em; color: #777;">있는 반찬으로 밥 챙겨주기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">간단 설거지</span> <span style="font-size: 0.8em; color: #777;">젖병세척, 아이먹은 그릇 씻기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">장기입주</span> <span style="font-size: 0.8em; color: #777;">함께 살면서 종일 봐주기</span></div>
                                    <hr>
                                    <div><span style="font-size: 0.9em; font-weight: bold;">단기입주</span> <span style="font-size: 0.8em; color: #777;">2-3일 종일 봐주기</span></div>
                                </div>
                            </div>
                            <!-- //modal-content end -->
                        </div>
                        <!-- //modal-dailog end-->
                    </div>
                    <!-- // modal end -->
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/assets/js/bootstrap.min.js"></script>
        <script>
             $(function () {
            //활동 버튼 클릭
            $(".care_age").click(function (e) {
                //버튼 클릭시 이미지 URL 변경
                //url 가져오기
                var img_url = $(this).next().find(".want_img").attr('src');
                var indeximg = img_url.indexOf("_n") //잘라서 _n이 있는지 확인
                if (indeximg > -1) {
                    var img_src = img_url.replace(/_n/, "_s");
                    $(this).next().find(".want_img").attr('src', img_src);
                } else {
                    var img_src = img_url.replace(/_s/, "_n");
                    $(this).next().find(".want_img").attr('src', img_src);
                }


            });
        });
        </script>
	</body>
</html>