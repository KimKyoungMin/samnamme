package co.kr.samman.controllers;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.NoticeBoardDao;
import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;

@Controller
public class NoticeController {
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 게시판
		@RequestMapping("notice.user")
		public String noticeList(Model model) {
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			List<board> noticeBoardList = noticeBoardDao.noticeBoardList();
			List<cont> noticeBoardReplyList = noticeBoardDao.noticereplyList();
			model.addAttribute("noticeBoardList", noticeBoardList);
			model.addAttribute("noticeBoardReplyList", noticeBoardReplyList);
			return "board.notice";
		}
		
		@RequestMapping(value="noticewrite.user", method=RequestMethod.GET)
		public String noticeWriteForm(Model model){
//			System.out.println("NoticeController.noticeWriteForm()");
			
			return "board.noticewrite";
		}
		
}

	
	