package com.ahpu.ssm.controller;



import java.sql.Array;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import com.ahpu.ssm.pojo.*;
import com.ahpu.ssm.service.UserService;
import com.ahpu.ssm.service.admin.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.service.admin.OrderService;
import com.ahpu.ssm.util.UUIDUtil;


@RequestMapping("order")
@Controller
public class OrderController {
	@Autowired
	OrderService service;
	@Autowired
	UserService service1;
	@Autowired
	ProductService service2;

	@RequestMapping("/addOrder")
	public ModelAndView addOrder(HttpSession session , double totalRow, @RequestParam(value="arr") String[] arr) {
		
		ModelAndView mav = new ModelAndView();
//		Car car = (Car) session.getAttribute("car");
		System.out.println(1);
		List<Cart> carts=new ArrayList<Cart>();
		for(String a:arr){
			service.findcid(a);

			carts.add(service.findcid(a));

		}

		User loginUser = (User)session.getAttribute("user");
//		List<Cart> carts=service1.findCart(loginUser);
		if(loginUser == null) {
			mav.addObject("msg", "请先登录，再继续购买！");
			mav.setViewName("login");
			return mav;
		}
		Order order = new Order();
		order.setOid(UUIDUtil.getUUId());
		order.setState(0);
		order.setTotal(totalRow);
		order.setOrdertime(new Date(System.currentTimeMillis()));
		order.setUser(loginUser);
//		Set<String> keySet = car.getItems().keySet();
//		for(String key : keySet) {
//			CarItem carItem = car.getItems().get(key);
//			OrderItem orderItem = new OrderItem();
//			orderItem.setItemid(UUIDUtil.getUUId());
//			orderItem.setCount(carItem.getCount());
//			orderItem.setSubtotal(carItem.getSubTotal());
//			orderItem.setProduct(carItem.getProduct());
//			orderItem.setOrder(order);
//			order.getItems().add(orderItem);
//			service.addOrderItem(orderItem);
//		}
		service.addOrder(order);
		for(Cart c : carts){
			OrderItem orderItem = new OrderItem();
			orderItem.setItemid(UUIDUtil.getUUId());
			Product p=service2.findProductByPid(c.getPid());
			c.setProduct(p);
			orderItem.setCount(c.getCount());
			System.out.println(p.getShop_price());
			System.out.println(c.getCount());
			orderItem.setSubtotal(p.getShop_price()*c.getCount());
//			Product p=service2.findProductByPimage(c.getProduct());
			orderItem.setProduct(c.getProduct());
			orderItem.setOrder(order);

			order.getItems().add(orderItem);
			service.addOrderItem(orderItem);
		}

//		car.clear();
		for(String a :arr){
			service1.deletebycid(a);
		}


		List<Address> list=new ArrayList<>();
		list=service1.getlist(loginUser);

		mav.addObject("list",list);
		mav.addObject("order" , order);
		mav.setViewName("order_info");

		return mav;

	}
	
	@RequestMapping("/orderForm")
	public ModelAndView orderForm(String address,String name,String telephone,String oid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = (User)session.getAttribute("user");
		System.out.println(address);
		System.out.println(name);
		System.out.println(telephone);
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
		System.out.println(page);

		mav.setViewName("order_list");
		mav.addObject("page",page);
		return mav;
	}
	

	@RequestMapping("/listDetail")
	public ModelAndView listDetail(int curPage,String oid) {
		ModelAndView mav = new ModelAndView();
		PageBean page = service.userListDetail(curPage,oid);
		System.out.println(page);
		mav.setViewName("orderdetail_list");
		mav.addObject("page",page);
		mav.addObject("oid",oid);

		return mav;
	}
	@RequestMapping("/listDetail1")
	public ModelAndView listDetail1(int curPage,String oid) {
		ModelAndView mav = new ModelAndView();
		List<OrderItem> list = service.selectOrderItemByOid(oid);
		mav.setViewName("comments");
		mav.addObject("list",list);
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
		List<Address> list=new ArrayList<>();
		list=service1.getlist(loginUser);

		mav.addObject("list",list);
		mav.addObject("order" , order);
		mav.setViewName("order_info");
		
		return mav;
	
	}
	@RequestMapping("utilOrder1")
	@ResponseBody
	public String utilOrder1(String oid){
		System.out.println(oid);
		Order order = service.selectOrderByOid(oid);
		int state = order.getState();
		state = state+1;
		order.setState(state);
		service.updateOrder(order);
		String msg="yes";
		return msg;
	}
	
}
