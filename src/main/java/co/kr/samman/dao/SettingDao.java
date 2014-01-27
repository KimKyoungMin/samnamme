package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.concert;
import co.kr.samman.dto.musict_adtable;
import co.kr.samman.dto.usert;

public interface SettingDao {
	public List<usert> userlists(); //회원 List
	public void musicInsert(musict_adtable ma); //음악 insert
	public void concertInsert(concert con);
}
