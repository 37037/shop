package com.ahpu.ssm.filter;

import com.ahpu.ssm.pojo.User;
import com.ahpu.ssm.pojo.admin;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class adminLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //1.如果当前已登录，直接放行
        HttpServletRequest rqs = (HttpServletRequest) request;
        HttpServletResponse rps = (HttpServletResponse) response;
        HttpSession session = rqs.getSession();
        admin admin = (admin) session.getAttribute("admin");
        if (admin == null) {
            rps.sendRedirect(rqs.getContextPath()+"/admin/adminLogin.action");

        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
