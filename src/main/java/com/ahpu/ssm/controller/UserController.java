package com.ahpu.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.pojo.User;
import com.ahpu.ssm.service.UserService;
import com.ahpu.ssm.util.UUIDUtil;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@RequestMapping("/regist")
	public String regist() {
		return "regist";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	
	@RequestMapping("/doLogin")//登陆验证
	public ModelAndView doLogin(User user,HttpSession session) { /* username   password  */
		
		// 数据验证 (略)
	/*	String code=(String) session.getAttribute("code");
		String code2=(String) session.getAttribute("vcode");
		System.out.print(code);
		System.out.print(code2);
		if(code == code2) {
			System.out.print("验证码正确！");
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", "验证码不正确，请重新登录");
		}*/
		boolean isSuccess = service.findUserByUsernameAndPassword(user);
		ModelAndView mav = new ModelAndView();
		if(isSuccess) {
			// 成功
			mav.addObject("msg", "登录成功！，请前往首页选购");
			
			// 添加到session
			session.setAttribute("user", user);
		}else {
			// 失败
			mav.addObject("msg","登录失败");
		}
		mav.setViewName("msg");
		return mav;
	}
	
	@RequestMapping("/doRegist")//注册
	public ModelAndView  doRegist(User user) {
		// 给新用户设定uid
		user.setUid(UUIDUtil.getUUId());
		ModelAndView mav = new ModelAndView();
		// 后台数据验证
		// 通过service 添加具体的内容
		if(user.getUsername()==""&&user.getPassword()=="") {
			mav.addObject("msg","未填写重要数据！");
			// 添加视图
			mav.setViewName("msg");
			return mav;
		}
		else {
		service.addUser(user);
		
		// 添加信息
		mav.addObject("msg","注册成功！");
		// 添加视图
		mav.setViewName("msg");
		return mav;
		}
	}
	
	@RequestMapping("logout")
	public String doLogout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "index";
	}
	@RequestMapping("/tocar")
	public ModelAndView toCar(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("user");
		if(loginUser == null) {
			mav.addObject("msg", "请先登录，再继续购买！");
			mav.setViewName("msg");
			return mav;
		}
		mav.setViewName("cart");
		return mav;
	}
	

}
