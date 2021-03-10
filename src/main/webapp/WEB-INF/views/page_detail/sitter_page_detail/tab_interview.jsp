<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<!-- 아이콘 사용 -->
	<script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script> 
<meta charset="UTF-8">


	<style>
		.tab_area {
		display: flex;
		flex-direction: column;
		
	   }
	   .info {
	   padding: 25px 0px;
	   	display: flex;
	   	margin-bottom: 5px;
	   	width: 100%;
	   }
	   .profileimg {
	   	margin-right: 16px;
	   }
	   .profileinfo {
	   	display: flex;
	   	flex-direction: column;
	   	width: 100%;
	   }
	   .top {
	   	display: flex;
	   	flex-direction: row;
	   	-webkit-box-align: center;
	   	align-items: center;
	   }
	   .name {
	   	color: #000;
	   	font-weight: bold;
	   	font-size: 0.9em;
	   	letter-spacing: -0.2px;
	   	line-height: 24px;
	   }
	   .child {
	   	margin-left: 8px;
	   	font-size: 0.8em;
	   	line-height: 18px;
	   	letter-spacing: -0.2px;
	   	color: rgb(136, 136, 136);
	   }
	   .divider {
	   	background: rgb(221,221,221);
	   	width: 1px;
	   	height: 8px;
	   	display: inline-block;
	   	margin: 0px 8px; 
	   }
	   .sub {
	   	vertical-align: top;
	   }
	   .sub_date {
	   	font-size: 0.9em;
	   	margin-left: 9px;
	   	font-weight: bold;
	   	color: rgb(136,136,136);
	   	letter-spacing: -0.2px;
	   	vertical-align: middle;
	   	line-height: 19px;
	   }
	   .desc {
	   	margin-top: 6px;
	   	font-size: 1em;
	   	line-height: 19px;
	   	color: #000;
	   	letter-spacing: -0.2px;
	   }
	   .sitter {
	   	position: relative;
	   	right: 50px;
	   	display: flex;
	   	margin-top: 16px;
	   }
	   .profileBlock {
	   	position: relative;
	   	right: 20px;
	   	text-align: right;
	   	margin-right: 10px;
	   }
	   .profileBlock > img {
	   	width: 40px;
	   	height: 40px;
	   	margin-left: 20px;
	   	border-radius: 50%;
	   }
	   .contentBlock {
	   	padding: 14px;
	   	border-radius: 4px;
	   	background: rgba(0, 174, 153, 0.1);
	   	position: relative;
	   	width: 100%;
	   	margin-right: 20px;
	   }
	   .arrow {
	   	position: absolute;
	   	top: 10px;
	   	left: -6px;
	   	width: 0px;
	   	height: 0px;
	   	border-style: solid;
	   	border-width: 5px 6px 5px 0;
	   	border-color: transparent rgba(0, 174, 153, 0.1) transparent transparent;
	   }
	   .titleBlock {
	   	display: flex;
	   	align-items: center;
	   	-webkit-box-align: center;
	   }
	   .title {
	   	color: rgb(0, 179, 153);
	   	font-size: 0.9em;
	   	letter-spacing: -0.4px;
	   	font-weight: bold;
	   }
	   .writeDate {
	   	padding-left: 10px;
	   	font-size: 0.9em;
	   	font-weight: bold;
	   	color: rgb(136, 136, 136);
	   }
	   .content {
	   	margin-top: 2px;
	   	font-size: 1em;
	   	color: #000;
	   	letter-spacing: -0.2px;
	   	line-height: 18px;
	   }
	   .divider_long {
	   	width: 100%;
	   	height: 1px;
	   	background: #ccc;
	   }
	   .btn_more {
	   	ouline: none;
	   	border: none;
	   	width: 100%;
	   	background: rgb(242,242,242);
	   	cursor: pointer;
	   	font-weight: bold;
	   	font-size: 1em;
	   	color: rgb(102, 102, 102);
	   	line-height: 21px;
	   	border-radius: 3px;
	   	height: 50px;
	   	box-shadow: rgba(0, 0, 0, 0.25) 0px 1px 2px;
	   }
	</style>

</head>
<body>
	<div class="tab_area">
		<div class="info">
			<div class="profileimg">
				<img width="60" height="60" style="border-radius: 50%;" src="<%=request.getContextPath()%>/assets/img/people_review.png" />
			</div>
			<div class="profileinfo">
				<div class="top">
					<div class="name">김<i class="far fa-circle"></i>경</div>
					<div class="child">
						유아 2명
						<div class="divider"></div>
						인터뷰 후기
					</div>
				</div> <!-- fin. top -->
				<div class="sub">
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
					<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
					<span class="sub_date">한 달 전</span>
				</div> <!-- fin. sub -->
				<div class="desc">
					<span>인터뷰도 잘 응해주셨고 친절하셨었는데 시간이 맞지 않았어요.</span>
					<br>
				</div> <!-- fin. desc -->
			</div>
		</div> <!-- fin. info -->
		
		<div class="divider_long"></div>
		
		<div class="tab_area">
			<div class="info">
				<div class="profileimg">
				<img width="60" height="60" style="border-radius: 50%;" src="<%=request.getContextPath()%>/assets/img/people_review.png" />
			</div>
			<div class="profileinfo">
				<div class="top">
					<div class="name">이<i class="far fa-circle"></i>연</div>
					<div class="child">
						영아 1명
						<div class="divider"></div>
						인터뷰 후기
					</div>
				</div> <!-- fin. top -->
				<div class="sub">
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span class="sub_date">5달 전</span>
				</div> <!-- fin. sub -->
				<div class="desc">
					<span>다른분을 채용하게 되어서 못 뵀었어요.</span>
					<br>
					<span>다음에 인연이 됐음 좋겠습니다.</span>
					<br>
				</div> <!-- fin. desc -->
			</div>
			</div><!-- fin. info -->
		</div> <!-- fin. tab_area -->
		
		<div class="divider_long"></div>
		
		<div class="tab_area">
			<div class="info">
				<div class="profileimg">
				<img width="60" height="60" style="border-radius: 50%;" src="<%=request.getContextPath()%>/assets/img/people_review.png" />
			</div>
			<div class="profileinfo">
				<div class="top">
					<div class="name">정<i class="far fa-circle"></i>우</div>
					<div class="child">
						영아 1명,유아 1명
						<div class="divider"></div>
						인터뷰 후기
					</div>
				</div> <!-- fin. top -->
				<div class="sub">
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
					<span style="color: #e5e5e5;"><i class="fas fa-star"></i></span>
					<span class="sub_date">6달 전</span>
				</div> <!-- fin. sub -->
				<div class="desc">
					<span>시간이 맞지 않아 연결되지 않았습니다...</span>
					<br>
				</div> <!-- fin. desc -->
			</div>
			</div><!-- fin. info -->
		</div> <!-- fin. tab_area -->
		<button class="btn_more" onClick="location.href='tab_more.do'">후기 더 보기</button>
	</div>
</body>
</html>