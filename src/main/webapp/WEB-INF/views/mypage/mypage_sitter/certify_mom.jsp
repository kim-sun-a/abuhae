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
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath()%>/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/notosans.css" />
        
        <!-- icon 참조 -->
        <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

        <style type="text/css">
        /* 초기 설정 -----------------------------------------------------*/
        .body, html, * {
            margin: 0;
            padding: 0;

            font-size: 1em;
            font-weight: bold;
        }

        h1, h2, h3, h4, h5, h6 {
            padding: 0;
            margin: 0;
        }

        a {
            color: black;
        }

        a:hover {
            text-decoration: none;
            color: black;
        }

        /** header --------------------------------------------------------------------*/

        .certi_resident_tl {
            padding: 20px 20px;
            max-width: 600px;
            background-color: #eee;
        }
        
        .certi_resident_tl .certi_resident_tl_in {
            display: flex;
            justify-content: space-between;
            flex-direction: row;
            align-items: center;
        }

        .certi_resident_tl .certi_resident_tl_in a i {
            text-decoration: none;
            font-size: 1.5em;
            margin-bottom: 35px;
        }

        .certi_resident_tl .certi_resident_tl_in h3 {
            font-weight: bold;
            color: #838383;
            margin-bottom: 10px;
        }

        .certi_resident_tl .certi_resident_tl_in p {
            color: #838383;
        }


        /** for 내 인증관리 페이지 (certify.html) --------------------------------------*/

        /** 공통 for 내 인증관리 */
        .wrap_certi_resident {
            margin: 0 auto;
            max-width: 600px;
            background-color: #eee;
        }

        .certi_resi_one {
            padding: 20px;
        }

        .resi_one_con {
            margin-bottom: 20px;
        }

        .resi_one_con:last-child {
            margin-bottom: 0;
        }

        .certi_resi_one {
            margin: 0 10px 20px 10px;
            background-color: #fff;
        }

        .certi_resi_one ul {
            margin-left: 20px;
        }

        .resi_one_con.order_resi {
            background-color: #6c6c6c;
            border-radius: 15px;
            width: 15%;
            height: 21px;
            color: #fff;
            text-align: center;
        }

        .resi_one_con.add_resi {
            color: rgb(14, 151, 115);
        }

        .resi_button1 input[type="file"] {
            display: none;
        }

        .resi_button1 input[type="file"]+label {
            width: 100%;
            height: 52px;
            padding-top: 12px;
            text-align: center;
            border: 1px solid #bebebe;
            border-radius: 5px;
            background-image: linear-gradient(180deg,#fff 2%,#ededed);
            font-size: 1.2em;
        }

        .resi_button2 {
            width: 100%;
            height: 50px;
            padding: 5px;
            border: 2px solid rgb(190, 190, 190);
        }

        .resi_date_slec {
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        .selc_con {
            width: 20%;
            height: 30px;
            margin-right: 20px;
            border: 0;
            border-bottom: 2px solid rgb(190, 190, 190);
            margin-bottom: 30px;
        }

        .resi_button3 {
            width: 100%;
            height: 80px;
            background-color: rgb(14, 151, 115);
            border: 0;
            font-size: 1.5em;
            color: #fff;
        }

        .child_list {
            border: 1px solid #eee;
            border-radius: 5px;
            padding: 20px 15px;
            box-shadow: 0 0 6px 0 hsla(0,0%,67.1%,.5);
            margin-bottom: 10px;
        }

        .child_list h4 {
            color: #0e9773;
            font-weight: bold;
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .child_one_con .row {
            display: flex;
            flex-direction: column;
        }

        .child_one_con div {
            width: 100%;
            margin-bottom: 10px;
            display: flex;
            flex-direction: row;
        }

        .child_one_con div label {
            margin-right: 37px;
        }

        .child_one_con div:last-child label {
            margin-right: 20px;
        }

        .child_one_con div input[type="text"] {
            border: 0;
            border-bottom: 1px solid #6c6c6c;
        }

        .child_one_con div:last-child {
            margin-bottom: 20px
        }

        .select_date {
            display: flex;
            justify-content: space-around;
        }

       
		</style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_certi_resident">
                    <!-- header -->
                    <header class="certi_resident_tl">
                        <div class="row">
                            <div class="col-xs-12 certi_resident_tl_in">
                                <div>
                                    <h3>엄마 인증</h3>
                                    <p>"올리신 서류의 세부내용은 노출되지 않으니 안심하세요."</p>
                                </div>
                                <a href="certify.jsp">
                                    <i class="fas fa-times"></i>
                                </a>
                            </div>
                        </div>
                    </header>

                    <!-- 첫번째 항목 -->
                    <section class="group_certi_resi_con">
                        <div class="row">
                            <div class="col-xs-12 certi_resi_con_in">
                                <form action="#" method="post" enctype="multipart/form-data">
                                    <!-- 첫번째 내용 -->
                                    <div class="certi_resi_one">
                                        <p class="resi_one_con order_resi">1번째</p>
                                        <h4 class="resi_one_con">
                                            자녀 양육경험을 확인하기 위해서 <br/>
                                            <span style="text-decoration: underline;">가족관계증명서</span>를 사진으로 찍어서 <br/>
                                            올려주세요. 
                                        </h4>
                                        <ul class="resi_one_con add_resi">
                                            <li>최근 6개월 이내에 발급된 경우만 인정됩니다.</li>
                                            <li>회원님의 개인정보 보호를 위해 주민등록 번호 뒷자리를 꼭 가리고 보내주세요.
                                                (주민등록뒷자리 '미포함' 선택 후 발급, 또는 해당부분 가린 후 촬영)
                                            </li>
                                        </ul>
                                        <p class="resi_one_con" style="color:#aaaaaa;">사진첨부는 최대 5장까지 가능합니다.</p>
                                        <div class="resi_button1">
                                            <input type="file" id="mom_photo" name="mom_photo">
                                            <label for="mom_photo">
                                                <i class="fas fa-file-import"></i> 사진 추가하기
                                            </label>
                                        </div>
                                        <img src="../img/cert_family_1.png" alt="주민등록등본 예시" style="margin-top: 20px; width: 100%;">
                                    </div>

                                    <!-- 두번째 내용 -->
                                    <div class="certi_resi_one">
                                        <p class="resi_one_con order_resi">2번째</p>
                                        <h4 class="resi_one_con">
                                            올리신 가족관계증명서에 적혀있는 <br/>
                                            발급일자를 아래 입력칸에 <br/>
                                            똑같이 입력해주세요.
                                        </h4>
                                        <img src="../img/cert_family_2.png" alt="주민등록등본 예시" style="width: 100%;">
                                        <div class="select_date">
                                            <select name="resi_year" id="resi_year_1" class="selc_con">
                                                <option>년도</option>
                                                <option value="1960">1960</option>
                                                <option value="1970">1970</option>
                                                <option value="1980">1980</option>
                                                <option value="1990">1990</option>
                                                <option value="2000">2000</option>
                                                <option value="2010">2010</option>
                                                <option value="2020">2020</option>
                                            </select>
                                            <select name="resi_month" id="resi_month" class="selc_con">
                                                <option>월</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                            </select>
                                            <select name="resi_day" id="resi_day" class="selc_con">
                                                <option>일</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                            </select>
                                        </div>
                                    </div>

                                     <!-- 세번째 내용 -->
                                     <div class="certi_resi_one">
                                        <p class="resi_one_con order_resi">3번째</p>
                                        <h4 class="resi_one_con">
                                            올리신 증명서 내용과 똑같게 <br/>
                                            아래 내용을 입력해주세요.
                                        </h4>
                                        <div class="resi_date_slec" id="resi_date_slec">
                                            <label for="resi_year" style="font-size: 1.2em; font-weight: bold; margin-top: 5px; margin-right: 20px;">자녀 수</label>
                                            <select name="resi_year" id="resi_year" class="selc_con">
                                                <option>선택</option>
                                                <option value="1">1명</option>
                                                <option value="2">2명</option>
                                                <option value="3">3명</option>
                                            </select>
                                        </div>
                                        <div class="child_info">
                                            <div class="child_list hide" id="child_one">
                                                <h4>첫째자녀</h4>
                                                <div class="child_one_con">
                                                    <div>
                                                        <label for="child_gender_one">성별</label>
                                                        <select id="child_gender_one" class="child_gender" name="child_gender_one">
                                                            <option value="m">남자</option>
                                                            <option value="f">여자</option>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label for="child_brithdate">생년월일</label>
                                                        <input type="text"  id="child_brithdate_one" class="child_brithdate" name="child_brithdate">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="child_list hide" id="child_two">
                                                <h4>첫째자녀</h4>
                                                <div class="child_one_con">
                                                    <div>
                                                        <label for="child_gender_one">성별</label>
                                                        <select id="child_gender_one" class="child_gender" name="child_gender_one">
                                                            <option value="m">남자</option>
                                                            <option value="f">여자</option>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label for="child_brithdate">생년월일</label>
                                                        <input type="text"  id="child_brithdate_one" class="child_brithdate" name="child_brithdate">
                                                    </div>
                                                </div>
                                                <h4>둘째자녀</h4>
                                                <div class="child_one_con">
                                                    <div>
                                                        <label for="child_gender_one">성별</label>
                                                        <select id="child_gender_one" class="child_gender" name="child_gender_one">
                                                            <option value="m">남자</option>
                                                            <option value="f">여자</option>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label for="child_brithdate">생년월일</label>
                                                        <input type="text"  id="child_brithdate_one" class="child_brithdate" name="child_brithdate">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="child_list hide" id="child_three">
                                                <h4>첫째자녀</h4>
                                                <div class="child_one_con">
                                                    <div>
                                                        <label for="child_gender_one">성별</label>
                                                        <select id="child_gender_one" class="child_gender" name="child_gender_one">
                                                            <option value="m">남자</option>
                                                            <option value="f">여자</option>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label for="child_brithdate">생년월일</label>
                                                        <input type="text"  id="child_brithdate_one" class="child_brithdate" name="child_brithdate">
                                                    </div>
                                                </div>
                                                <h4>둘째자녀</h4>
                                                <div class="child_one_con">
                                                    <div>
                                                        <label for="child_gender_one">성별</label>
                                                        <select id="child_gender_one" class="child_gender" name="child_gender_one">
                                                            <option value="m">남자</option>
                                                            <option value="f">여자</option>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label for="child_brithdate">생년월일</label>
                                                        <input type="text"  id="child_brithdate_one" class="child_brithdate" name="child_brithdate">
                                                    </div>
                                                </div>
                                                <h4>셋째자녀</h4>
                                                <div class="child_one_con">
                                                    <div>
                                                            <label for="child_gender_one">성별</label>
                                                            <select id="child_gender_one" class="child_gender" name="child_gender_one">
                                                                <option value="m">남자</option>
                                                                <option value="f">여자</option>
                                                            </select>
                                                    </div>
                                                    <div>
                                                        <label for="child_brithdate">생년월일</label>
                                                    <input type="text"  id="child_brithdate_one" class="child_brithdate" name="child_brithdate">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="resi_one_con add_resi" style="margin-bottom: 50px;">
                                            올리신 증명서 내용과 입력하신 내용이 일치되어야 <br/>
                                            인증처리가 완료됩니다.
                                        </p>
                                    </div>
                                    <div>
                                        <button type="submit" class="resi_button3">인증을 신청합니다!</button>
                                    </div>
                                </form>
                               
                                <!--<form action="certify.html" method="get" enctype="multipart/form-data">
                                    <div>아이디: <input type="text" name="userid"></div>
                                    <div>비밀번호 : <input type="password" name="pwd"></div>
                                    <div><input type="file" name="photo"></div>
                                    <div><button type="submit">전송</button></div>
                                </form>-->
                            </div>
                        </div>
                    </section>

		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#resi_year").click(function(e) {
                    e.preventDefault();

                    var count = $("#resi_year").val();
                    if(count == 1) {
                        $(this).parent("#resi_date_slec").next().find("#child_one").toggleClass("hide");
                    } else if (count == 2) {
                        $(this).parents("#resi_date_slec").next().find("#child_two").toggleClass("hide");
                    } else if (count == 3) {
                        $(this).parent("#resi_date_slec").next().find("#child_three").toggleClass("hide");
                    }
                });
            });
        </script>
	</body>
</html>