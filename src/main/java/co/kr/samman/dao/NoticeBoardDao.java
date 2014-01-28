package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;


public interface NoticeBoardDao {
	public List<board> noticeBoardList();
	public List<cont> noticereplyList();
}
