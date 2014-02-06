package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.musict;
import co.kr.samman.dto.mymusict;

public interface MusicDao {
	public List<musict> getMusiclists(); //음악 리스트 
	public musict musicselect(int minfonum); //음악 하나 select
	public void myplayerlist(mymusict m); //myplayerlist (DB에)추가
	public int myplayerlistCk(String userid, int minfonum); //myplayerlist (DB에)추가 할 때 값 비교
	public List<mymusict> getmylist(String userid); //mylist select 
	public void mydownlist(String userid, int minfonum); //mdlist (DB)추가
	public void musicDel(int minfonum); //음악 삭제
	public void mylistDel(int minfonum); //마이리스트 삭제

}
