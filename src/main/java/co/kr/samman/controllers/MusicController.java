package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MusicController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//음악  목록 페이지
		@RequestMapping("music.htm")
		public String music() {
			
			return "music.music";
		}

}
