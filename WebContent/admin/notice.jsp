<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<c:if test="${empty sessionScope.admin_id}">
	<script>
		alert('로그인 후 이용하세요.');
		location.href='./admin.jsp';
	</script>
</c:if>
<jsp:useBean id="noticeDTO" class="com.zimcarry.notice.NoticeDTO" />
<jsp:useBean id="noticeDAO" class="com.zimcarry.notice.NoticeDAO" />
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
<c:set var="noticeList" value="${noticeDAO.getNoticeList('o', limit)}" scope="page" />
<c:set var="page" value="${util.paging(noticeDAO.noticeListSize(), 10)}" />
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
            <a class="navbar-brand" href="javascript:;">공지사항 게시글 관리</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      	<div class="list_up notice">
      		<table>
      			<thead>
      				<tr>
      					<th>번호</th>
      					<th>제목</th>
      					<th>작성자</th>
      					<th>작성일</th>
      					<th>조회수</th>
      					<th>숨김여부</th>
      				</tr>
      			</thead>
      			<tbody>
      				<c:forEach var="noticeItem" items="${noticeList}" varStatus="status">
	      				<tr>
	      					<td>${noticeItem.noIdx}</td>
	      					<td><a href="#">${noticeItem.noTitle}</a></td>
	      					<td>${noticeItem.noWriter}</td>
	      					<td>${noticeItem.noWritedate}</td>
	      					<td>${noticeItem.noHit}</td>
	      					<td>${noticeItem.noHidden}</td>
	      				</tr>
      				</c:forEach>
      			</tbody>
      		</table>
  			<div class="page_wrap">
				<ul class="page_list">
					<c:forEach var="i" items="${page}" varStatus="status" >
						<li><a href="./notice.jsp?pageNum=${status.index + 1}"<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>${status.index + 1}</a></li>
					</c:forEach>
			    </ul>
			</div>
		</div>
      	<div class="list_down notice">
      		<form method="post" action="./data/write_edit_ok.jsp" onsubmit="return checkForm()" enctype="multipart/form-data" id="noForm">
      			<p>제목 : <input type="text" name="noTitle" id="no_title"></p>
      			<p>작성자 : <input type="text" name="noWriter" id="no_writer"></p>
      			<p>내용</p>
      			<p><textarea name="noContent" id="no_content" placeholder="이미지는 드래그 앤 드롭으로 업로드 하세요"></textarea></p>
				<p>업로드된 파일 : <span id="ogFile"></span></p>
      			<p><input type="file" name="noFilename"></p>
      			<input type="hidden" value="" name="ogFilename" id="og_filename">
      			<p>게시글을 감추시겠습니까? <label for="no_hiddenyse">예 </label><input type="radio" name="noHidden" id="no_hiddenyse" value="o"> <label for="no_hiddenno">아니요 </label><input type="radio" name="noHidden" id="no_hiddenno" value="x"></p>
      			<input type="hidden" name="noIdx" id="noIdx">
      			<p id="btn_wrap">
      				<input type="submit" value="작성" id="btn_write" name="btn_write">
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
  		$('.sidebar-wrapper ul.nav li:eq(3)').addClass("active");
  	});
  </script>
	<script src="https://cdn.ckeditor.com/ckeditor5/20.0.0/classic/ckeditor.js"></script>
  	<script src="../assets/js/notice.js"></script>
</body>

</html>