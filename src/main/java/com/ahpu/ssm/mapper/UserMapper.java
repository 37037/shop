package com.ahpu.ssm.mapper;

import com.ahpu.ssm.pojo.Cart;
import com.ahpu.ssm.pojo.User;

import java.util.List;

public interface UserMapper {

	void addUser(User user);

	int findUserByUsernameAndPassword(User user);
	boolean updatepwd(User user);
	void insercart(Cart cart);
	List<Cart> findCart(User user);
	int isIncart(Cart cart);
	void updateCart(Cart cart);
	void deleteproduct( String cid);
	void deletecar(User user);



}
