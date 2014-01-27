package co.kr.samman.controllers;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.ConcertDao;
import co.kr.samman.dao.SettingDao;
import co.kr.samman.dto.concert;

@Controller
public class ConcertController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//콘서트 정보 페이지
	@RequestMapping("concertmain.user")
	public String concert(Model model) {
//		System.out.println("인터페이스의 구현을   Mapper가담당 : notices");
//		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
//		
//		///////////////////////////////////////////////////////////////			
//		model.addAttribute("user",noticeDao.getUser());
		//System.out.println("ConcertController.concert()");
		ConcertDao concertdao = sqlSession.getMapper(ConcertDao.class);
//		System.out.println("ConcertController.concert() get Mapper");
		model.addAttribute("concertlist",concertdao.getConcertList());
//		System.out.println("ConcertController.concert() set Attribute");
		return "concert.concertmain";
	}
	
	@RequestMapping("concertdetail.user")
	public String concertdetail(HttpServletRequest req, Model model){
		int id = Integer.parseInt(req.getParameter("connum"));
		//System.out.println("ConcertController. concertdetail()"+id);
		ConcertDao concertdao = sqlSession.getMapper(ConcertDao.class);
		model.addAttribute("concertDetail", concertdao.getConcertdetail(id));
		return "concert.concertdetail";
	}
	@RequestMapping(value="concertupdate.admin", method=RequestMethod.GET)
	public String concertupdateform(HttpServletRequest req, Model model){
		int id = Integer.parseInt(req.getParameter("connum"));
		ConcertDao concertdao = sqlSession.getMapper(ConcertDao.class);
		model.addAttribute("concertDetail", concertdao.getConcertdetail(id));
		return "concert.concertUpdate";
	}
	
	@RequestMapping(value="concertupdate.admin", method=RequestMethod.POST)
	public String concertupdate(concert con, HttpServletRequest req, Model model) throws IOException{
		con.setConpic(con.getFiles().getOriginalFilename());
		String path = req.getRealPath("/concertpic/"+con.getConpic());
		
		if(!con.getConpic().equals("")){
	    	FileOutputStream fs = new FileOutputStream(path);
	    	fs.write(con.getFiles().getBytes());
	    	fs.close();
	    }
		if(con.getStarttime().length()==5)
			con.setCondate(con.getStartday() + " " + con.getStarttime()+":00");
		else con.setCondate(con.getStartday() + " " + con.getStarttime());
		if(con.getEndtime().length()==5)
			con.setConenddate(con.getStartday() + " " + con.getEndtime()+":00");
		else con.setConenddate(con.getStartday() + " " + con.getEndtime());
		
//		System.out.println(con.getCondate());
//		System.out.println(con.getConenddate());
		
		ConcertDao settingDao = sqlSession.getMapper(ConcertDao.class);
		settingDao.concertupdate(con);
		
		return "redirect:concertmain.user";
	}
	
}
