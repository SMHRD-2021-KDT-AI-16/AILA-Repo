package com.aila.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.NewsVO;
import com.aila.model.TrendVO;

public class NewsDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<TrendVO> sTop10() {
		SqlSession sqlsession = factory.openSession(true);
		List<TrendVO> result = sqlsession.selectList("sTop10");
		sqlsession.close();
		return result;
	}
	
	public List<NewsVO> news() {
		SqlSession sqlsession = factory.openSession(true);
		List<NewsVO> result = sqlsession.selectList("news");
		sqlsession.close();
		return result;
	}

	public List<HashMap<String, Object>> top10news(String search_word) {
		SqlSession sqlsession = factory.openSession(true);
		List<HashMap<String, Object>> result = sqlsession.selectList("top10news", search_word);
		sqlsession.close();
		return result;		
	}
}
