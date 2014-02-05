package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.musict;

public interface VideoDao {

	public List<musict> getvediolists(int page,int limit);
	public int listcount();
}
