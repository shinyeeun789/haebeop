package kr.ed.haebeop.util;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class UserInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean flag = false;
        HttpSession session = request.getSession(false);            // 자동 로그인 되지 않도록 false로 막아주기

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (session != null && session.getAttribute("user") != null) {
            flag = true;
        } else {
            flag = false;
            out.print("<script> confirm('로그인 후 접근 가능한 페이지입니다.'); location.href='" + request.getContextPath() + "/user/login'; </script>");
            out.flush();
        }
        return flag;
    }

}