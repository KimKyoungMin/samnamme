package co.kr.samman.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.samman.dao.AccountDao;
import co.kr.samman.dto.mdlist;
import co.kr.samman.dto.payinfo;
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
			
			//현재 결제 이용기간 보여주기
			payt paytDto = accountDao.getleastpay(userid);
			model.addAttribute("pd", paytDto);
			
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
		
		//결제 상세 페이지
		@RequestMapping(value="paymentform.user", method=RequestMethod.GET)
		public String paymentform(Model model){
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			UserDetails user = 
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			System.out.println(user.getUsername());
			
			//결제 상세 내역
			List<payt> pt = accountDao.getpay(user.getUsername());
			model.addAttribute("pt", pt);
			
			return "account.paymentform";
		}
		
		//결제 하기
		@RequestMapping(value="pay.user", method=RequestMethod.GET)
		public String pay(Model model){
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			List<payinfo> payinfoDto = accountDao.getpayinfo();
			model.addAttribute("payinfoDto", payinfoDto);
			
			return "account.payok";
		}
		
		@RequestMapping(value="pay.user", method=RequestMethod.POST)
		public String payok(HttpServletRequest req, HttpServletResponse res) throws IOException{
			System.out.println(req.getParameter("paysubcode"));  //라디오 값
			int paysubcode = Integer.parseInt(req.getParameter("paysubcode"));
			
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			
			payinfo payinfoDto = accountDao.payinfoselect(paysubcode); //결제 가격, 서브코드, 더해질 날짜 셀렉트
			System.out.println(payinfoDto.getPaysubcode()+"//"+payinfoDto.getPaypdate()+"//"+payinfoDto.getPayprice());
			
			UserDetails user = 
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            payinfoDto.setUserid(user.getUsername());
			accountDao.payok(payinfoDto);
			
			return "redirect:account.user?userid="+user.getUsername();
		}
		
		
		
		
}
