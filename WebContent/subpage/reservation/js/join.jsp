<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("id") == null){
%>
<script>
	alert("로그인 후 이용하세요.");
	location.href="../login.jsp";
</script>
<%
	}

	if(request.getParameter("b_idx") == null){
%>
	<script>
		alert("잘못된 접근입니다.");
		location.href="list.jsp";
	</script>
<%	
	}

	String b_idx = request.getParameter("b_idx");
	String userid = (String)session.getAttribute("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mariadb://210.100.221.140:3306/project";
	String uid = "root";
	String upw = "1234";
	
	String b_userid = "";
	String b_title = "";
	String b_content = "";
	String b_regdate = "";
	String b_hit = "";
	String b_file = "";
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			sql = "UPDATE tb_board set b_hit = b_hit + 1 WHERE b_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_idx);
			pstmt.executeUpdate();
		
			sql = "SELECT b_idx, b_userid, b_title, b_content, b_regdate, b_hit, b_file ";
			sql += "FROM tb_board where b_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				b_userid = rs.getString("b_userid");
				b_title = rs.getString("b_title");
				b_content = rs.getString("b_content");
				b_regdate = rs.getString("b_regdate");
				b_hit = rs.getString("b_hit");
				b_file = rs.getString("b_file");
				
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
</head>
<body>
	<h2>글보기</h2>
	<p>제목 : <%=b_title%></p>
	<p>작성자 : <%=b_userid%> </p>
	<p>조회수 : <%=b_hit%> </p>
	<p>날짜 : <%=b_regdate%></p>
	<p>내용</p>
	<p> <%=b_content%></p>
	<p>파일 : <%
		if(b_file != null && !b_file.equals("")) {
			out.print(b_file);
		}
	%></p>
	<p><input type="button" value="리스트" onclick="location.href='list.jsp'">
<%
	if(userid.equals(b_userid)){
%>
	 <input type="button" value="수정" onclick="location.href='edit.jsp?b_idx=<%=b_idx%>'"> 
	 <input type="button" value="삭제" onclick="location.href='delete.jsp?b_idx=<%=b_idx%>'">
<%
	}
%>
	</p>
	<form method="post" action="reply_ok.jsp">
	<input type="hidden" name="b_idx" value="<%=b_idx%>">
		<p><%=userid %> : <input type="text" name="r_content"> <input type="submit" value="확인"></p>
		<hr>
		<%
			try{
				sql = "SELECT r_idx, r_userid, r_content, r_regdate, r_bidx FROM tb_reply ";
				sql += "WHERE r_bidx=? order by r_idx DESC";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b_idx);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String r_idx = rs.getString("r_idx");
					String r_userid = rs.getString("r_userid");
					String r_content = rs.getString("r_content");
					String r_regdate = rs.getString("r_regdate");
%>
				<p><%=r_userid %> : <%=r_content %> <%=r_regdate %> <input type="button" value="삭제" onclick="location.href='reply_del.jsp?r_idx=<%=r_idx%>&b_idx=<%=b_idx%>'"></p>
<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
%>
		
	</form>
</body>
</html>