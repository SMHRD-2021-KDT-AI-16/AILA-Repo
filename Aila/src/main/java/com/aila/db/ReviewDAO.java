package com.aila.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.db.SqlSessionManager;
import com.aila.model.ReviewVO;

public class ReviewDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ReviewVO> allReview(String user_id){

		List<ReviewVO> Reviews = null;
		SqlSession sqlsession = factory.openSession();
		try {
			Reviews = sqlsession.selectList("allReview", user_id);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlsession.close();
		}
		return Reviews;
	}

}
