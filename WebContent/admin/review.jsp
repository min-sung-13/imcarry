<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<c:if test="${empty sessionScope.admin_id}">
	<script>
		alert('로그인 후 이용하세요.');
		location.href='./admin.jsp';
	</script>
</c:if>
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<jsp:useBean id="reviewDTO" class="com.zimcarry.review.ReviewDTO" />
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<jsp:useBean id="bookDTO" class="com.zimcarry.book.BookDTO" />
<jsp:useBean id="util" class="com.zimcarry.util.Util" />

<c:set var="pageNum" value="1" />
<c:set var="limit" value=", 10" />
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
			<c:set var="start" value="${pageNum * 10 - 10}" />
			<c:set var="limit" value="${start}${limit}" />
		</c:otherwise>
	</c:choose>
</c:if>

<c:set var="reviewList" value="${reviewDAO.selectAll(limit)}" />
<c:set var="page" value="${util.paging(reviewDAO.reviewListSize(), 10)}" />

<!DOCTYPE html>
<html lang="ko">
<!-- head -->
<%@ include file="./head.jsp" %>
<body class="">
  <div class="wrapper ">
    <!-- side menu -->
    <%@ include file="./side_menu.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">이용후기 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      	<div class="review_table">
      		<table>
      			<thead>
      				<tr>
      					<th>번호</th>
      					<th>제목</th>
      					<th>작성자</th>
      					<th>만족도</th>
      					<th>이용날짜</th>
      					<th>숨김여부</th>
      				</tr>
      			</thead>
      			<tbody>
      				<c:forEach var="reviewItem" items='${ reviewList }' varStatus="status">
      					<c:set var="bookDTO" value="${ bookDAO.selectBookWhereIdx(reviewItem.reBookidx) }" />
	      				<tr>
	      					<td>${ reviewItem.reIdx }</td>
	      					<td><a href="#" onclick="review_d(${reviewItem.reIdx}, ${reviewItem.reBookidx})">${reviewItem.reTitle}</a></td>
	      					<td>${ bookDTO.bName }</td>
	      					<td>${ reviewItem.reScore }</td>
	      					<td>${ bookDTO.bStartdate }</td>
	      					<td>${ reviewItem.reHidden}</td>
						</tr>
      				</c:forEach>
      			</tbody>
      		</table>
      		<div class="page_wrap">
	            <ul class="page_list">
				 	<c:forEach var="i" items="${page}" varStatus="status" >
					<li>
						<a href="review.jsp?pageNum=${status.index + 1}"
							<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>
							${status.index + 1}
						</a>
					</li>
	                </c:forEach>
	            </ul>
        	</div>
      	</div>
        <!--  review_table end -->
        <!-- review detail -->
        <div class="review_detail off">
	        <form method="post" action="./data/review_edit.jsp">
	        	<input type="hidden" name="re_idx" id="re_idx" value="0">
	        	<p class="bold">글 번호 : <span class="m" id="re_num"></span> 작성자 : <span id="re_writer" class="m"></span> 작성일 : <span id="re_writedate"></span></p>
		        <p class="bold">구간 : <span id="re_route" class="m_small"></span> 만족도 : <span id="re_score"></span></p>
		       	<p class="bold">제목 : <span id="re_title"></span></p>
	        	<div class="re_content">
	        		<p id="re_content"></p> 
	        	</div>
	        	<div class="radio">
	        		<p>리뷰 숨김 여부 설정</p>
		        	<label class="rad_label">공개</label> <input type="radio" name="review_hv" id="re_hidden_n" value="x" checked="checked"> 
		        	<label class="rad_label">숨김</label> <input type="radio" name="review_hv" id="re_hidden_y" value="o">
	        	</div>
	        	<p class="submit"><input type="submit" value="수정" id="btn_review_edit"></p>
	        </form>
        </div>
      </div>
      <!-- footer -->
      <%@ include file="./footer.jsp" %>
    </div>
    </div>
  <!--   Core JS Files   -->
  <%@ include file="./core_js.jsp" %>
   s<script>
   $(function () {
 		$('.sidebar-wrapper ul.nav li').removeClass("active");
 		$('.sidebar-wrapper ul.nav li:eq(5)').addClass("active");
 	})
  </script>
  	<script src="../assets/js/review_a.js"></script>
</body>
</html>