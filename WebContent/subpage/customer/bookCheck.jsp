<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<%
	String bHp = request.getParameter("bHp");
	String reBookidx = request.getParameter("reBookidx");
	out.print(bookDAO.checkBook(bHp, reBookidx));
	System.out.println("잘나오니?");
	System.out.println(bookDAO.checkBook(bHp, reBookidx));
%>