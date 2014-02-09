package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;

public interface CommunityBoardDao {

	List<board> communityBoardList(int firstnum, int lastnum);

	int communityreplygetcount(int bnum);

	List<cont> communityreplyList();

}
