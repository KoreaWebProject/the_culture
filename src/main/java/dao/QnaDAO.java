package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.QnaVO;

@Repository
public class QnaDAO {

	SqlSession sqlSession;
	
	@Autowired
	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 수 알아내기
	public int getRowTotal(HashMap<String, Object> map) {
		int res = sqlSession.selectOne("q.qna_count", map);
		return res;
	}

	// QNA 목록 출력
	public List<QnaVO> selectList( HashMap<String, Object> map) {
		//System.out.println("QNADAO SELECTLIST");
		List<QnaVO> list = sqlSession.selectList("q.qna_list", map);
		return list;
	}

	// QNA 등록
	public int insertContent(QnaVO vo) {
		//System.out.println("Qna insert");
		int res = sqlSession.insert("q.qna_insert", vo);
		return res;
	}
	
	//선택한 QNA 내용 출력
	public QnaVO selectOne(int qna_id) {
		QnaVO detail = sqlSession.selectOne("q.qna_detail", qna_id);
		return detail;
	}

	//qna 삭제
	public int update(int qna_id) {
		int res = sqlSession.update("q.qna_del_up", qna_id);
		//System.out.println(res);
		//System.out.println(qna_id);
		return res;
	}
	
	//qna 완료
		public int update_clear(int qna_id) {
			int res = sqlSession.update("q.qna_update_clear", qna_id);
			return res;
		}
}
