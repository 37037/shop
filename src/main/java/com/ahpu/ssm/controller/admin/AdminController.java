package com.ahpu.ssm.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ahpu.ssm.pojo.admin;
import com.ahpu.ssm.pojo.notice;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.pojo.User;
import com.ahpu.ssm.service.UserService;
import com.ahpu.ssm.util.UUIDUtil;

import java.sql.Date;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService service;
	@RequestMapping("/adminLogin")
	public String login(){
		return "admin/adminLogin";
	}
	@RequestMapping("doLogin")
	@ResponseBody
	public String dologin(@Param("admin") admin admin,HttpSession session){
//		admin a=new admin();
//		a.setAcount(acount);
//		a.setPwd(pwd);
		if(service.adminLogin(admin)){
			session.setAttribute("admin", admin);
			String msg="yes";
			return msg;
		}else {
			String msg="no";
			return msg;

		}

	}

	
	
	
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "admin/product/add";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "admin/home";
	}
	
	@RequestMapping("/top")
	public String top() {
		return "admin/top";
	}
	@RequestMapping("/bottom")
	public String bottom() {
		return "admin/bottom";
	}
	@RequestMapping("/left")
	public String left() {
		return "admin/left";
	}
	@RequestMapping("/welcome")
	public String welcome() {
		return "admin/welcome";
	}
	@RequestMapping("/notice")
    public  String notice(){
	    return "admin/notice";
    }
    @RequestMapping("/updatenotice")
    @ResponseBody
    public  String updatenotice(String notice){

		notice n=new notice();
		n.setNotice(notice);
		n.setTime(new Date(System.currentTimeMillis()));
	    service.addnotice(n);


        return "success";
    }
	
	

}
