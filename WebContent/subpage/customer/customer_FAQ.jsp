<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="faqDAO" class="com.zimcarry.faq.FaqDAO"/>
<c:set var="faqList" value="${faqDAO.selectFaqListHiddenNo()}" />
<!DOCTYPE html>
<html lang="ko">
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
			                <li><a href="./customer_notice.jsp">공지사항</a></li>
			                <li><a href="./customer_FAQ.jsp" class="on">FAQ</a></li>
			                <li><a href="./customer_review.jsp">이용후기</a></li>
			            </ul>
			        </nav>
			        <div class="sub_indicator box_inner">
			            <h2>FAQ</h2>
			            <ul>
			                <li>Home</li>
			                <li>고객센터</li>
			                <li>FAQ</li>
			            </ul>
			        </div>
			        <div class="faq_area box_inner">
			            <dl class="faq_list">
			               <c:forEach var="faq" items="${faqList}">
				               <dt>
				                   <div class="big q">Q</div>
				                   <div class="q_box">
				                   		${faq.fQuestion}
				                   </div>
				               </dt>
				               <dd style="display: none;">
				                   <div class="big">A</div>
				                   <div class="a_box">
				                   		${faq.fAnswer}
				                   </div>
				               </dd>
			               </c:forEach>
		                </dl>
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