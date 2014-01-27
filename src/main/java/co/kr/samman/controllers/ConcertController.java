package co.kr.samman.controllers;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.ConcertDao;

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
	
}
