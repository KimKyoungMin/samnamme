package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VideoController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//뮤직 비디오 페이지
		@RequestMapping("musicViedo.htm")
		public String video() {
			
			return "video.video";
		}

}
