package com.aila.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aila.db.TrendDAO;
import com.aila.model.TrendVO;

public class TrendService implements command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<TrendVO> result = new TrendDAO().showTop10();
		request.setAttribute("top10", result);
		return "Gotrend.do";
	}

}
