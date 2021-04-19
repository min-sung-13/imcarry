<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean class="com.zimcarry.hotel.HotelDTO" id="hotelDTO"/>
<jsp:useBean class="com.zimcarry.hotel.HotelDAO" id="hotelDAO"/>
<c:if test="${empty sessionScope.admin_id}">
	<script>
		alert('로그인 후 이용하세요.');
		location.href='./admin.jsp';
	</script>
</c:if>

<c:set var="totCnt" value="${hotelDAO.totCnt()}" /> 
<c:set var="hotelList" value="${hotelDAO.selectHotel(0, 12)}"/>

<!DOCTYPE html>
<html lang="ko">

<!-- head -->
<%@ include file="./head.jsp" %>

<body class="">
  <div class="wrapper">
    <!-- side menu -->
    <%@ include file="./side_menu.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">제휴 호텔 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="hotel_content">
      	<div class="hotel_find hotel">
      		<h3>제휴 호텔 검색</h3>
      		<div>
      			<p id="findArea"><input type="search" name="find_hotel" id="find_hotel" placeholder="검색할 호텔을 입력하세요."> <button id="findBtn" onclick="find()">검색</button> <button id="listBtn" onclick="list()">전체 리스트</button> <input type="hidden" name="findName" id="findName"></p>
      		</div>
      	</div>
      	<div class="hotel_list hotel">
      		<table>
      			<tr>
      				<th>번호</th>
      				<th>이름</th>
      				<th>할인</th>
      				<th>현재 제휴</th>      				
      			</tr>
      			
      			<c:forEach var="hotel" items="${hotelList}" varStatus="status">
				<tr class="hotelList">
					<td>${status.count}</td>
					<td><a href="javascript:findHotel(${hotel.hIdx})">${hotel.hName}</a></td>
					<td>${hotel.hDiscount}</td>
					<td>${hotel.hPartner}</td>
				</tr>
				</c:forEach>
				
				<tr>
					<input type="hidden" name="totCnt" id="totCnt" value="${totCnt}">
					<td colspan="4" id="page" class="paging">
					</td>
				</tr>
      		</table>
      	</div>
      	<div class="hotel_view hotel">
      		<h3>제휴 호텔</h3>
      		<form method="post" action="./data/hotel_ok.jsp" enctype="multipart/form-data" onsubmit="return checkform()">
      			<input type="hidden" name="h_idx" id="h_idx" value="0">
      			<div class="hIdxO">
      				<p>호텔 사진 <span id="fileoriginname"></span><input type="hidden" name="h_fileoriginname" id="h_fileoriginname"></p>
      				<p><input type="file" name="h_file2" id="h_file2"></p>
      			</div>
      			<div class="hIdxX">
      				<p>호텔 사진 <input type="file" name="h_file1" id="h_file1"></p>
      			</div>
      			<p>호텔 명 <input type="text" name="h_name" id="h_name"></p>
      			<p>호텔 주소 <input type="text" name="h_address" id="h_address"></p>
      			<p>호텔 지도 <input type="text" name="h_map" id="h_map"></p>
      			<p>호텔 할인 
      				<label id="label1_1">O</label><input type="radio" name="h_discount" value="O" id="radio1_1"> 
      				<label id="label1_2">X</label><input type="radio" name="h_discount" value="X" id="radio1_2">
      			</p>
      			<br>
      			<p>현재 제휴 상황 
      				<label id="label2_1">O</label><input type="radio" name="h_partner" value="O" id="radio2_1"> 
      				<label id="label2_2">X</label><input type="radio" name="h_partner" value="X" id="radio2_2">
      			</p>
      			<div class="hIdxO">
      				<p><input type="submit" value="수정"> <input type="button" value="비우기" onclick="resetInfor()"></p>
      			</div>
      			<div class="hIdxX">
      				<p><input type="submit" value="추가"></p>
      			</div>
      		</form>
      	</div>
      </div>
      <!-- footer -->
      <%@ include file="./footer.jsp" %>
    </div>
  </div>
  <!--   Core JS Files   -->
  <%@ include file="./core_js.jsp" %>
  <script>
  	$(function () {
  		$('.sidebar-wrapper ul.nav li').removeClass("active");
  		$('.sidebar-wrapper ul.nav li:eq(2)').addClass("active");
  	})
  </script>
  <script src="../assets/js/hotel.js"></script>
</body>

</html>
