<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%  request.setCharacterEncoding("utf-8"); %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.admin_id}">
	<script>
		alert('로그인 후 이용하세요.');
		location.href='./admin.jsp';
	</script>
</c:if>
<jsp:useBean id="faqDTO" class="com.zimcarry.faq.FaqDTO" />
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO" />
<jsp:useBean id="util" class="com.zimcarry.util.Util" />
<c:set var="pageNum" value="1" />
<c:set var="limit" value=", 8" />
<c:if test="${pageNum ne null}" >
	<c:set var="pageNum" value="${param.pageNum}" />
	<c:if test="${param.pageNum eq null}">
		<c:set var="pageNum" value="1" />
	</c:if>
	<c:choose>
		<c:when test="${pageNum eq 1 || pageNum eq null}">
			<c:set var="limit" value="0, 8" />
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${pageNum * 8 - 8}" />
			<c:set var="limit" value="${start}${limit}" />
		</c:otherwise>
	</c:choose>
</c:if>
<c:set var="noticeList" value="${faqDAO.selectFaqList(limit)}" scope="page" />
<c:set var="page" value="${util.paging(faqDAO.faqListSize(), 8)}" />
<!DOCTYPE html>
<html lang="ko">
<!-- head -->
<style>
	.ck-editor__editable_inline {
   		min-height: 400px;
	}
</style>
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
            <a class="navbar-brand" href="javascript:;">공지사항 게시글 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      	<div class="list_up notice">
      		<div class="page_wrap">
				<ul class="page_list">
					<c:forEach var="i" items="${page}" varStatus="status" >
						<li><a href="./faq.jsp?pageNum=${status.index + 1}"<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>${status.index + 1}</a></li>
					</c:forEach>
			    </ul>
			</div>
      		<dl>
      			<c:forEach var="faq" items="${noticeList}" varStatus="status">
      			<dt>
      				<div>
      					<p class="data">
	      					작성일 : ${faq.fWritedate} // 숨김 여부 : ${faq.fHidden} 
	      					<p>
		      					<button class="btn btn_edit" value="${faq.fIdx}">수정</button> 
		      					<c:if test="${faq.fHidden == 'x'}"><button class="btn btn_hidden">숨기기</button></c:if>
		      					<c:if test="${faq.fHidden == 'o'}"><button class="btn btn_show" >보이기</button></c:if>
	      					</p>
      					</p>
      				</div>
      				<div class="q_area">
      					<span>질문: </span>
      					${faq.fQuestion}
      				</div>
      			</dt>
      			<dd>
  					<span>답변: </span>
      				<div>
      					${faq.fAnswer}
      				</div>
      			</dd>
      			</c:forEach>
      		</dl>
      		<div class="page_wrap">
				<ul class="page_list">
					<c:forEach var="i" items="${page}" varStatus="status" >
						<li><a href="./faq.jsp?pageNum=${status.index + 1}"<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>${status.index + 1}</a></li>
					</c:forEach>
			    </ul>
			</div>
      	</div>
      	<div class="list_down notice">
      		<form method="post" action="./data/faq_ok.jsp" onsubmit="return checkFaq()">
      			<p>질문</p>
      			<p><textarea name="fQuestion" id="fQuestion" placeholder="질문을 작성하세요"></textarea></p>
      			<p>답변</p>
      			<p><textarea name="fAnswer" id="fAnswer" placeholder="답변을 작성하세요"></textarea></p>
      			<p>게시글을 감추시겠습니까? <label for="fHiddenyse">예 </label><input type="radio" name="fHidden" id="no_hiddenyse" value="o"> <label for="fHiddenno">아니요 </label><input type="radio" name="fHidden" id="fHiddenno" value="x"></p>
      			<input type="hidden" name="fIdx" id="fIdx">
      			<p id="btn_wrap">
      				<input type="submit" value="등록" id="btn_write" name="write">
      			</p>
      		</form>
      	</div>
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
  		$('.sidebar-wrapper ul.nav li:eq(4)').addClass("active");
  	});
  </script>
  <script src="../assets/js/ckeditor5/build/ckeditor.js"></script>
  <script src="../assets/js/faq.js"></script>
</body>

</html>