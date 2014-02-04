package co.kr.samman.dto;

import java.util.Date;

public class payt {
	private int paynum;
	private String userid;
	private int paymoney;
	private String paydate;
	private int paysubcode;
	
	//join 때문에 추가
	private String payname;

	public int getPaynum() {
		return paynum;
	}

	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPaymoney() {
		return paymoney;
	}

	public void setPaymoney(int paymoney) {
		this.paymoney = paymoney;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
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
	
	

}
