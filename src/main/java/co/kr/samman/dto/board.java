package co.kr.samman.dto;

import java.util.Date;

public class board {
	
	private int bnum;
	private String userid;
	private String btitle;
	private String bcontent;
	private String bpicname;
	private Date bdate;
	private int bsub;
	
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBpicname() {
		return bpicname;
	}
	public void setBpicname(String bpicname) {
		this.bpicname = bpicname;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBsub() {
		return bsub;
	}
	public void setBsub(int bsub) {
		this.bsub = bsub;
	}
}
