package co.kr.samman.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.samman.dao.MemberDao;
import co.kr.samman.dao.MusicDao;
import co.kr.samman.dto.musict;
import co.kr.samman.dto.usert;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("main.htm")
	public String home(Model model) {
		
		MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
		
		List<musict> musicList = musicDao.getMainMusiclists();
		model.addAttribute("musicList", musicList);
		
		return "main.main";
	}
	
	//로그인
	@RequestMapping(value="login.htm", method=RequestMethod.GET)
	public String login(){
		return "login.loginForm";
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
	@RequestMapping(value="joinIdCheck.htm" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String joincheck(HttpServletRequest req,HttpServletResponse res, Model model, String userId){
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		JSONObject data = new JSONObject();
		int usert = memberDao.usercheck(userId);
		System.out.println("usert count : "+usert+"     userid : "+userId);
		if(usert==0){
			data.put("resultvalue", "가능");
			System.out.println(data.toString());
			return data.toString();
		}else{
			data.put("resultvalue", "중복값 있음");
			System.out.println(data.toString());
			return data.toString();
		}
	}

}
