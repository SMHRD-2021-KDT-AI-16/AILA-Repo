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
import com.aila.model.CompanyVO;
import com.aila.model.Frequency_cntVO;
import com.aila.model.ReviewVO;
import com.aila.model.TopicVO;

public class ReviewService implements command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session= request.getSession();
		response.setContentType("text/html;charset=utf-8");
		
		String food_name = request.getParameter("food_name");
		session.setAttribute("food_name", food_name);

		String review_source = request.getParameter("review_source");
		
		if(review_source == null) {
			CompanyVO vo = (CompanyVO) session.getAttribute("member");
			System.out.println("member : " + vo);
			review_source = vo.getCompany_name();
		}
		
		
		session.setAttribute("review_source", review_source);
		
		Review_resultDAO dao = new Review_resultDAO();
		ArrayList<Frequency_cntVO> cnt_list = new ArrayList<>();
		ArrayList<TopicVO> topic_list = new ArrayList<>();
		ArrayList<ReviewVO> review_list = new ArrayList<>();
		
		int food_idx=1;
		
		if(food_name.equals("김치")) {
			food_idx=2;
		}
		review_list = dao.selectReview(food_idx, review_source);
		cnt_list = dao.fc_cnt(food_name, review_source);
		topic_list = dao.selectTopic(food_name, review_source);
		ArrayList<String> pos_cnt_word = new ArrayList();
		ArrayList<String> neg_cnt_word = new ArrayList();
		ArrayList<Integer> pos_cnt_ = new ArrayList();
		ArrayList<Integer> neg_cnt_ = new ArrayList();
		ArrayList<String> pos_topic_word = new ArrayList();
		ArrayList<String> neg_topic_word = new ArrayList();
		ArrayList<Integer> pos_topic = new ArrayList();
		ArrayList<Integer> neg_topic = new ArrayList();
		int pos_cnt = 0;
		int neg_cnt = 0;
		if (cnt_list != null) {
			for (int i = 0;i<cnt_list.size();i++) {
				if(cnt_list.get(i).getFc_emotion()==1) {
					pos_cnt_word.add(cnt_list.get(i).getFc_word());
					pos_cnt_.add(cnt_list.get(i).getFc_cnt());
				}else {
					neg_cnt_word.add(cnt_list.get(i).getFc_word());
					neg_cnt_.add(cnt_list.get(i).getFc_cnt());
				}
			}
			request.setAttribute("pos_cnt_word", pos_cnt_word);
			request.setAttribute("pos_cnt", pos_cnt_);
			request.setAttribute("neg_cnt_word", neg_cnt_word);
			request.setAttribute("neg_cnt", pos_cnt_);
			System.out.println("cnt 보내기 끝~!");
		} else {
			System.out.println("cnt 못가져왔음");
		}
		if (topic_list != null) {
			for (int i = 0;i<topic_list.size();i++) {
				if(topic_list.get(i).getTopic_emotion()==1) {
					pos_topic_word.add(topic_list.get(i).getTopic_content());
					pos_topic.add(Math.round(topic_list.get(i).getTopic_rating()));
				}else {
					neg_topic_word.add(topic_list.get(i).getTopic_content());
					neg_topic.add(Math.round(topic_list.get(i).getTopic_rating()));
				}
			}
			request.setAttribute("pos_topic_word", pos_topic_word);
			request.setAttribute("pos_topic", pos_topic);
			request.setAttribute("neg_topic_word", neg_topic_word);
			request.setAttribute("neg_topic", pos_topic);
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
		
		ArrayList<String> year = new ArrayList();
		ArrayList<String> month = new ArrayList();
		for (int i =0;i<yearDates.size();i++) {
			year.add(yearDates.get(i).split("-")[0]);
			month.add(yearDates.get(i).split("-")[1]);
			System.out.println(year.get(i)+"-"+month.get(i)+":"+pos_m_cnt.get(i)+":"+neg_m_cnt.get(i));
		}
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("pos_m", pos_m_cnt);
		request.setAttribute("neg_m", neg_m_cnt);
		
		
		
		request.setAttribute("review_emotion_cnt", review_emotion_cnt);

		System.out.println("감정 비율 보내기 성공 review_emotion");
		return "Goreview_result.do";
	}

}
