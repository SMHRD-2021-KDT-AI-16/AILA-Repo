package com.aila.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aila.db.MemberDAO;
import com.aila.model.CompanyVO;

public class LoginService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String inputKey = request.getParameter("inputKey");
		System.out.println(inputKey);
		CompanyVO vo = new CompanyVO();
		vo.setCompany_key(inputKey);
		CompanyVO result = new MemberDAO().login(vo);
		System.out.println("member: "+result);
		
		if(result != null) {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=utf-8");
			session.setAttribute("member", result);
			response.getWriter().print(true);
			//return "Trend.do";
		}else {
			response.getWriter().print(false);
		}
		
		return null;
	}

}
