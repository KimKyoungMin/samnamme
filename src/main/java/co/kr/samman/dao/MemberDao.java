package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.notice;
import co.kr.samman.dto.usert;

public interface MemberDao {
	//메인화면에 나타나는 게시글 
	/*public String musictop();*/ //music TOP5 
	
	public void userInsert(usert u); //회원 Insert

	public int usercheck(String userid);

	public List<co.kr.samman.dto.bookmark> getBookmark();
    public notice mainnotice(); //main에 최근 공지사항 글 가져오기

}
