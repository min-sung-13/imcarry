<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.zimcarry.hotel.HotelDTO" id="hotelDTO"/>
<jsp:useBean class="com.zimcarry.hotel.HotelDAO" id="hotelDAO"/>
<%@ page import="java.util.*"%>
<%@ page import="com.zimcarry.hotel.HotelDTO"%>
<%
	String hName = null;
	int start = 0;
	int recNum = 0;
	String hIdx = null;
	int paging = 0;
	
	if(request.getParameter("hIdx") != null && request.getParameter("hIdx") != "0"){
		hIdx = request.getParameter("hIdx");
		out.println(hotelDAO.viewHotel(hIdx));
	}
	
	if(request.getParameter("hName") != null && request.getParameter("start") != null && request.getParameter("recNum") != null){
		hName = request.getParameter("hName");
		if(request.getParameter("start").equals("1")){
			start = 0;
			recNum = Integer.parseInt(request.getParameter("recNum"));
		}else{
			start = Integer.parseInt(request.getParameter("start"));
			recNum = Integer.parseInt(request.getParameter("recNum"));
			start = (start-1)*recNum;
		}
		List<HotelDTO> hotelList = hotelDAO.selectHotel(hName, start, recNum);
		out.println(hotelList);
		System.out.println(hotelList);
	}else if(request.getParameter("hName") != null){
		hName = request.getParameter("hName");
		out.println(hotelDAO.totCnt(hName));
	}
	
	if(request.getParameter("paging") != null){
		paging = Integer.parseInt(request.getParameter("paging"));
		recNum = Integer.parseInt(request.getParameter("recNum"));
		
		paging = (paging-1)*recNum;
		
		List<HotelDTO> hotelList = hotelDAO.selectHotel(paging, recNum);
		out.println(hotelList);
	}
	
%>