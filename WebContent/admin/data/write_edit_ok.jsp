<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ page import="com.zimcarry.util.FileService"%>
<%@ page import="java.lang.IllegalArgumentException"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="noticeDAO" class="com.zimcarry.notice.NoticeDAO" />
<jsp:useBean id="noticeDTO" class="com.zimcarry.notice.NoticeDTO" />
<jsp:setProperty property="*" name="noticeDTO" />
<%
	try {
		FileService fs = new FileService();
		File temp = new File(request.getRealPath("uploads"));
		if (!temp.exists()) {
			System.out.println("파일 또는 디렉토리 없음");
			temp.mkdir();
		}
		fs.setRealPath(request.getRealPath("uploads"));
		int maxSize = 100 * 1024 * 1024;
		String savePath = fs.getRealPath();
		String format = "UTF-8";
		String uploadFile = "";
		int read = 0;
		byte[] buf = new byte[1024];
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
		System.out.print(multi.getParameter("noTitle"));
		String noTitle = multi.getParameter("noTitle");
		String noWriter = multi.getParameter("noWriter");
		String noContent = multi.getParameter("noContent");
		uploadFile = multi.getFilesystemName("noFilename");
		String ogFilename = multi.getParameter("ogFilename");
		String noHidden = multi.getParameter("noHidden");
		String noIdx = multi.getParameter("noIdx");
		
		File file = new File(savePath + "/" + uploadFile);
		if (!file.exists()) {
			System.out.println("파일 또는 디렉토리 없음");
			file.mkdir();
		}
		
		String btn = "";
		
		if (multi.getParameter("btn_write") != null) {
			btn = multi.getParameter("btn_write");
		} else if (multi.getParameter("btn_edit") != null) {
			btn = multi.getParameter("btn_edit");
		}
		
		if (btn.equals("작성")) {
			if (uploadFile != null) {
				if (fs.insertFileNotice(noTitle, noWriter, noContent, noHidden, file)) {
					out.print("<script>");
					out.print("alert('공지사항 작성 성공!');");
					out.print("location.href='../notice.jsp'");
					out.print("</script>");
				}
			} else {
				if (noticeDAO.insertNotice(noTitle, noWriter, noContent, noHidden)) {
					out.print("<script>");
					out.print("alert('공지사항 작성 성공!');");
					out.print("location.href='../notice.jsp'");
					out.print("</script>");
				}
			}
		} else {
			if (uploadFile != null) {
				if (fs.updateFileNotice(noIdx, noTitle, noWriter, noContent, noHidden, file, ogFilename)) {
					out.print("<script>");
					out.print("alert('공지사항 수정 성공!');");
					out.print("location.href='../notice.jsp'");
					out.print("</script>");
				}
			} else {
				if (noticeDAO.editNoice(noIdx, noTitle, noWriter, noContent, noHidden)) {
					out.print("<script>");
					out.print("alert('공지사항 수정 성공!');");
					out.print("location.href='../notice.jsp'");
					out.print("</script>");
				}
			}
		}
	} catch (IllegalArgumentException e1) {
		e1.printStackTrace();
		System.out.println("파일오류");
		
	} catch (Exception e) {
		e.printStackTrace();
%>
		<script>
			alert('잘못된 접근입니다.');
			location.href='../notice.jsp';
		</script>
<%
	}
%>
