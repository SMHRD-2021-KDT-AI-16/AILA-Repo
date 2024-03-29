package com.aila.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.Frequency_cntVO;
import com.aila.model.ReviewVO;
import com.aila.model.TopicVO;

public class Review_resultDAO {

	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	
	public ArrayList<Frequency_cntVO> fc_cnt(int food_idx, String review_source){
		
		SqlSession sqlsession = factory.openSession();
		ArrayList<Frequency_cntVO> result = null;
		Frequency_cntVO vo = new Frequency_cntVO();
		vo.setFood_idx(food_idx);
		vo.setFc_resource(review_source);
		try {
			result = (ArrayList)sqlsession.selectList("review_cnt", vo);
		} catch (Exception e) {
			System.out.println("빈도수 못가져왔음");
		} finally {
			sqlsession.close();
		}
		
		return result;
		
	}
	
	public ArrayList<TopicVO> selectTopic(int food_idx, String review_source){
		
		SqlSession sqlsession = factory.openSession();
		
		ArrayList<TopicVO> result = null;
		
		TopicVO vo = new TopicVO();
		vo.setFood_idx(food_idx);
		vo.setReview_source(review_source);
		try {
			result = (ArrayList)sqlsession.selectList("review_topic", vo);
			System.out.println("리뷰 토픽 가져옴");
		} catch (Exception e) {
			System.out.println("토픽 못가져왔음");
		} finally {
			sqlsession.close();
		}
		
		
		return result;
	}
	
	
	public ArrayList<ReviewVO> selectReview(int food_idx, String review_source){
		
		SqlSession sqlsession = factory.openSession();
		ReviewVO vo = new ReviewVO();
		vo.setFood_idx(food_idx);
		vo.setReview_source(review_source);
		ArrayList<ReviewVO> result = new ArrayList();
		try {
			result = (ArrayList)sqlsession.selectList("review", vo);
		} catch (Exception e) {
			System.out.println("리뷰 데이터 못가져왔음");
		} finally {
			
			sqlsession.close();
		}
		return result;
	}

	public List<Object> selectFullReview(TopicVO vo, int topic_emotion) {
		
		SqlSession sqlsession = factory.openSession();
		System.out.println(vo.toString());
		System.out.println(topic_emotion);
		List<Object> result;
		if(topic_emotion == 1) {
			result = sqlsession.selectList("fullPosReview", vo);
		}else {
			result = sqlsession.selectList("fullNegReview", vo);
		}
		sqlsession.close();
		
		return result;
		
	}
	
	
}
