package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.qna;
public interface BoardDao {
	public qna qnaDetail(String qnum);
	public List<qna> qnalists();
	public void qnaWrite(qna qnadto);
	public void qnaDelete(String qnum);
	public int listcount();
}
