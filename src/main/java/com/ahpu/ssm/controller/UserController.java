package com.ahpu.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ahpu.ssm.pojo.*;
import com.ahpu.ssm.service.admin.OrderService;
import com.ahpu.ssm.service.admin.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
public class UserController {
	
	@Autowired
	UserService service;
	@Autowired

	OrderService service1;
	@Autowired
	ProductService service2;
	
	@RequestMapping("/regist")
	public String regist() {
		return "regist";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		List<Product> p=service2.findHotProduct();
		List<Product> p1=service2.findlatestProduct();
		ModelAndView mav=new ModelAndView();
		mav.addObject("p",p);
		mav.addObject("p1",p1);
		mav.setViewName("index");
		return mav;
	}
	
	
	@RequestMapping("/doLogin")//登陆验证
	public ModelAndView doLogin(User user,HttpSession session) {

		boolean isSuccess = service.findUserByUsernameAndPassword(user);
		ModelAndView mav = new ModelAndView();
		if(isSuccess) {
			// 成功
			mav.addObject("msg", "登录成功！，请前往首页选购");
			
			// 添加到session
			session.setAttribute("user", user);
			mav.setViewName("index");
			return mav;
		}else {
			// 失败
			mav.addObject("msg","登录失败");
			mav.setViewName("msg");
			return mav;
		}

	}
	
	@RequestMapping("/doRegist")//注册
	public ModelAndView  doRegist(User user) {
		// 给新用户设定uid
		user.setUid(UUIDUtil.getUUId());
		System.out.println(user);
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
	@RequestMapping("/have")
	@ResponseBody
	public String have(String username){
				if(		service.haveusername(username)){
					String msg="yes";
					return msg;
				}else {
					String msg="no";
					return msg;
				}
	}

	@RequestMapping("/tocomments")
	public ModelAndView tocomments(HttpSession session, String oid0,HttpServletRequest re){
		User u=(User)session.getAttribute("user");
		System.out.println(44444);
		System.out.println(oid0);
		System.out.println(666);

		Order o=service1.selectOrderByOid(oid0);
		 o.setState(4);
		 service1.updateOrder(o);
		List<OrderItem> orderItems=service1.selectOrderItemByOid(oid0);
		System.out.println(orderItems.size());
		for(int i=0;i<orderItems.size();i++){
			Comments c=new Comments();
			c.setUsername(u.getUsername());
			c.setTime(new Date(System.currentTimeMillis()));
			c.setPid(re.getParameter("pid"+i));
			c.setComment(re.getParameter("comment"+i));
			System.out.println(c.getComment());
			service.addcomment(c);
		}

		String url ="redirect:http://localhost:8080/C/order/orderlist.action?curPage="+1;

		return new ModelAndView(url);


	}

	
	@RequestMapping("logout")
	public String doLogout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "index";
	}
	@RequestMapping("/editmessage")
	public ModelAndView editmessage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editmessage");
		return mav;
	}
	@RequestMapping("/adress")
	public ModelAndView adress(HttpSession session){
		ModelAndView mav = new ModelAndView();
		User loginUser = (User) session.getAttribute("user");
		List<Address> list=new ArrayList<>();
		list=service.getlist(loginUser);
		mav.setViewName("adress");
		mav.addObject("list",list);

		return mav;
	}
	@RequestMapping("/deleteaid")
    public ModelAndView delete(String aid ,HttpSession session){
        System.out.println(1);
        System.out.println(aid);
	    service.deleteaid(aid);
	    ModelAndView mav=new ModelAndView();
        User loginUser = (User) session.getAttribute("user");
        List<Address> list=new ArrayList<>();
        list=service.getlist(loginUser);
        mav.setViewName("adress");
        mav.addObject("list",list);
        return mav;
    }




    @RequestMapping("add")
    @ResponseBody
	public String add(String person,String phone,String address,String address1,HttpSession session) {

		User loginUser = (User) session.getAttribute("user");
		System.out.println(address1);
		String add=address1+address;
		Address a=new Address();
		a.setAid(UUIDUtil.getUUId());
		a.setPerson(person);
		a.setUsername(loginUser.getUsername());
		a.setPhone(phone);
		a.setAddress(add);

		System.out.println(a.getAddress());
		System.out.println(a.getPerson());
		System.out.println(a.getUsername());

		service.add(a);


			String msg = "yes";
			return msg;

	}
	@RequestMapping("pass")
	@ResponseBody
	public String dopassword(String upwd,HttpSession session) {

		User loginUser = (User) session.getAttribute("user");
		loginUser.setPassword(upwd);
		if (service.findUserByUsernameAndPassword(loginUser)) {
			String msg = "yes";
			return msg;
		} else {
			String msg = "no";
			return msg;

		}
	}
	@RequestMapping("pass2")
	@ResponseBody
	public String dopassword2(String npwd,HttpSession session) {

		User loginUser = (User) session.getAttribute("user");
		loginUser.setPassword(npwd);
		if (service.updatepwd(loginUser)) {
			String msg = "yes";
			return msg;
		} else {
			String msg = "no";
			return msg;

		}
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
	@RequestMapping("/getnotice")
	@ResponseBody
	public notice find(){
		return service.find();
	}

	

}
