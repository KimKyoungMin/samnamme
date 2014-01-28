package co.kr.samman.controllers;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.BoardDao;
import co.kr.samman.dto.qna;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//자유 게시판
	@RequestMapping("community.user")
	public String notice() {	
		return "board.community";
	}
	
	//회원이 게시판에 글쓰기
	@RequestMapping(value="communityReg.htm", method=RequestMethod.GET)
	public String communityForm(){
		return "board.communityForm";
	}
	
	@RequestMapping(value="communityReg.htm", method=RequestMethod.POST)
	public String communityReg(){
		return "redirect:community.user";
	}
	
	//qna 게시판
		@RequestMapping("qna.user")
		public String qna(HttpServletRequest request, Model model) {

			int page = 1;
			int limit = 15;
			
			if(request.getParameter("page") != null){
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			//다른거 가지고와 spring 방식이 아님
		/*	int listcount = boarddao.getListCount();
			boardlist = boarddao.getBoardList(page, limit); //sql session
			
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (((int)((double)page / 10 + 0.9)) -1)*10 + 1;
			int endpage = startpage + 10 - 1;
			if(endpage > maxpage){
				endpage = maxpage;
			}
			
			request.setAttribute("page", page);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("listcount", listcount);
			request.setAttribute("boardlist", boardlist);
			
			
			*/
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			int listcount = BoardDao.listcount();
			System.out.println("큐넘!"+listcount);
			List<qna> qnaList = BoardDao.qnalists();
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("getqnum",listcount);
			return "board.qna";
		}
		
		//qna detail 게시판
		@RequestMapping("qnaDetail.user")
		public String qnaDetail(String qnum, Model model) {
			
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			qna qnaDetail = BoardDao.qnaDetail(qnum);
			model.addAttribute("qnaDetail", qnaDetail);
			return "board.qnaDetail";
		}
		
		//qnaWrite 게시판
		@RequestMapping(value= "qnaWrite.user" , method=RequestMethod.GET)
		public String qnaWritemenu() {	
			return "board.qnaWrite";
		}
		
		@RequestMapping(value= "qnaWrite.user" , method=RequestMethod.POST)
		public String qnaWrite(qna qnadto) {	
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			
			UserDetails user =   
				       (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
			qnadto.setUserid(user.getUsername());
			
			BoardDao.qnaWrite(qnadto);
			return "redirect:qna.user";
		}
		
	    //qna 글 삭제
		@RequestMapping(value="qnaDelete.user", method=RequestMethod.POST)
		public String qnaDelete(String qnum) {	
			System.out.println("삭제 포스트");
			System.out.println(qnum);
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			BoardDao.qnaDelete(qnum);
			
			return "redirect:qna.user";
		}

}
