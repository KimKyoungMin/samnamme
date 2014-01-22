package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MenuController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("main.htm")
	public String home(Model model) {
		
		/* 실행 가능한 예제였음
		//UserDao userdao = sqlSession.getMapper(UserDao.class);
		//User user = userdao.getUser();
	    //System.out.println("userid : "+user.getUserid() +"   username"+user.getUname());
		//model.addAttribute("user", user);
		 */
		 
		return "main.main";
	}
	
	//로그인
	@RequestMapping(value="login.htm", method=RequestMethod.GET)
	public String login(){
		
		return "login.loginForm";
	}
	
	@RequestMapping(value="login.htm", method=RequestMethod.POST)
	public String loginCheck(){
		
		return "redirect:main.htm";
	}
	
	//회원가입
	@RequestMapping(value="join.htm", method=RequestMethod.GET)
	public String join(){
		
		return "login.joinForm";
	}
	
	@RequestMapping(value="join.htm", method=RequestMethod.POST)
	public String joinCheck(){
		
		return "redirect:main.htm";
	}
	
	//음악  목록 페이지
	@RequestMapping("music.htm")
	public String music() {
		
		return "music.music";
	}
	
	//뮤직 비디오 페이지
	@RequestMapping("musicViedo.htm")
	public String video() {
		
		return "video.video";
	}
	
	//콘서트 정보 페이지
	@RequestMapping("concert.htm")
	public String conertdetail() {
		
		return "concert.concert";
	}
	
	//공지사항 게시판
	@RequestMapping("notice.htm")
	public String free() {
		
		return "board.notice";
	}
	
	//관리자가 공지사항 글쓰기
	@RequestMapping(value="noticeReg.htm", method=RequestMethod.GET)
	public String noticeform(){
		
		return "board.noticeForm";
	}
	
	@RequestMapping(value="noticeReg.htm", method=RequestMethod.POST)
	public String noticeReg(){
		
		return "redirect:notice.htm";
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
	
	//회원 정보 페이지
	@RequestMapping(value = "account.htm", method = RequestMethod.GET)
	public String account() {
		return "account.userAccount";
	}
	
	//관리자 관리
	@RequestMapping("ausers.htm")
	public String setting() {
		
		return "setting.ausers";
	}
	
	@RequestMapping("")
	public String userDetail(){
		
		return "setting.audetail";
	}
	
	@RequestMapping(value="amusicform.htm", method=RequestMethod.GET)
	public String musicform(){
		
		return "setting.amusicform";
	}
	
	@RequestMapping(value="amusicform.htm", method=RequestMethod.POST)
	public String musicInsert(){
		
		return "redirect:music.htm";
	}
	
	@RequestMapping(value="acform.htm", method=RequestMethod.GET)
	public String concertform(){
		
		return "setting.acform";
	}
	
	@RequestMapping(value="acform.htm", method=RequestMethod.POST)
	public String concertInsert(){
		
		return "redirect:concert.htm";
	}
	
	
	
	
	
	
}
