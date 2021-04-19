<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>짐 없는 여행의 시작! 아임캐리</title>
</head>
<link href="../../css/event_style.css" rel="stylesheet">
<link href="../../images/ico_tit.ico" rel="shortcut icon" type="image/x-icon">
<body>
<div id="wrap">
		<!-- header -->
		<%@ include file="../../common/header.jsp" %>
		
		 <div class="customer sub_content_wrap sub_page">
            <div class="sub_title box_inner">
                짐없는 여행의 시작<br>
                <span>아임캐리</span>
            </div>
            <div class="white">
                <div id="sub_content" class="box_inner sub_content event_content">
                    <div class="sub_indicator box_inner">
                        <h2>이벤트</h2>
                        <ul>
                            <li>Home</li>
                            <li>이벤트</li>
                            <li>이벤트</li>
                        </ul>
                    </div>
                    <div class="box_inner container clear2">
                        <div id="event_notice_board">
                            <table class="event_basic_list">
                                <caption>나잇스윗</caption>
                                <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>부산시티투어</td>
                                        <td>아임캐리</td>
                                        <td>2019-11-11</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="event_basic_picture">
                                <img src="../../images/2019111116332925126.jpg" alt="부산시티투어">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- footer -->
   		<%@ include file="../../common/footer.jsp" %>
   		<!-- footer end -->
   		<!-- pop-up -->
   		<%@ include file="../../common/popup.jsp" %>
   		<!-- pop-up end -->
</div>
<script src="../../js/jquery-3.5.1.min.js"></script>
<script src="../../js/main.js"></script>
</body>
</html>