package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.musict;

public interface MusicDao {
	public List<musict> getMusiclists();
	public void myplayerlist(String minfonum); //myplayerlist 추가

}
