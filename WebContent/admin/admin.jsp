<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String admin_id = "";
	if(session.getAttribute("admin_id") != null){
		admin_id = (String)session.getAttribute("admin_id");
	}
%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<jsp:useBean id="noitceDAO" class="com.zimcarry.notice.NoticeDAO" />
<jsp:useBean id="reviewDAO" class="com.zimcarry.review.ReviewDAO" />
<jsp:useBean id="hotelDAO" class="com.zimcarry.hotel.HotelDAO" />
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO" />
<c:set var="bookList" value="${bookDAO.selectBookList('0, 10')}" />

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
            <a class="navbar-brand" href="javascript:;">관리자</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
      <%
      	if (admin_id == null || admin_id.equals("")) {
      %>
      	<div class="login_wrap">
          <form method="post" action="./data/admin_ok.jsp">
          	<p>Admin ID <input type="text" name="admin_id" id="admin_id"></p>
          	<p>Password <input type="password" name="admin_pw" id="admin_pw"></p>
          	<p class="login_btn"><input type="submit" value="LOGIN" id="login_btn"></p>
          	<p class="login_btn"><input type="button" value="REGIST" onclick="location.href='admin_reg.jsp'"></p>
          </form>
      	</div>
      	<%
      	} else {
      	%>
      	<div class="logged_in_wrap">
      		<p id="admin_ok"><img src="../assets/img/ico_logo_title.png" alt="짐캐리 로고" /><%=admin_id%> 님 반갑습니다.</p>
      		<p id="admin_logout"><input type="button" value="로그아웃" name="logout_btn" onclick="location.href='admin_logout.jsp'" /></p>
      	</div>
      	<div class="container-fluid">
            <div class="simple_wrap">
	      		<div class="col-lg-3 col-md-6 col-sm-6">
		            <div class="card card-stats">
			            <div class="card-header card-header-success card-header-icon">
				            <div class="card-icon">
				            	<i class="material-icons">content_copy</i>
				            </div>
				            <p class="card-category">공지사항</p>
				            <h3 class="card-title">${noitceDAO.noticeListSize()}(${noitceDAO.noticeListSize('x')}) 개</h3>
			            </div>
			            <div class="card-footer">
				            <div class="stats">
				            	<i class="material-icons">date_range</i> 모든 공지사항 개수(화면에 나타나는 공지사항 개수)
				            </div>
			            </div>
		            </div>
	            </div>
	            <div class="col-lg-3 col-md-6 col-sm-6">
	              <div class="card card-stats">
	                <div class="card-header card-header-danger card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">info_outline</i>
	                  </div>
	                  <p class="card-category">이용 후기</p>
	                  <h3 class="card-title">${reviewDAO.reviewListSize()} 개 .. ${reviewDAO.reviewAverage()} 점</h3>
	                </div>
	                <div class="card-footer">
	                  <div class="stats">
	                    <i class="material-icons">local_offer</i> 화면에 나타나는 후기 개수
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-lg-3 col-md-6 col-sm-6">
	              <div class="card card-stats">
	                <div class="card-header card-header-info card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">store</i>
	                  </div>
	                  <p class="card-category">제휴호텔 개수</p>
	                  <h3 class="card-title">${hotelDAO.totCnt()} 개</h3>
	                </div>
	                <div class="card-footer">
	                  <div class="stats">
	                    <i class="material-icons">update</i> 총 제휴호텔 개수
	                  </div>
	                </div>
	              </div>
	            </div>
		        <div class="col-lg-3 col-md-6 col-sm-6">
	              <div class="card card-stats">
	                <div class="card-header card-header-success card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">content_copy</i>
	                  </div>
	                  <p class="card-category">FAQ 개수</p>
	                  <h3 class="card-title">${faqDAO.faqListSize()} 개</h3>
	                </div>
	                <div class="card-footer">
	                  <div class="stats">
	                    <i class="material-icons">date_range</i> FAQ 개수
	                  </div>
	                </div>
	              </div>
	            </div>
	       	 </div>
       	 </div>
       	 <div class="col-lg-6 col-md-12">
				<div class="card">
					<div class="card-header card-header-warning">
						<h4 class="card-title">최근 예약 현황 / 총 예약 건수(${bookDAO.bookListSize()})</h4>
						<p class="card-category">${today} / 최근 10개 예약</p>
					</div>
					<div class="card-body table-responsive">
						<table class="table table-hover">
							<thead class="text-warning">
								<tr>
									<th>예약번호</th>
									<th>이름</th>
									<th>경로</th>
									<th>맡기는 일정</th>
									<th>찾는 일정</th>
									<th>리뷰</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="book" items="${bookList}" varStatus="status">
									<tr>
										<td>${book.bIdx}</td>
										<td>${book.bName}</td>
										<td>${book.bStart} → ${book.bEnd}</td>
										<td>${book.bStartdate}</td>
										<td>${book.bEnddate}</td>
										<td>${book.bIsreview}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
      	</div>
      	<%
      	}
      	%>
      </div>
      <!-- footer -->
      <%@ include file="./footer.jsp" %>
    </div>
  <!--   Core JS Files   -->
  <%@ include file="./core_js.jsp" %>
  <script>
  	$(function () {
  		$('.sidebar-wrapper ul.nav li').removeClass("active");
  		$('.sidebar-wrapper ul.nav li:eq(0)').addClass("active");
  		$('#admin_id').focus();
  		for(let i = 1; i <= 5; i++) {
  			$('.sidebar-wrapper ul.nav li:eq(' + i + ')').addClass("off");
  		}
		<%
			if(session.getAttribute("admin_id") != null){
		%>
				for(let i = 1; i <= 5; i++) {
		  			$('.sidebar-wrapper ul.nav li:eq(' + i + ')').removeClass("off");
		  		}
		<%
			}
		%>
		$('#login_btn').on("click", function() {
  			if($('#admin_id').val() == "" || $('#admin_pw').val() == "") {
  				alert("아이디와 비밀번호를 모두 입력하세요.");
  				return false;
  			}
  		});
  	});
  </script>
</body>

</html>