package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.mdlist;
import co.kr.samman.dto.payinfo;
import co.kr.samman.dto.payt;
import co.kr.samman.dto.usert;

public interface AccountDao {
	public usert getuserinfo(String userid); //회원 정보 
	public void usertEdit(usert usert); //회원 정보 수정
	public List<mdlist> getmdlist(String userid); //다운 리스트 
	public List<payt> getpay(String userid); //결제  상세 내역
	public payt getleastpay(String userid); //현재 이용하는 결제 내역
	public List<payinfo> getpayinfo(); //결제 상품 정보
	public payinfo payinfoselect(int paysubcode); //결제 가격, 서브코드, 더해질 날짜 셀렉트
	public void payok(payinfo payinfoDto); //결제
	public void uexpUpdate(String expdate, String userid); //usert 에 uexpdate update
	public int userCk(String userid); //유효 고객인지 체크

}
