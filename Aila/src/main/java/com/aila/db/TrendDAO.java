package com.aila.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.TrendVO;

public class TrendDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<TrendVO> showTop10() {
		SqlSession sqlsession = factory.openSession(true);
		List<TrendVO> result = sqlsession.selectList("showTop10");
		sqlsession.close();
		return result;
	}

}
