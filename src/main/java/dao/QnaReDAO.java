package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.QnaReVO;

public class QnaReDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//댓글 조회
	public List<QnaReVO> selectList(int idx) {
		List<QnaReVO> list = sqlSession.selectList("qr.qna_reple_detail", idx);
		//System.out.println(vo.toString());
		return list;
	}
	
	public int insert(QnaReVO vo) {
		int res = sqlSession.insert("qr.qna_reple_insert", vo);
		return res;
	}

}
