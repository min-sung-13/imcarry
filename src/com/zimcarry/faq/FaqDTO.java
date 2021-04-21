package com.zimcarry.faq;

import java.util.Date;

public class FaqDTO {
	private int fIdx;
	private String fQuestion;
	private String fAnswer;
	private Date fWritedate;
	private String fHidden;
	
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	public String getfQuestion() {
		return fQuestion;
	}
	public void setfQuestion(String fQuestion) {
		this.fQuestion = fQuestion;
	}
	public String getfAnswer() {
		return fAnswer;
	}
	public void setfAnswer(String fAnswer) {
		this.fAnswer = fAnswer;
	}
	public Date getfWritedate() {
		return fWritedate;
	}
	public void setfWritedate(Date fWritedate) {
		this.fWritedate = fWritedate;
	}
	public String getfHidden() {
		return fHidden;
	}
	public void setfHidden(String fHidden) {
		this.fHidden = fHidden;
	}
	@Override
	public String toString() {
		return "FaqDTO [ fIdx : " + fIdx + ", fQuestion : " + fQuestion + ", fAnswer : " + fAnswer + ", fWritedate : " + fWritedate + ", fHidden : " + fHidden + " ]";
	}
}