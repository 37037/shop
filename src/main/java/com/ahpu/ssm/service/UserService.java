package com.ahpu.ssm.service;

import com.ahpu.ssm.pojo.*;

import java.util.List;

public interface UserService {

	void addUser(User user);
	boolean adminLogin(admin admin);
	boolean findUserByUsernameAndPassword(User user);
	boolean updatepwd(User user);
	void insetcart(Cart cart);
	List<Cart> findCart(User user);
	boolean isIncart(Cart cart);
	void updateCart(Cart cart);
	void deleteproduct(String cid);
	void deletecar(User user);
	void addnotice(notice notice);
	notice find();
	List<notice> findnotice();
	void deletenotice(String nid);
	boolean haveusername(String username);
	void deletebycid(String cid);
	void add(Address a);
	List<Address> getlist(User user);
	void deleteaid(String aid);
	PageBean listUser(int curPage);
	void deleteuser(String uid);
	User finduser(String username);
	void updatemessage(User user);

}
