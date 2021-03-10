<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/upd_mps_detail.css">

        <style type="text/css">

      </style>
    </head>

    <body>
        <div class="app">
            <div class="container">
                <div class="wrap_get_mom">
                     <!-- header -->
                     <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do?sitterno=${login.sitterno}">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">내 구직 현황</h3>
                            </div>
                        </div>
                    </header>
                    <!-- end header -->
                    
                    <!-- content1 -->
                    <section class="group1_get_mom">
                        <div class="row">
                            <div class="col-xs-12 get_mom_tab">
                                <!-- 탭 버튼 영역 -->
                                <ul class="gm_tab_button">
                                    <li id="button1" class="gm_tab_item fi_selected">
                                        <a class="tab_button_item_link selected" href="#gm_tab_page_1">내가 지원한</a>
                                    </li>
                                    <li id="button2" class="gm_tab_item">
                                        <a class="tab_button_item_link" href="#gm_tab_page_2">내게 신청한</a>
                                    </li>
                                </ul>
                                <!-- end 탭 버튼 영역-->

                                <!-- 내용 영역 -->
                                <div class="gm_tab_panel">
                                    <!-- 내가 지원한 -->
                                    <div class="gm_tab_page" id="gm_tab_page_1">
                                    
                                        <c:choose>
                                        	<c:when test="${output2 == null }">
                                        		<p>조회내역이 없습니다.</p>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:forEach var="out" items="${output2 }" varStatus="status">
                                        			<c:if test="${out.job_opening eq 'Y'.charAt(0)}">
                                        				<div class="gm_appl">
				                                            <div class="appl_img">
				                                               <c:if test="${out.isProfile eq '0'}">
		                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" 
		                                                   			style="margin-right:10px; width: 52px; height:52px; border-radius: 50%;"/>
		                                                   		</c:if>
		                                                   		<c:if test="${out.isProfile eq 'y'.charAt(0) }">
		                                                   			<img src="${out.fileUrl }" alt="임시프로필" style="margin-right:10px; width: 52px; height: 52px; border-radius: 50%;">
		                                                   		</c:if>
				                                            </div>
				                                            <div class="gs_appl_cont">
			                                                	<p class="si_name">
			                                                		<a href="${pageContext.request.contextPath}/page_detail/mom_detail.do?momno=${out.momno}">${out.name }&nbsp;부모</span></a>
		                                                		</p>
				                                                <p>희망시급:${out.payment }원</p>
				                                                <p>지원시간:${out.applydate }</p>
				                                                <c:if test="${out.accept == null }">
				                                                	<div class="success">
					                                                   <p>맘회원의 응답을 기다리고 있습니다.</p>
					                                                </div>
				                                                </c:if>
				                                                <c:if test="${out.accept == 'N' }">
				                                                	<div class="deny">
					                                                    <p>
					                                                    	<span style="color: #e93c3c;">거절 사유 : ${out.deny_type }</span>
					                                                        <br>다른 맘회원에게 신청을 시작해보세요.
					                                                    </p>
					                                                </div>
				                                                </c:if>
				                                                <c:if test="${out.accept == 'Y' }">
				                                                	<div class="success">
					                                                    <p>
					                                                        맘회원이 인터뷰 요청에 수락하였습니다. <br>
					                                                    아래의 번호로 연락하여 인터뷰 시간을 조율할 수 있습니다.
					                                                    </p>
					                                                    <p class="si_phone"><mark>맘회원 번호 : ${out.phone }</mark></p>
					                                                    <span>※ 아부해는 인터뷰 이후의 상황에 대하여 책임지지 않습니다.</span> 
					                                                </div>
				                                                </c:if>
				                                            </div>
				                                        </div> 
                                        			</c:if>
                                        			
                                        			<!-- 맘회원이 구직을 종료했을 경우 -->
                                        			<c:if test="${out.job_opening eq 'N'.charAt(0)}">
                                        				<div class="gm_appl" id="no_show1">
				                                            <div class="appl_img">
				                                               <c:if test="${out.isProfile eq '0'}">
		                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" 
		                                                   			style="margin-right:10px; width: 52px; height:52px; border-radius: 50%;"/>
		                                                   		</c:if>
		                                                   		<c:if test="${out.isProfile eq 'y'.charAt(0) }">
		                                                   			<img src="${out.fileUrl }" alt="임시프로필" style="margin-right:10px; width: 52px; height: 52px; border-radius: 50%;">
		                                                   		</c:if>
				                                            </div>
				                                            <div class="gs_appl_cont">
			                                                	<p class="si_name">
			                                                		${out.name }&nbsp;부모
			                                                	</p>
				                                                <p>희망시급:${out.payment }원</p>
				                                                <p>지원시간:${out.applydate }</p>
				                             
			                                                	<div class="deny">
				                                                    <p> 맘회원이 구인을 종료하였습니다.</p>
				                                                </div>
				                                            </div>
				                                        </div> 
                                        			</c:if>
			                                        <hr>
                                        		</c:forEach>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!-- end 내가 지원한 -->

                                    <!-- 내게 신청한-->
                                    <div class="gm_tab_page hide" id="gm_tab_page_2" class="hide">
                                        <c:forEach var="in" items="${output}" varStatus="status">
                               				<c:if test="${in.job_opening eq 'Y'.charAt(0)}">
	                                            	
                                           		<div class="gm_appl">
                                                    	<c:if test="${in.isProfile eq '0'}">
                                                  			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 52px; height:52px; border-radius: 50%;"/>
                                                  		</c:if>
                                                  		<c:if test="${in.isProfile eq 'y'.charAt(0) }">
                                                  			<img src="${in.fileUrl }" alt="임시프로필" style="width: 52px; height: 52px; border-radius: 50%;">
                                                  		</c:if>
                                                     <div class="gm_info">
                                                         <p><a href="${pageContext.request.contextPath}/page_detail/mom_detail.do?momno=${in.momno}">${in.name} 부모</a></p>
                                                         <p>희망시급: ${in.payment} 원</p>
                                                         <p>지원시간: ${in.applydate} </p>
                                                         <p class="gm_endtime">
                                                            <%-- 인터뷰 요청에 응답하지 않았을 경우 --%>
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
					                                                              	  <input type="hidden" id="accept_edit2" name="sitterno" value="${login.sitterno }">
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny1" class="deny_btn" value="최근에 다른 부모님과 활동을 시작하였습니다.">
					                                                                      <label for="deny1">최근에 다른 부모님과 활동을 시작하였습니다.</label>
					                                                                  </div>
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny2" class="deny_btn" value="다른 부모님과 인터뷰 후, 결과를 기다리고 있습니다.">
					                                                                      <label for="deny2">다른 부모님과 인터뷰 후, 결과를 기다리고 있습니다.</label>
					                                                                  </div>
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny3" class="deny_btn" value="이동하기에 먼 거리입니다.">
					                                                                      <label for="deny3">이동하기에 먼 거리입니다.</label>
					                                                                  </div>
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny4" class="deny_btn" value="요청하신 시간에는 어렵습니다.">
					                                                                      <label for="deny4">요청하신 시간에는 어렵습니다.</label>
					                                                                  </div>
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny5" class="deny_btn" value="요청하신 활동은 자신있는 분야가 아닙니다.">
					                                                                      <label for="deny5">요청하신 활동은 자신있는 분야가 아닙니다.</label>
					                                                                  </div>
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny6" class="deny_btn" value="아이 나이가 너무 어립니다.">
					                                                                      <label for="deny6">아이 나이가 너무 어립니다.</label>
					                                                                  </div>
					                                                                  <div>
					                                                                      <input type="radio" name="deny_type" id="deny7" class="deny_btn" value="피치 못할 사정으로 앞으로 맘시터 활동이 어렵습니다.">
					                                                                      <label for="deny7">피치 못할 사정으로 앞으로 맘시터 활동이 어렵습니다.</label>
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
	                                                             <%-- 인터뷰 요청을 수락했을 경우 --%>
	                                                             <c:if test="${in.accept == 'Y'}">
	                                                               <div class="success">
					                                                    <p>
					                                                    아래의 번호로 연락하여 인터뷰 시간을 조율할 수 있습니다.
					                                                    </p>
					                                                    <p class="si_phone"><mark>맘 번호 : ${in.phone }</mark></p>
					                                                    <span>※ 아부해는 인터뷰 이후의 상황에 대하여 책임지지 않습니다.</span> 
					                                                </div>
	                                                             </c:if>
	                                                             <%-- 인터뷰 요청을 거절했을 경우 --%>
	                                                             <c:if test="${in.accept == 'N'}">
	                                                             	<div class="deny">
				                                                    	<p>맘회원에게 내 거절의사를 전달했습니다.</p>
				                                                    	<p><span style="color: #e93c3c; font-size: 1.3em;">거절 사유 : ${in.deny_type}</span></p>
				                                                	</div>
	                                                             </c:if> 
	                                                         </p>
	                                                     </div>
                                                 	</div>
	                                    	
	                                                <hr>
                                     		</c:if>
                                     		
                                     		<c:if test="${in.job_opening eq 'N'.charAt(0)}">
                                           		<div class="gm_appl" id="no_show2">
                                                    	<c:if test="${in.isProfile eq '0'}">
                                                  			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 52px; height:52px; border-radius: 50%;"/>
                                                  		</c:if>
                                                  		<c:if test="${in.isProfile eq 'y'.charAt(0) }">
                                                  			<img src="${in.fileUrl }" alt="임시프로필" style="width: 52px; height: 52px; border-radius: 50%;">
                                                  		</c:if>
                                                     <div class="gm_info">
                                                         <p>${in.name} 부모</p>
                                                         <p>희망시급: ${in.payment} 원</p>
                                                         <p>지원시간: ${in.applydate} </p>
                                                         <p class="gm_endtime">   
                                                       	 <div class="deny">
	                                                    	<p>맘회원이 구인을 종료하였습니다.</p>
	                                                	 </div>       
                                                     </div>
                                               	</div>
                                                <hr>
                                     		</c:if>
                                        </c:forEach>
                                    </div>
                                    <!-- end 내게 신청한-->
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- end content1 -->

                    <!-- modal -->
                    <div id="res_modal" class="modal fade" tabindex="-1" role="dialog" 
                    aria-labelledby="modalLabel" aria-hidden="true">
                        <!-- mocal-dialog -->
                        <div class="modal-dialog">
                            <!-- modal-content -->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="fund_500"><i class="fas fa-coins"></i>지금 응답하면, 적립금 500원</div>
                                </div>

                                <!-- 내용 -->
                                <div class="modal-body">
                                    <p>응답가능 시간 2 : 58 : 16초 남음</p>
                                    <p>맘시터 구인 1일째 - 희망시급 10,000원</p>
                                    <div class="modal_btn">
                                        <button type="button" id="interview_no" 
                                        onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_sitter/reason_deny.do'">거절</button>
                                        <button type="button" id="interview_ok">수락</button>
                                    </div>
                                </div>
                            </div>
                            <!-- //modal-content end -->
                        </div>
                        <!-- //modal-dailog end-->
                    </div>
                </div>
            </div>
        </div>
      
        <!--Google CDN 서버로부터 jQuery 참조 -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
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
               
               $("#agreeForm").ajaxForm({
                  method: "POST",
                  success: function(json) {
                     if (json.rt == "OK") {
                        window.location = "${pageContext.request.contextPath}/mypage/mypage_sitter/getm/${login.sitterno}";
                     }
                  }
               });
               
               $("#denyForm").ajaxForm({
                   method: "POST",
                   success: function(json) {
                      if (json.rt == "OK") {
                         window.location = "${pageContext.request.contextPath}/mypage/mypage_sitter/getm/${login.sitterno}";
                      }
                   }
                });
               
                $(".gm_tab_item").click(function(e) {
                    e.preventDefault();

                    $(".gm_tab_item").not(this).removeClass("fi_selected");
                    $(this).addClass("fi_selected");

                    $(".gm_tab_item").not(this).find("a").removeClass("selected");
                    $(this).find("a").addClass("selected");

                    var target = $(this).find("a").attr("href");
                    $(target).removeClass("hide");
                    $(".gm_tab_panel > div").not($(target)).addClass("hide");
                }); 
                
                $(".interview_no").click(function(e) {
                    e.preventDefault();
                    
                    $(this).parent().next().toggleClass("hide");
                 });
                
                
            });
        </script>
   </body>
</html>