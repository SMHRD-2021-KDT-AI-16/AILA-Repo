package com.aila.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aila.controller.LoginService;
import com.aila.controller.command;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// String과 command 타입을 가지는 HashMap 객체를 생성합니다.
		HashMap<String, command> map = new HashMap<>();

		public void init(ServletConfig config) throws ServletException {
			super.init();
			
			map.put("views/Login.do", new LoginService());
			
		}

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String uri = request.getRequestURI();
			System.out.println(uri);
			String cp = request.getContextPath();
			String path = uri.substring(cp.length()+1);
			
			request.setCharacterEncoding("UTF-8");
			
			String finalpath = null;
			command com = null;
			if (path.contains("Go")){
				finalpath = path.replace("Go", "").replace(".do", ".jsp").replace("views/", "");
				System.out.println(finalpath);
			} else {
				System.out.println(path);
				com = map.get(path);
				System.out.println(com);
				finalpath = com.execute(request, response);
			}
			
			if (finalpath != null) {
				if (finalpath.contains("redirect:/")) {
					System.out.println(finalpath);
					response.sendRedirect(finalpath.replaceAll("redirect:/", ""));
				} else {
					System.out.println(finalpath);
					RequestDispatcher rd = request.getRequestDispatcher(finalpath);
					rd.forward(request, response);
				}
			}
		}


}
