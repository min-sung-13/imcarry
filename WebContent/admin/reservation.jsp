<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.admin_id}">
	<script>
		alert('로그인 후 이용하세요.');
		location.href='./admin.jsp';
	</script>
</c:if>
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<jsp:useBean id="util" class="com.zimcarry.util.Util" />
<c:choose>
	<c:when test="${empty param.btn }" >
		<c:set var="btn" value="all" />
	</c:when>
	<c:otherwise>
		<c:set var="btn" value="${param.btn}" />
	</c:otherwise>
</c:choose>
<c:set var="pageNum" value="1" />
<c:set var="limit" value=", 20" />
<c:if test="${pageNum ne null}" >
	<c:set var="pageNum" value="${param.pageNum}" />
	<c:if test="${param.pageNum eq null}">
		<c:set var="pageNum" value="1" />
	</c:if>
	<c:choose>
		<c:when test="${pageNum eq 1 || pageNum eq null}">
			<c:set var="limit" value="0, 10" />
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${pageNum * 15 - 15}" />
			<c:set var="limit" value="${start}${limit}" />
		</c:otherwise>
	</c:choose>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<!-- head -->
<%@ include file="./head.jsp" %>

<body>
	<div class="wrapper">
		<!-- side menu -->
		<%@ include file="./side_menu.jsp" %>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:;">예약 관리</a>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content reser">
				<div class="button_wrap">
					<button id="all" class="on">모든 예약 보기</button>
					<button id="future">다가오는 예약 보기</button>
					<button id="past">지난 예약 보기</button>
				</div>
				<c:choose>
					<c:when test="${btn eq 'all' }" >
						<%@ include file="./reservation_all.jsp" %>
					</c:when>
					<c:when test="${btn eq 'past' }" >
						<%@ include file="./reservation_past.jsp" %>
					</c:when>
					<c:when test="${btn eq 'future' }" >
						<%@ include file="./reservation_future.jsp" %>
					</c:when>
				</c:choose>
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
  		$('.sidebar-wrapper ul.nav li:eq(1)').addClass("active");
  	})
  </script>
  <script src="../assets/js/reservation.js"></script>
</body>

</html>