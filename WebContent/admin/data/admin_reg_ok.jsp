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
		String sql = "INSERT INTO tb_admin(ad_id, ad_pw) VALUES (?, PASSWORD(?))";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, admin_id);
		pstmt.setString(2, admin_pw);
		int result = pstmt.executeUpdate();
		if(result >= 1) {
%>	
			<script>
				alert("관리자 등록이 완료되었습니다.");
				location.href="../admin.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("관리자 등록에 실패하였습니다.");
				history.back();
			</script>
<%
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>