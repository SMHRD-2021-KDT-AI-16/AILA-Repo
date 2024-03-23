package com.aila.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	
	int food_idx=1;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			food_idx = Integer.parseInt(request.getParameter("food_idx"));
		}catch (NullPointerException e) {
			HttpSession session= request.getSession();
			food_idx =(int) session.getAttribute("food_idx");
		}
		String review_source = request.getParameter("review_source");
		
		Review_resultDAO dao = new Review_resultDAO();
		ArrayList<Frequency_cntVO> cnt_list = new ArrayList();
		ArrayList<TopicVO> topic_list = new ArrayList();
		ArrayList<ReviewVO> review_list = new ArrayList();
		
		review_list = dao.selectReview(food_idx, review_source);
		cnt_list = dao.fc_cnt(food_idx, review_source);
		topic_list = dao.selectTopic(food_idx, review_source);
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
			request.setAttribute("topic_list_map", topic_list_map);
			System.out.println("토픽리스트 보내기 성공");

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
			
		} else {
			System.out.println("review 못가져왔음");
		}
		// 현재 날짜를 가져옵니다.
        LocalDate today = LocalDate.now();
        
        // YYYY-MM 형식으로 날짜를 포맷할 DateTimeFormatter를 생성합니다.
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        
        // 최근 일년간의 날짜를 담을 배열을 생성합니다.
        ArrayList<String> yearDates = new ArrayList<>();
        
        // 최근 일년간의 날짜를 계산하여 배열에 추가합니다.
        for (int i = 0; i < 12; i++) {
            LocalDate date = today.minusMonths(i);
            String formattedDate = date.format(formatter);
            yearDates.add(formattedDate);
        }
    
		pos_cnt=0;
		neg_cnt=0;
		ArrayList<Integer> pos_m_cnt = new ArrayList();
		ArrayList<Integer> neg_m_cnt = new ArrayList();
		for(int j=0;j<yearDates.size();j++) {
			for (int i =0 ; i<review_list.size();i++) {
				if(review_list.get(i).getReview_rating()==1 && review_list.get(i).getMonth().equals(yearDates.get(j))) {
						pos_cnt++;
					}else if(review_list.get(i).getReview_rating()==0 && review_list.get(i).getMonth().equals(yearDates.get(j))) {
						neg_cnt++;
					}
			}
			pos_m_cnt.add(pos_cnt);
			neg_m_cnt.add(neg_cnt);
			pos_cnt=0;
			neg_cnt=0;
		}
		
		request.setAttribute("Dates", yearDates);
		request.setAttribute("pos_m", pos_m_cnt);
		request.setAttribute("neg_m", neg_m_cnt);
		
		
		request.setAttribute("cnt_list_map", cnt_list_map);
		System.out.println("빈도수 단어 리스트 보내기 성공");
		request.setAttribute("review_emotion_cnt", review_emotion_cnt);

		System.out.println("감정 비율 보내기 성공 review_emotion");
		return "Goreview_result.do";
	}

}
