package com.aila.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
		String food_name = request.getParameter("food");
		String review_source = request.getParameter("review_source");
		
		Review_resultDAO dao = new Review_resultDAO();
		ArrayList<Frequency_cntVO> cnt_list = new ArrayList();
		ArrayList<TopicVO> topic_list = new ArrayList();
		ArrayList<ReviewVO> review_list = new ArrayList();
		
		int food_idx = 1;
		if (food_name.equals("김치")) {
			food_idx = 2;
		}
		review_list = dao.selectReview(food_idx, review_source);
		cnt_list = dao.fc_cnt(food_name, review_source);
		topic_list = dao.selectTopic(food_name, review_source);
		Map<String, TopicVO> topic_list_map = new HashMap<>();
		Map<String, Frequency_cntVO> cnt_list_map = new HashMap<>();

		int pos_cnt = 1;
		int neg_cnt = 1;
		if (cnt_list != null) {
			for (int i = 0; i < cnt_list.size(); i++) {
				if (cnt_list.get(i).getFc_emotion() == 1) {
					cnt_list_map.put("pos_vo"+pos_cnt++,cnt_list.get(i) );					
				}else {
					cnt_list_map.put("pos_vo"+neg_cnt++,cnt_list.get(i) );
				}
			}
			HttpSession session = request.getSession();
			session.setAttribute("cnt_result", cnt_list_map);
		} else {
			System.out.println("cnt_list 못가져왔음");
		}
		if (topic_list != null) {
			pos_cnt = 1;
			neg_cnt = 1;
			for (int i = 0; i < topic_list.size(); i++) {
				if (topic_list.get(i).getTopic_emotion() == 1) {
					topic_list_map.put("pos_vo" + pos_cnt++, topic_list.get(i));
				} else {
					topic_list_map.put("neg_vo" + neg_cnt++, topic_list.get(i));
				}
			}

			HttpSession session = request.getSession();
			session.setAttribute("topic_result", topic_list_map);
		} else {
			System.out.println("topic_list 못가져왔음");
		}
		pos_cnt = 0;
		neg_cnt = 0;
		Map<String, Integer> review_emotion_cnt = new HashMap<>();
		if (review_list != null) {
			for (int i = 0; i < review_list.size(); i++) {
				if (review_list.get(i).getReview_rating() > 3) {
					review_list.get(i).setReview_rating(1);
					pos_cnt++;
				} else {
					review_list.get(i).setReview_rating(0);
					neg_cnt++;
				}
			}
			review_emotion_cnt.put("pos", pos_cnt);
			review_emotion_cnt.put("neg", neg_cnt);
			System.out.println("리뷰 긍정/부정 분리 끝");
			System.out.println(review_emotion_cnt.get("pos"));
			System.out.println(review_emotion_cnt.get("neg"));
			HttpSession session = request.getSession();
			session.setAttribute("review_emotion_cnt", review_emotion_cnt);
			System.out.println("감정 비율 보내기 성공 review_emotion");
		} else {
			System.out.println("review 못가져왔음");
		}
		// 월별 리뷰 개수를 저장할 HashMap
		Map<String, Integer> review_cnt_M = new HashMap<>();

		// 리뷰 리스트를 반복하면서 각 리뷰의 생성 월을 가져와서 월별 개수를 계산
		for (ReviewVO review : review_list) {
			String month = review.getMonth();
			// 해당 월의 개수를 가져와 증가시킴
			review_cnt_M.put(month, review_cnt_M.getOrDefault(month, 0) + 1);
		}

		return "Goreview_result.do";
	}

}
