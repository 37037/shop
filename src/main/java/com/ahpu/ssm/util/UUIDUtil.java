package com.ahpu.ssm.util;

import java.util.UUID;



public class UUIDUtil {

	public static String getUUId() {
		
		return UUID.randomUUID().toString().replace("-", "");
		
		
	//	return null;
	}
	
}
