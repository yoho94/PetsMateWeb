package com.petsmate.controller;

import java.util.List;
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
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private GuestService guestService;
	@Inject
	private PetService petService;
	@Inject
	private CallService callService;

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
	@RequestMapping("/mypage")
	public void doMypage(HttpServletRequest req) throws Exception{
		logger.info("마이페이지");
	}
	
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String login(GuestVO vo, HttpServletRequest req, Model model) throws Exception { // TODO 로그인 안내 메시지 넣기
		logger.info("로그인 버튼 클릭");
		
		HttpSession session = req.getSession();
		GuestVO loginGuest = guestService.login(vo);
		List<PetVO> loginPet = petService.login(vo);
		List<CallVO> loginCall = callService.login(vo);
		
		
		if(loginGuest == null) {
			session.setAttribute("guest", null);
			session.setAttribute("petList", null);
			session.setAttribute("callList", null);
		}
		else {
			session.setAttribute("guest", loginGuest);
			session.setAttribute("petList", loginPet);
			session.setAttribute("callList", loginCall);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/login/signup")
	public void doSignup(){
		logger.info("회원가입 폼 페이지");
	}
	
	@RequestMapping(value = "/login/signup/action", method = RequestMethod.POST)
	public String signup(GuestVO vo, HttpServletRequest req, Model model) throws Exception {
		logger.info("회원가입 버튼 클릭");
		HttpSession session = req.getSession();
		String pw1 = req.getParameter("password1");
		String pw2 = req.getParameter("password2");
		vo.setPassword(pw1);
		
		if(vo.getName() == null || vo.getName().equals("") ||
				vo.getId() == null || vo.getId().equals("") ||
				vo.getPhone() == null || vo.getPhone().equals("") ||
				vo.getPassword() == null || vo.getPassword().equals("")) {
			model.addAttribute("msg", "비어있는 값이 있으면 안됩니다. 양식을 모두 채워주세요."); 
			model.addAttribute("url", "/login/signup");
			
			return "alert";
		}
		
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
		
		return "redirect:/";
	}
	
	@RequestMapping("/call")
	public void doCall() {
		logger.info("콜 페이지");
	}
	

}
