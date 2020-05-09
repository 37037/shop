package com.ahpu.ssm.service;

import com.ahpu.ssm.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahpu.ssm.mapper.UserMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper ;

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		mapper.addUser(user);
	}

	@Override
	public boolean adminLogin(admin admin) {
		int c=mapper.adminLogin(admin);
		if(c > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean findUserByUsernameAndPassword(User user) {
		
		int count = mapper.findUserByUsernameAndPassword(user);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updatepwd(User user) {

		if(mapper.updatepwd(user)){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void insetcart(Cart cart) {
		mapper.insercart(cart);
	}

	@Override
	public List<Cart> findCart(User user) {
		return mapper.findCart(user);
	}

	@Override
	public boolean isIncart(Cart cart) {
		int count=mapper.isIncart(cart);
		if(count > 0){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void updateCart(Cart cart) {
		mapper.updateCart(cart);
	}

	@Override
	public void deleteproduct(String cid) {
		mapper.deleteproduct(cid);
	}

	@Override
	public void deletecar(User user) {
		mapper.deletecar(user);
	}

	@Override
	public void addnotice(notice notice) {
		mapper.addnotice(notice);
	}

	@Override
	public notice find() {
		return  mapper.find();
	}

	@Override
	public List<notice> findnotice() {
		List<notice> list=mapper.findnotice();
		return list;
	}

	@Override
	public void deletenotice(String nid) {
		mapper.deletenotice(nid);
	}

	@Override
	public boolean haveusername(String username) {
		int count;
		count=mapper.haveusername(username);
		if(count>0){
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void deletebycid(String cid) {
		mapper.deletebycid(cid);
	}

	@Override
	public void add(Address a) {
		mapper.add(a);


	}

	@Override
	public List<Address> getlist(User user) {
		return mapper.getlist(user);
	}

	@Override
	public void deleteaid(String aid) {
		mapper.deleteaid(aid);
	}

	@Override
	public PageBean listUser(int curPage) {
		PageBean<User> page = new PageBean<User>();

		page.setCurPage(curPage);
		int totalCount = mapper.selectuserCount();
		page.setTotalSize(totalCount);

		double total = totalCount;
		int totalPage = (int)Math.ceil(total/ PageBean.pageSize);
		page.setTotalPage(totalPage);

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (curPage - 1) * PageBean.pageSize);
		map.put("size", PageBean.pageSize);

		List<User> list = mapper.finduserByPage(map);

		page.setList(list);
		return page;
	}

	@Override
	public void deleteuser(String uid) {
		mapper.deleteuser(uid);
	}

	@Override
	public User finduser(String username) {
		return mapper.finduser(username);
	}

    @Override
    public void updatemessage(User user) {
        mapper.updateuser(user);
    }


}
