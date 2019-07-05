package com.kh.kdw.intercepter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.kdw.domain.MemberVo;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 로그인 성공시 쿠키 체크 되어 있으면 쿠키 생성
		String chk_id = request.getParameter("chk_id");
		if (chk_id == null) {
			chk_id = "N";
		}
		System.out.println("LoginInterceptor, chk_id : " + chk_id);
		HttpSession session = request.getSession();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		System.out.println("LoginInterceptor, memberVo : " + memberVo);
		if(memberVo != null) {
			if(chk_id.equals("Y")) {
				// 쿠키 생성
				String user_code = String.valueOf(memberVo.getUser_code());
				Cookie user_cookie = new Cookie("user_code", user_code);
				// 쿠키 유지 시간
				int maxAge = 60 * 60 * 24 * 7; // 일주일
				user_cookie.setMaxAge(maxAge);
				response.addCookie(user_cookie);
				System.out.println("쿠키생성");
			}
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
