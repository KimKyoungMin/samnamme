package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.concert;
import co.kr.samman.dto.musict_adtable;
import co.kr.samman.dto.usert;

public interface SettingDao {
	public List<usert> userlists(); //회원 List
	public void musicInsert(musict_adtable ma); //음악 insert
	public void concertInsert(concert con); //공연 insert
	public void getConcertdelete(int id); //공연 delete
	public void musicUpdatenoFile(musict_adtable ma);
	public void musicUpdatenoFileOne(musict_adtable ma);
	public void musicUpdatenoFileTwo(musict_adtable ma);
	public void musicUpdatenoFileAll(musict_adtable ma);
}
