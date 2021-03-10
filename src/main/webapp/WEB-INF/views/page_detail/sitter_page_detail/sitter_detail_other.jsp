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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/page_detail_for_mom.css" />	
</head>
	
<body>		
		<div class="container">
			<div class="col-xs-12"> <!-- xs-12로 모바일 맞춤 -->
				<div class="pull-right">
					<button type="button" class="btn btn-dark btn-xs" id="siren" onclick = "location.href = 'sitter_report.jsp'">
				 	<img src="<%=request.getContextPath()%>/assets/img/siren.png" width="13" height="15"/>
				            신고
				  	</button>
				</div>
				<button type="button" class="x_btn" onclick = "history.back() ">
					<img src="<%=request.getContextPath()%>/assets/img/x-btn.jpg" width="28" height="28"/>
				</button>
				<div class="profil_photo">
					  <div class="profil_img">			  
						<img src="<%=request.getContextPath()%>/assets/img/chat_mom.png" width="100%"/>
					  </div>
				</div> <!-- fin. profil_photo -->
				<div class="profil_info">
					<div class="info_name">
						<div class="name" style="font-size:1.4em;">정<i class="far fa-circle"></i>우</div>
						<div class="name_siter">엄마 맘시터</div>
						<div class="response">
							응답률
							96%
						</div>
					</div><!-- fin. info_name -->		
					<div class="info_star">
						<div class="star">
							<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
							<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
							<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
							<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
							<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
						</div>
						<div class="review_ea">
								후기 20개
						</div>
						<div class="line"></div>
						<div class="age">50세</div>
						<div class="line"></div>
						<div class="number">no.53213</div>
					</div><!-- fin. info_star -->
				</div> <!-- fin. profil_info -->
				
				<hr/>
				
				<div class="three">
					<div class="three_area">
						<div class="views_area">
							<div id="views"><i class="fas fa-user-friends"></i> 조회수</div>
							<div id="views_number">93742</div>
						</div>
						<div class="line_three"></div>
						<div class="clock_area">
							<div id="clock"><i class="far fa-clock"></i> 프로필 작성</div>
							<div id="date">한 달 전</div>
						</div>
						<div class="line_three"></div>
						<div class="cctv_area">
							<div id="cctv" style="color: #ff7000"><span style="color: #ff7000;"><i class="fas fa-video"></i></span> CCTV</div>
							<div id="agree" style="color: #ff7000">동의함</div>
						</div>
					</div>
				</div>
				<!-- Main start-->
				<div class="main">
					<div class="human_box">
						<div class="human">
							<div class="human_area">
								<div><img width="70" height="70" src="<%=request.getContextPath()%>/assets/img/certification.png"/></div>	
							<div class="human_text_area">
								<div class="human_text_title">본인 인증 완료</div>
								<div class="human_text">맘시터 고객안전관리팀에서 
								실명 / 생년월일 / 연락처를 확인하였습니다.
								</div>
							</div>
							</div>		
						</div>
					</div>
					<!-- ------------- -->
					<div class="main_box">
						<div class="box_name">핵심 인증</div>
						<div class="main_area">
							<div class="main_other_area">
								<div height= 40px;>
								<img width="100" src="<%=request.getContextPath()%>/assets/img/certification_human.png"/>
								</div>
								<div class="main_other_text_area">
									<div class="other_text_title">등초본 인증 완료</div>
									<div class="other_text">맘시터 고객안전관리팀이 주민등록등(초)본으로
										맘시터의 등록소재지를 확인했습니다.
									</div>
									<div class="mom_info">
									<div>- 주민등록등(초)본 확인</div>
									</div>
								</div>
							</div> <!-- fin. main_other -->						
						</div>
					</div>
					<div class="info_box">
						<div class="box_name">간단 자기소개</div>
						<div class="info_area">
							<div class="info_text_box">
								<div class="info_text">
									<span>세아이를 키운 엄마로서 아이들을 돌봄과 동시에 필요한 전문적인 학습도 도와줄수 있습니다
									(수학전공, 수학학원 최근까지 운영 초등생 전과목 중고등 이과수학까지 지도 가능 
									영어책 리딩 문제없어요 중등교사 자격증 소지) 
									<br/>
									</span>
									<span>
									맞벌이 가정의 육아의 어려움을 충분히 공감하며 맡겨진 아이를 책임감을 갖고 정성을 다해 돌보겠습니다. 
									밝고 쾌활한 성격으로 동화구연(아이 눈높이에 맞게)이나 역할놀이도 재밌게 잘하고 노래 하는것도 좋아합니다.
									(교회 성가대봉사 20년) 차 가지고 이동하며(운전경력 24년) 돌봄 시간에 따라 시급조정 가능합니다. 
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="iwant_box">
						<div class="box_name">선호하는 돌봄유형</div>
						<div class="iwant_area">
							<div class="iwant_text_box">
								<div class="iwant_text_title">
									"저는<span style="color: #ff7000"> 등하원</span> 돌봄을 가장 선호해요"
								</div>
								<div class="iwant_text">
									<div id="iwant_text_desc">- 2~10세 아이를 기관에 가기 전후에 돌볼 수 있어요</div>
									<div id="iwant_text_desc">- 주 5일 하루 3~5시간 책임지고 돌볼 수 있어요</div>
									<div id="iwant_text_desc">- 등하원, 밥챙겨주기, 씻기기, 놀아주기 활동을 할 수 있어요</div>
								</div>
							</div>
						</div>
					</div>
					<div class="active_box">
						<div class="box_name">활동 가능 시간</div>
						<div class="active_area">
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
					<div class="box_name">돌봄 가능 연령</div>
					<div class="possible_age_area">
						<div>
							<div class="age_line">
								<div class="ages col-xs-3">
									<div style="margin-bottom: -10px">
									<i class="fas fa-baby fa-3x"></i>
									</div>
									<br>
									<span>신생아</span>
								</div>
								<div class="ages col-xs-3">
									<div style="margin-bottom: -10px">
									<i class="fas fa-baby-carriage fa-3x"></i>
									</div>
									<br>
									<span>영아</span>
								</div>
								<div class="ages col-xs-3">
									<div style="margin-bottom: -10px">
									<i class="fas fa-child fa-3x"></i>
									</div>
									<br>
									<span>유아</span>
								</div>
								<div class="ages col-xs-3">
									<div style="margin-bottom: -10px">
									<i class="fas fa-school fa-3x"></i>
									</div>
									<br>
									<span>초등학생</span>
								</div>
							</div> <!-- fin. age_line -->
						</div>
					</div> <!-- fin. possible_age_area -->
				</div> <!-- fin. possible_age_box -->
					<div class="possible_age_box">
						<div class="box_name">가능한 활동</div>
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
												<div class="active_no_box">
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
					<div class="possible_zone_box">
						<div class="box_name">활동 가능 지역</div>
						<div class="possible_zone_area">
							<div>
								<div class="zone_line">
									<div class="zone_link">
										<div><i class="fas fa-star"></i> 1 순위</div>
									</div>
									<div>인천광역시 남동구</div>
								</div>
								<hr>
							</div>
							<div>
								<div class="zone_line">
									<div class="zone_link_2n3">
										<div><i class="fas fa-map-marker-alt"></i>  2 순위</div>
									</div>
									<div>인천광역시 연수구</div>
								</div>
								<hr>
							</div>
							<div>
								<div class="zone_line">
									<div class="zone_link_2n3">
										<div><i class="fas fa-map-marker-alt"></i>  3 순위</div>
									</div>
									<div>인천광역시 남구</div>
								</div>
							</div>
						</div> <!-- fin. possible_zone_area -->
					</div> <!-- fin. possible_zone_box -->
					<div class="talk_box">
						<div class="box_name">부모 후기 <span style="color: #ff7000;">999개</span></div>
						<div class="talk_area">
							<div class="talk_main">
								<div class="talk_menu">
									<div data-tab="tab_ok" class='tabmenu col-xs-4' id="default">
									<p id="tab01_p">채용 후기(99)</p></div>
									<div data-tab="tab_interview" class='tabmenu col-xs-4' id="tab02">
									<p id="tab02_p">인터뷰 후기(99)</p></div>
									<div data-tab="tab_faile" class='tabmenu col-xs-4' id="tab03">
									<p id="tab03_p">실패 후기(0)</p></div>									
								</div>
								<div id="tabcontent"> <!-- tab 내용부분 -->				
								</div>
							</div>
						</div> <!-- fin. talk_area -->
					</div> <!-- fin. talk_box -->
					<div class="famille_box">
						<div class="box_name">함께한 가족 수</div>
						<div class="famille_area">
							<div class="famille_main">
								<div class="famille_date col-xs-12">
									1999년 10월 28일 부터 <span style="font-weight: bold; color: #ff7000;">현재까지</span>
								</div>
								<div class="famille_number">
									99
								</div>
							</div>
						</div> <!-- fin. famille_area -->
					</div> <!-- fin. famille_box -->
					<div class="experience_box">
						<div class="box_name">관련 경험</div>
						<div class="experience_area">
							<div class="experience_main">
								<div class="experience_line">
									<div class="experience_text">
										<div class="experience_point"></div>
										<div>1세 쌍둥이 여아, 8개월 여아 자매 정기돌봄</div>
									</div> <!-- fin. experience_text -->
									<div class="experience_date">
										2019.01.04 ~ 2020.10.10
									</div>
								</div> <!-- fin. experience_line --> 
							</div> <!-- fin. experience_main -->
							<div class="experience_main">
								<div class="experience_line">
									<div class="experience_text">
										<div class="experience_point"></div>
										<div>2세 남아 단기돌봄</div>
									</div> <!-- fin. experience_text -->
									<div class="experience_date">
										2018.07.01 ~ 2018.08.15
									</div>
								</div> <!-- fin. experience_line --> 
							</div> <!-- fin. experience_main -->
							<div class="experience_main">
								<div class="experience_line">
									<div class="experience_text">
										<div class="experience_point"></div>
										<div>고아원 관련 단기 봉사</div>
									</div> <!-- fin. experience_text -->
									<div class="experience_date">
										2017.05.20 ~ 2017.07.18
									</div>
								</div> <!-- fin. experience_line --> 
							</div> <!-- fin. experience_main -->
						</div> <!-- fin. experience_area -->
					</div> <!-- fin. experience_box -->
				</div> <!-- fin. Main -->
				<!-- ----------하단고정 부분 시작------------ -->
			<div class="test">
			<div class="fixed_box col-xs-12">
				<div class="fixed_area">
					<div class="fixed_area_age">
						<div class="fixed_name">
							정<i class="far fa-circle"></i>우
						</div>
						<div class="fixed_age">
							(50세, 여)
						</div>
					</div>
					<div class="fixed_money">
						희망시급 : 99,900원
					</div>
				</div> <!-- fin. fixed_area -->
				<div class="fixed_btn">
					<div class="fixed_btn_jim">						
						<button id="swapHeart" class="btn btn-default swap">
						    <span class="glyphicon glyphicon-heart-empty" style="color: #ff7000; font-size: 25px;"></span>
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
			</div>
				<!-- /.modal -->
				<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<!-- .modal-dialog -->
					<div class="modal-dialog">
						<!-- .modal-content -->
						<div class="modal-content">
							<div class="modal-body">
								<p style="text-align: center; padding-top: 10px; font-weight: bold;">
									이용권이 있는 회원만 신청 가능합니다.
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_ok" onclick="location.href='<%=request.getContextPath()%>/buy/buy.jsp'">
									이용권 구매하러 가기
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
		            swal("찜 하기 완료!", "마이페이지 > 찜한 맘시터에서 확인할 수 있습니다.");
			    }
			 	// 찜 취소할 때 alert창과 glyphicon변형
		        else{
		           	swal("찜 하기 취소");
		            $(this).find('span').addClass("glyphicon-heart-empty");
		        }
		    
			  }); // fin. 찜버튼 기능
			  			  
			  $('.tabmenu').click(function() {
					var activeTab = $(this).attr('data-tab');
					$('#default').css('background-color', 'white');
					$('#tab02').css('background-color', 'white');
					$('#tab03').css('background-color', 'white');
					$(this).css('background-color', 'rgb(255,238,224)');
					$.ajax({
						type : 'GET',                 //get방식으로 통신
						url : activeTab + ".jsp",    //탭의 data-tab속성의 값으로 된 jsp파일로 통신
						dataType : "html",            //html형식으로 값 읽기
						error : function() {          //통신 실패시 ㅠㅠ
							alert('통신실패!');
						},
						success : function(data) {    //통신 성공시 탭 내용을 담는 div를 읽어들인 값으로 채우기
							$('#tabcontent').html(data);
						}
					});
				});
				$('#default').click(); 
			}); // fin. 탭 기능
		</script>
		 <!-- jquery 파일명 수정 -->
		<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script> 
	</body>
</html>
