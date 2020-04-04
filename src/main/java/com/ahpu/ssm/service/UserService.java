package com.ahpu.ssm.service;

import com.ahpu.ssm.pojo.Cart;
import com.ahpu.ssm.pojo.Product;
import com.ahpu.ssm.pojo.User;

import java.util.List;

public interface UserService {

	void addUser(User user);

	boolean findUserByUsernameAndPassword(User user);
	boolean updatepwd(User user);
	void insetcart(Cart cart);
	List<Cart> findCart(User user);
	boolean isIncart(Cart cart);
	void updateCart(Cart cart);
	void deleteproduct(String cid);
	void deletecar(User user);

}
