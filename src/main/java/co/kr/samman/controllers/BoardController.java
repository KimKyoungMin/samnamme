package co.kr.samman.controllers;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.SettingDao;
import co.kr.samman.dto.qna;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//공지사항 게시판
	@RequestMapping("notice.user")
	public String free() {
		
		return "board.notice";
	}
	
	//관리자가 공지사항 글쓰기
	@RequestMapping(value="noticewrite.user", method=RequestMethod.GET)
	public String noticeform(){
		
		return "board.noticewrite";
	}
	
	@RequestMapping(value="noticewrite.user", method=RequestMethod.POST)
	public String noticeReg(){
		
		return "redirect:notice.user";
	}
	
	//공지사항 상세 보기
	@RequestMapping(value="noticedetail.user", method=RequestMethod.GET)
	public String noticedetail(){
		
		return "board.noticedetail";
	}
	
	
	@RequestMapping("community.user")
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
		return "redirect:community.user";
	}
	
	//qna 게시판
	@RequestMapping("qna.user")
	public String qna(Model model) {

		SettingDao settingDao = sqlSession.getMapper(SettingDao.class);
		List<qna> qnaList = settingDao.qnalists();
		model.addAttribute("qnaList", qnaList);
		return "board.qna";
	}
	
	//qna detail 게시판
	@RequestMapping("qnaDetail.user")
	public String qnaDetail(Model model) {

		
		return "board.qnaDetail";
	}
	
	
}
