package com.aila.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aila.db.NewsDAO;
import com.aila.db.ReviewDAO;
import com.aila.model.ReviewVO;
import com.aila.model.TrendVO;
import com.google.gson.Gson;

/**
 * Servlet implementation class test0321
 */
@WebServlet("/test0321Service")
public class test0321Service extends HttpServlet  {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test0321Service() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String search_word = request.getParameter("search_word");
		List<HashMap<String, Object>> result = new NewsDAO().top10news(search_word);
		
		Gson gson = new Gson();
		String jsonArr = gson.toJson(result);
		System.out.println(jsonArr);
		
	    response.setContentType("application/json; charset=utf-8");
	    if(search_word != null) {
	    	response.getWriter().print(jsonArr.toString());	    	
	    }
		
	}
	

}
