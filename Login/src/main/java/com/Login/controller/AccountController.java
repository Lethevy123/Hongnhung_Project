package com.Login.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Login.bean.MailInfo;
import com.Login.dao.CustomerDAO;
import com.Login.entity.Customer;
import com.Login.service.CookiService;
import com.Login.service.MailService;

@Controller
public class AccountController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	CookiService cookie;
	
	@Autowired
	MailService mail;
	
	@Autowired
	HttpSession session;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckemail = cookie.read("email");
		Cookie ckpass = cookie.read("pass");
		
		if (ckemail != null && ckpass != null) {
			String email = ckemail.getValue();
			String pass = ckpass.getValue();
			
			model.addAttribute("ueml", email);
			model.addAttribute("upw", pass);
		}

		
		return "account/login";
	}
	
	@PostMapping("/account/login")
	public String login(Model model, 
			@RequestParam("email") String email ,
			@RequestParam("pw") String pw, 
			@RequestParam(name = "rm", defaultValue = "false") boolean rm) {
		Customer customer = customerDAO.findById(email);
		
		if(customer == null) {
			model.addAttribute("msgE", "Please enter a valid email");
		} else if(!pw.equals(customer.getPassword())) {
			model.addAttribute("msgP", "Please enter a valid password");
		} else {
			// Ghi nho tai khoan
			if(rm == true) {
				cookie.create("email", customer.getEmail(), 30);
				cookie.create("pass", customer.getPassword(), 30);
			} else {
				cookie.delete("email");
				cookie.delete("pass");
			}
			return "redirect:/account/login2";
		}
		
		return "account/login";
	}
	@RequestMapping("/account/login2")
	public String login2(Model model) {
		return "account/login2";
	}
	
	@GetMapping("/account/register")
	public String register(Model model) {
		Customer user = new Customer();
		model.addAttribute("form", user);
		return "account/register";
	}
	
	@PostMapping("/account/register")
	public String register(Model model,
			@Valid @ModelAttribute("form") Customer user, 
			@RequestParam("birthDay1") String birthDay1, 
			BindingResult bindingResult) throws ParseException {
		if(bindingResult.hasErrors()) {
			return "account/register";
		} else {
			Customer customer = customerDAO.findById(user.getEmail());
			if(customer != null) {
				model.addAttribute("msgE", "Email already exists");
			} else {
				model.addAttribute("msg", "Sign Up Successfully");
				Date birthDay = dateFormat.parse(birthDay1);
				user.setBirthDay(birthDay);
				customerDAO.create(user);
				}
			return "account/register";
		}
	}
	@GetMapping("/account/forgot")
	public String forgot(Model model) {
		Customer user = new Customer();
		model.addAttribute("form", user);
		return "account/forgot";
	}
	
	@PostMapping("/account/forgot")
	public String forgot(Model model,
			@Valid @ModelAttribute("form") Customer user,  
			BindingResult bindingResult) throws ParseException, MessagingException {
		if(bindingResult.hasErrors()) {
			return "account/forgot";
		} else {
			Customer customer = customerDAO.findById(user.getEmail());
			if(customer == null) {
				model.addAttribute("msgE", "Email is not exists");
			} else {
				model.addAttribute("msg", "Send mail Successfully, please check your email");
				String from = "vylethe@gmail.com";
				String to = user.getEmail();
				String subject = "Welcome";
				String body = "Your Password: " + customer.getPassword();
				MailInfo info = new MailInfo(from, to, subject, body);
				mail.send(info);
			}
			return "account/forgot";
		}
	}
}
