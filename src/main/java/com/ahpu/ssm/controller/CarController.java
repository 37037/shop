package com.ahpu.ssm.controller;

import javax.servlet.http.HttpSession;

import com.ahpu.ssm.pojo.*;
import com.ahpu.ssm.service.UserService;
import com.ahpu.ssm.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.service.admin.ProductService;

import java.util.List;

@RequestMapping("car")
@Controller
public class CarController {
	
	@Autowired
	ProductService service;
	@Autowired
	UserService service1;
	
	@RequestMapping("/updatecount")
	@ResponseBody
	public String updateCount(String name,Integer count,HttpSession session){
		User user=(User)session.getAttribute("user");
		Cart c=new Cart();
//		c.setProductname(name);
		c.setPid(name);
		c.setUid(user.getUsername());
		c.setCount(count);
		System.out.println(c.getCount());
		System.out.println(name);
//		System.out.println(c.getProductname());
		service.updateCount(c);
			String msg="yes";
			return msg;


	}
	@RequestMapping("/addCar")
	public ModelAndView addCar(String pid, int count,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//通过pid找到商品内容
		Product p = service.findProductByPid(pid);
		//将count加入到购物车中
		CarItem item = new CarItem();
		item.setProduct(p);
		item.setCount(count);
		//将购物车项加入到购物车
		Car car=(Car) session.getAttribute("car");
		if (car==null) {
			car=new Car();
		}
		car.add2Car(item);
		session.setAttribute("car", car);
		mav.setViewName("cart");
		return mav;
	}
	@RequestMapping("/addCar1")
	public ModelAndView addCar1(String pid, int count,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		User user=(User)session.getAttribute("user");
		//通过pid找到商品内容
		Product p = service.findProductByPid(pid);
		//将count加入到购物车中
		Cart cart=new Cart();
		cart.setCid(UUIDUtil.getUUId());
		cart.setCount(count);
		cart.setUid(user.getUsername());
		cart.setPid(pid);
		cart.setProduct(p);
		if(service1.isIncart(cart)){
			service1.updateCart(cart);
		}else {service1.insetcart(cart);
		}

//		Car car=(Car) session.getAttribute("car");
//		if (car==null) {
//			car=new Car();
//		}
//		car.add2Car(item);
//		session.setAttribute("car", car);
		List<Cart> carts=service1.findCart(user);
		System.out.println(carts);

		mav.addObject("carts",carts);
		mav.setViewName("cart");
		return mav;
	}
	@RequestMapping("/showCar")
	public ModelAndView showCar(HttpSession session) {
		User user=(User)session.getAttribute("user");
		List<Cart> carts=service1.findCart(user);
		ModelAndView mav=new ModelAndView();
		mav.addObject("carts",carts);
		System.out.println(carts);
		mav.setViewName("cart");
		return mav;
	}
	
	@RequestMapping("/delcar")
	public  ModelAndView delCar(String cid,HttpSession session) {
		service1.deleteproduct(cid);
		User user=(User)session.getAttribute("user");
		List<Cart> carts=service1.findCart(user);
		ModelAndView mav=new ModelAndView();
		mav.addObject("carts",carts);
		mav.setViewName("cart");
		return mav;
	}

	@RequestMapping("/clearcar")
	public String clearCar(HttpSession session) {
		User user=(User)session.getAttribute("user");
		service1.deletecar(user);
		
		
		return "cart";
	}
}
