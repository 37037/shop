package com.ahpu.ssm.mapper;

import com.ahpu.ssm.pojo.User;

public interface UserMapper {

	void addUser(User user);

	int findUserByUsernameAndPassword(User user);

}
