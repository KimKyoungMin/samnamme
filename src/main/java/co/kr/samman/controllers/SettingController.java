package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SettingController {
	
	@Autowired
	private SqlSession sqlSession;
	
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
