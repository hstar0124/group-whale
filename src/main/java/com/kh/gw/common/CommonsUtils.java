package com.kh.gw.common;

import java.util.UUID;

public class CommonsUtils {

	public static String getRandomString() {
		
		//랜덤한 32비트의 문자열을 생성해 준다.
		return UUID.randomUUID().toString().replace("-", "");
	}
	
}
