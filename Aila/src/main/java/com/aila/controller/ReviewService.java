package com.aila.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aila.db.Review_resultDAO;
import com.aila.model.Frequency_cntVO;
import com.aila.model.ReviewVO;
import com.aila.model.TopicVO;


public class ReviewService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String food_name = request.getParameter("food_name");
		String review_source = request.getParameter("review_source");
		Review_resultDAO dao = new Review_resultDAO();
		ArrayList<Frequency_cntVO> cnt_list = new ArrayList();
		ArrayList<TopicVO> topic_list = new ArrayList();
		ArrayList<ReviewVO> review_list = new ArrayList();
		int food_idx = 1;
		if(food_name.equals("김치")) {
			food_idx=2;
		}
		review_list= dao.selectReview(food_idx,review_source);			
		cnt_list=dao.fc_cnt(food_name);
		topic_list = dao.selectTopic(food_name);
		
		if(cnt_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("cnt_result", cnt_list);
		}else {
			System.out.println("cnt_list 못가져왔음");
		}
		if(topic_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("topic_result", topic_list);
		}else {
			System.out.println("topic_list 못가져왔음");
		}
		int pos_cnt=0;
		int neg_cnt=0;
		ArrayList<ReviewVO> pos_review= new ArrayList();
		ArrayList<ReviewVO> neg_review= new ArrayList();
		if(review_list != null) {
			for(int i=0 ; i< review_list.size();i++) {
				if(review_list.get(i).getReview_rating()>3) {
					review_list.get(i).setReview_rating(1);
					pos_review.add(review_list.get(i));
					pos_cnt++;
				}else {
					review_list.get(i).setReview_rating(0);
					neg_review.add(review_list.get(i));
					neg_cnt++;
				}
			}
			System.out.println("리뷰 긍정/부정 분리 끝");
			int[] review_emotion = new int[2];
			review_emotion[0]=neg_cnt;
			review_emotion[1]=pos_cnt;
			HttpSession session = request.getSession();
			session.setAttribute("review_emotion", review_emotion);
			System.out.println("감정 비율 보내기 성공 review_emotion");
		}else {
			System.out.println("review 못가져왔음");
		}
		
		for(int i =0; i < pos_review.size();i++) {
			if(pos_review.get(i).getCreated_at().split("-")[1].equals("01")) {
				
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return "Goreview_result.do";
	}

}
