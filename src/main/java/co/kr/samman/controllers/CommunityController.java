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

	// 자유게시판
	@RequestMapping("notice.user")
	public String noticeList(HttpServletRequest req, Model model) {
		NoticeBoardDao noticeBoardDao = sqlSession
				.getMapper(NoticeBoardDao.class);
		int lastnum = 3;
		int firstnum = 0;
		String lastnumS = req.getParameter("lastnum");
		if (lastnumS != null && !lastnumS.equals("")) {
			lastnum = Integer.parseInt(lastnumS) + 3;
		}
		lastNumber lastnumb = new lastNumber();
		lastnumb.setLastnum(lastnum);
		model.addAttribute("lastNumber", lastnumb);
		// 보드 내용 구해 넣기
		List<board> noticeBoardList = noticeBoardDao.noticeBoardList(firstnum,
				lastnum);
		// reply갯수 구해서 더해주기
		for (board boardreply : noticeBoardList) {
			boardreply.setReplycount(noticeBoardDao
					.noticereplygetcount(boardreply.getBnum()));
		}
		// 댓글 구하기
		List<cont> noticeBoardReplyList = noticeBoardDao.noticereplyList();

		model.addAttribute("noticeBoardList", noticeBoardList);
		model.addAttribute("noticeBoardReplyList", noticeBoardReplyList);
		return "board.notice";
	}
}
