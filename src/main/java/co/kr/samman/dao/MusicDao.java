package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.musict;
import co.kr.samman.dto.mymusict;

public interface MusicDao {
	public List<musict> getMusiclists(); //음악 리스트 
	public void myplayerlist(mymusict m); //myplayerlist (DB에)추가
	public List<mymusict> getmylist(String userid); //mylist
	public void mydownlist(String userid, int minfonum); //mdlist (DB)추가
	public void musicDel(int minfonum); //음악 삭제

}
