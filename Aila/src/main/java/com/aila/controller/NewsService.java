package com.aila.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aila.db.NewsDAO;
import com.aila.model.TrendVO;
import com.google.gson.Gson;


public class NewsService implements command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search_word = request.getParameter("search_word");
		List<HashMap<String, Object>> result = new NewsDAO().top10news(search_word);
		
		List<TrendVO> sresult = new NewsDAO().sTop10();
		
		request.setAttribute("stop10", sresult);
		request.setAttribute("result", result);
		
		Gson gson = new Gson();
		String jsonArr = gson.toJson(result);
		System.out.println(result);
		
	    response.setContentType("application/json; charset=utf-8");
	    
	    
	    if("true".equals(request.getParameter("ajax"))) {
	    	response.getWriter().print(jsonArr.toString());
	    	response.getWriter().flush();
	    	return null;
	    } 
	    return "Gonews.do";
	    
		
	}
	

}
