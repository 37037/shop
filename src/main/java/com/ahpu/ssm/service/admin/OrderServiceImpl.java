package com.ahpu.ssm.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ahpu.ssm.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahpu.ssm.mapper.admin.OrderMapper;
import com.ahpu.ssm.mapper.admin.ProductMapper;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper mapper;
	@Override
	public void addOrder(Order o) {
		// TODO Auto-generated method stub
		mapper.addOrder(o);
	}

	@Override
	public void addOrderItem(OrderItem oi) {
		// TODO Auto-generated method stub
		mapper.addOrderItem(oi);
	}

	@Override
	public void updateOrder(Order o) {
		// TODO Auto-generated method stub
		mapper.updateOrder(o);
	}

	@Override
	public Order selectOrderByOid(String oid) {
		// TODO Auto-generated method stub
		return mapper.selectOrderByOid(oid);
	}

	@Override
	public PageBean listOrder(int curPage) {
		// TODO Auto-generated method stub
		PageBean<Order> page = new PageBean<Order>();
		
		page.setCurPage(curPage);
		int totalCount = mapper.selectCount();
		page.setTotalSize(totalCount);
		
		double total = totalCount;
		int totalPage = (int)Math.ceil(total/ PageBean.pageSize);
		page.setTotalPage(totalPage);
		
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("start", (curPage - 1) * PageBean.pageSize);
		map.put("size", PageBean.pageSize);
		
		List<Order> list = mapper.findByPage(map);
		
		page.setList(list);
		return page;
	}

	@Override
	public PageBean listOrderQita(int curPage , int state) {
		// TODO Auto-generated method stub
		PageBean<Order> page = new PageBean<Order>();
		
		page.setCurPage(curPage);
		int totalCount = mapper.selectCountqita(state);
		page.setTotalSize(totalCount);
		
		double total = totalCount;
		int totalPage = (int)Math.ceil(total/ PageBean.pageSize);
		page.setTotalPage(totalPage);
		
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("start", (curPage - 1) * PageBean.pageSize);
		map.put("size", PageBean.pageSize);
		map.put("state", state);
		
		List<Order> list = mapper.findByPage2(map);
		
		page.setList(list);
		
		return page;
	}

	@Override
	public void deleteOrder(String o) {
		// TODO Auto-generated method stub
		mapper.deleteOrder(o);
	}

	@Override
	public PageBean userListOrder(int curPage,String usernameid) {
		// TODO Auto-generated method stub
		PageBean<Order> page = new PageBean<Order>();
		
		page.setCurPage(curPage);
		int totalCount = mapper.selectCountByUsernameid(usernameid);
		page.setTotalSize(totalCount);
		
		double total = totalCount;
		int totalPage = (int)Math.ceil(total/ PageBean.pageSize);
		page.setTotalPage(totalPage);
		
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("start", (curPage - 1) * PageBean.pageSize);
		map.put("size", PageBean.pageSize);
		map.put("usernameid", usernameid);
		
		List<Order> list = mapper.findByPage3(map);
		page.setList(list);
		return page;
	}

	@Override
	public PageBean userListDetail(int curPage, String oid) {
		PageBean<OrderItem> page = new PageBean<OrderItem>();
		
		page.setCurPage(curPage);
		int totalCount = mapper.selectCountByOid(oid);
		page.setTotalSize(totalCount);
		double total = totalCount;
		int totalPage = (int)Math.ceil(total/ PageBean.pageSize);
		page.setTotalPage(totalPage);
		
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("start", (curPage - 1) * PageBean.pageSize);
		map.put("size", PageBean.pageSize);
		map.put("oid", oid);
		
		List<OrderItem> list = mapper.findByPage4(map);
		page.setList(list);
		return page;
	}

	@Override
	public Cart findcid(String cid) {
		return mapper.findcid(cid);
	}

	@Override
	public int findcount(int state) {
		return mapper.countorder(state);
	}

	@Override
	public List<OrderItem> selectOrderItemByOid(String oid) {
		// TODO Auto-generated method stub
		return mapper.selectOrderItemByOid(oid);
	}


}
