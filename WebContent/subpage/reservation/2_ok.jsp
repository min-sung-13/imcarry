<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>조회하기</title>
<link href="../../css/rs3.css" rel="stylesheet">
<link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald:400,500" rel="stylesheet">
<jsp:useBean id="ReseDTO" class="com.zimcarry.reservation.ReservationDTO"/>
<jsp:useBean id="ReseDAO" class="com.zimcarry.reservation.ReservationDAO"/>
<c:set var="name1" value="${param.name1}"/>
<c:set var="phone1" value="${param.phone2.replace('-', '')}"/>
<c:set var="Reser_List" value="${ReseDAO.selectJoin(name1,phone1)}"/>
</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<div class="reservation sub_content_wrap">
		<div class="sub_title box_inner">
			짐없는 여행의 시작<br>
			<span>아임캐리</span>
		</div>
			<div class="white">
			<div id="sub_content" class="box_inner sub_content">
				<nav class="sub_navi">
					<ul>
						<li><a href="1.jsp">예약하기</a></li>
						<li><a href="2.jsp">조회하기</a></li>
					</ul>
				</nav>
				<div class="sub_indicator box_inner">
					<h2>예약조회</h2>
					<ul>
						<li>Home</li>
						<li>예약</li>
						<li>예약조회</li>
					</ul>
				</div>
			<div id="list">	
			<img src="../../images/ico/deli_ico03.jpg" id="receipt">
			<c:forEach var="item" items="${Reser_List}" varStatus="status">

				<p><span>예약 번호 : </span> ${item.bIdx}</p>
				<p><span>예약자 이름 : </span> ${item.bName}</p>
				<p><span>예약자 연락처 : </span> ${item.bHp.substring(0, 3)} - ${item.bHp.substring(3, 7)} - ${item.bHp.substring(7)}</p>
				<p><span>이동 구간 : </span> ${item.bStart} -> ${item.bEnd}</p>
				<p><span>예약 날짜 : </span> ${item.bBookingdate}</p>
				<p><span>물건 찾으시는 날짜 : </span> ${item.bStartdate}</p>
				<p><span>찾으시는 시간 : </span> ${item.bEnddate}</p>
				<p><span>26인치 이상 물건 : </span> ${item.bOver26} 개</p>
				<p><span>26인치 이하 물건 : </span> ${item.bUnder26} 개</p> 
				<p><span>총 금액 : </span> ${item.bPrice} 원</p>
			</c:forEach>
			</div>
			<div>
				<img src="../../images/img/carry-data.png" id="carry">
				<input type="button" id="btninput" value="돌아가기" onclick="location.href='2.jsp'">
			</div>
		</div>
	</div>
</div>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'>
	</script>
	<script src="../../js/main.js"></script>
	<script>
		$(function() {
			$("#carry").addClass("animate");
		});
	</script>
	
	<!-- footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp"%>
	<!-- pop-up end -->
</body>
</html>
