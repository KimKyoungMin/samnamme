package co.kr.samman.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.samman.dao.BoardDao;
import co.kr.samman.dao.MusicDao;
import co.kr.samman.dao.VideoDao;
import co.kr.samman.dto.musict;

@Controller
public class VideoController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//뮤직 비디오 페이지
		@RequestMapping("musicViedo.user")
		public String video(HttpServletRequest request, Model model) {
		
			int page = 1;
			int limit = 6;
			if(request.getParameter("page") != null){
				page = Integer.parseInt(request.getParameter("page"));
			}
			int startrow = ((page-1)*limit);
			
			VideoDao videoDao = sqlSession.getMapper(VideoDao.class);
			List<musict> videoList = videoDao.getvediolists(startrow, limit);
			int listcount = videoDao.listcount();
			
			
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (((int)((double)page / 10 + 0.9)) -1)*10 + 1;
			int endpage = startpage + 10 - 1;
			if(endpage > maxpage){
				endpage = maxpage;
			}
			
			
			model.addAttribute("videoList", videoList);
			request.setAttribute("page", page);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			
			
			return "video.videomain";
		}
		
	
}
