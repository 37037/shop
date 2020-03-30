package com.ahpu.ssm.service.admin;

import java.util.List;

import com.ahpu.ssm.pojo.Order;
import com.ahpu.ssm.pojo.OrderItem;
import com.ahpu.ssm.pojo.PageBean;


public interface OrderService {
	void addOrder(Order o);
	void deleteOrder(Order o);
	void addOrderItem(OrderItem oi);
	void updateOrder(Order o);
	Order selectOrderByOid(String oid);
	List<OrderItem> selectOrderItemByOid(String oid);
	PageBean listOrder(int curPage);
	PageBean listOrderQita(int curPage , int state);
	PageBean userListOrder(int curPage,String usernameid);
	PageBean userListDetail(int curPage,String oid);
}
