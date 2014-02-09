package co.kr.samman.controllers;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.CommunityBoardDao;
import co.kr.samman.dao.ConcertDao;
import co.kr.samman.dao.NoticeBoardDao;
import co.kr.samman.dao.SettingDao;
import co.kr.samman.dto.board;
import co.kr.samman.dto.concert;
import co.kr.samman.dto.cont;
import co.kr.samman.dto.lastNumber;

@Controller
public class CommunityController {
	@Autowired
	private SqlSession sqlSession;

	//자유게시판
	@RequestMapping("community.user")
	public String noticeList(HttpServletRequest req, Model model) {
		CommunityBoardDao communityBoardDao = sqlSession.getMapper(CommunityBoardDao.class);
		//보여주는 게시글 숫자를 결정하는 넘버
		int lastnum=5;
		int firstnum=0;
		String lastnumS = req.getParameter("lastnum");
		if(lastnumS !=null && !lastnumS.equals("")){
			lastnum = Integer.parseInt(lastnumS)+5;
		}
		lastNumber lastnumb = new lastNumber();
		lastnumb.setLastnum(lastnum);
		model.addAttribute("lastNumber", lastnumb);
		//보드 내용 구해 넣기
		List<board> communityBoardList = communityBoardDao.communityBoardList(firstnum, lastnum);
		//reply갯수 구해서 더해주기
		for(board boardreply :communityBoardList){
			boardreply.setReplycount(communityBoardDao.communityreplygetcount(boardreply.getBnum()));
		}
		//댓글 구하기 
		List<cont> communityBoardReplyList = communityBoardDao.communityreplyList();
		//jsp 단에서는 noticeBoardList 랑 noticeBoardReplyList를 그대로 사용하기로 함(수정 소요 과다 발생)
		model.addAttribute("noticeBoardList", communityBoardList);
		model.addAttribute("noticeBoardReplyList", communityBoardReplyList);
		return "board.community";
	}
	
	//community board write method 
	@RequestMapping(value="communitywrite.user", method=RequestMethod.GET)
	public String noticeWriteForm(Model model){
//		System.out.println("NoticeController.noticeWriteForm()-get");
		
		return "board.communitywrite";
	}
	
	@RequestMapping(value="communitywrite.user", method=RequestMethod.POST)
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
		return "redirect:community.user";
	}
	
}
