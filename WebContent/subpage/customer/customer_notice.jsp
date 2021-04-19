<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
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
<c:set var="noticeList" value="${noticeDAO.getNoticeList('x', limit)}" />
<c:set var="page" value="${util.paging(noticeDAO.noticeListSize('x'), 10)}" />
<c:if test="${param.keyword ne null}">
	<c:set var="noticeList" value="${noticeDAO.getNoticeList(limit, param.search, param.keyword)}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
    <title>짐 없는 여행의 시작! 아임캐리</title>
    <link href="../../css/customer_center_style.css" rel="stylesheet">
    <link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<div id="wrap">
		<!-- header -->
		<%@ include file="../../common/header.jsp" %>
		<!-- header end -->
		<!-- content -->
		<div class="customer sub_content_wrap">
            <div class="sub_title box_inner">
                짐없는 여행의 시작<br>
                <span>아임캐리</span>
            </div>
            <div class="white">
                <div id="sub_content" class="box_inner sub_content">
                    <nav class="sub_navi">
                        <ul>
                            <li><a href="./customer_notice.jsp" class="on">공지사항</a></li>
                            <li><a href="./customer_FAQ.jsp">FAQ</a></li>
                            <li><a href="./customer_review.jsp">이용후기</a></li>
                        </ul>
                    </nav>
                    <div class="sub_indicator box_inner">
                        <h2>공지사항</h2>
                        <ul>
                            <li>Home</li>
                            <li>고객센터</li>
                            <li>공지사항</li>
                        </ul>
                    </div>
                    <div class="notice_area box_inner">
                        <form action="./customer_notice.jsp" method="POST" onsubmit="return checkSearch()" class="minisrch_form clear2">
                            <fieldset>
                                <legend>검색</legend>
                                <select name="search">
                                    <option value="제목">제목</option>
                                    <option value="내용">내용</option>
                                </select>
                                <input type="text" name="keyword" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
                                <input type="button" value="검색" id="search_btn">
                                <input type="button" value="전체보기" id="reset_btn">
                            </fieldset>
                        </form>
                        <table class="notice_list">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                            <c:forEach var="notice" items="${noticeList}" varStatus="status">
	                            <tr>
	                                <td>${noticeList.size() - status.index}</td>
	                                <td><a href="./customer_notice_view.jsp?noIdx=${notice.noIdx}">${notice.noTitle}</a></td>
	                                <td>${notice.noWriter}</td>
	                                <td>${notice.noWritedate}</td>
	                                <td>${notice.noHit}</td>
	                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="page_wrap">
                        <ul class="page_list">
                        	<c:forEach var="i" items="${page}" varStatus="status" >
								<li><a href="./customer_notice.jsp?pageNum=${status.index + 1}"<c:if test="${status.index + 1 eq pageNum}">class="on"</c:if>>${status.index + 1}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
   		<!-- content end -->
   		<!-- footer -->
   		<%@ include file="../../common/footer.jsp" %>
   		<!-- footer end -->
   		<!-- pop-up -->
   		<%@ include file="../../common/popup.jsp" %>
   		<!-- pop-up end -->
	</div>
	<script src="../../js/jquery-3.5.1.min.js"></script>
	<script src="../../js/customer.js"></script>
   	<script src="../../js/main.js"></script>
</body>
</html>