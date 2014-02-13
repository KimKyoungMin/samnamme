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
		public String account(String userid, Model model,HttpServletRequest request, int page) {
			
			
			 page = 1;
			int limit = 7;
			if(request.getParameter("page") != null){
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			int startrow = ((page-1)*limit);
			
			System.out.println(userid);
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			usert usertDto = accountDao.getuserinfo(userid);
			int listcount = accountDao.listcount(userid);
			
			model.addAttribute("usertDto", usertDto);
			
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (((int)((double)page / 10 + 0.9)) -1)*10 + 1;
			int endpage = startpage + 10 - 1;
			if(endpage > maxpage){
				endpage = maxpage;
			}
			
			System.out.println("타냐1");
			request.setAttribute("userid", userid);
			request.setAttribute("page", page);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("maxpage", maxpage);
			
			model.addAttribute("listcount",listcount);
			System.out.println("타냐2");
			//다운 리스트
			List<mdlist> md = accountDao.getmdlist(userid,startrow, limit);
			model.addAttribute("md", md);
			System.out.println("타냐3");
			//현재 결제 이용기간 보여주기
			payt paytDto = accountDao.getleastpay(userid);
			model.addAttribute("pd", paytDto);
			System.out.println("타냐4");
			System.out.println("====================");
			System.out.println("page"+page);
			System.out.println("max"+maxpage);
			System.out.println("start"+startpage);
			System.out.println("end"+endpage);
			System.out.println("====================");
			
			
			return "account.useraccountmain";
		}
		
		//회원 정보 수정
		@RequestMapping(value="account.user", method=RequestMethod.POST)
		public String useredit(usert usert, HttpServletRequest request){
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			//System.out.println(request.getParameter("uname"));
			System.out.println(usert.getUserid()+"+++");
			accountDao.usertEdit(usert);
			return "redirect:account.user?userid="+usert.getUserid()+"&page=1";
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
			
			UserDetails user = 
					(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			AccountDao accountDao = sqlSession.getMapper(AccountDao.class);
			
			//유효기간이 끝나지 않았는데 결제하려고 할때 
			int ck = accountDao.userCk(user.getUsername());
			if(ck==0){
				if(req.getParameter("paysubcode")!=null){				
					int paysubcode = Integer.parseInt(req.getParameter("paysubcode"));
					payinfo payinfoDto = accountDao.payinfoselect(paysubcode); //결제 가격, 서브코드, 더해질 날짜 셀렉트
					System.out.println(payinfoDto.getPaysubcode()+"//"+payinfoDto.getPaypdate()+"//"+payinfoDto.getPayprice());
					
					payinfoDto.setUserid(user.getUsername());
					accountDao.payok(payinfoDto);
					
					//회원 유효기간도 업데이트 해줌 uexpdate
					payt paytDto = accountDao.getleastpay(user.getUsername());
					String expdate = paytDto.getExpdate();
					accountDao.uexpUpdate(expdate, user.getUsername());		
				}else{
					res.setCharacterEncoding("EUC-KR");
					PrintWriter out = res.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('결제 상품을 선택해주세요')");
					out.println("history.back();");
					out.println("</script>");
					out.close();
				}				
			}else{ //유효기간이 아직 끝나지 않았을 경우 
				res.setCharacterEncoding("EUC-KR");
				PrintWriter out = res.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('결제 기간이 아직 끝나지 않았습니다.')");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
			return "redirect:account.user?userid="+user.getUsername()+"&page=1";
		}
	
}
