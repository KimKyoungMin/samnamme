package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.qna;
public interface BoardDao {
	public qna qnaDetail(String qnum);
	public List<qna> qnalists(int page,int limit);
	public void qnaWrite(qna qnadto);
	public void qnaReply(qna qnadto);
	public void qnaDelete(String qnum);
	public int listcount();
}
