package com.zimcarry.hotel;

public class HotelDTO {
	private long hIdx;
	private String hFile;
	private String hName;
	private String hAddress;
	private String hMap;
	private String hDiscount;
	private String hPartner;
	
	public long gethIdx() {
		return hIdx;
	}
	public void sethIdx(long hIdx) {
		this.hIdx = hIdx;
	}
	public String gethFile() {
		return hFile;
	}
	public void sethFile(String hFile) {
		this.hFile = hFile;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String gethAddress() {
		return hAddress;
	}
	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}
	public String gethMap() {
		return hMap;
	}
	public void sethMap(String hMap) {
		this.hMap = hMap;
	}
	public String gethDiscount() {
		return hDiscount;
	}
	public void sethDiscount(String hDiscount) {
		this.hDiscount = hDiscount;
	}
	public String gethPartner() {
		return hPartner;
	}
	public void sethPartner(String hPartner) {
		this.hPartner = hPartner;
	}
	@Override
	public String toString() {
		return  hIdx + "|" + hFile + "|" + hName + "|" + hAddress + "|" + hMap + "|" + hDiscount + "|" + hPartner;
	}
}

