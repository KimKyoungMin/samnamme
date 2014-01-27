package co.kr.samman.controllers;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.samman.dao.MusicDao;
import co.kr.samman.dto.musict;

@Controller
public class MusicController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//음악  목록 페이지
		@RequestMapping("musicmain.user")
		public String music(Model model) {
			MusicDao musicDao = sqlSession.getMapper(MusicDao.class);
			
			List<musict> musicList = musicDao.getMusiclists();
			model.addAttribute("musicList", musicList);
			
			return "music.musicmain";
		}

}
