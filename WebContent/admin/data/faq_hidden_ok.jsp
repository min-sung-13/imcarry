<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	if (request.getParameter("fHidden") == null || request.getParameter("fHidden").equals("")) {
%>
		<script>
			alert('잘못된 접근입니다.');
			location.href='../admin.jsp';
		</script>
<%
	} else {
		String temp = request.getParameter("fIdx");
		String fHidden = request.getParameter("fHidden");
		int fIdx = Integer.parseInt(temp);
		
		faqDAO.hidden(fIdx, fHidden);
	}
%>