<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <form method="post" onsubmit="return checkBook()" action="write.jsp" id="reviewForm">
                                <fieldset>
                                    <legend>이용후기 작성</legend>
                                    <div id="book_check_area">
                                    	<p><img src="../../images/ico/ico_logo_title.png" alt="아임캐리 로고" ></p>
                                    	<p class="text">클린한 이용 후기를 위해 이용 고객만 작성이 가능합니다.</p>
                                    	<p class="text">이용 후기 작성을 위해 이용내역조회를 먼저 해주세요.</p>
	                                    <input type="text" name="bHp" id="bHp" placeholder="전화번호를 입력하세요 (-제외)">
	                                    <input type="text" name="reBookidx" id="reBookidx" placeholder="예약번호를 입력하세요">
                                    	<input type="button" id="book_check_btn" value="이용내역조회">
                                    </div>
                                    <div id="isData_no" class="hidden check_result">
                                    	<h2 class="result_msg">이용내역 조회 결과</h2>
                                    	<h1 class="no_msg">후기를 작성할 이용내역이 존재하지 않습니다 <span>:)</span></h1>
                                    </div>
                                    <div id="isData_yes" class="hidden check_result">
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
                                    				<td id="bName">name</td>
                                    				<td><span id="bStart">start</span> -> <span id="bEnd">end</span></td>
                                    				<td><span id="bStartdate">start time</span> ~ <span id="bEnddate">end time</span></td>
                                    				<td><input type="button" value="작성" id="write_btn" onclick="$('#reviewForm').submit()"></td>
                                    			</tr>
                                    		</tbody>
                                    	</table>
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
	<script src="../../js/customer.js"></script>
   	<script src="../../js/main.js"></script>
</body>
</html>