package com.ahpu.ssm.service;

import com.ahpu.ssm.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahpu.ssm.mapper.UserMapper;

import java.util.List;

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


}
