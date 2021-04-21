package com.zimcarry.util;

import java.util.Date;

public class Util {

	public String changeScoreString(String score) {
		switch (score) {
		case "0.5":
			return "harf";
		case "1.0":
			return "one";
		case "1.5":
			return "one_half";
		case "2.0":
			return "two";
		case "2.5":
			return "two_half";
		case "3.0":
			return "three";
		case "3.5":
			return "three_half";
		case "4.0":
			return "four";
		case "4.5":
			return "four_half";
		case "5":
			return "five";
		default:
			return "style='display: none;'";
		}
	}
	
	public int[] paging(int listSize, int contentCnt) {
		int contentCount = contentCnt; 
		int pageCount = 0;
		int totalContent = listSize; 
		
		if (totalContent % contentCount != 0) { 
			pageCount = (totalContent / contentCount) + 1; 
		} else {
			pageCount = totalContent / contentCount; 
		}
		if (contentCount > totalContent) {
			return new int[1];
		}
		return new int[pageCount];
	}
	
	public Date getToday() {
		return new Date();
	}
}


