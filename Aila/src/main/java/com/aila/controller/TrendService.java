package com.aila.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aila.db.TrendDAO;
import com.aila.model.TrendVO;
import com.google.gson.Gson;

public class TrendService implements command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search_word = request.getParameter("search_word");
		List<HashMap<String, Object>> Tresult = new TrendDAO().related10(search_word);
		
		List<TrendVO> result = new TrendDAO().showTop10();
		
		request.setAttribute("top10", result);
		request.setAttribute("Tresult", Tresult);
		
		Gson gson = new Gson();
		String jsonArr = gson.toJson(Tresult);
		System.out.println(Tresult);
		
		if("true".equals(request.getParameter("ajax"))) {
	    	response.getWriter().print(jsonArr.toString());
	    	response.getWriter().flush();
	    	return null;
	    } 
		return "Gotrend.do";
	}
	
	

}
