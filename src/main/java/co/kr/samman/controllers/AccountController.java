package co.kr.samman.controllers;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.AccountDao;
import co.kr.samman.dto.mdlist;
import co.kr.samman.dto.payt;
import co.kr.samman.dto.usert;

@Controller
public class AccountController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원 정보 페이지
		@RequestMapping(value="account.user", method=RequestMethod.GET)
		public String account(String userid, Model model) {
			System.out.println(userid);
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			usert usertDto = accountDao.getuserinfo(userid);
			model.addAttribute("usertDto", usertDto);
			
			//다운 리스트
			List<mdlist> md = accountDao.getmdlist(userid);
			model.addAttribute("md", md);
			
			//결제 내역
			List<payt> pt = accountDao.getpay(userid);
			model.addAttribute("pt", pt);
			
			return "account.useraccountmain";
		}
		
		//회원 정보 수정
		@RequestMapping(value="account.user", method=RequestMethod.POST)
		public String useredit(usert usert, HttpServletRequest request){
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			//System.out.println(request.getParameter("uname"));
			System.out.println(usert.getUserid()+"+++");
			accountDao.usertEdit(usert);
			return "redirect:account.user?userid="+usert.getUserid();
		}
		
}
