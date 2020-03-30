package com.ahpu.ssm.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.pojo.Order;
import com.ahpu.ssm.pojo.PageBean;
import com.ahpu.ssm.pojo.Product;
import com.ahpu.ssm.service.admin.OrderService;
import com.ahpu.ssm.service.admin.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	@Autowired
	OrderService service;
	
	@RequestMapping("/listOrder")
	public ModelAndView listOrder(int curPage) {
		ModelAndView mav = new ModelAndView();
		PageBean page = service.listOrder(curPage);
		mav.setViewName("admin/order/list");
		mav.addObject("page",page);
		return mav;
	}
	@RequestMapping("/listOrderQita")
	public ModelAndView listOrderyfk(int curPage,int state) {
		ModelAndView mav = new ModelAndView();
		PageBean page = service.listOrderQita(curPage , state);
		mav.setViewName("admin/order/list2");
		mav.addObject("page",page);
		return mav;
	}
	
	@RequestMapping("/utilOrder")
	public ModelAndView utilOrder(String oid) {
		ModelAndView mav = new ModelAndView();
		Order order = service.selectOrderByOid(oid);
		int state = order.getState();
		if(state != 3) {
			state = state+1;
			order.setState(state);
			service.updateOrder(order);
		}else {
			service.deleteOrder(order);
		}
		mav.addObject("msg","success");
		mav.setViewName("admin/msg");
		return mav;
	}
	@RequestMapping("/deleteOrder")
	public ModelAndView deleteProduct(Order o) {
		ModelAndView mav = new ModelAndView();
		service.deleteOrder(o);
		mav.addObject("msg", "删除成功");
		mav.setViewName("admin/welcome");
		return mav;
	}
}
