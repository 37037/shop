package com.ahpu.ssm.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ahpu.ssm.pojo.*;
import com.ahpu.ssm.service.admin.OrderService;
import com.ahpu.ssm.service.admin.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.service.UserService;
import com.ahpu.ssm.util.UUIDUtil;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService service;
	@Autowired
	ProductService service1;
	@Autowired
	OrderService service2;
	@RequestMapping("/getuser")
	public ModelAndView getuser(int curPage){
		ModelAndView mav=new ModelAndView();
		PageBean page =service.listUser( curPage);

		mav.addObject("page",page);
		mav.setViewName("admin/usermanage/messageuser");
		return  mav;
	}
	@RequestMapping("/finduserbyname")
	public ModelAndView finduserbyname(String uname){
		ModelAndView mav=new ModelAndView();
		User u=service.finduser(uname);

		mav.addObject("u",u);
		mav.setViewName("admin/usermanage/finduser");
		return  mav;
	}
	@RequestMapping("/deleteuser")
	public ModelAndView  deleteuser(String uid){
		ModelAndView mav=new ModelAndView();
		service.deleteuser(uid);
		mav.addObject("msg", "删除成功");
		mav.setViewName("admin/welcome");
		return mav;

	}
	@RequestMapping("/updateuser")
    public ModelAndView  updateuser(String username){
        ModelAndView mav=new ModelAndView();
        User user =service.finduser(username);

        mav.addObject("user", user);
        mav.setViewName("admin/usermanage/edit");
        return mav;

    }
    @RequestMapping("/updatemessage")
    public ModelAndView  updatemessage(User user){
        ModelAndView mav=new ModelAndView();
        service.updatemessage(user);

        mav.addObject("msg", "修改成功");
        mav.setViewName("admin/welcome");
        return mav;

    }
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
	@RequestMapping("/msg")
	public ModelAndView msg() {
		int s0=service2.findcount(0);
		int s1=service2.findcount(1);
		int s2=service2.findcount(2);
		int s3=service2.findcount(3);
		int s4=service2.findcount(4);
		List list= new ArrayList();

		list.add(s0);
		list.add(s1);
		list.add(s2);
		list.add(s3);
		list.add(s4);

		List list1=new ArrayList();
		list1.add(service.selectcount(0));
		System.out.println(service.selectcount(0));
		list1.add(service.selectcount(1));

		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("list1",list1);
		mav.setViewName("admin/msg");
		return mav;
	}
	@RequestMapping("/notice")
    public  ModelAndView notice(){
	   List<notice> list= service.findnotice();
	    ModelAndView mav=new ModelAndView();
	    mav.setViewName("/admin/notice");
	    mav.addObject("list" ,list);



	    return mav;
    }
    @RequestMapping("/deletenotice")
    public  ModelAndView deletenotice(String nid){
        service.deletenotice(nid);
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/admin/welcome");
        mav.addObject("msg" ,"删除成功");
        return mav;
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

	@RequestMapping("/anser")
	public  ModelAndView anser(int curPage ){
		ModelAndView mav=new ModelAndView();
		PageBean page=service1.findallcomments(curPage);
		mav.addObject("page",page);
		mav.setViewName("admin/product/comments");


		return mav;
	}

	@RequestMapping("/yesanser")
	public  ModelAndView yesanser(int curPage ){
		ModelAndView mav=new ModelAndView();
		PageBean page=service1.findallcommentsyes(curPage);
		mav.addObject("page",page);
		mav.setViewName("admin/product/commentsyes");


		return mav;
	}
	@RequestMapping("/updateanser")
	public  ModelAndView updateanser(String anser,String gid ){
		ModelAndView mav=new ModelAndView();
		Comments comments=service1.findcommentsbygid(gid);
		System.out.println(		comments.getComment()
);
		comments.setAnser(anser);
		comments.setState(1);
		service1.updatecomments(comments);
		mav.addObject("msg","回复成功");
		mav.setViewName("admin/welcome");


		return mav;
	}

}
