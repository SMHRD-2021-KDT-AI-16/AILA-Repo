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

import com.aila.controller.FullReviewService;
import com.aila.controller.LoginService;
import com.aila.controller.ReviewService;
import com.aila.controller.NewsService;
import com.aila.controller.TrendService;
import com.aila.controller.command;
import com.aila.controller.LogoutService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// String과 command 타입을 가지는 HashMap 객체를 생성합니다.
		HashMap<String, command> map = new HashMap<>();

		public void init(ServletConfig config) throws ServletException {
			super.init();
			
			map.put("views/Login.do", new LoginService());
			map.put("views/Logout.do", new LogoutService());
			map.put("views/Trend.do", new TrendService());
			map.put("views/News.do", new NewsService());
			map.put("views/Review.do", new ReviewService());
			map.put("views/FullReview.do", new FullReviewService());
}

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uri = request.getRequestURI();
			String cp = request.getContextPath();
			String path = uri.substring(cp.length()+1);
			request.setCharacterEncoding("UTF-8");
			String finalpath = null;
			command com = null;
			if (path.contains("Go")){
				finalpath = path.replace("Go", "").replace(".do", ".jsp").replace("views/", "");
			} else {
				com = map.get(path);
				
				finalpath = com.execute(request, response);
				System.out.println("execute까진 됨");
			}
			
			if (finalpath != null) {
				if (finalpath.contains("redirect:/")) {
					response.sendRedirect(finalpath.replaceAll("redirect:/", ""));
				} else {
					RequestDispatcher rd = request.getRequestDispatcher(finalpath);
					rd.forward(request, response);
				}
			}
		}

}
