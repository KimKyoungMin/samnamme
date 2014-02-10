package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.concert;

public interface ConcertDao {

	public List<concert> getConcertList();
	public concert getConcertdetail(int id);
	public concert concertupdate(concert con);
	public void concertupdatenoImage(co.kr.samman.dto.concert con);
}
