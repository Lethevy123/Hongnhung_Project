package com.Login.service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookiService {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse respose;
	
	public Cookie create(String name, String value, int days) {
		String encodeValue = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodeValue);
		cookie.setMaxAge(days*24*60*60);
		cookie.setPath("/");
		respose.addCookie(cookie);
		return cookie; 
	}
	
	public Cookie read(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					String decodedValue = new String(Base64.getDecoder().decode(cookie.getValue()));
					cookie.setValue(decodedValue);
					return cookie;
				}
			}
		}
		return null;
	}	
	
	public void delete(String name) {
		this.create(name, "" , 0);
	}
}
