package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.usert;

public interface SettingDao {
	public List<usert> userlists(); //회원 List
	public usert userdetail(); //회원 정보 디테일

}
