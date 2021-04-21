package com.zimcarry.reservation;

import java.util.Date;

public class ReservationDTO {
	private long bIdx;
	private String bName;		
	private String bHp;			
	private String bStart; 		
	private String bEnd;		
	private Date bBookingdate;	
	private Date bStartdate;	
	private Date bEnddate;		
	private int bOver26;		
	private int bUnder26;		
	private int bPrice;			
	private int bPoint;			
	private String bIsreview;
	
	public long getbIdx() {
		return bIdx;
	}
	public void setbIdx(long bIdx) {
		this.bIdx = bIdx;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbHp() {
		return bHp;
	}
	public void setbHp(String bHp) {
		this.bHp = bHp;
	}
	public String getbStart() {
		return bStart;
	}
	public void setbStart(String bStart) {
		this.bStart = bStart;
	}
	public String getbEnd() {
		return bEnd;
	}
	public void setbEnd(String bEnd) {
		this.bEnd = bEnd;
	}
	public Date getbBookingdate() {
		return bBookingdate;
	}
	public void setbBookingdate(Date bBookingdate) {
		this.bBookingdate = bBookingdate;
	}
	public Date getbStartdate() {
		return bStartdate;
	}
	public void setbStartdate(Date bStartdate) {
		this.bStartdate = bStartdate;
	}
	public Date getbEnddate() {
		return bEnddate;
	}
	public void setbEnddate(Date bEnddate) {
		this.bEnddate = bEnddate;
	}
	public int getbOver26() {
		return bOver26;
	}
	public void setbOver26(int bOver26) {
		this.bOver26 = bOver26;
	}
	public int getbUnder26() {
		return bUnder26;
	}
	public void setbUnder26(int bUnder26) {
		this.bUnder26 = bUnder26;
	}
	public int getbPrice() {
		return bPrice;
	}
	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}
	public int getbPoint() {
		return bPoint;
	}
	public void setbPoint(int bPoint) {
		this.bPoint = bPoint;
	}
	public String getbIsreview() {
		return bIsreview;
	}
	public void setbIsreview(String bIsreview) {
		this.bIsreview = bIsreview;
	}
	@Override
	public String toString() {
		return "reser_DTO [bIdx=" + bIdx + ", bName=" + bName + ", bHp=" + bHp + ", bStart=" + bStart + ", bEnd=" + bEnd
				+ ", bBookingdate=" + bBookingdate + ", bStartdate=" + bStartdate + ", bEnddate=" + bEnddate
				+ ", bOver26=" + bOver26 + ", bUnder26=" + bUnder26 + ", bPrice=" + bPrice + ", bPoint=" + bPoint
				+ ", bIsreview=" + bIsreview + "]";
	}
}
