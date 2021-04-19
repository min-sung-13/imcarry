<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기</title>
<link href="../../images/ico_tit.ico" rel="shortcut icon"
	type="image/x-icon">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400|Oswald:400,500"
	rel="stylesheet">
<link href="../../css/rs_Form.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="./js/reservation.js"></script>

</head>
<body>
	<%@ include file="../../common/header.jsp"%>
	<%
		String se_phone = (String) session.getAttribute("p_number");
	%>
	<div class="reservation sub_content_wrap">
		<div class="sub_title box_inner">
			짐없는 여행의 시작<br> <span>아임캐리</span>
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
					<h2>예약하기</h2>
					<ul>
						<li>Home</li>
						<li>예약</li>
						<li>예약하기</li>
					</ul>
				</div>
				<div id="re_info">
					<div id="reInfo_img">
						<img src="../../images/ico/ico_logo_title.png">
					</div>
					<h3>아임캐리를 찾아주셔서 감사합니다.<br>아래의 예약 양식을 모두 입력해주세요.</h3>
					<div>
						<form action="1_ok.jsp" method="post" onsubmit="return chkform()"
							name="my_form" id="form-1">
							<input type="text" name="bName" id="name2" placeholder="이름" />
							<input type="text" name="bHp" id="phone2" placeholder="휴대폰 번호(' - ' 포함)" />
							
							<h1 class="h1">구간 선택</h1>
							<div class="box_select" id="select_place">
								<select name="bStart" id="select_start" class="select_option">
									<option value="맡기는 장소">맡기는 장소</option>
									<option value="부산역">부산역</option>
									<option value="숙소">숙소</option>
									<option value="벡스코">벡스코</option>
								</select>
								<select name="bEnd" id="select_end" class="select_option">
									<option value="찾는 장소">찾는 장소</option>
									<option value="부산역">부산역</option>
									<option value="숙소">숙소</option>
									<option value="벡스코">벡스코</option>
								</select>
								<!-- <input type="text" class="hidden"> -->
							</div>
	
							<h1 class="h1">맡길 시간</h1>
							<div class="box_select" id="select_time">
								<input type="text" name="bBookingdate" id="datepicker_start" placeholder="YYYY-MM-DD" />
								<select name="bBookingtime1" id="select_hour" class="select_option">
									<option value="시 선택">시 선택</option>
									<option value="9">오전 9시</option>
									<option value="10">오전 10시</option>
									<option value="11">오전 11시</option>
									<option value="12">오후 12시</option>
									<option value="14">오후 1시</option>
									<option value="15">오후 2시</option>
								</select>
								<select name="bBookingtime2" id="select_min" class="select_option">
									<option value="분 선택">분 선택</option>
									<option value="0">0분</option>
									<option value="10">10분</option>
									<option value="20">20분</option>
									<option value="30">30분</option>
									<option value="40">40분</option>
									<option value="50">50분</option>
								</select>
							</div>
							<h1 class="h1">찾을 날짜</h1>
							<div class="box_select">
								<input type="text" name="bBookingdateend" id="datepicker_end"
									placeholder="찾는 날짜를 입력하세요.">
							</div>
							<h1 class="h1">26인치 이상 수하물</h1>
							<div class="box_select">
								<input type="text" name="bOver26" id="bOver26" class="count_n_price" />
								<span class="count">개</span>
							</div>
							<h1 class="h1">26인치 이하 수하물</h1>
							<div class="box_select">
								<input type="text" name="bUnder26" id="bUnder26" class="count_n_price" />
								<span class="count">개</span>
							</div>
							<h1 class="h1">총 결제 금액</h1>
							<div class="box_select">
								<input type="text" name="bPrice" id="bPrice" class="count_n_price" readonly /><span class="count">원</span>
							</div>
							<input type="button" id="btninput" value="예약하기" onclick="$('#form-1').submit()" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../../js/main.js"></script>
	<!-- footer -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp"%>
	<!-- pop-up end -->
</body>
</html>