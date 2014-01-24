package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//공지사항 게시판
	@RequestMapping("notice.htm")
	public String free() {
		
		return "board.notice";
	}
	
	//관리자가 공지사항 글쓰기
	@RequestMapping(value="noticewrite.htm", method=RequestMethod.GET)
	public String noticeform(){
		
		return "board.noticewrite";
	}
	
	@RequestMapping(value="noticewrite.htm", method=RequestMethod.POST)
	public String noticeReg(){
		
		return "redirect:notice.htm";
	}
	
	//공지사항 상세 보기
	@RequestMapping(value="noticedetail.htm", method=RequestMethod.GET)
	public String noticedetail(){
		
		return "board.noticedetail";
	}
	
	
	//자유 게시판
	@RequestMapping("community.htm")
	public String notice() {	
		return "board.community";
	}
	
	//회원이 게시판에 글쓰기
	@RequestMapping(value="communityReg.htm", method=RequestMethod.GET)
	public String communityForm(){
		return "board.communityForm";
	}
	
	@RequestMapping(value="communityReg.htm", method=RequestMethod.POST)
	public String communityReg(){
		return "redirect:community.htm";
	}
	

}
