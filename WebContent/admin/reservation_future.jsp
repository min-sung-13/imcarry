<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="bookList" value="${bookDAO.selectBookList(limit, false)}" />
<c:set var="page" value="${util.paging(bookDAO.bookListSize(false), 15)}" />
<c:if test="${param.keyword ne null}">
	<c:set var="bookList" value="${bookDAO.selectBookList(limit, false, param.keyword)}" />
</c:if>
<div class="col-lg-6 col-md-12">
	<div class="card">
		<div class="card-header card-header-warning future">
			<h4 class="card-title">다가오는 예약</h4>
			<p class="card-category">${today}</p>
		</div>
		<div class="card-body table-responsive">
			<div class="minisearch_form_wrap">
				<form method="POST" action="./reservation.jsp" class="minisrch_form">
					<input type="text" name="keyword" placeholder="전화번호를 입력하세요">
					<input type="button" value="검색" id="search_btn">
					<input type="button" value="전체보기" id="reset_btn_f">
					<input type="hidden" name="btn" value="future" >
				</form>
			</div>
			<table class="table table-hover">
				<thead class="text-warning">
					<tr>
						<th>예약번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>경로</th>
						<th>맡기는 일정</th>
						<th>찾는 일정</th>
						<th>리뷰</th>
						<th>예약취소</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${bookList eq null}" >
						<h1>예약이 없습니다.</h1>
					</c:if>
					<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td class="idx">${book.bIdx}</td>
							<td class="name">${book.bName}</td>
							<td>${book.bHp.substring(0, 3)} - ${book.bHp.substring(2, 6)} - ${book.bHp.substring(7)}</td>
							<td>${book.bStart} → ${book.bEnd}</td>
							<td>${book.bStartdate}</td>
							<td>${book.bEnddate}</td>
							<td>${book.bIsreview}</td>
							<td><input type="button" value="예약취소" class="btn_cancel"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page_wrap">
				<ul class="page_list">
					<c:forEach var="i" items="${page}" varStatus="status" >
						<li><a href="./reservation.jsp?btn=future&&pageNum=${status.index + 1}"<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>${status.index + 1}</a></li>
					</c:forEach>
			    </ul>
			</div>
		</div>
	</div>
</div>