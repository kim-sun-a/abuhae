<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/upd_mpm_detail.css">

        <style type="text/css">

 
        /** 두번째 항목 */



		</style>
    </head>

    <body>
        <div class="app">
            <div class="container">
                <div class="wrap_get_sitter">
                     <!-- header -->
                     <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do?momno=${login.momno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">내 구인 현황</h3>
                            </div>
                        </div>
                    </header>
                    <!-- end header -->
                    
                    <!-- content1 -->
                    <section class="group1_get_sitter">
                        <div class="row">
                            <div class="col-xs-12 get_sitter_tab">
                                <!-- 탭 버튼 영역 -->
                                <ul class="gs_tab_button">
                                    <li id="button1" class="gs_tab_item fi_selected">
                                        <a class="tab_button_item_link selected" href="#gs_tab_page_1">내가 신청한</a>
                                    </li>
                                    <li id="button2" class="gs_tab_item">
                                        <a class="tab_button_item_link" href="#gs_tab_page_2">내게 지원한</a>
                                    </li>
                                </ul>
                                <!-- end 탭 버튼 영역-->

                                <!-- 내용 영역 -->
                                <div class="gs_tab_panel">
                                    <!-- 내가 지원한 -->
                                    <div class="gs_tab_page" id="gs_tab_page_1">
                                        <c:choose>
                                        	<c:when test="${out == null }">
                                        		<p>내가 지원한 회원 목록이 없습니다.</p>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:forEach var="out" items="${out}" varStatus="status">
                                        			<!-- 시터가 구직 중일 경우 -->
                                       				<c:if test="${out.job_opening eq 'Y'.charAt(0) }">
                                       					<div class="gs_appl">
				                                            <div class="appl_img">
				                                                <c:if test="${out.isProfile eq '0'}">
		                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 52px; height:52px; border-radius: 50%;"/>
		                                                   		</c:if>
		                                                   		<c:if test="${out.isProfile eq 'y'.charAt(0) }">
		                                                   			<img src="${out.fileUrl }" alt="임시프로필" style="width: 52px; height: 52px; border-radius: 50%;">
		                                                   		</c:if>
				                                            </div>
				                                            <div class="gs_appl_cont">
				                                            	
			                                               	 	<p class="si_name">
			                                               		 	<a href="${pageContext.request.contextPath}/page_detail/sitter_detail.do?sitterno=${out.sitterno}">${out.name }&nbsp;<span>( ${out.birthdate }세 )</span> </a>
			                                               	 	</p>
				                                                <p>희망시급 : ${out.payment }원</p>
				                                                <p>지원시간 : ${out.applydate }</p>
				                                                <c:if test="${out.accept == null }">
				                                                	<div class="success">
					                                                   <p>시터의 응답을 기다리고 있습니다.</p>
					                                                </div>
				                                                </c:if>
				                                                <c:if test="${out.accept == 'N' }">
				                                                	<div class="deny">
					                                                    <p>아쉽게도 시터가 인터뷰 요청을 거절하였습니다.
					                                                        <br><span style="color: #e93c3c;">거절 사유 : ${out.deny_type } </span> 
					                                                    </p>
					                                                </div>
				                                                </c:if>
				                                                <c:if test="${out.accept == 'Y' }">
				                                                	<div class="success">
					                                                    <p>
					                                                        시터가 인터뷰 요청에 수락하였습니다. <br>
					                                                    아래의 번호로 연락하여 인터뷰 시간을 조율할 수 있습니다.
					                                                    </p>
					                                                    <p class="si_phone"><mark>시터 번호 : ${out.phone }</mark></p>
					                                                    <span>※ 아부해는 인터뷰 이후의 상황에 대하여 책임지지 않습니다.</span> 
					                                                </div>
				                                                </c:if>
				                                            </div>
				                                        </div> 
                                       				</c:if>
			                                        <!-- 시터가 구직 종료 하였을 경우 -->
			                                        <c:if test="${out.job_opening eq 'N'.charAt(0)}">
			                                        	<div class="gs_appl" id="no_show1">
				                                            <div class="appl_img">
				                                                <c:if test="${out.isProfile eq '0'}">
		                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; border-radius: 50%;"/>
		                                                   		</c:if>
		                                                   		<c:if test="${out.isProfile eq 'y'.charAt(0) }">
		                                                   			<img src="${out.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
		                                                   		</c:if>
				                                            </div>
				                                            <div class="gs_appl_cont">
			                                               	 	<p class="si_name">${out.name }&nbsp;<span>( ${out.birthdate }세 )</span></p>
				                                                <p>희망시급 : ${out.payment }원</p>
				                                                <p>지원시간 : ${out.applydate }</p>
				                                               
			                                                	<div class="deny">
				                                                    <p>시터가 구직을 종료하였습니다.</p>
				                                                </div>
				                                            </div>
				                                        </div> 
			                                        </c:if>
                                        			
                                        		</c:forEach>
                                        	</c:otherwise>
                                        </c:choose>                                          
                                    </div>
                                    <!-- end 내가 지원한 -->

                                    <!-- 내게 신청한-->
                                    <div class="gs_tab_page hide" id="gs_tab_page_2" class="hide">
                                        <c:choose>
                                        	<c:when test="${in == null }">
                                        		<p>내게 신청한 회원이 없습니다.</p>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:forEach var="in" items="${in }" varStatus="status">
                                        			<!-- 구인중인 회원 -->
                                       				<c:if test="${in.job_opening eq 'Y'.charAt(0) }">
                                       					<div class="gs_appl">
				                                            <div class="appl_img">
				                                                <c:if test="${in.isProfile eq '0'}">
		                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 52px; height: 52px; border-radius: 50%;"/>
		                                                   		</c:if>
		                                                   		<c:if test="${in.isProfile eq 'y'.charAt(0) }">
		                                                   			<img src="${in.fileUrl }" alt="임시프로필" style="width: 52px; height: 52px; border-radius: 50%;">
		                                                   		</c:if>
				                                            </div>
				                                            <div class="gs_appl_cont">
				                                            	
			                                               	    <p class="si_name">
			                                               	 		<a href="${pageContext.request.contextPath}/page_detail/sitter_detail.do?sitterno=${in.sitterno}">${in.name }&nbsp;<span>( ${in.birthdate }세 )</span></a>
			                                               	    </p>
				                                                <p>희망시급 : ${in.payment}원</p>
				                                                <p>지원시간 : ${in.applydate }</p>
				                                                <c:if test="${in.accept == null}">
	                                                                <p class="wait_response">
	                                                                   부모님이 내 답변을 기다리고 있습니다. <br>
	                                                               </p>
	
		                                                             <div class="agree_btn">
		                                                             	 <form id="agreeForm" method="post" action="${pageContext.request.contextPath}/mypage/edit_ok_accept">
			                                                                 <input type="hidden" id="accept_edit1" name="momno" value="${in.momno}">
					                                                         <input type="hidden" id="accept_edit2" name="sitterno" value="${in.sitterno}">
					                                                         <input type="hidden" id="accept_edit3" name="cntno" value="${in.cntno}">
			                                                                 <button type="submit" class="interview_ok">수락</button>
			                                                              </form>
			                                                              <button type="button" class="interview_no">거절</button>
		                                                             </div>
		                                                              
		                                                              <div class="reason_deny hide">
		                                                          		  <form id="denyForm" method="post" action="${pageContext.request.contextPath}/mypage/edit_ok_deny">
	                                                         		  	      <div class="deny_cont">
	                                                         		  	      		<h4>거절 유형을 선택해주세요.</h4>
						                                                              <div class="deny_radio">
						                                                              	  <input type="hidden" id="accept_edit1" name="momno" value="${in.momno}">
						                                                              	  <input type="hidden" id="accept_edit2" name="sitterno" value="${in.sitterno }">
						                                                                  <div>
						                                                                      <input type="radio" name="deny_type" id="deny1" class="deny_btn" value="최근에 다른 맘시터와 활동을 시작하였습니다.">
						                                                                      <label for="deny1">최근에 다른 맘시터와 활동을 시작하였습니다.</label>
						                                                                  </div>
						                                                                  <div>
						                                                                      <input type="radio" name="deny_type" id="deny2" class="deny_btn" value="다른 맘시터와 인터뷰 후, 결과를 기다리고 있습니다.">
						                                                                      <label for="deny2">다른 맘시터와 인터뷰 후, 결과를 기다리고 있습니다.</label>
						                                                                  </div>
						                                                                  <div>
						                                                                      <input type="radio" name="deny_type" id="deny4" class="deny_btn" value="요청하신 시간에는 어렵습니다.">
						                                                                      <label for="deny4">요청하신 시간에는 어렵습니다.</label>
						                                                                  </div>
						                                                                  <div>
						                                                                      <input type="radio" name="deny_type" id="deny7" class="deny_btn" value="피치 못할 사정으로 앞으로 구인 활동이 어렵습니다.">
						                                                                      <label for="deny7">피치 못할 사정으로 앞으로 구인 활동이 어렵습니다.</label>
						                                                                  </div>
						                                                                  <div>
						                                                                      <input type="radio" name="deny_type" id="deny8" class="deny_btn" value="그 밖에 다른 이유로 거절합니다.">
						                                                                      <label for="deny8">그 밖에 다른 이유로 거절합니다.</label>
						                                                                  </div>
						                                                              </div>
	                                                         		  	      	</div>
				                                                              <div>
				                                                                  <button class="ok_btn center-block" type="submit">전송하기</button>
				                                                              </div>     
		                                                          		  </form>
		                                                          	  </div>
	                                                           	 </c:if>
				                                                <c:if test="${in.accept == 'N' }">
				                                                	<div class="deny">
				                                                    	<p>시터에게 내 거절의사를 전달했습니다.</p>
				                                                    	<p>거절 사유 : ${in.deny_type }</p>
				                                                	</div>
				                                                </c:if>
				                                               <c:if test="${in.accept == 'Y'}">
	                                                               <div class="success">
					                                                    <p>
					                                                    아래의 번호로 연락하여 인터뷰 시간을 조율할 수 있습니다.
					                                                    </p>
					                                                    <p class="si_phone"><mark>시터 번호 : ${in.phone }</mark></p>
					                                                    <span>※ 아부해는 인터뷰 이후의 상황에 대하여 책임지지 않습니다.</span> 
					                                                </div>
	                                                            </c:if>
				                                            </div>
				                                        </div>
                                       				</c:if>
                                       				
                                       				<!-- 구인종료한 회원일 경우 --> 
                                       				<c:if test="${in.job_opening eq 'N'.charAt(0)}">
                                       					<div class="gs_appl" id="no_show2">
				                                            <div class="appl_img">
				                                                <c:if test="${in.isProfile eq '0'}">
		                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 52px; height: 52px; border-radius: 50%;"/>
		                                                   		</c:if>
		                                                   		<c:if test="${in.isProfile eq 'y'.charAt(0) }">
		                                                   			<img src="${in.fileUrl }" alt="임시프로필" style="width: 52px; height: 52px; border-radius: 50%;">
		                                                   		</c:if>
				                                            </div>
				                                            <div class="gs_appl_cont">
				                                               	 <p class="si_name">
				                                               	 	<a href="${pageContext.request.contextPath}/page_detail/sitter_detail.do?sitterno=${in.sitterno}">${in.name }&nbsp;<span>( ${in.birthdate }세 )</span></a>
			                                               	 	</p>
				                                                <p>희망시급 : ${in.payment}원</p>
				                                                <p>지원시간 : ${in.applydate }</p>
				                                               <div class="deny">
			                                                    	<p>시터가 구직 종료하였습니다.</p>
			                                                	</div>
				                                            </div>
				                                        </div>
                                       				</c:if>
                                        			
                                        		</c:forEach>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!-- end 내게 신청한-->
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- end content1 -->
                </div>
            </div>
        </div>
        
		<!--Google CDN 서버로부터 jQuery 참조 -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Javascript -->
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
        <!-- jQuery Ajax Form plugin CDN -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
        <!-- jQuery Ajax Setup -->
        <script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
        <script type="text/javascript">
        	 $(function() {
        		 console.log("${output}");
        		 
        		 // 구직 종료 회원 프로필을 클릭했을 경우 메세지 창 
        		 $("#no_show1").click(function(e) {
        			 alert("시터가 프로필을 비공개하였습니다.");
        			 return;
        		 });
        		 
        		 $("#no_show2").click(function(e) {
        			 alert("시터가 프로필을 비공개하였습니다.");
        			 return;
        		 });
        		 
                $(".gs_tab_item").click(function(e) {
                    e.preventDefault();

                    $(".gs_tab_item").not(this).removeClass("fi_selected");
                    $(this).addClass("fi_selected");

                    $(".gs_tab_item").not(this).find("a").removeClass("selected");
                    $(this).find("a").addClass("selected");

                    var target = $(this).find("a").attr("href");
                    $(target).removeClass("hide");
                    $(".gs_tab_panel > div").not($(target)).addClass("hide");
                });
                
                $(".interview_no").click(function(e) {
                    e.preventDefault();
                    
                    $(this).parent().next().toggleClass("hide");
                 });
                
                $("#agreeForm").ajaxForm({
                    method: "POST",
                    success: function(json) {
                       if (json.rt == "OK") {
                          window.location = "${pageContext.request.contextPath}/mypage/mypage_mom/gets/${login.momno}";
                       }
                    }
                 });
                 
                 $("#denyForm").ajaxForm({
                     method: "POST",
                     success: function(json) {
                        if (json.rt == "OK") {
                           window.location = "${pageContext.request.contextPath}/mypage/mypage_mom/gets/${login.momno}";
                        }
                     }
                  });
            });
        </script>
	</body>
</html>