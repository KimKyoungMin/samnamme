package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.concert;
import co.kr.samman.dto.musict;

public interface ConcertDao {

	public List<concert> getConcertList();
}
