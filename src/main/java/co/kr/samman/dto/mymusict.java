package co.kr.samman.dto;

public class mymusict {

	private String userid;
	private int minfonum;
	private int myordernum;
	
	//join 때문에 추가
	private String mtitle;
	private String msname;
	private String mfilename;
	private String mpicname;
	
	
	public String getMpicname() {
		return mpicname;
	}
	public void setMpicname(String mpicname) {
		this.mpicname = mpicname;
	}
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
	public int getMyordernum() {
		return myordernum;
	}
	public void setMyordernum(int myordernum) {
		this.myordernum = myordernum;
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
	public String getMfilename() {
		return mfilename;
	}
	public void setMfilename(String mfilename) {
		this.mfilename = mfilename;
	}
	
	
}
