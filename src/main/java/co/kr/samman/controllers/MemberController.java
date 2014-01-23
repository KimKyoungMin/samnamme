package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.MemberDao;
import co.kr.samman.dto.usert;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("main.htm")
	public String home(Model model) {
		return "main.main";
	}
	
	//로그인
	@RequestMapping(value="login.htm", method=RequestMethod.GET)
	public String login(){
		return "login.loginForm";
	}
	
	@RequestMapping(value="login.htm", method=RequestMethod.POST)
	public String loginCheck(String userid, String upwd){
		/*MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.loginCk(userid);*/
		
		
		
		return "redirect:main.htm";
	}
	
	//회원가입
	@RequestMapping(value="join.htm", method=RequestMethod.GET)
	public String join(){
		return "login.joinForm";
	}
	
	@RequestMapping(value="join.htm", method=RequestMethod.POST)
	public String joinCheck(usert u){
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.userInsert(u);
		
		return "redirect:main.htm";
	}

}
