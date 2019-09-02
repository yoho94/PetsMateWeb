package com.petsmate.controller;

import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.petsmate.dto.CallVO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetList;
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
	
	
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String login(GuestVO vo, HttpServletRequest req, Model model) throws Exception {
		logger.info("로그인 버튼 클릭");
		
		HttpSession session = req.getSession();
		GuestVO loginGuest = guestService.login(vo);
		
		
		
		
		if(loginGuest == null) {
			session.setAttribute("guest", null);
			session.setAttribute("petList", null);
			session.setAttribute("callList", null);
			
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다."); 
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		else {
			List<PetVO> loginPet = petService.login(vo);
			List<CallVO> loginCall = callService.login(vo);
			
			session.setAttribute("guest", loginGuest);
			session.setAttribute("petList", loginPet);
			session.setAttribute("callList", loginCall);
			
			model.addAttribute("msg", "로그인 성공 !"); 
			model.addAttribute("url", "/");
			
			return "alert";
		}
	}
	
	@RequestMapping("/login/signup")
	public void doSignup(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.invalidate();
		logger.info("회원가입 폼 페이지");
	}
	
	@RequestMapping("/login/signupSNS")
	public String doSignup(){
		logger.info("SNS 회원가입 폼 페이지");
		
		return "login/signup";
	}
	
	@RequestMapping(value = "/login/signup/action", method = RequestMethod.POST)
	public String signup(GuestVO vo, HttpServletRequest req, Model model) throws Exception {
		logger.info("회원가입 버튼 클릭");
		HttpSession session = req.getSession();
		String pw1 = req.getParameter("password1");
		String pw2 = req.getParameter("password2");
		boolean isNaver = Boolean.parseBoolean(req.getParameter("isNaver"));
		if(isNaver) {
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 20; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			}
			
			vo.setPassword(temp.toString());
		}
		else
			vo.setPassword(pw1);
		
		if(vo.getName() == null || vo.getName().equals("") ||
				vo.getId() == null || vo.getId().equals("") ||
				vo.getPhone() == null || vo.getPhone().equals("") ||
				vo.getPassword() == null || vo.getPassword().equals("")) {
			model.addAttribute("msg", "비어있는 값이 있으면 안됩니다. 양식을 모두 채워주세요."); 
			model.addAttribute("url", "/login/signup");
			
			return "alert";
		}
		
		if(!isNaver)
		if(!pw1.equals(pw2)) {
			model.addAttribute("msg", "비밀번호를 확인해주세요."); 
			model.addAttribute("url", "/login/signup");
			
			return "alert";
		}
		
		if(!Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", vo.getPhone())) {
			model.addAttribute("msg", "올바른 핸드폰 번호가 아닙니다. -없이 기입해주세요.");
			model.addAttribute("url", "/login/signup");
			
			return "alert";
		}
		
		if(guestService.findId(vo)) { // TODO 따로 버튼 만들어서 빼기.
			model.addAttribute("msg", "중복된 아이디가 있습니다."); 
			model.addAttribute("url", "/login/signup");
			
			return "alert";
		}
		
		guestService.signup(vo);
		
		model.addAttribute("msg", "회원가입 성공 !"); 
		model.addAttribute("url", "/login/signupPet");
		session.setAttribute("guest", vo);
		
		
				
		return "alert";
	}
	@RequestMapping("/login/signupPet")
	public void doSignupPet(GuestVO vo, Model model) {
		logger.info("회원가입 (PET) 폼 페이지"); 
	}
	
	@RequestMapping(value = "/login/signupPet/action", method = RequestMethod.POST)
	public String doSignupPetAction(PetList petList, Model model, HttpServletRequest req) throws Exception{
		logger.info("회원가입 (PET) Action");
		
		for(PetVO vo : petList.getPetList()) {
			if(vo.getId() == null || vo.getId().equals("") ||
					vo.getName() == null || vo.getName().equals("") ||
					vo.getWeight() <= 0) {
				model.addAttribute("msg", "이름, 무게는 값이 비어있으면 안됩니다."); 
				model.addAttribute("url", "/login/signupPet");
				
				return "alert";
			}
		}
		
		for(PetVO vo : petList.getPetList())
			petService.signup(vo);
		
		model.addAttribute("msg", "펫 추가 성공 !"); 
		model.addAttribute("url", "/");
		
		HttpSession session = req.getSession();
		GuestVO vo = (GuestVO) session.getAttribute("guest");
		if(vo != null) {
			List<PetVO> loginPet = petService.login(vo);
			session.setAttribute("petList", loginPet);
		}
		
		return "alert";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) { // TODO 로그아웃 안내 메시지 넣기
		logger.info("로그아웃");
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "/logout";
	}
	
}
