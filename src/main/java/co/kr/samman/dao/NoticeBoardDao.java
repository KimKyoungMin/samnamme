package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;


public interface NoticeBoardDao {
	public List<board> noticeBoardList();
	public List<cont> noticereplyList();
	public void writenotice(board bor);
	public board getConcertdetail(int boardid);
	public void concertupdate(board board);
}
