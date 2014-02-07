package co.kr.samman.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.samman.dao.BoardDao;
import co.kr.samman.dao.MusicDao;
import co.kr.samman.dao.SettingDao;
import co.kr.samman.dao.VideoDao;
import co.kr.samman.dto.cont;
import co.kr.samman.dto.musict;
import co.kr.samman.dto.usert;

@Controller
public class VideoController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="musicViedo2.user" , method=RequestMethod.GET)
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
	
	//뮤직 비디오 페이지
		@RequestMapping(value="musicViedo.user" , method=RequestMethod.GET)
		public String video(HttpServletRequest request, Model model, int Minfonum) {
			
			
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
			
			
			musict playvideo2 = videoDao.playvideo(Minfonum);
			String playvideo= playvideo2.getMurl();
			model.addAttribute("videoList", videoList);
			model.addAttribute("playvideo", playvideo);
			request.setAttribute("page", page);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			
			
			return "video.videomain";
		}
		
		
		@RequestMapping(value="pagechangeof.user" ,produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String pagechange(HttpServletRequest request,HttpServletResponse response, Model model) throws UnsupportedEncodingException {
		
			
			int page = 1;
			int limit = 6;
			int startrow = ((page-1)*limit);
			VideoDao videoDao = sqlSession.getMapper(VideoDao.class);
			List<musict> videoList = videoDao.getvediolists(startrow, limit);
			int listcount = videoDao.listcount();
			//Ajax 한글처리를위한 추가구문
			request.setCharacterEncoding("UTF-8");
			response.setHeader("Content-Type", "text/html; charest=utf-8");
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (((int)((double)page / 10 + 0.9)) -1)*10 + 1;
			int endpage = /*startpage + 10 - 1*/10;
			if(endpage > maxpage){
				endpage = maxpage;
			}
			model.addAttribute("videoList", videoList);
			//확인 필요
			/*request.setAttribute("page", page);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);*/
			model.addAttribute("listcount", listcount);
			JSONArray data = new JSONArray();
			for(musict b : videoList){
				//Json 객체 생성
				JSONObject obj = new JSONObject();
				obj.put("mtitle",b.getMtitle());
				obj.put("minfonum", b.getMinfonum());
				obj.put("msname", b.getMsname());
				//Json 리스트에 객체를 추가함
				data.add(obj);
			}
			System.out.println(data.toString());
			return data.toString();
		}
		
	
}
