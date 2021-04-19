package com.zimcarry.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zimcarry.db.DBConn;

public class FaqDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public boolean insertFAQ(FaqDTO faqDTO) {
		try {
			String sql = "INSERT INTO tb_faq(f_question, f_answer, f_hidden) VALUES (?, ?, ?)";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faqDTO.getfQuestion());
			pstmt.setString(2, faqDTO.getfAnswer());
			pstmt.setString(3, faqDTO.getfHidden());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
	
	public boolean editFAQ(FaqDTO faqDTO) {
		try {
			String sql = "UPDATE tb_faq SET f_question = ?, f_answer = ?, f_hidden = ? WHERE f_idx = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faqDTO.getfQuestion());
			pstmt.setString(2, faqDTO.getfAnswer());
			pstmt.setString(3, faqDTO.getfHidden());
			pstmt.setInt(4, faqDTO.getfIdx());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
	
	public void hidden(int fIdx, String fHidden) {
		try {
			String sql = "UPDATE tb_faq SET f_hidden = ? WHERE f_idx = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fHidden);
			pstmt.setInt(2, fIdx);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
	}
	
	public List<FaqDTO> selectFaqList(String limit) {
		List<FaqDTO> faqList = new ArrayList<FaqDTO>();
		try {
			String sql = "SELECT f_idx, f_question, f_answer, f_writedate, f_hidden FROM tb_faq ORDER BY f_idx DESC LIMIT " + limit;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				FaqDTO faqDTO = new FaqDTO();
				faqDTO.setfIdx(rs.getInt("f_idx"));
				faqDTO.setfQuestion(rs.getString("f_question"));
				faqDTO.setfAnswer(rs.getString("f_answer"));
				faqDTO.setfWritedate(rs.getDate("f_writedate"));
				faqDTO.setfHidden(rs.getString("f_hidden"));
				faqList.add(faqDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return faqList;
	}
	
	public int faqListSize() {
		int size = 0;
		try {
			String sql = "SELECT COUNT(f_idx) AS total FROM tb_faq";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				size = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			DBConn.close(conn, pstmt, rs);
		}
		return size;
	}
	
	public List<FaqDTO> selectFaqListHiddenNo() {
		List<FaqDTO> faqList = new ArrayList<FaqDTO>();
		try {
			String sql = "SELECT f_idx, f_question, f_answer, f_writedate, f_hidden FROM tb_faq WHERE f_hidden = 'x'";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				FaqDTO faqDTO = new FaqDTO();
				faqDTO.setfIdx(rs.getInt("f_idx"));
				faqDTO.setfQuestion(rs.getString("f_question"));
				faqDTO.setfAnswer(rs.getString("f_answer"));
				faqDTO.setfWritedate(rs.getDate("f_writedate"));
				faqDTO.setfHidden(rs.getString("f_hidden"));
				faqList.add(faqDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			DBConn.close(conn, pstmt, rs);
		}
		return faqList;
	}
}
