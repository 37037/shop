package com.ahpu.ssm.mapper.admin;

import java.util.List;
import java.util.Map;

import com.ahpu.ssm.pojo.Cart;
import com.ahpu.ssm.pojo.Order;
import com.ahpu.ssm.pojo.OrderItem;
import com.ahpu.ssm.pojo.Product;

public interface OrderMapper {
	void addOrder(Order o);
	void deleteOrder(String o);
	void addOrderItem(OrderItem oi);
	void updateOrder(Order o);
	Order selectOrderByOid(String oid);
	Order selectOrderByUsernameid(String usernameid);
	List<OrderItem> selectOrderItemByOid(String oid);
	List<Order> findByPage(Map<String, Object> map);
	List<Order> findByPage2(Map<String, Object> map);
	List<Order> findByPage3(Map<String, Object> map);
	List<OrderItem> findByPage4(Map<String, Object> map);
	List<OrderItem> findByPage5(Map<String, Object> map);
	int selectCount();
	int selectCountqita(int state);
	int selectCountByUsernameid(String usernameid);
	int selectCountByOid(String oid);
	Cart findcid(String cid);
	int countorder(int state);
}
