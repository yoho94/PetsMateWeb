package com.petsmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetVO;
import com.petsmate.service.CallService;
import com.petsmate.service.GuestService;
import com.petsmate.service.PetService;

@Controller
@RequestMapping("/")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private GuestService guestService;
	@Inject
	private PetService petService;
	@Inject
	private CallService callService;
	
	@RequestMapping("/login")
	public void doLogin() {
		logger.info("로그인 폼 페이지");
	}
	@RequestMapping("/login/naverLogin")
	public void doNaverLogin() {
		logger.info("네이버 로그인 페이지");
	}
	
	@RequestMapping("/login/naverLogin/action")
	public String doNaverAction(HttpServletRequest req, Model model) throws Exception {
		logger.info("네이버 로그인 액션");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();
		
		if(email != null && !email.isEmpty()) {
			GuestVO vo = new GuestVO();
			GuestVO login = null;
			vo.setId(email);
			boolean isSignup = guestService.findId(vo);
			
			if(isSignup) {
				login = guestService.naverLogin(vo);
				
				List<PetVO> loginPet = petService.login(vo);
				List<CallVO> loginCall = callService.login(vo);
				
				session.setAttribute("guest", login);
				session.setAttribute("petList", loginPet);
				session.setAttribute("callList", loginCall);
				
			} else {
				model.addAttribute("msg", "네이버 아이디로 회원가입이 필요합니다."); 
				model.addAttribute("url", "/login/signupSNS");
				
				return "alert";
			}
		}
		model.addAttribute("msg", "로그인 성공 !"); 
		model.addAttribute("url", "/");
		
		return "alert";
	}
	
	@RequestMapping("/login/facebookLogin")
	public void doFacebookLogin() {
		logger.info("페이스북 로그인 페이지");
	}
	
	@RequestMapping("/login/facebookLogin/action")
	public String doFacebookAction(HttpServletRequest req, Model model) throws Exception {
		logger.info("페이스북 로그인 액션");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		HttpSession session = req.getSession();
		
		if(email != null && !email.isEmpty()) {
			GuestVO vo = new GuestVO();
			GuestVO login = null;
			vo.setId(email);
			boolean isSignup = guestService.findId(vo);
			
			if(isSignup) {
				login = guestService.naverLogin(vo);
				
				List<PetVO> loginPet = petService.login(vo);
				List<CallVO> loginCall = callService.login(vo);
				
				session.setAttribute("guest", login);
				session.setAttribute("petList", loginPet);
				session.setAttribute("callList", loginCall);
				
			} else {
				model.addAttribute("msg", "페이스북 아이디로 회원가입이 필요합니다."); 
				model.addAttribute("url", "/login/signupSNS");
				session.setAttribute("email", email);
				session.setAttribute("name", name);
				
				return "alert";
			}
		}
		model.addAttribute("msg", "로그인 성공 !"); 
		model.addAttribute("url", "/");
		
		return "alert";
	}
	
}
