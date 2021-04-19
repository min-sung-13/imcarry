<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${param.bIdx eq null}">
		<script>
			alert('잘못된 접근입니다.');
			location.href='../admin.jsp';
		</script>
	</c:when>
	<c:otherwise>
		<jsp:useBean id="bookDTO" class="com.zimcarry.book.BookDTO" />
		<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
		<jsp:setProperty property="*" name="bookDTO"/>
		<c:set var="btn" value="${param.btn}"/>
		<c:choose>
			<c:when test="${bookDAO.deleteBook(bookDTO)}">
				<script>
					alert('예약이 취소되었습니다.');
				</script>
				<c:choose>
					<c:when test="${btn eq 'all'}" >
						<script>
							location.href='../reservation.jsp?pageNum=1&btn=all';
						</script>
					</c:when>
					<c:when test="${btn eq 'past'}" >
						<script>
							location.href='../reservation.jsp?pageNum=1&btn=past';
						</script>
					</c:when>
					<c:otherwise>
						<script>
							location.href='../reservation.jsp?pageNum=1&btn=future';
						</script>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<script>
					alert('예약이 취소실패');
					history.back();
				</script>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
