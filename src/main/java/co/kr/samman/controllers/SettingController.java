package co.kr.samman.controllers;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.SettingDao;
import co.kr.samman.dto.usert;

@Controller
public class SettingController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//관리자 관리
		@RequestMapping("ausers.htm")
		public String users(Model model) {
			SettingDao settingDao = sqlSession.getMapper(SettingDao.class);
			List<usert> userList = settingDao.userlists();
			model.addAttribute("userList", userList);
			
			return "setting.ausers";
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
