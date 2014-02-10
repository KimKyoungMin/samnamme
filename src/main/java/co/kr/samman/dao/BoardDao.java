package co.kr.samman.dao;

import java.util.List;

import co.kr.samman.dto.qna;
public interface BoardDao {
	public qna qnaDetail(String qnum);
	public void qnaCount(String qnum);
	
	public void qnaWriteRef(qna qnadto);
	public List<qna> qnalists(int page,int limit);
	public int qnaWrite(qna qnadto);
	public int qnaReplyWrite(qna qnadto);
	public int qnaQnumCount();
	
	public void qnaEdit(qna qnadto);
	public void qnaDelete(String qnum);
	public int listcount();
}
