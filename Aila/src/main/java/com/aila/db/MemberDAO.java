package com.aila.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.CompanyVO;

public class MemberDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public CompanyVO login(CompanyVO vo) {
		SqlSession sqlsession = factory.openSession(true);
		CompanyVO result = sqlsession.selectOne("login", vo);
		sqlsession.close();
		return result;
	}

}
