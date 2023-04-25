package vo;

public class QnaReVO {
	String qna_re_contents, qna_re_regdate, qna_re_update;
	//답글 내용, 작성 시간, 수정 시간
	int qna_re_ref, qna_id, qna_re_remove_lev;
	//qna 리플용 시퀀스, 문의글 id(외래키), 댓글 삭제 여부
	public String getQna_re_contents() {
		return qna_re_contents;
	}
	public void setQna_re_contents(String qna_re_contents) {
		this.qna_re_contents = qna_re_contents;
	}
	public String getQna_re_regdate() {
		return qna_re_regdate;
	}
	public void setQna_re_regdate(String qna_re_regdate) {
		this.qna_re_regdate = qna_re_regdate;
	}
	public String getQna_re_update() {
		return qna_re_update;
	}
	public void setQna_re_update(String qna_re_update) {
		this.qna_re_update = qna_re_update;
	}
	public int getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public int getQna_re_remove_lev() {
		return qna_re_remove_lev;
	}
	public void setQna_re_remove_lev(int qna_re_remove_lev) {
		this.qna_re_remove_lev = qna_re_remove_lev;
	}
}
