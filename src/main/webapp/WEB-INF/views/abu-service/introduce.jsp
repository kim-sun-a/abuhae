<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>아이를부탁해</title>

    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/assets/ico/favicon.ico" />

    <!-- bootstrap -->
    <!--절대 경로 수정 1220 선아-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- noto Sans 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/introduce.css" />
    <!-- fontawesome(글리피콘) 적용 -->
    <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <style type="text/css">
        .container {
            margin: auto;
            padding: 0;
        }

        section .col-xs-12 {
            padding: 0;
        }
    </style>
</head>

<body>
    <div class="container">
        <div id="menu">
				<c:if test="${login != null }">
					<c:choose>
						<c:when test="${fn:contains(login.type, 'M')}">
							<%@ include file="../index_header_login_mom.jsp"%>
						</c:when>
						<c:when test="${fn:contains(login.type, 'S')}">
							<%@ include file="../index_header_login_sitter.jsp"%>
						</c:when>
					</c:choose>
				</c:if>
				<c:if test="${login == null }">
					<%@ include file="../index_header.jsp"%>
				</c:if>
				<%-- <h3>${login.type}, ${login.momno }</h3>
				<p>${login.sitterno }</p> --%>
			</div>
        <section>
            <div id="service" class="col-xs-12">
                <!-- xs-12로 모바일 맞춤 -->
                <div class="service_wrap">
                    <div class="what_service">맘시터 서비스는 무엇인가요?</div>
                    <div>바쁜 부모님들이</div>
                    <div>믿을 수 있는 아이돌보미를</div>
                    <div class="service_desc_bold">쉽고 빠르게 찾을 수 있는 서비스입니다.</div>
                    <div class="service_img"><img src="${pageContext.request.contextPath}/assets/img/momsitter_about.png"></div>
                    <div class="service_desc">각자의 상황마다 요청시간과 돌봄내용이 다양한 부모님들의 다양한 니즈를, 다양한 특기와 장점을 가진 아이돌보미들이 도움을 줄 수 있도록
                        연결하는 공유경제 서비스입니다.</div>
                </div>
                <!--중간 나눔 바-->
                <div class="bar"></div>
                <!--페이지 나누어서 진행 ajax로 버튼 클릭시 화면 변환 tab으로 진행-->
                <div>
                    <div class="button_wrap">
                        <button class="service_btn" data-tab="introduce_what">어떤 점이 좋나요?</button>
                        <button class="service_btn" data-tab="introduce_when">어떻게 시작되었나요?</button>
                    </div>
                    <div>
                        <div class="click"></div>
                    </div>
                    <div id="content"></div>
                </div>
            </div> <!-- fin. col-xs-12 -->
        </section>
    </div>

    
    <script type="text/javascript">
        $(function () {
            //브라우저 로드시 에이작스 받아오기 - 선아
            //default는 어떤 점이 좋나요?
            $(document).ready(function () {
                $.ajax({
                    type: 'GET',                 //get방식으로 통신
                    url: "${pageContext.request.contextPath}/abu-service/introduce_what.do",    //부모가이드 보여주기
                    dataType: "html",            //html형식으로 값 읽기
                    error: function () {          //통신 실패시 ㅠㅠ
                        alert('통신실패!');
                    },
                    success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                        $('#content').html(data);
                    }
                });
                
            });

            //클릭시에 ajax 받아오기
            $(".service_btn").click(function (e) {
                var serv_btn = $(this).attr('data-tab');
                //content ajax로 불러오기
                $(document).ready(function () {
                    $.ajax({
                        type: 'GET',                 //get방식으로 통신
                        url: "${pageContext.request.contextPath}/abu-service/"+serv_btn + ".do",    //부모가이드 보여주기
                        dataType: "html",            //html형식으로 값 읽기
                        error: function () {          //통신 실패시 ㅠㅠ
                            alert('통신실패!');
                        },
                        success: function (data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
                            $('#content').html(data);
                        }
                    });
                });
                //클릭시 어느 페이지 보고 있는지 css 설정 - 선아
                if(serv_btn=='introduce_what') {
                    $(".click").css('left','0');
                } else {
                    $(".click").css('left','50%');
                }
            });
            
            $(document).on('click','.go_momsitter', function(){
            	if(${login == null }) {
            		location.href="${pageContext.request.contextPath}/join/join.do";
            	} else {
            		location.href="${pageContext.request.contextPath}/search/sitter_search.do";
            	}
                
            });

            
        });
    </script>
</body>

</html>