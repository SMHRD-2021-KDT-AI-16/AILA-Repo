package com.aila.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.ReviewVO;

public class ReviewDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<ReviewVO> allReview(String review_idx){

		List<ReviewVO> Reviews = null;
		
		SqlSession sqlsession = factory.openSession();
		try {
			Reviews = sqlsession.selectList("allReview", review_idx);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sqlsession.close();
		}
		return Reviews;
	}

	public List<ReviewVO> printReview() {
		List<ReviewVO> Reviews = null;
		
		SqlSession sqlsession = factory.openSession();
		try {
			Reviews = sqlsession.selectList("printReview");
			System.out.println("DAO printreview");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("DAO Fail");
		} finally {
			sqlsession.close();
		}
		return Reviews;
	}

	

}
