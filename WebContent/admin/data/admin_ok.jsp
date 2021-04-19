<%@page import="com.zimcarry.db.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String admin_id = request.getParameter("admin_id");
	String admin_pw = request.getParameter("admin_pw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = DBConn.getConnection();
		String sql = "SELECT ad_idx FROM tb_admin WHERE ad_id=? AND ad_pw=PASSWORD(?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, admin_id);
		pstmt.setString(2, admin_pw);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			session.setAttribute("admin_id", admin_id);
%>	
			<script>
				alert("관리자님 환영합니다.");
				location.href="../admin.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("아이디와 비밀번호를 확인하세요.");
				history.back();
			</script>
<%
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
</body>
</html>