<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<c:if test="${param.reBookidx == 0 || empty param.reBookidx}" >
	<script>
		alert('잘못된 접근입니다.');
		location.href='./customer_review.jsp';
	</script>
</c:if>
<jsp:setProperty property="*" name="reviewDTO" />
<c:out value="${reviewDTO.reBookidx }" />
<c:if test="${reviewDAO.insertReview(reviewDTO)}" >
	<script>
		alert('후기작성 성공!\n정성스러운 후기 작성 감사합니다!');
		location.href='./customer_review.jsp';
	</script>
</c:if>
