package com.ahpu.ssm.controller;



import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.pojo.Car;
import com.ahpu.ssm.pojo.CarItem;
import com.ahpu.ssm.pojo.Order;
import com.ahpu.ssm.pojo.OrderItem;
import com.ahpu.ssm.pojo.PageBean;
import com.ahpu.ssm.pojo.Product;
import com.ahpu.ssm.pojo.User;
import com.ahpu.ssm.service.admin.OrderService;
import com.ahpu.ssm.util.UUIDUtil;


@RequestMapping("order")
@Controller
public class OrderController {
	@Autowired
	OrderService service;

	@RequestMapping("/addOrder")
	public ModelAndView addOrder(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		Car car = (Car) session.getAttribute("car");
		User loginUser = (User)session.getAttribute("user");
		if(loginUser == null) {
			mav.addObject("msg", "请先登录，再继续购买！");
			mav.setViewName("login");
			return mav;
		}
		Order order = new Order();
		order.setOid(UUIDUtil.getUUId());
		order.setState(0);
		order.setTotal(car.getTotalPrice());
		order.setOrdertime(new Date(System.currentTimeMillis()));
		order.setUser(loginUser);
		Set<String> keySet = car.getItems().keySet();
		for(String key : keySet) {
			CarItem carItem = car.getItems().get(key);
			OrderItem orderItem = new OrderItem();
			orderItem.setItemid(UUIDUtil.getUUId());
			orderItem.setCount(carItem.getCount());
			orderItem.setSubtotal(carItem.getSubTotal());
			orderItem.setProduct(carItem.getProduct());
			orderItem.setOrder(order);
			order.getItems().add(orderItem);
			service.addOrderItem(orderItem);
		}
		service.addOrder(order);
		car.clear();
		mav.addObject("order" , order);
		mav.setViewName("order_info");
		
		return mav;
	
	}
	
	@RequestMapping("/orderForm")
	public ModelAndView orderForm(String address,String name,String telephone,String oid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = (User)session.getAttribute("user");
		Order order = service.selectOrderByOid(oid);
		order.setAddress(address);
		order.setName(name);
		order.setTelephone(telephone);
		order.setUser(user);
		order.setState(1);
		service.updateOrder(order);
		mav.addObject("msg","购买成功");
		mav.setViewName("msg");
		return mav;
	}
	
	
	@RequestMapping("/orderlist")
	public ModelAndView orderList(int curPage,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = (User)session.getAttribute("user");
		PageBean page = service.userListOrder(curPage, user.getUsername());
		mav.setViewName("order_list");
		mav.addObject("page",page);
		return mav;
	}
	

	@RequestMapping("/listDetail")
	public ModelAndView listDetail(int curPage,String oid) {
		ModelAndView mav = new ModelAndView();
		PageBean page = service.userListDetail(curPage,oid);
		mav.setViewName("orderdetail_list");
		mav.addObject("page",page);
		mav.addObject("oid",oid);
		return mav;
	}
	
	
	@RequestMapping("/payorder")
	public ModelAndView payorder(HttpSession session,String oid) {
		
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("user");
		if(loginUser == null) {
			mav.addObject("msg", "请先登录，再继续购买！");
			mav.setViewName("login");
			return mav;
		}
		Order order = service.selectOrderByOid(oid);
		order.setOrdertime(new Date(System.currentTimeMillis()));
		List<OrderItem> items = service.selectOrderItemByOid(oid);
		order.setItems(items);
		mav.addObject("order" , order);
		mav.setViewName("order_info");
		
		return mav;
	
	}
	
}
