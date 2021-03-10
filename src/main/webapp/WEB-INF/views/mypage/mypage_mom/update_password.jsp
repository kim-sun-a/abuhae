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

        <!-- css 참조 -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/upd_mps_detail.css">

        <style>
            .mp_detail_tl {
                border-bottom: 1px solid #ccc;
                margin-bottom: 40px;
            }
        </style>
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_upd_pwd">
                    <!-- header -->
                    <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do?momno=${login.momno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">비밀번호 변경</h3>
                            </div>
                        </div>
                    </header>
                    <!-- end header -->
                    
                    <!-- content -->
                   <section class="group1_upd_pwd">
                        <div class="row">
                            <div class="col-xs-12">
                                <form method="POST" action="${pageContext.request.contextPath}/mypage/mypage_mom/update_passwordOk.do" id="mom_pwd_form">
                                    <input type="hidden" name="memberno" value="${login.memberno}">
                                    <div class="upd_pwd_cont">
                                        <div class="pwd_con_in">
                                            <label for="now_pw">현재 비밀번호</label> <br/>
                                            <input autocomplete="false" type="password" name="now_pw" id="now_pw" minlength="6"
                                            placeholder="현재 비밀번호를 입력하세요." style="border-bottom: 1px solid #ccc;"> 
                                        </div>
                                        <div class="pwd_con_in">
                                            <label for="new_pw">새로운 비밀번호</label> <br/>
                                            <input autocomplete="false" type="password" name="new_pw" id="new_pw" minlength="6"
                                            placeholder="새롭게 사용할 비밀번호를 입력하세요." style="border-bottom: 1px solid #ccc;">
                                        </div>
                                        <div class="pwd_con_show">
                                            <input type="checkbox" name="show_pw" id="show_pw">
                                            <label for="show_pw">비밀번호 보기</label>
                                        </div>
                                    </div>
                                    <button type="submit" id="pwd_btn">변경하기</button>
                                </form>  
                            </div>
                        </div>
                   </section>
                   <!-- end content -->
                </div>
            </div>
        </div>

      <!-- Javascript -->
      <script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>

        <!-- 비밀번호 보이기/가리기 기능-->
        <script>
            $(function() {
                // 체크박스 클릭 시 패스워드 보이기
                $("#show_pw").change(function() {
                   /** $(this).prop('checked',$("#now_pw").attr('type', 'text')); */
                   if($(this).prop('checked') == true) {
                        $(this).prop('checked',$("#now_pw").attr('type', 'text'));
                        $(this).prop('checked',$("#new_pw").attr('type', 'text'));
                   } else {
                       $("#now_pw").attr('type', 'password');
                       $("#new_pw").attr('type', 'password');
                   }
                });
                

                /**$("#mom_pwd_form").submit(function(e) {
                    e.preventDefault();

                    var now = $("#now_pw").val();

                    if(now != "ezen2020") {
                        alert("현재 비밀번호를 확인해주세요. (임시 비밀번호 : ezen2020)"); // 임시 비밀번호(ezen2020)와 다를 경우 확인 메세지 띄우기
                        $("#now_pw").focus();
                        return false;
                    } else {
                        var result = confirm("비밀번호를 변경하시겠습니까?");

                        if(result) {
                            location.href = "../../login/login.html";
                        } 
                    }
                }); */
            });
        </script>
   </body>
</html>