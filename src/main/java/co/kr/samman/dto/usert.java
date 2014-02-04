package co.kr.samman.dto;

import java.util.Date;

public class usert {

	private String userid;
	private String upwd;
	private String uname;
	private String utel;
	private String uemail;
	private Date ujoindate;
	private String uexpdate;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public Date getUjoindate() {
		return ujoindate;
	}
	public void setUjoindate(Date ujoindate) {
		this.ujoindate = ujoindate;
	}
	public String getUexpdate() {
		return uexpdate;
	}
	public void setUexpdate(String uexpdate) {
		this.uexpdate = uexpdate;
	}
	
	
}
