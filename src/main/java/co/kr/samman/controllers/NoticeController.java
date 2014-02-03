package co.kr.samman.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.samman.dao.NoticeBoardDao;
import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;
import co.kr.samman.dto.lastNumber;

@Controller
public class NoticeController {
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 게시판
		@RequestMapping("notice.user")
		public String noticeList(HttpServletRequest req, Model model) {
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			int lastnum=3;
			int firstnum=0;
			String lastnumS = req.getParameter("lastnum");
//			System.out.println("noticeList-lastnumS : "+lastnumS);
//			System.out.println("noticeList-lastnum : "+lastnum);
			if(lastnumS !=null && !lastnumS.equals("")){
				lastnum = Integer.parseInt(lastnumS)+3;
			}
//			System.out.println("noticeList-lastnumS : "+lastnumS);
//			System.out.println("noticeList-lastnum : "+lastnum);
			lastNumber lastnumb = new lastNumber();
			lastnumb.setLastnum(lastnum);
			model.addAttribute("lastNumber", lastnumb);
			List<board> noticeBoardList = noticeBoardDao.noticeBoardList(firstnum, lastnum);
			List<cont> noticeBoardReplyList = noticeBoardDao.noticereplyList();
			model.addAttribute("noticeBoardList", noticeBoardList);
			model.addAttribute("noticeBoardReplyList", noticeBoardReplyList);
			return "board.notice";
		}
		
		@RequestMapping("noticereply.user")
		@ResponseBody
		public String noticeReplyList(HttpServletRequest req, Model model,String bnum, String userid, String ccontent, String replynum) {
//			System.out.println("noticeReplyList+ noticereply.user 댓글 AJAX Controller단");
//			System.out.println(bnum+"  "+userid+"   "+ccontent);
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.noticereplyInsert(bnum, userid, ccontent);
			cont cont=noticeBoardDao.noticereplyResult(bnum, userid);
			//Json 객체 생성
			JSONObject obj = new JSONObject();
			//Json에 String 값 입력
			obj.put("replynum", replynum);
			obj.put("username", cont.getUsername()+":"+cont.getCcontent()+"<br>"+cont.getCdate());
			return obj.toString();
		}
		@RequestMapping(value="noticewrite.user", method=RequestMethod.GET)
		public String noticeWriteForm(Model model){
//			System.out.println("NoticeController.noticeWriteForm()-get");
			
			return "board.noticewrite";
		}
		
		@RequestMapping(value="noticewrite.user", method=RequestMethod.POST)
		public String noticeWrite(board bor, HttpServletRequest req, Model model) throws IOException{
			//System.out.println("NoticeController.noticeWriteForm()- post");
			bor.setBpicname(bor.getFilespic().getOriginalFilename());
			String path = req.getRealPath("/CSS/noticeboardpic/"+bor.getBpicname());
			
			if(!bor.getBpicname().equals("")){
		    	FileOutputStream fs = new FileOutputStream(path);
		    	fs.write(bor.getFilespic().getBytes());
		    	fs.close();
		    }
			
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.writenotice(bor);
			return "redirect:notice.user";
		}
		
		@RequestMapping(value="noticeupdate.user", method=RequestMethod.GET)
		public String noticeUpdateform(HttpServletRequest req, Model model){
//			System.out.println("NoticeController.noticeUpdateform - get");
			int boardid = Integer.parseInt(req.getParameter("bnum"));
//			System.out.println("boardid"+boardid);
			
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
//			System.out.println("sqlsession create good");
			model.addAttribute("board", noticeBoardDao.getNoticedetail(boardid));
			return "board.noticeupdate";
		}
		
		@RequestMapping(value="noticeupdate.user", method=RequestMethod.POST)
		public String noticeUpdate(board board, HttpServletRequest req, Model model) throws IOException{
//			System.out.println("NoticeController.noticeUpdateform - post");
			board.setBpicname(board.getFilespic().getOriginalFilename());
			String path = req.getRealPath("/CSS/noticeboardpic/"+board.getBpicname());
			
			if(!board.getBpicname().equals("")){
		    	FileOutputStream fs = new FileOutputStream(path);
		    	fs.write(board.getFilespic().getBytes());
		    	fs.close();
		    }
			
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.noticeupdate(board);
			
			return "redirect:notice.user";
		}
		
		@RequestMapping("noticedelete.user")
		public String noticeDelete(HttpServletRequest req, Model model){
			int boardid = Integer.parseInt(req.getParameter("bnum"));
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.noticeudelete(boardid);
			return "redirect:notice.user";
		}
}

	
	