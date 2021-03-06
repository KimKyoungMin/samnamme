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
	
	/*//회원이 게시판에 글쓰기
	@RequestMapping(value="communityReg.htm", method=RequestMethod.GET)
	public String communityForm(){
		return "board.communityForm";
	}
	
	@RequestMapping(value="communityReg.htm", method=RequestMethod.POST)
	public String communityReg(){
		return "redirect:community.user";
	}*/
	
	//qna 게시판
		@RequestMapping(value="qna.user",method=RequestMethod.GET)
		public String qna(HttpServletRequest request, Model model) {
			
			int page = 1;
			int limit = 10	;
			 
			
			
			if(request.getParameter("page") != null){
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			
			int listcount = BoardDao.listcount();
			
			
				int startrow = ((page-1)*limit);	
				List<qna> qnaList = BoardDao.qnalists(startrow, limit);
				model.addAttribute("qnaList", qnaList);
			

			
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (((int)((double)page / 10 + 0.9)) -1)*10 + 1;
			int endpage = startpage + 10 - 1;
			if(endpage > maxpage){
				endpage = maxpage;
			}
			System.out.println("====================");
			System.out.println("page"+page);
			System.out.println("max"+maxpage);
			System.out.println("start"+startpage);
			System.out.println("end"+endpage);
			System.out.println("====================");
			
			request.setAttribute("page", page);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			
			model.addAttribute("page", page);
			model.addAttribute("maxpage", maxpage);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			model.addAttribute("listcount",listcount);
			
			
			return "board.qna";
		}
		
		//qna detail 게시판
		@RequestMapping("qnaDetail.user")
		public String qnaDetail(String qnum, Model model) {
			
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			qna qnaDetail = BoardDao.qnaDetail(qnum);
			BoardDao.qnaCount(qnum);
			model.addAttribute("qnaDetail", qnaDetail);
			
			return "board.qnaDetail";
		}
		
		//qnaWrite 게시판
		@RequestMapping(value= "qnaWrite.user" , method=RequestMethod.GET)
		public String qnaWritemenu(Model model) {
			UserDetails user =   
				       (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("userid", user.getUsername());
			
			return "board.qnaWrite";
		}
		
		@RequestMapping(value= "qnaWrite.user" , method=RequestMethod.POST)
		public String qnaWrite(qna qnadto) {	
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			System.out.println("33 : " + qnadto.getQtitle());
			System.out.println("33 : " + qnadto.getQcontent());
			UserDetails user =   
				       (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
			qnadto.setUserid(user.getUsername());
			System.out.println("글넘버"+ qnadto.getQnum());
			
			int qrenum = BoardDao.qnaQnumCount();
			System.out.println("111" + qrenum); 	
			qnadto.setQrenum(qrenum);
			BoardDao.qnaWrite(qnadto);
			return "redirect:qna.user";
		}
		
		//댓글달기
		@RequestMapping(value= "qnaReply.user" , method=RequestMethod.GET)
		public String qnaReply(String qnum, Model model) {
			
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			qna qnaReply = BoardDao.qnaDetail(qnum);
			System.out.println(qnum);
			model.addAttribute("qnaReply", qnaReply);
			return "board.qnaReply";
		}
		
		@RequestMapping(value= "qnaReply.user" , method=RequestMethod.POST)
		public String qnaReply2(qna qnadto) {	
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			UserDetails user =   
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BoardDao.qnaWriteRef(qnadto);
			qnadto.setQstep(qnadto.getQstep() + 1);
			qnadto.setQdepth(qnadto.getQdepth() + 1);
			qnadto.setUserid(user.getUsername());
					
			BoardDao.qnaReplyWrite(qnadto);
			return "redirect:qna.user";
		}
		
		//qna 글 수정
		@RequestMapping(value="qnaEdit.user", method=RequestMethod.GET)
		public String qnaEdit(String qnum, Model model){
			System.out.println("수정 컨트롤러 // qnum="+qnum);
			BoardDao BoardDao = sqlSession.getMapper(BoardDao.class);
			qna qnaDto = BoardDao.qnaDetail(qnum);
			model.addAttribute("qnadto", qnaDto);
			
			return "board.qnaEdit";
		}
		
		@RequestMapping(value="qnaEdit.user", method=RequestMethod.POST)
		public String qnaEditOk(qna qnadto){
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			boardDao.qnaEdit(qnadto);
			System.out.println(qnadto.getQnum()+"//////");;
			
			return "redirect:qnaDetail.user?qnum="+qnadto.getQnum();
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
