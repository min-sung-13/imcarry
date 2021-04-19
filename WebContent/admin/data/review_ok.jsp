<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<%
	String re_idx = request.getParameter("re_idx");
	String re_bookidx = request.getParameter("re_bookidx");
	
	out.println(reviewDAO.reviewDetail(re_idx) + "|");
	out.println(bookDAO.selectBookWhereIdx(re_bookidx));
%>
