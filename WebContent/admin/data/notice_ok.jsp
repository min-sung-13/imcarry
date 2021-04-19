<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="noticeDAO" class="com.zimcarry.notice.NoticeDAO" />
<c:choose>
	<c:when test="${empty param.noIdx}" >
		<script>
			alert('잘못된 접근입니다.');
			location.href='../notice.jsp';
		</script>
	</c:when>
	<c:otherwise>
		${noticeDAO.noticeDataToJSON(param.noIdx)}
		<%System.out.println(noticeDAO.noticeDataToJSON("1")); %>
	</c:otherwise>
</c:choose>
