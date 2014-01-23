package co.kr.samman.dto;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class musict {

	private int minfonum;
	private String mtitle;
	private String aid;
	private String mfilename;
	private String murl;
	private String mpicname;
	private String msname;
	private String mgrade;
	private String metcinfo;
	
	private ArrayList<MultipartFile> files;
	
	public ArrayList<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(ArrayList<MultipartFile> files) {
		this.files = files;
	}
	
	
	public int getMinfonum() {
		return minfonum;
	}
	public void setMinfonum(int minfonum) {
		this.minfonum = minfonum;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getMfilename() {
		return mfilename;
	}
	public void setMfilename(String mfilename) {
		this.mfilename = mfilename;
	}
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
	public String getMpicname() {
		return mpicname;
	}
	public void setMpicname(String mpicname) {
		this.mpicname = mpicname;
	}
	public String getMsname() {
		return msname;
	}
	public void setMsname(String msname) {
		this.msname = msname;
	}
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	public String getMetcinfo() {
		return metcinfo;
	}
	public void setMetcinfo(String metcinfo) {
		this.metcinfo = metcinfo;
	}
	
	
}
