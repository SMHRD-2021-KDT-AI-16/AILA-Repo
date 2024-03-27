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
		CompanyVO vo = new CompanyVO();
		System.out.println("저기!!!!!!!!!!"+inputKey);
		vo.setCompany_key(inputKey);
		CompanyVO result = new MemberDAO().login(vo);
		System.out.println("여기!!!!!!!!!"+result);
		if(result != null) {
			System.out.println("세션저장 직전");
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=utf-8");
			session.setAttribute("member", result);
			response.getWriter().print(true);
			System.out.println("성공인데?");
			return "Trend.do";
		}else {
			System.out.println("실패인듯?");
			response.getWriter().print(false);
			return null;
		}
		
	}

}
