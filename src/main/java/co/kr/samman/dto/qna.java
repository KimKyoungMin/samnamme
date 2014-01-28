package co.kr.samman.dto;

import java.util.Date;

public class qna {
	

	private int qnum;
	private String userid;
	private String qtitle;
	private String qcontent;
	private Date qdate;
	private int qstep;  
	private int qdepth;
	
	
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public int getStep() {
		return qstep;
	}
	public void setStep(int step) {
		this.qstep = step;
	}
	public int getDepth() {
		return qdepth;
	}
	public void setDepth(int depth) {
		this.qdepth = depth;
	}
	
	
}
