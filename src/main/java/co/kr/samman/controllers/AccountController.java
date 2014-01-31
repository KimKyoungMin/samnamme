package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원 정보 페이지
		@RequestMapping(value = "account.user", method = RequestMethod.GET)
		public String account() {
			
			return "account.useraccountmain";
		}
}
