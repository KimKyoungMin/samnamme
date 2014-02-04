package co.kr.samman.dto;

public class mdlist {

	private String userid;
	private int minfonum;
	private int mdownnum;
	
	//join 때문에 추가
	private String mtitle;
	private String msname;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMinfonum() {
		return minfonum;
	}
	public void setMinfonum(int minfonum) {
		this.minfonum = minfonum;
	}
	public int getMdownnum() {
		return mdownnum;
	}
	public void setMdownnum(int mdownnum) {
		this.mdownnum = mdownnum;
	}
	
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMsname() {
		return msname;
	}
	public void setMsname(String msname) {
		this.msname = msname;
	}
	
	
}
