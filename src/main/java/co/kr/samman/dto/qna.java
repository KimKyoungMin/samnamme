package co.kr.samman.dto;

import java.util.Date;

public class qna {
	

	private int qnum;
	private String userid;
	private String qtitle;
	private String qcontent;
	private String qdate;
	private int qstep;  
	private int qdepth;
	private int qrenum;
	private int qcount;
	
	
	public int getQstep() {
		return qstep;
	}
	public void setQstep(int qstep) {
		this.qstep = qstep;
	}
	public int getQdepth() {
		return qdepth;
	}
	public void setQdepth(int qdepth) {
		this.qdepth = qdepth;
	}
	public int getQrenum() {
		return qrenum;
	}
	public void setQrenum(int qrenum) {
		this.qrenum = qrenum;
	}
	public int getQcount() {
		return qcount;
	}
	public void setQcount(int qcount) {
		this.qcount = qcount;
	}
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
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
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
