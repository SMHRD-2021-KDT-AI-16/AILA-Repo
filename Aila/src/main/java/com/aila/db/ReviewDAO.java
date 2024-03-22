package com.aila.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.ReviewVO;

public class ReviewDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ReviewVO> ReviewM(){

		List<ReviewVO> Reviews = null;
		
		SqlSession sqlsession = factory.openSession();
		
		try {
			Reviews = sqlsession.selectList("ReviewM");
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sqlsession.close();
		}
		return Reviews;
	}

}
