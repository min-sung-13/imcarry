package com.zimcarry.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.zimcarry.notice.NoticeDAO;
import com.zimcarry.notice.NoticeDTO;

public class FileService {

	private NoticeDAO noticeDAO = null;
	private String realPath;
	
	public FileService() {
		noticeDAO = new NoticeDAO();
	}
	
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	
	public static String getToday() {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(c.getTime());
	}
	
	public boolean insertFileNotice (String noTitle, String noWriter, String noContent, String noHidden, File file) {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNoTitle(noTitle);
		noticeDTO.setNoWriter(noWriter);
		noticeDTO.setNoContent(noContent);
		noticeDTO.setNoHidden(noHidden);
		noticeDTO.setNoFilename(file.getName());
		noticeDTO = noticeDAO.insertFileNotice(noticeDTO);
		if (noticeDTO != null) {
			moveFile(noticeDTO, file);
		}
		return true;
	}
	
	public boolean updateFileNotice(String noIdx, String noTitle, String noWriter, String noContent, String noHidden, File file, String ogFilename) {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNoIdx(Long.parseLong(noIdx));
		noticeDTO.setNoTitle(noTitle);
		noticeDTO.setNoWriter(noWriter);
		noticeDTO.setNoContent(noContent);
		noticeDTO.setNoHidden(noHidden);
		noticeDTO.setNoFilename(file.getName());
		noticeDTO = noticeDAO.editFileNotice(noticeDTO);
		System.out.println("업데이트 파일 수정" + noticeDTO);
		if (noticeDTO != null) {
			moveFile(noticeDTO, file);
		}
		return true;
	}
	
	public void moveFile(NoticeDTO noticeDTO, File file) {
		File dir = new File(realPath + "/" + getToday());
		if(!dir.isDirectory()) {
			System.out.println("파일 없음?");
			dir.mkdir();
		}
		if(file.isFile()) {
			System.out.println("파일 있음 !!!!!!");
			System.out.println("realPath : " + realPath);
			File newFile = new File(realPath + noticeDTO.getNoFilepath());
			System.out.println("newFile : " + newFile);
			file.renameTo(newFile);
		}
	}
}
