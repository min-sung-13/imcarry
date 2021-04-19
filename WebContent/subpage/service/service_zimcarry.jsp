<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="hotelDTO" class="com.zimcarry.hotel.HotelDTO" />
<jsp:useBean id="hotelDAO" class="com.zimcarry.hotel.HotelDAO" />

<c:set var="totCnt" value="${hotelDAO.hotelCnt()}"/>
<c:set var="hotelList" value="${hotelDAO.getHotelMain(0, 4)}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>짐 없는 여행의 시작! 아임캐리</title>
	<link href="../../css/service_style.css" rel="stylesheet">
	<link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
</head>

<body>
	<!-- header -->
	<%@ include file="../../common/header.jsp" %>
		
	<div class="service sub_content_wrap">
		<div class="sub_title box_inner">
			짐없는 여행의 시작<br>
			<span>아임캐리</span>
		</div>
		<div class="white1_1">
			<div id="sub_content" class="box_inner sub_content">
				<nav class="sub_navi">
					<ul>
						<li><a href="./service_zimcarry.jsp">아임캐리란</a></li>
						<li><a href="./service_delivery.jsp">운송서비스</a></li>
						<li><a href="./service_carry.jsp">보관서비스</a></li>
                      </ul>
				</nav>
				<div class="sub_indicator box_inner">
					<h2>아임캐리란</h2>
					<ul>
						<li>Home</li>
						<li>서비스</li>
						<li>아임캐리란</li>
					</ul>
				</div>
				<div class="box_inner clear2">
					<div id="serve_content">
						<h3>역·공항 수하물 보관 & 픽업 서비스</h3>
						<p>아임캐리 서비스는 여행 · 출장객 짐을 보관하거나<br><span>[부산역 ↔ 숙소], [김해공항 ↔ 숙소], [숙소 ↔ 숙소]</span> 구간에서 <br>짐을 옮겨드리는 서비스입니다.</p>
						<ul class="serve_content_box clear2">
							<li>
								<div class="box_img"></div>
								<div class="box_circle">01</div>
								<div class="box_text">
									<h4>예약하고</h4>
									<p>원하는 서비스를 선택하고 <br>온라인 결제 완료!</p>
								</div>
							</li>
							<li>
								<div class="box_img"></div>
								<div class="box_circle">02</div>
								<div class="box_text">
									<h4>맡기고</h4>
								<p>예약일정에 맞추어 <br>짐을 맡겨주세요.</p>
								</div>
							</li>
							<li>
								<div class="box_img"></div>
								<div class="box_circle">03</div>
								<div class="box_text">
									<h4>즐기고</h4>
									<p>짐에 대한 걱정과 부담없이 <br>여행을 즐기세요.</p>
								</div>
							</li>
							<li>
								<div class="box_img"></div>
								<div class="box_circle">04</div>
								<div class="box_text">
									<h4>찾고</h4>
									<p>예약한 장소에 배송된 <br>짐을 찾아주세요.</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="gray1_1">
			<div id="serve_infor">
				<div class="box_inner">
					<h2>아임캐리 부산 매장안내도</h2>
					<ul class="infor_menu clear2">
						<a id="s1" class="on"><li>부산역</li></a>
						<a id="s2"><li>김해공항 국내선</li></a>
						<a id="s3"><li>김해공항 국제선</li></a>
						<a id="s4"><li>벡스코</li></a>
					</ul>
					<div id="slide_box">
						<ul class="infor_shop clear2 slider">
							<li>
								<div class="infor_shop_map">
									<img src="../../images/img/shop_img01_map.jpg" alt="부산역 매장지도">
								</div>
								<div class="infor_shop_content">
									<div class="infor_shop_content_map">
										<img src="../../images/img/shop_img01.jpg" alt="부산역매장">
									</div>
									<h3>부산역</h3>
									<ul>
										<li>
											<div class="shop_circle clear2">01</div>
											<p>부산역 1층 2번 출구 찾기</p>
										</li>
										<li>
											<div class="shop_circle clear2">02</div>
											<p class=" clear2">출구 앞 아임캐리로 짐을 가지고 들어가기</p>
										</li>
									</ul>
									<div class="infor_shop_content_time">
										<p>운영시간 : 09:00 ~ 22:00</p>
									</div>
								</div>
							</li>
							<li>
								<div class="infor_shop_map">
									<img src="../../images/img/shop_img02_map.jpg" alt="김해공항 국내선 매장지도">
								</div>
								<div class="infor_shop_content">
									<div class="infor_shop_content_map">
										<img src="../../images/img/shop_img02.jpg" alt="김해공항 국내선 매장">
									</div>
									<h3>김해공항 국내선</h3>
									<ul>
										<li>
											<div class="shop_circle clear2">01</div>
											<p>김해공항 국내선 2층 GATE4 안쪽의 CJ 수하물 보관소 이용하기</p>
										</li>
									</ul>
									<div class="infor_shop_content_time">
										<p>운영시간 : 09:00 ~ 20:00</p>
									</div>
								</div>
							</li>
							<li>
								<div class="infor_shop_map">
									<img src="../../images/img/shop_img03_map.jpg" alt="김해공항 국제선 매장지도">
								</div>
								<div class="infor_shop_content">
									<div class="infor_shop_content_map">
										<img src="../../images/img/shop_img03.jpg" alt="김해공항 국제선 매장">
									</div>
									<h3>김해공항 국제선</h3>
									<ul>
										<li>
											<div class="shop_circle clear2">01</div>
											<p>김해공항 국제선 3층 T로밍 센터 옆 CJ 수하물보관소 이용하기</p>
										</li>
									</ul>
									<div class="infor_shop_content_time">
										<p>운영시간 : 09:00 ~ 20:00</p>
									</div>
								</div>
							</li>
							<li>
								<div class="infor_shop_map">
									<img src="../../images/img/shop_img04_map.jpg" alt="벡스코 매장지도">
								</div>
								<div class="infor_shop_content">
									<div class="infor_shop_content_map">
										<img src="../../images/img/shop_img04.jpg" alt="벡스코 매장">
									</div>
									<h3>벡스코</h3>
									<ul>
										<li>
											<div class="shop_circle clear2">01</div>
												<p>벡스코 제 1전시장 1층 2호 아임캐리 이용하기</p>
										</li>
									</ul>
									<div class="infor_shop_content_time">
										<p>운영시간 : 10:00~18:00</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="white1_2">
			<div id="room_infor">
				<div class="box_inner">
					<div id="find_room">
						<input type="search" placeholder="숙소를 검색해 보세요"> <a onclick="find()"></a>
					</div>
					<ul id="1" class="clear2 on3">
                      
					<c:forEach var="item" items="${hotelList}" varStatus="status">
						<li>
                           	<div class="room_img" style="background: url('../../images/room/${item.hFile}') center;"></div>
	                        <div class="room_content">
	                            <h3 class="room_name">${item.hName}</h3>
	                            <p class="room_addr">${item.hAddress}</p>
	                            <div class="room_btn"><a href="${item.hMap}" target="_blank">지도보기</a></div>
	                        </div>
	                        <c:if test="${item.hDiscount == 'O'}">
	                        <div class="room_discount">
	                            <span>20%</span> OFF
	                        </div>
	                        </c:if>
	                    </li>
					</c:forEach>
						
					</ul>
					
					
	                      
					<div class="num_click">
						<input type="hidden" name="totCnt" id="totCnt" value="${totCnt}">
						<div id="page" class="paging">
						</div>
	                </div>
            	</div>
        	</div>
    	</div>
	</div>
        
	<!-- footer -->
	<%@ include file="../../common/footer.jsp" %>
	<!-- footer end -->
	<!-- pop-up -->
	<%@ include file="../../common/popup.jsp" %>
	<!-- pop-up end -->
	<script src="../../js/jquery-3.5.1.min.js"></script>
	<script src="../../js/service_js.js"></script>
   	<script src="../../js/main.js"></script>
</body>
</html>