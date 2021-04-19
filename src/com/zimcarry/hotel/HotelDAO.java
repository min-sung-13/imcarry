package com.zimcarry.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zimcarry.db.DBConn;

public class HotelDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public int totCnt() {
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT count(h_idx) as cnt FROM tb_hotel";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public int totCnt(String h_name) {
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT count(h_idx) as cnt FROM tb_hotel WHERE h_name LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+h_name+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public List<HotelDTO> selectHotel(int start, int recNum){
		List<HotelDTO> hotelList = new ArrayList<HotelDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT h_idx, h_name, h_discount, h_partner FROM tb_hotel order by h_idx asc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, recNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HotelDTO hotel = new HotelDTO();
				hotel.sethIdx(rs.getLong("h_idx"));
				hotel.sethName(rs.getString("h_name"));
				hotel.sethDiscount(rs.getString("h_discount"));
				hotel.sethPartner(rs.getString("h_partner"));
				hotelList.add(hotel);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	public List<HotelDTO> selectHotel(String h_name, int start, int recNum){
		List<HotelDTO> hotelList = new ArrayList<HotelDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT h_idx, h_name, h_discount, h_partner FROM tb_hotel WHERE h_name LIKE ? order by h_idx asc limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+h_name+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, recNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HotelDTO hotel = new HotelDTO();
				hotel.sethIdx(rs.getLong("h_idx"));
				hotel.sethName(rs.getString("h_name"));
				hotel.sethDiscount(rs.getString("h_discount"));
				hotel.sethPartner(rs.getString("h_partner"));
				hotelList.add(hotel);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	public int insertHotel(HotelDTO hotelDTO) {
		String sql = "INSERT INTO tb_hotel(h_file, h_name, h_address, h_map, h_discount, h_partner) VALUE(?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotelDTO.gethFile());
			pstmt.setString(2, hotelDTO.gethName());
			pstmt.setString(3, hotelDTO.gethAddress());
			pstmt.setString(4, hotelDTO.gethMap());
			pstmt.setString(5, hotelDTO.gethDiscount());
			pstmt.setString(6, hotelDTO.gethPartner());
			if(pstmt.executeUpdate() != 0) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return 0;
	}
	
	public HotelDTO viewHotel(String h_idx) {
		String sql = "SELECT h_file, h_name, h_address, h_map, h_discount, h_partner FROM tb_hotel WHERE h_idx=?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				HotelDTO hotelDTO = new HotelDTO();
				hotelDTO.sethFile(rs.getString("h_file"));
				hotelDTO.sethName(rs.getString("h_name"));
				hotelDTO.sethAddress(rs.getString("h_address"));
				hotelDTO.sethMap(rs.getString("h_map"));
				hotelDTO.sethDiscount(rs.getString("h_discount"));
				hotelDTO.sethPartner(rs.getString("h_partner"));
				return hotelDTO;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int updateHotel(HotelDTO hotelDTO) {
		String sql = "UPDATE tb_hotel SET h_file=?, h_name=?, h_address=?, h_map=?, h_discount=?, h_partner=? WHERE h_idx=?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotelDTO.gethFile());
			pstmt.setString(2, hotelDTO.gethName());
			pstmt.setString(3, hotelDTO.gethAddress());
			pstmt.setString(4, hotelDTO.gethMap());
			pstmt.setString(5, hotelDTO.gethDiscount());
			pstmt.setString(6, hotelDTO.gethPartner());
			pstmt.setLong(7, hotelDTO.gethIdx());
			if(pstmt.executeUpdate() != 0) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt);
		}
		return 0;
	}
	
	// main page
	public int hotelCnt() {
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT count(h_idx) as cnt FROM tb_hotel WHERE h_partner='O'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public int hotelCnt(String h_name) {
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT count(h_idx) as cnt FROM tb_hotel WHERE h_partner='O' AND h_name LIKE ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+h_name+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public List<HotelDTO> getHotelMain(int start, int recNum){
		List<HotelDTO> hotelList = new ArrayList<HotelDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT h_idx, h_file, h_name, h_address, h_map, h_discount FROM tb_hotel WHERE h_partner='O' order by h_idx asc LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, recNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HotelDTO hotel = new HotelDTO();
				hotel.sethIdx(rs.getLong("h_idx"));
				hotel.sethFile(rs.getString("h_file"));
				hotel.sethName(rs.getString("h_name"));
				hotel.sethAddress(rs.getString("h_address"));
				hotel.sethMap(rs.getString("h_map"));
				hotel.sethDiscount(rs.getString("h_discount"));
				hotelList.add(hotel);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	public List<HotelDTO> getHotelMain(String h_name, int start, int recNum){
		List<HotelDTO> hotelList = new ArrayList<HotelDTO>();
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT h_idx, h_file, h_name, h_address, h_map, h_discount FROM tb_hotel WHERE h_partner='O' AND h_name LIKE ? order by h_idx asc LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+h_name+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, recNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HotelDTO hotel = new HotelDTO();
				hotel.sethIdx(rs.getLong("h_idx"));
				hotel.sethFile(rs.getString("h_file"));
				hotel.sethName(rs.getString("h_name"));
				hotel.sethAddress(rs.getString("h_address"));
				hotel.sethMap(rs.getString("h_map"));
				hotel.sethDiscount(rs.getString("h_discount"));
				hotelList.add(hotel);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(conn, pstmt, rs);
		}
		return hotelList;
	}
	
	
}
