package com.zimcarry.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.zimcarry.db.DBConn;

public class ReviewDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public List<ReviewDTO> selectAll(String limit) {

		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
	
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT re_idx, re_score, re_title, re_content, re_writedate, re_bookidx, re_hidden FROM tb_review ORDER BY re_idx DESC LIMIT " + limit;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setReIdx(rs.getLong("re_idx"));
				reviewDTO.setReScore(rs.getDouble("re_score"));
				reviewDTO.setReTitle(rs.getString("re_title"));
				reviewDTO.setReContent(rs.getString("re_content"));
				reviewDTO.setReWritedate(rs.getDate("re_writedate"));
				reviewDTO.setReBookidx(rs.getLong("re_bookidx"));
				reviewDTO.setReHidden(rs.getString("re_hidden"));
				reviewList.add(reviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return reviewList;
	}
	public boolean insertReview(ReviewDTO reviewDTO) {
		try {
			String sql = "INSERT INTO tb_review(re_score, re_title, re_content, re_bookidx) VALUES(?, ?, ?, ?)";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, reviewDTO.getReScore());
			pstmt.setString(2, reviewDTO.getReTitle());
			pstmt.setString(3, reviewDTO.getReContent().trim());
			pstmt.setLong(4, reviewDTO.getReBookidx());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				sql = "UPDATE tb_book SET b_isreview = ? WHERE b_idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "o");
				pstmt.setLong(2, reviewDTO.getReBookidx());
				result = pstmt.executeUpdate();
				if (result > 0) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
	public List<ReviewDTO> selectReviewList(String limit) {

		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT re_idx, re_score, re_title, re_content, re_writedate, re_bookidx, re_hidden FROM tb_review WHERE re_hidden = 'x' ORDER BY re_idx DESC LIMIT " + limit;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setReIdx(rs.getLong("re_idx"));
				reviewDTO.setReScore(rs.getDouble("re_score"));
				reviewDTO.setReTitle(rs.getString("re_title"));
				reviewDTO.setReContent(rs.getString("re_content"));
				reviewDTO.setReWritedate(rs.getDate("re_writedate"));
				reviewDTO.setReBookidx(rs.getLong("re_bookidx"));
				reviewDTO.setReHidden(rs.getString("re_hidden"));
				reviewList.add(reviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return reviewList;
	}
	
	public int reviewListSize() {
		int size = 0;
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT COUNT(re_idx) AS total FROM tb_review WHERE re_hidden = 'x'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				size = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		if (size == 0) {
			size = 1;
		}
		return size;
	}
	public ReviewDTO reviewDetail(String re_idx) {
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT re_idx, re_score, re_title, re_content, re_writedate, re_bookidx, re_hidden FROM tb_review WHERE re_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, re_idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setReIdx(rs.getLong("re_idx"));
				reviewDTO.setReScore(rs.getDouble("re_score"));
				reviewDTO.setReTitle(rs.getString("re_title"));
				reviewDTO.setReContent(rs.getString("re_content"));
				reviewDTO.setReWritedate(rs.getDate("re_writedate"));
				reviewDTO.setReBookidx(rs.getLong("re_bookidx"));
				reviewDTO.setReHidden(rs.getString("re_hidden"));
				return reviewDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int review_show(String re_hidden, String re_idx) {
		try {
			conn = DBConn.getConnection();
			String sql = "UPDATE tb_review SET re_hidden=? WHERE re_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, re_hidden);
			pstmt.setString(2, re_idx);
			int result = pstmt.executeUpdate();
			if(result >= 1) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public String reviewAverage() {
		double avg = 0.0;
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT AVG(re_score) AS average FROM tb_review";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				avg = rs.getDouble("average");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		
		return String.format("%.2f", avg);
	}
	
}