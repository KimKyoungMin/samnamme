package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.musict;
import co.kr.samman.dto.musict_adtable;
import co.kr.samman.dto.qna;
import co.kr.samman.dto.usert;

public interface SettingDao {
	public List<usert> userlists(); //회원 List
	public void musicInsert(musict_adtable ma); //음악 insert
	public List<qna> qnalists();

}
