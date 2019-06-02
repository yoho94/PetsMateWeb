package com.petsmate.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.petsmate.dto.GuestVO;
import com.petsmate.service.GuestService;

@Controller
@RequestMapping("/")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private GuestService guestService;

	@RequestMapping("/test")
	public void doA() {
		logger.info("test 실행..........");
	}
	
	@RequestMapping("/test2")
	public void doTest2() {
		logger.info("테스트 실행 !");
	}
	
	@RequestMapping("/")
	public String doHome() {
		return "home";
	}
	
	@RequestMapping("/login")
	public void doLogin() {
		logger.info("로그인 폼 페이지");
	}
	
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String login(GuestVO vo, HttpServletRequest req) throws Exception { // TODO 로그인 안내 메시지 넣기
		logger.info("로그인 버튼 클릭");
		
		HttpSession session = req.getSession();
		GuestVO login = guestService.login(vo);
		
		if(login == null)
			session.setAttribute("guest", null);
		else
			session.setAttribute("guest", login);
		
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) { // TODO 로그아웃 안내 메시지 넣기
		logger.info("로그아웃");
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "redirect:/";
	}

}
