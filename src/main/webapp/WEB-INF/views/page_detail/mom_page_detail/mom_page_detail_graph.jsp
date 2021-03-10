<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	
%>
<!doctype html>
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
											* 2020.12.16 부터
											<div style="margin-left: 5px;">
											정기적으로 돌봐주세요.
											</div>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="active">
									<div class="active_main">
										<div class="active_main_box" style="display: block;">
											<div>
												<div class="day_area">
													<div class="day_box">
														<div class="day">
															<div class="day_name">수</div>
															<div class="date_name">12/16</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">목</div>
															<div class="date_name">12/17</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">금</div>
															<div class="date_name">12/18</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">토</div>
															<div class="date_name">12/19</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">일</div>
															<div class="date_name">12/20</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">월</div>
															<div class="date_name">12/21</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">화</div>
															<div class="date_name">12/22</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">수</div>
															<div class="date_name">12/23</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">목</div>
															<div class="date_name">12/24</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">금</div>
															<div class="date_name">12/25</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">토</div>
															<div class="date_name">12/26</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">일</div>
															<div class="date_name">12/27</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">월</div>
															<div class="date_name">12/28</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">화</div>
															<div class="date_name">12/29</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">수</div>
															<div class="date_name">12/30</div>
														</div>
													</div>
													<div class="day_box">
														<div class="day">
															<div class="day_name">목</div>
															<div class="date_name">12/31</div>
														</div>
													</div>
												</div> <!-- fin. day_area -->
											</div>	
											<div class="heure_area">
												<div class="heure">00:00</div>
												<div class="heure">02:00</div>
												<div class="heure">04:00</div>
												<div class="heure">06:00</div>
												<div class="heure">08:00</div>
												<div class="heure">10:00</div>
												<div class="heure">12:00</div>
												<div class="heure">14:00</div>
												<div class="heure">16:00</div>
												<div class="heure">18:00</div>
												<div class="heure">20:00</div>
												<div class="heure">22:00</div>
												<div class="heure">00:00</div>
											</div> <!-- fin. herue_area -->		
											<div class="date_area">
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="date"></div>
												<div class="time_area">
													<div class="time_box">
														<div class="time_01">
															<div>08:00</div>
															<div>22:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_02">
															<div>17:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_03">
															<div>17:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_04">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_05">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_06">
															<div>07:00</div>
															<div>22:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_07">
															<div>07:00</div>
															<div>22:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_08">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_09">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_10">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_11">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_12">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_13">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_14">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_15">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
														<div class="time_16">
															<div>09:30</div>
															<div>23:00</div>
															<br>
															<div></div>
														</div>
													</div>
												</div>
											</div>						
										</div> <!-- fin. active_main_box -->
									</div> <!-- fin. active_main -->
								</div> <!-- fin. active -->
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
						    <span class="glyphicon glyphicon-heart-empty" style="color: rgb(0, 143, 105); font-size: 25px;"></span>
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
				<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- .modal-dialog -->
					<div class="modal-dialog">
						<!-- .modal-content -->
						<div class="modal-content">
							<div class="modal-body">
								<p style="text-align: center; padding-top: 10px; font-weight: bold;">
									일자리에 지원하기 위해
									<br/>
									지원권을 구매해주세요
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_ok" onclick = "location.href = 'http://localhost:8080<%=request.getContextPath()%>/buy/buy.jsp'">
									지원권 구매하러 가기
								</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->		
			</div> <!-- fin. col-xs-12 -->
		</div>
	
		<!-- Javascript -->
		<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
		<script type="text/javascript">
		jQuery(function($) {
			
			  $('#swapHeart').on('click', function() {
			    var $jim = $(this)
			    
			    // 찜할 때 alert창과 glyphicon변형
			    if($(this).find('span').hasClass("glyphicon-heart-empty")) {
			    	$(this).find('span').removeClass("glyphicon-heart-empty");
			    	$(this).find('span').addClass("glyphicon-heart");
		            swal("찜 하기 완료!", "마이페이지 > 찜한 일자리에서 확인할 수 있습니다.");
			    }
			 	// 찜 취소할 때 alert창과 glyphicon변형
		        else{
		           	swal("찜 하기 취소");
		            $(this).find('span').addClass("glyphicon-heart-empty");
		        }
		    
			  }); // fin. 찜버튼 기능
			});
		 </script>
		 <!-- jquery 파일명 수정 -->
		<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script> 
	</body>
</html>