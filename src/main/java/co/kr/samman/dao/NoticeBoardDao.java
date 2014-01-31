package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;


public interface NoticeBoardDao {
	public List<board> noticeBoardList( int firstnum,int lastnum);
	public List<cont> noticereplyList();
	public void writenotice(board bor);
	public board getNoticedetail(int boardid);
	public void noticeupdate(board board);
	public void noticeudelete(int boardid);
}
