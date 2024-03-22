package com.aila.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aila.db.Review_resultDAO;
import com.aila.model.Frequency_cntVO;
import com.aila.model.TopicVO;


public class ReviewService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String food_name = request.getParameter("food");
		Review_resultDAO dao = new Review_resultDAO();
		System.out.println(food_name);
		ArrayList<Frequency_cntVO> cnt_list = new ArrayList();
		ArrayList<TopicVO> topic_list = new ArrayList();
		cnt_list=dao.fc_cnt(food_name);
		topic_list = dao.selectTopic(food_name);
		
		if(cnt_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("result", cnt_list);
		}else {
			System.out.println("cnt_list 못가져왔음");
		}
		if(topic_list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("result", topic_list);
		}else {
			System.out.println("topic_list 못가져왔음");
		}
		
		return "Goreview_result.do";
	}

}
