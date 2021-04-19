package com.zimcarry.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.zimcarry.db.DBConn;

public class ReservationDAO {
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
//	public ReservationDAO() {}
	
	public boolean insertBoard(ReservationDTO r_DTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			String sql = "INSERT INTO tb_book(b_name, b_hp, b_start, b_end, b_startdate, b_enddate, b_over26, b_under26, b_price) "
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_DTO.getbName());
			pstmt.setString(2, r_DTO.getbHp());
			pstmt.setString(3, r_DTO.getbStart());
			pstmt.setString(4, r_DTO.getbEnd());
			pstmt.setString(5, format.format(r_DTO.getbStartdate()));
			pstmt.setString(6, format.format(r_DTO.getbEnddate()));
			pstmt.setInt(7, r_DTO.getbOver26());
			pstmt.setInt(8, r_DTO.getbUnder26());
			pstmt.setInt(9, r_DTO.getbPrice());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("예약 성공");
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return false;
	}
	
	public List<ReservationDTO> selectJoin(String name, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ReservationDTO> boardList = new ArrayList<ReservationDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT b_idx, b_name, b_hp, b_start, b_end, b_bookingdate, b_startdate, b_enddate, b_over26, b_under26, b_price FROM tb_book WHERE b_name=? AND b_hp=? AND b_enddate >= CURDATE();";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReservationDTO res_DTO = new ReservationDTO();
				
				res_DTO.setbIdx(rs.getLong("b_idx"));
				res_DTO.setbName(rs.getString("b_name"));
				res_DTO.setbHp(rs.getString("b_hp"));
				res_DTO.setbStart(rs.getString("b_start"));
				res_DTO.setbEnd(rs.getString("b_end"));
				res_DTO.setbBookingdate(rs.getDate("b_bookingdate"));
				res_DTO.setbStartdate(rs.getDate("b_startdate"));
				res_DTO.setbEnddate(rs.getDate("b_enddate"));
				res_DTO.setbOver26(rs.getInt("b_over26"));
				res_DTO.setbUnder26(rs.getInt("b_under26"));
				res_DTO.setbPrice(rs.getInt("b_price"));
				boardList.add(res_DTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return boardList;
	}
}
