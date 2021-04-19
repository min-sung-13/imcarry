<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
	<script>
		var code = prompt('접속 허용 코드를 입력하세요.');
		if(code != "1234") {
			alert("허용되지 않은 코드입니다.");
			top.window.open('about:blank','_self').close();
			top.window.opener=self;
			top.self.close();
		}
	</script>
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
				<div class="admin_regist">
			    	<h2>관리자 등록</h2>
					<form method="post" action="./data/admin_reg_ok.jsp">
			          	<p>AdminId <input type="text" name="admin_id" id="admin_id"></p>
			          	<p>Password <input type="password" name="admin_pw" id="admin_pw"></p>
			          	<p><input type="submit" value="REGIST" id="reg_btn"></p>
				    </form>
				</div>
			</div>
		<%@ include file="./footer.jsp" %>
    </div>
  </div>
  <!--   Core JS Files   -->
  <%@ include file="./core_js.jsp" %>
  <script>
  	$(function () {
  		for(let i = 1; i <= 5; i++) {
  			$('.sidebar-wrapper ul.nav li:eq(' + i + ')').addClass("off");
  		}
  		$('.sidebar-wrapper ul.nav li').removeClass("active");
  		$('.sidebar-wrapper ul.nav li:eq(0)').addClass("active");
  		$('#ad_adminid').focus();
  		$('#reg_btn').on("click", function() {
  			if($('#admin_id').val() == "" || $('#admin_pw').val() == "") {
  				alert("아이디와 비밀번호를 모두 입력하세요.");
  				return false;
  			}
  		});
  	});
  </script>
</body>
</html>




