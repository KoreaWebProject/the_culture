package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserInfoVO;

@Repository
public class UserInfoDAO {
	SqlSession sqlSession;

	@Autowired
	public UserInfoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println(this.sqlSession);
	}


	public UserInfoVO selectOne(String id) {
		UserInfoVO vo = sqlSession.selectOne("u.userinfo_one", id);
		return vo;
	}
}
