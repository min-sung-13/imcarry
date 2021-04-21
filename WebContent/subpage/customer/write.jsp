<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bookDTO" class="com.zimcarry.book.BookDTO" />
<jsp:useBean id="bookDAO" class="com.zimcarry.book.BookDAO" />
<jsp:setProperty property="*" name="bookDTO" />
<jsp:setProperty property="bIdx" name="bookDTO" value="${param.reBookidx}" />
<c:set var="bookDTO" value="${bookDAO.selectBookSimpleInfo(bookDTO.getbIdx(), bookDTO.getbHp())}" />
<c:if test="${empty param.reBookidx}">
	<script>
		alert('잘못된 접근입니다.');
		location.href='./customer_review.jsp';
	</script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
    <title>짐 없는 여행의 시작! 아임캐리</title>
    <link href="../../css/customer_center_style.css" rel="stylesheet">
    <link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
    <style>
    	.ck.ck-editor {
    		max-width: 610px;
    		margin: 0 auto !important;
    	}
    	.ck-editor__editable {
    		min-height: 300px;
    	}
    </style>
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
                            <li><a href="./customer_FAQ.jsp">FAQ</a></li>
                            <li><a href="./customer_review.jsp" class="on">이용후기</a></li>
                        </ul>
                    </nav>
                    <div class="sub_indicator box_inner">
                        <h2>이용후기</h2>
                        <ul>
                            <li>Home</li>
                            <li>고객센터</li>
                            <li>이용후기</li>
                        </ul>
                    </div>
                    <div class="review_area box_inner">
                        <div class="write_wrap">
                            <form method="post" onsubmit="return checkReview()" action="write_ok.jsp">
                                <fieldset>
                                    <legend>이용후기 작성</legend>
                                    
                                    <div id="isData_yes" class="check_result">
                                    	<h2 class="result_msg">이용내역 조회 결과</h2>
                                    	<table>
                                    		<thead>
                                    			<tr>
                                    				<th>이름</th>
                                    				<th>구간</th>
                                    				<th>날짜</th>
                                    				<th>이용 후기 작성</th>
                                   				</tr>
                                    		</thead>
                                    		<tbody>
                                    			<tr>
                                    				<td id="bName">${bookDTO.bName}</td>
                                    				<td><span id="bStart">${bookDTO.bStart}</span> -> <span id="bEnd">${bookDTO.bEnd}</span></td>
                                    				<td><span id="bStartdate">${bookDTO.bStartdate}</span> ~ <span id="bEnddate">${bookDTO.bEnddate}</span></td>
                                    				<td class="accent">후기 작성중</td>
                                    			</tr>
                                    		</tbody>
                                    	</table>
                                    </div>
                                    <div class="input_area">
	                                    <p class="mid_text">별점을 선택하세요</p>
	                                    <ul class="star_list clear2">
	                                        <li><a href="#" class="">0.5</a></li>
	                                        <li><a href="#" class="">1</a></li>
	                                        <li><a href="#" class="">1.5</a></li>
	                                        <li><a href="#" class="">2</a></li>
	                                        <li><a href="#" class="">2.5</a></li>
	                                        <li><a href="#" class="">3</a></li>
	                                        <li><a href="#" class="">3.5</a></li>
	                                        <li><a href="#" class="">4</a></li>
	                                        <li><a href="#" class="">4.5</a></li>
	                                        <li><a href="#" class="">5</a></li>
	                                    </ul>
	                                    <input type="hidden" name="reScore" id="star_score" value="">
	                                    <input type="text" name="reTitle" id="reTitle" placeholder="제목을 입력해주세요">
	                                    <textarea name="reContent" id="reContent" placeholder="아임캐리 이용 후기를 남겨주세요"></textarea>
	                                    <input type="hidden" name="reBookidx" id="reBookidx" value="${bookDTO.bIdx}">
	                                    <div class="btn_wrap">
	                                        <input class="btn_base btn_yellow" type="submit" value="후기 등록">
	                                    </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
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
	<script src="../../js/ckeditor5/build/ckeditor.js"></script>
	<script src="../../js/ckeditor.js"></script>
	<script src="../../js/customer.js"></script>
   	<script src="../../js/main.js"></script>
</body>
</html>