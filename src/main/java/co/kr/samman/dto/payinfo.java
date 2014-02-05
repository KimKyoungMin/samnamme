package co.kr.samman.dto;

public class payinfo {

	private int paysubcode;
	private String payname;
	private int payprice;
	private int paypdate;
	
	private String userid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public int getPaysubcode() {
		return paysubcode;
	}
	public void setPaysubcode(int paysubcode) {
		this.paysubcode = paysubcode;
	}
	public String getPayname() {
		return payname;
	}
	public void setPayname(String payname) {
		this.payname = payname;
	}
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	public int getPaypdate() {
		return paypdate;
	}
	public void setPaypdate(int paypdate) {
		this.paypdate = paypdate;
	}
	
	
}
