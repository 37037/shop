package com.ahpu.ssm.service;

import com.ahpu.ssm.pojo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahpu.ssm.mapper.UserMapper;
import com.ahpu.ssm.pojo.User;

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


}
