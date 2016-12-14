package com.fengtaiguang.springmvc.portal.web.controller.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public void afterCompletion(HttpServletRequest rquest, HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		System.out.println(".................afterCompletion...........arg2=" + arg2);

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("....................postHandle........arg2=" + arg2);
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse response, Object arg2) throws Exception {
		System.out.println("................preHandle............arg2=" + arg2);
		if (1 == 0) {
			// response.sendRedirect("");
			// response.getWriter().print(b)
			return false;
		}
		return true;
	}

}
