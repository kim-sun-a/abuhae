<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>관리자페이지</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
		<!-- css 참조  -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_statistic.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin_header.css" />
		<!-- 구글 폰트 참조 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Acme&display=swap" rel="stylesheet">
		<!-- chart.js -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
		</head>
			<body>
			<div class="container">
			<header>
			<%@ include file="../admin/admin_header.jsp"%>
			</header>
				<div class="col-md-10 middle" id="middle_yunjae">
					<p id="todayIs" style="font-family: 'Acme'; font-size: 2em; text-align: center; color: #5f5f5f; "></p>
					<div id="chartContainer_connect" style="height: 300px; width: 700px;"></div>
					<br/>
					<div id="chartContainer_age" style="height: 300px; width: 700px;"></div>
					<br/>
					<div id="chartContainer" style="height: 300px; width: 700px;"></div>
					<br/>
					<div id="chartContainer_yes" style="height: 300px; width: 700px;"></div>
				</div>
			</div>
						
				<!-- Javascript -->
				<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
				<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
				<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
				<script type="text/javascript">
				
				// 나이대 차트
				var chart = new CanvasJS.Chart("chartContainer_age", {
					animationEnabled: true,
					title:{
						text: "나이대",
						fontColor: "#c99190",
						fontWeight: "bold"
					},	
					legend: {
						cursor:"pointer",
						itemclick: toggleDataSeries
					},
					data: [{
						type: "column",
						color: "#eda4a6",
						name: "맘",
						legendText: "맘",
						showInLegend: true, 
						dataPoints:[
							{ label: "20대", y: 900 },
							{ label: "30대", y: 5000},
							{ label: "40대", y: 7000 },
							{ label: "50대", y: 4500 },
							{ label: "60대", y: 800 }
						]
					},
					{
						type: "column",	
						name: "시터",
						color: "#f8d3cb",
						legendText: "시터",
						axisYType: "secondary",
						showInLegend: true,
						dataPoints:[
							{ label: "20대", y: 8000 },
							{ label: "30대", y: 9500 },
							{ label: "40대", y: 4500 },
							{ label: "50대", y: 3200 },
							{ label: "60대", y: 600 }
						]
					}]
				});
				chart.render();

				function toggleDataSeries(e) {
					if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
						e.dataSeries.visible = false;
					}
					else {
						e.dataSeries.visible = true;
					}
					chart.render();
				}
				// 나이대 차트 끝
				</script>
				
				<script type="text/javascript">
				// 응답건수 차트 
				var chart = new CanvasJS.Chart("chartContainer_yes", {
					animationEnabled: true,
					title:{
						text: "오늘 응답건수",
						fontWeight: "bold",
						fontColor: "#695A42"
					},
					
					axisY:{
						gridColor: "#B6B1A8",
						tickColor: "#B6B1A8"
					},
					
					data: [{
						type: "stackedColumn",
						showInLegend: true,
						color: "#B6B1A8",
						name: "미응답",
						dataPoints: [
							{ y: 1000, x: new Date() }
						]
						},
						{        
							type: "stackedColumn",
							showInLegend: true,
							name: "응답",
							color: "#695A42",
							dataPoints: [
								{ y: 3000, x: new Date() }
							]
						}]
				});
				chart.render();
				// 응답건수 차트 끝	
				</script>
				
				<script type="text/javascript">
				// 하루 접속 인원 차트
				var dataPoints = [];
				
				var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					theme: "light2",
					title: {
						text: "오늘 접속 인원",
						fontColor: "#69a6b4"
					},
					axisY: {
						title: "",
						titleFontSize: 24,
						color: "#d3efde",
						includeZero: true
					},
					data: [{
						type: "column",
						yValueFormatString: "#,### Units",
						color: "#d3efde",
						dataPoints: dataPoints
					}]
				});
				
				// 후에 JSON이 아닌 SQL함수를 사용해 y좌표 수정
				function addData(data) {
					for (var i = 0; i < data.length; i++) {
						dataPoints.push({
							x: new Date(),
							y: 120000
						});
					}
					chart.render();
				
				}
				
				$.getJSON("https://canvasjs.com/data/gallery/javascript/daily-sales-data.json", addData);
				// 하루 접속 인원 차트 끝
				</script>
				<script>
				// 매칭성사율 차트 
				window.onload = function () {
				var chart = new CanvasJS.Chart("chartContainer_connect", {
					theme: "light2",
					animationEnabled: true,
					title: {
						text: "매칭 성사율",
						fontColor: "#7d7098"
					},
					data: [{
						type: "pie",
						indexLabelFontSize: 18,
						radius: 80,
						indexLabel: "{label} - {y}",
						yValueFormatString: "###0.0\"%\"",
						click: explodePie,
						dataPoints: [
							{ y: 62.5, label: "매칭" },
							{ y: 26, label: "거절"},
							{ y: 11.5, label: "미응답" }
						]
					}]
				});
				chart.render();
				
				function explodePie(e) {
					for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
						if(i !== e.dataPointIndex)
							e.dataSeries.dataPoints[i].exploded = false;
					}
				}
				}
				// 매칭성사율 차트 끝 
				</script>
				<script type="text/javascript">
				let today = new Date();   
				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일
				document.write()
				document.getElementById ( 'todayIs' ).innerHTML = year + ' . ' + month + ' . ' + date ;
				</script>
		</body>
</html>