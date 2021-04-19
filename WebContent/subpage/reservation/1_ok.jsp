<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="com.zimcarry.reservation.ReservationDTO" %>
<%@ page import="com.zimcarry.reservation.ReservationDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ReservationDTO reser = new ReservationDTO();
	ReservationDAO reserDAO = new ReservationDAO();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	
	request.setCharacterEncoding("UTF-8");

	String bName = request.getParameter("bName");
	String bHp = request.getParameter("bHp");
	String bStart = request.getParameter("bStart");
	String bEnd = request.getParameter("bEnd");
	String bBookingdate1 = request.getParameter("bBookingdate");
	String bStartdate1 = request.getParameter("bBookingtime1");
	String bStartdate2 = request.getParameter("bBookingtime2");
	
	String sDate = bBookingdate1 + " " + bStartdate1 + ":" + bStartdate2 + ":00";
	Date startDate = format.parse(sDate);
	
	String bBookingdateend = request.getParameter("bBookingdateend");
	Date endDate = format2.parse(bBookingdateend);
	
	String bOver26 = request.getParameter("bOver26");
	String bUnder26 = request.getParameter("bUnder26");
	String bPrice = request.getParameter("bPrice");
	
	reser.setbName(bName);
	reser.setbHp(bHp.replace("-", ""));
	reser.setbStart(bStart);
	reser.setbEnd(bEnd);
	reser.setbStartdate(startDate);
	reser.setbEnddate(endDate);
	reser.setbOver26(Integer.parseInt(bOver26));
	reser.setbUnder26(Integer.parseInt(bUnder26));
	reser.setbPrice(Integer.parseInt(bPrice));
	
	if (reserDAO.insertBoard(reser)) {
%>
	<script>
		alert('예약성공!');
		location.href='./2.jsp';
	</script>
<%
	} else {
%>
	<script>
		alert('예약실패 :(');
		history.back();
	</script>
<%
	}
%>