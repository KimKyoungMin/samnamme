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
	public void noticereplyInsert(String bnum, String userid, String ccontent);
	public List<cont> noticereplyResult(String bnum);
	public void noticereplyDelete(String bnum);
	public int noticereplygetcount(int bnum);
}
