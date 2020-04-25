package com.ahpu.ssm.mapper;

import com.ahpu.ssm.pojo.*;

import java.util.List;

public interface UserMapper {

	void addUser(User user);
	int adminLogin(admin admin);

	int findUserByUsernameAndPassword(User user);
	boolean updatepwd(User user);
	void insercart(Cart cart);
	List<Cart> findCart(User user);
	int isIncart(Cart cart);
	void updateCart(Cart cart);
	void deleteproduct( String cid);
	void deletecar(User user);
	void addnotice(notice notice);
	notice find();
	int haveusername(String s);
	void deletebycid(String cid);
	void add(Address a);
	List<Address> getlist(User user);
	void deleteaid(String aid);





}
