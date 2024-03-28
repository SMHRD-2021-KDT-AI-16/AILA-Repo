package com.aila.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aila.db.Review_resultDAO;
import com.aila.model.TopicVO;

public class FullReviewService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int food_idx = Integer.parseInt(request.getParameter("food_idx"));
		String review_source = request.getParameter("review_source");
		int topic_emotion = Integer.parseInt(request.getParameter("topic_emotion"));
		String topic_content = request.getParameter("topic_content");
		
		TopicVO vo = new TopicVO();
		vo.setFood_idx(food_idx);
		vo.setReview_source(review_source);
		vo.setTopic_content(topic_content);
		
		List<HashMap<String, String>> result = new Review_resultDAO().selectFullReview(vo, topic_emotion);
		
		
		return null;
	}

}
