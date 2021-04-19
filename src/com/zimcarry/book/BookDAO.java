package com.zimcarry.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;

import com.zimcarry.db.DBConn;

public class BookDAO {
	Date today;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	@SuppressWarnings("unchecked")
	public String checkBook(String bHp, String reBookidx) {
		JSONObject jobj = new JSONObject();
		jobj.put("isData", "no");
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_idx = ? AND b_hp = ? ORDER BY b_idx DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reBookidx);
			pstmt.setString(2, bHp);
			rs = pstmt.executeQuery();
			today = new Date();
			format.format(today);
			if (rs.next()) {
				if (rs.getDate("b_enddate").before(today)) { //찾는 일정이 오늘보다 과거일 경우 true  -> 예약 후 서비스 이용이 종료되었다는 뜻
					jobj.clear();
					jobj.put("isData", "yes");
					jobj.put("bIdx", rs.getString("b_idx"));
					jobj.put("bName", rs.getString("b_name"));
					jobj.put("bHp", rs.getString("b_hp"));
					jobj.put("bStart", rs.getString("b_start"));
					jobj.put("bEnd", rs.getString("b_end"));
					jobj.put("bStartdate", rs.getString("b_startdate"));
					jobj.put("bEnddate", rs.getString("b_enddate"));
					jobj.put("bIsreview", rs.getString("b_isreview"));
					return jobj.toString();
				} else {
					jobj.clear();
					jobj.put("isData", "no");
					return jobj.toString();
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return jobj.toString();
	}
	
	public BookDTO selectBookSimpleInfo(String bIdx, String bHp) {
		BookDTO bookDTO = null;
		try {
			String sql = "SELECT b_idx, b_name, b_start, b_end, b_bookingdate, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_idx = ? AND b_hp = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bIdx);
			pstmt.setString(2, bHp);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbBookingdate(rs.getDate("b_bookingdate"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				return bookDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookDTO; //null
	}
	
	public BookDTO selectBookWhereIdx(String bIdx) {
		BookDTO bookDTO = null;
		try {
			String sql = "SELECT b_idx, b_name, b_start, b_end, b_bookingdate, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_idx = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bIdx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbBookingdate(rs.getDate("b_bookingdate"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				return bookDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookDTO;
	}
	
	public List<BookDTO> selectBookList() {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDTO bookDTO = null;
		try {
			String sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book ORDER BY b_idx DESC";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbHp(rs.getString("b_hp"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				bookList.add(bookDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookList;
	}
	
	public List<BookDTO> selectBookList(String limit) {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDTO bookDTO = null;
		try {
			String sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book ORDER BY b_idx DESC LIMIT " + limit;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbHp(rs.getString("b_hp"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				bookList.add(bookDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookList;
	}
	
	public List<BookDTO> selectBookList(String limit, String keyword) {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDTO bookDTO = null;
		try {
			String sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_hp LIKE ? ORDER BY b_idx DESC LIMIT " + limit;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbHp(rs.getString("b_hp"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				bookList.add(bookDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookList;
	}
	
	/**
	 * 과거의 예약(서비스를 이용한)일 경우 true <br />
	 * 미래의 예약(서비스 이용 전)일 경우 false를 paramter로 전달 
	 * @param limit
	 * @param isPast
	 * @return bookList (ArrayList)
	 */
	public List<BookDTO> selectBookList(String limit, boolean isPast) {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDTO bookDTO = null;
		String sql = "";
		
		if (isPast) { //과거 예약
			sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_enddate < NOW() ORDER BY b_idx DESC LIMIT " + limit;
		} else { //미래 예약
			sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_enddate > NOW() ORDER BY b_idx DESC LIMIT " + limit;
		}
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbHp(rs.getString("b_hp"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				bookList.add(bookDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookList;
	}
	
	public List<BookDTO> selectBookList(String limit, boolean isPast, String keyword) {
		List<BookDTO> bookList = new ArrayList<BookDTO>();
		BookDTO bookDTO = null;
		String sql = "";
		
		if (isPast) { //과거 예약
			sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_enddate < NOW() AND b_hp LIKE ? ORDER BY b_idx DESC LIMIT " + limit;
		} else { //미래 예약
			sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_isreview FROM tb_book WHERE b_enddate > NOW() AND b_hp LIKE ? ORDER BY b_idx DESC LIMIT " + limit;
		}
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bookDTO = new BookDTO();
				bookDTO.setbIdx(rs.getLong("b_idx"));
				bookDTO.setbName(rs.getString("b_name"));
				bookDTO.setbHp(rs.getString("b_hp"));
				bookDTO.setbStart(rs.getString("b_start"));
				bookDTO.setbEnd(rs.getString("b_end"));
				bookDTO.setbStartdate(rs.getDate("b_startdate"));
				bookDTO.setbEnddate(rs.getDate("b_enddate"));
				bookDTO.setbIsreview(rs.getString("b_isreview"));
				bookList.add(bookDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return bookList;
	}
	
	public boolean deleteBook(BookDTO bookDTO) {
		try {
			String sql = "DELETE FROM tb_book WHERE b_idx = ? AND b_name = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bookDTO.getbIdx());
			pstmt.setString(2, bookDTO.getbName());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
	
	public int bookListSize() {
		int size = 0;
		try {
			String sql = "SELECT COUNT(b_idx) AS size FROM tb_book";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				size = rs.getInt("size");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return size;
	}
	
	public int bookListSize(boolean isPast) {
		int size = 0;
		try {
			String sql = "";
			if (isPast) { //과거 예약
				sql = "SELECT COUNT(b_idx) AS size FROM tb_book WHERE b_enddate < NOW()";
			} else { //미래 예약
				sql = "SELECT COUNT(b_idx) AS size FROM tb_book WHERE b_enddate > NOW()";
			}
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				size = rs.getInt("size");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return size;
	}
}