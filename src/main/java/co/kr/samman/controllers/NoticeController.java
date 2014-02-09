package co.kr.samman.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

import co.kr.samman.dao.NoticeBoardDao;
import co.kr.samman.dto.board;
import co.kr.samman.dto.cont;
import co.kr.samman.dto.lastNumber;

@Controller
public class NoticeController {
	@Autowired
	private SqlSession sqlSession;
	//자유게시판
		@RequestMapping("notice.user")
		public String noticeList(HttpServletRequest req, Model model) {
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			int lastnum=3;
			int firstnum=0;
			String lastnumS = req.getParameter("lastnum");
			if(lastnumS !=null && !lastnumS.equals("")){
				lastnum = Integer.parseInt(lastnumS)+3;
			}
			lastNumber lastnumb = new lastNumber();
			lastnumb.setLastnum(lastnum);
			model.addAttribute("lastNumber", lastnumb);
			//보드 내용 구해 넣기
			List<board> noticeBoardList = noticeBoardDao.noticeBoardList(firstnum, lastnum);
			//reply갯수 구해서 더해주기
			for(board boardreply :noticeBoardList){
				boardreply.setReplycount(noticeBoardDao.noticereplygetcount(boardreply.getBnum()));
			}
			//댓글 구하기 
			List<cont> noticeBoardReplyList = noticeBoardDao.noticereplyList();
			
			model.addAttribute("noticeBoardList", noticeBoardList);
			model.addAttribute("noticeBoardReplyList", noticeBoardReplyList);
			return "board.notice";
		}
		
		//notice board write method 
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
		
		@RequestMapping(value="noticereplygetList.user" ,produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String noticeReplygetList(HttpServletRequest req,HttpServletResponse res, Model model, String bnum, int replycount) throws UnsupportedEncodingException{
			int lastreply=7;
			if(replycount!=0){
				lastreply =replycount; 
			}
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			List<cont> cont=noticeBoardDao.noticereplyResult2(bnum, lastreply);
			//댓글 갯수 구하기
			int replynum=noticeBoardDao.noticereplygetcount(Integer.parseInt(bnum));
			
			//Ajax 한글처리를위한 추가구문
			req.setCharacterEncoding("UTF-8");
			res.setHeader("Content-Type", "text/html; charest=utf-8");
			
			//Json 리스트객체 생성
			JSONArray data2 = new JSONArray();
			JSONObject obj2 = new JSONObject();
			//리플 갯수 넣어주기
			obj2.put("newreplyCount", replynum);
			data2.add(obj2);
			//댓글 객체리스트 넣어주기
			for(cont b : cont){
				//Json 객체 생성
				JSONObject obj = new JSONObject();
				obj.put("username",b.getUsername());
				obj.put("ccontent",b.getCcontent());
				obj.put("cdate", b.getCdate());
				obj.put("userid", b.getUserid());
				obj.put("bnum",  b.getBnum());
				obj.put("cnum", b.getCnum());
				//Json 리스트에 객체를 추가함
				data2.add(obj);
			}
			return data2.toString();
		}
		@RequestMapping(value="noticereplyget.user" ,produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String noticeReplyget(HttpServletRequest req,HttpServletResponse res, Model model, String Cnum) throws UnsupportedEncodingException {
			System.out.println(Cnum);
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			//noticeBoardDao.noticereplyDelete(cnum);
			cont cont = noticeBoardDao.noticereplyGet(Cnum);
			System.out.println(cont.getCcontent());
			JSONObject data = new JSONObject();
			data.put("replycontent", cont.getCcontent());
			System.out.println(data.toString());
			return data.toString();
		}
		
		@RequestMapping(value="noticereplyupdate.user" ,produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String noticeReplyUpdate(HttpServletRequest req,HttpServletResponse res, Model model, String Cnum, String concent){
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.noticereplyUpdate(concent, Integer.parseInt(Cnum));
			
			JSONObject data = new JSONObject();
			data.optString("message", "success");
			System.out.println(data.toString());
			return data.toString();
		}
		
		
		
		
		@RequestMapping(value="noticereplydelete.user" ,produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String noticeReplyDelete(HttpServletRequest req,HttpServletResponse res, Model model, String cnum) throws UnsupportedEncodingException {
			System.out.println(cnum);
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.noticereplyDelete(cnum);
			
			//Ajax 한글처리를위한 추가구문
			req.setCharacterEncoding("UTF-8");
			res.setHeader("Content-Type", "text/html; charest=utf-8");
			JSONObject data = new JSONObject();
			data.optString("message", "success");
			System.out.println(data.toString());
			return data.toString();
		}
		
		@RequestMapping(value="noticereplyadd.user" ,produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String noticeReplyList(HttpServletRequest req,HttpServletResponse res, Model model,String bnum, String userid, String ccontent) throws UnsupportedEncodingException {
			System.out.println(bnum+"  "+userid+"   "+ccontent);
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			noticeBoardDao.noticereplyInsert(bnum, userid, ccontent);
			
			//Ajax 한글처리를위한 추가구문
			req.setCharacterEncoding("UTF-8");
			res.setHeader("Content-Type", "text/html; charest=utf-8");
			
			//Json 리스트객체 생성
				JSONObject data = new JSONObject();
				//Json 리스트에 객체를 추가함
				data.put("message","success");
				System.out.println(data.toString());
			return data.toString();
		}
		
		
		
		@RequestMapping(value="noticeupdate.user", method=RequestMethod.GET)
		public String noticeUpdateform(HttpServletRequest req, Model model){
			System.out.println("NoticeController.noticeUpdateform - get");
			int boardid = Integer.parseInt(req.getParameter("bnum"));
			System.out.println("boardid"+boardid);
			
			NoticeBoardDao noticeBoardDao = sqlSession.getMapper(NoticeBoardDao.class);
			System.out.println("sqlsession create good");
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

	
	