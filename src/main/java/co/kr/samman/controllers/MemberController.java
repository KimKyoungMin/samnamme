package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
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

}
