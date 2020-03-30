package com.ahpu.ssm.service;

import com.ahpu.ssm.pojo.User;

public interface UserService {

	void addUser(User user);

	boolean findUserByUsernameAndPassword(User user);

}
