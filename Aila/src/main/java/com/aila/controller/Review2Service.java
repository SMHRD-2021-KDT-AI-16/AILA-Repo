package com.aila.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aila.db.ReviewDAO;
import com.aila.model.ReviewVO;

public class Review2Service implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String inputKey = request.getParameter("inputKey");
		
		ReviewVO vo = new ReviewVO();
		ReviewDAO dao = new ReviewDAO();
		
		vo.setReview_content(inputKey);
		List<ReviewVO> list = dao.ReviewM();
		//ReviewVO result = (ReviewVO) new ReviewDAO().allReview(inputKey);
		
		if(list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("Review", list);
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
		
		return null;
	}

}
