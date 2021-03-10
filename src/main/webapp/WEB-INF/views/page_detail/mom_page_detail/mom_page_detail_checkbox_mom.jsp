<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	
%>
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

<!-- 아이콘 사용 -->
<script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script> 

<!-- sweetalert 사용 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/mom_page_detail.css" />
<style type="text/css">
	#modal_ok {
		color: #008f69;
		border-color: #fff;
		height: 50px;
		margin-left: -30px;
		width: 160px;
		font-weight: bold;
	}
	#modal_serach {
		color: #008f69;
		border-color: #fff;
		margin-right: -50px;
		font-weight: bold;
		height: 50px;
		width: 190px;
		border-left: 1px solid #ccc;
	}
</style>
</head>
	
<body>		
		<div class="container">
			<div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
				<div class="pull-right">
					<button type="button" class="btn btn-dark btn-xs" id="siren" onclick = "location.href = 'mom_report.jsp'">
				 	 <img src="<%=request.getContextPath()%>/assets/img/siren.png" width="13" height="15"/>
				             신고
				  	</button>
				</div>
				  <button type="button" class="x_btn" onclick = "history.back() ">
					<img src="<%=request.getContextPath()%>/assets/img/x-btn.jpg" width="28" height="28"/>
				  </button>
				<div class="profil_photo">
				  <div class="profil_img">			  
					<img src="<%=request.getContextPath()%>/assets/img/chat_mom.png"/>				
				  </div>
				</div> <!-- fin. profil_photo -->
				<div class="profil_info">
					<p style="font-weight: bold; font-size: 1.2em;">실내놀이 맘시터 찾습니다.</p>
				</div> <!-- fin. profil_info -->
				<div class="mom_info">
				    <div class="name">정<i class="far fa-circle"></i>우</div>
					<div class="line"></div>
					<div class="number">no.53213</div>
				</div>
				
				<hr/>
				
				<div class="two_info_box">
					<div class="two_info_area">
						<div class="views_area">
							<div id="views"><i class="fas fa-user-friends"></i> 지원자 수</div>
							<div id="views_number"><span style="color: #00726e;">현재 999명</span></div>
						</div>
						<div class="two_info_style"></div>
						<div class="clock_area">
							<div id="clock"><i class="far fa-clock"></i> 신청서 작성</div>
							<div id="date">한 달 전</div>
						</div>
					</div>
				</div>
				<!-- Main start-->
				<div class="main">
					<div class="info_box">
						<div class="box_name">신청내용</div>
						<div class="info_area">
							<div class="info_text_box">
								<div class="info_text">
									<span>
										여아 15개월 엄청 산만함.. 오르기 좋아합니다
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="iwant_box">
						<div class="box_name">원하는 시터나이</div>
						<div class="iwant_area">
							<div class="sitter_age_area">
								<div class="sitter_age_no_area">
									20대
								</div>
								<div class="sitter_age_ok_area">
									30대
								</div>
								<div class="sitter_age_ok_area">
									40대
								</div>
								<div class="sitter_age_ok_area">
									50대
								</div>
								<div class="sitter_age_no_area">
									60대
								</div>
							</div>
						</div>
					</div> <!-- fin. iwant_box -->
					<div class="possible_zone_box">
						<div class="box_name">돌봄 지역</div>
						<div class="possible_zone_area">
							<div>
								<div class="zone_line">
									<span style="color: #028071;"><i class="fas fa-map-marker-alt"></i></span> 
									<div id="zone_line_blank">인천광역시 남동구</div>
								</div>
							</div>
						</div> <!-- fin. possible_zone_area -->
					</div> <!-- fin. possible_zone_box -->
					<div class="active_box">
						<div class="box_name">활동 가능 시간</div>
						<div class="active_area">
							<div class="active_area_text">
								<div class="active_area_profil">
									<img src="<%=request.getContextPath()%>/assets/img/chat_mom03.jpg" width="60" height="60" style="border-radius: 100%;"/>
								</div>
								<div class="active_area_text_box">
									<div id="active_area_style"></div>
									<div style="padding: 8px 0px;">
										<div class="active_text_line">
											<span id="active_text_style">
											아래 시간 중 서로 맞는 시간에 만나보고
											<br/>
											<span style="color: #c040dc; margin-left: 5px;">
											돌봄 일정을 결정
											</span>
											하고 싶어요.
											</span>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="active_time_box">
								
									<div class="partTime_line">
										<div class="partTime">
											<div class="part">오전</div>
											<div class="time">07시 ~ 12시</div>
										</div>
										<div class="partTime">
											<div class="part">오후</div>
											<div class="time">12시 ~ 18시</div>
										</div>
										<div class="partTime">
											<div class="part">저녁</div>
											<div class="time">18시 ~ 22시</div>
										</div>
									</div> <!-- fin. partTime_line -->
									
									<div class="partDay_line">
										월
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										화
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										수
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										목
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										금
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_ok"><i class="fas fa-check"></i></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										토
										<div class="partDay_no"></div>
										<div class="partDay_no"></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									<div class="partDay_line">
										일
										<div class="partDay_no"></div>
										<div class="partDay_no"></div>
										<div class="partDay_no"></div>
									</div> <!-- fin. partDay_line -->
									
								</div> <!-- fin. active_time_box -->
							</div>
						</div> <!-- fin. active_area -->
					</div> <!-- fin. active_box -->
					<div class="possible_age_box">
					<div class="box_name">아이 정보</div>
					<div class="possible_age_area">
						<div>							
							<div class="child_age_line">
								<div style="margin-bottom: -10px">
								<span style="color: #ff7000;"><i class="fas fa-baby-carriage fa-3x"></i></span>
								</div>
								<span class="child_age_text">영아 2세</span>
							</div>
							<div class="child_age_line">
								<div style="margin-bottom: -10px">
								<span style="color: #ff7000;"><i class="fas fa-child fa-3x"></i></span>
								</div>
								<span class="child_age_text">유아 7세</span>
							</div>		
						</div>
					</div> <!-- fin. possible_age_area -->
				</div> <!-- fin. possible_age_box -->
					<div class="possible_age_box">
						<div class="box_name">원하는 활동</div>
						<div class="possible_age_area">
							<div>
							<div class="possible_active_main">
									<div class="active_line col-xs-3">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/innerplayicon_s.png"/>
												</div>
												<span>실내놀이</span>
											</div>
										</div>
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="<%=request.getContextPath()%>/assets/img/koreanicon_s.png"/>
												</div>
												<span>한글놀이</span>
											</div>
										</div>
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/cleanicon_s.png"/>
												</div>
												<span>간단 청소</span>
											</div>
										</div>
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="<%=request.getContextPath()%>/assets/img/longhouseicon_s.png"/>
												</div>
												<span>장기입주</span>
											</div>
										</div>
									</div>
									<!-- --- -->
									<div class="active_line col-xs-3">
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="<%=request.getContextPath()%>/assets/img/guideicon_s.png"/>
												</div>
												<span>등하원 돕기</span>
											</div>
										</div>
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/englishicon_s.png"/>
												</div>
												<span>영어놀이</span>
											</div>
										</div>
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/eaticon_s.png"/>
												</div>
												<span>밥 챙겨주기</span>
											</div>
										</div>
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="<%=request.getContextPath()%>/assets/img/houseicon_s.png"/>
												</div>
												<span>단기입주</span>
											</div>
										</div>
									</div>
									<!-- ----- -->
									<div class="active_line col-xs-3">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/readicon_s.png"/>
												</div>
												<span>책읽기</span>
											</div>
										</div>
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="<%=request.getContextPath()%>/assets/img/studyicon_s.png"/>
												</div>
												<span>학습지도</span>
											</div>
										</div>
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/dishicon_s.png"/>
												</div>
												<span>간단 설거지</span>
											</div>
										</div>
									</div>
									<!-- ------- -->
									<div class="active_line col-xs-3">
										<div class="active_ok">
											<div class="active_ok_img">
												<div class="active_ok_box">
												<img src="<%=request.getContextPath()%>/assets/img/ousideicon_s.png"/>
												</div>
												<span>야외활동</span>
											</div>
										</div>
										<div class="active_no">
											<div class="active_no_img">
												<div class="active_no_box">
												<img src="<%=request.getContextPath()%>/assets/img/ballicon_s.png" />
												</div>
												<span>체육놀이</span>
											</div>
										</div>
									</div>
									<!-- ---- -->
								</div>
							</div>
						</div> <!-- fin. possible_active_area -->
					</div> <!-- fin. possible_active_box -->
					<div class="talk_box">
						<div class="box_name">맘시터 후기</div>
						<div class="talk_area">
							<div class="talk_main">
								<div>
									<div class="talk_box_ea">
										<div class="talk_box_line">
											<img src="<%=request.getContextPath()%>/assets/img/chat_mom02.png" width="50" height="50"/>
											<div class="talk_box_line_text">
												<div class="talk_box_line_date_name">
													<div class="talk_box_line_name">김<i class="far fa-circle"></i>준</div>
													<div class="talk_box_line_date">7달 전</div>
												</div>
												<div class="talk_box_line_date_name">
													<div style="color: #000; font-size: 0.8em; margin-right: 5px; font-weight: bold;">인터뷰 후기</div>
													<div class="star_area">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</div>
												</div>
												<div class="talk_box_line_date_name">
													<div class="talk_box_talk">
														<span>원하는 시간이 저와 맞지 않아 매칭이 성사되지 못하였습니다ㅠㅠ</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<hr style="margin: -1px 0px 0px; height: 1px; border: none; background-color: rgb(224,224,224);">
									
									<div class="talk_box_ea">
										<div class="talk_box_line">
											<img src="<%=request.getContextPath()%>/assets/img/chat_mom02.png" width="50" height="50"/>
											<div class="talk_box_line_text">
												<div class="talk_box_line_date_name">
													<div class="talk_box_line_name">김<i class="far fa-circle"></i>준</div>
													<div class="talk_box_line_date">7달 전</div>
												</div>
												<div class="talk_box_line_date_name">
													<div style="color: #000; font-size: 0.8em; margin-right: 5px; font-weight: bold;">인터뷰 후기</div>
													<div class="star_area">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</div>
												</div>
												<div class="talk_box_line_date_name">
													<div class="talk_box_talk">
														<span>원하는 시간이 저와 맞지 않아 매칭이 성사되지 못하였습니다ㅠㅠ</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<hr style="margin: -1px 0px 0px; height: 1px; border: none; background-color: rgb(224,224,224);">
									
									<div class="talk_box_ea">
										<div class="talk_box_line">
											<img src="<%=request.getContextPath()%>/assets/img/chat_mom02.png" width="50" height="50"/>
											<div class="talk_box_line_text">
												<div class="talk_box_line_date_name">
													<div class="talk_box_line_name">김<i class="far fa-circle"></i>준</div>
													<div class="talk_box_line_date">7달 전</div>
												</div>
												<div class="talk_box_line_date_name">
													<div style="color: #000; font-size: 0.8em; margin-right: 5px; font-weight: bold;">인터뷰 후기</div>
													<div class="star_area">
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
														<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
													</div>
												</div>
												<div class="talk_box_line_date_name">
													<div class="talk_box_talk">
														<span>원하는 시간이 저와 맞지 않아 매칭이 성사되지 못하였습니다ㅠㅠ</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> <!-- fin. talk_area -->
					</div> <!-- fin. talk_box -->
					<div class="possible_age_box">
					<div class="box_name">그 외 요청사항</div>
					<div class="possible_age_area">
						<div>							
							<div class="other_line">
								<label class="want_gender_line">희망 맘시터 성별 : </label>
								<span class="want_gender">여자</span>
							</div>
							<div class="other_line">
								<label class="want_care_line">희망 돌봄 방식 : </label>
								<span class="want_care">할머니(할아버지)와 함께 돌봐주세요.</span>
							</div>		
						</div>
					</div> <!-- fin. possible_age_area -->
					</div> <!-- fin. possible_age_box -->
				</div> <!-- fin. Main -->
				<!-- ----------하단고정 부분 시작------------ -->
				<div class="fixed_box col-xs-12">
					<div class="fixed_area">
						<div class="fixed_area_age">
							<div class="fixed_name">
								맘시터 구인 3 일째
							</div>
							<div class="fixed_age">
								희망시급 (협의가능)
							</div>
							<div class="fixed_money">
							99,900원
							</div>
						</div>
					</div> <!-- fin. fixed_area -->
					<div class="fixed_btn">
						<div class="fixed_btn_jim">						
							<button id="swapHeart" class="btn btn-default swap">
							    <a data-toggle="modal" href="#Modal"><span class="glyphicon glyphicon-heart-empty" style="color: rgb(0, 143, 105); font-size: 25px;"></span></a>
							</button>
							<div class="jim_number">
								999
							</div>
						</div>
						<div class="interview_btn">
							<button tabindex="0" type="button" class="btn-interview">
								<div>
									<div class="btn_text_box">
										<span><a data-toggle="modal" href="#myModal" class="btn btn-primary btn-sm">인터뷰 신청하기</a></span>
									</div>
								</div>
							</button>
						</div>
					</div>
				</div> <!-- fin. fixed_box -->
				<!-- /.modal -->
				<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<!-- .modal-dialog -->
				<div class="modal-dialog">
					<!-- .modal-content -->
					<div class="modal-content">
						<div class="modal-body">
							<p style="text-align: center; padding-top: 10px; font-weight: bold;">
								시터 회원만 지원가능합니다.
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_ok">
								확인
							</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<div id="Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<!-- .modal-dialog -->
			<div class="modal-dialog">
				<!-- .modal-content -->
				<div class="modal-content">
					<div class="modal-body">
						<p style="text-align: center; padding-top: 10px; font-weight: bold;">
							시터회원만 일자리를 찜할 수 있습니다.
							'맘시터 찾기'에서 나와 맞는 맘시터를 찜해보세요.
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="modal_ok">
							확인
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="modal_serach" onclick="location.href='<%=request.getContextPath()%>/search/sitter_search.jsp'">
							맘시터 찾기
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		</div> <!-- fin. col-xs-12 -->
		</div>
	
		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		 <!-- jquery 파일명 수정 -->
		<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script> 
	</body>
</html>