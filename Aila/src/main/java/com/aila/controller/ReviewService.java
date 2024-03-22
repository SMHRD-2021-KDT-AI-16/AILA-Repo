package com.aila.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aila.db.ReviewDAO;
import com.aila.model.ReviewVO;
import com.google.gson.Gson;


@WebServlet("/ReviewService")
public class ReviewService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewService() {
        super();

    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		String inputKey = request.getParameter("inputKey");
		
		ReviewVO vo = new ReviewVO();
		ReviewDAO dao = new ReviewDAO();
		
		vo.setReview_content(inputKey);
		List<ReviewVO> list = dao.ReviewM();

		
		if(list != null) {
			HttpSession session = request.getSession();
			session.setAttribute("Review", list);
			
			Gson gson = new Gson();
			String jsonArr = gson.toJson(list);
			
		    response.setContentType("application/json; charset=utf-8");
		    response.getWriter().print(jsonArr.toString());
		    
		}else {
			response.getWriter().print(false);
		}
	}

}
