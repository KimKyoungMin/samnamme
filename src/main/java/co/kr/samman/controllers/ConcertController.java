package co.kr.samman.controllers;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConcertController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//콘서트 정보 페이지
	@RequestMapping("concert.htm")
	public String conertdetail() {
		
		return "concert.concert";
	}

}
