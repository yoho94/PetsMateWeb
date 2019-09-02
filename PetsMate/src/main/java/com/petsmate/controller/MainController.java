package com.petsmate.controller;

import java.sql.Timestamp;
import java.util.Arrays;
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

import com.petsmate.dao.CallPetDAO;
import com.petsmate.dto.CallPetVO;
import com.petsmate.dto.CallVO;
import com.petsmate.dto.DriverVO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.PetList;
import com.petsmate.dto.PetVO;
import com.petsmate.service.CallService;
import com.petsmate.service.DriverService;
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
	@Inject
	private DriverService driverService;
	@Inject
	private CallPetDAO callPetDAO;

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
	
	@RequestMapping("/home")
	public String doHome2() {
		return "home";
	}
	
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
	
	@RequestMapping("/mypage")
	public String doMypage(HttpServletRequest req, Model model) throws Exception{
		logger.info("마이페이지");
		
		HttpSession session = req.getSession();
		GuestVO vo = (GuestVO)session.getAttribute("guest");
		
		if(vo == null) {
			model.addAttribute("msg", "로그인을 해주세요."); 
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		
		List<DriverVO> driverList = driverService.selectDriver();
		List<CallVO> loginCall = callService.login(vo);
		
		session.setAttribute("driverList", driverList);
		session.setAttribute("callList", loginCall);
		
		return "/mypage";
	}
	
	@RequestMapping(value = "/mypage/action", method = RequestMethod.POST)
	public String doMypagePetAction(PetList petList, Model model, HttpServletRequest req) throws Exception{
		logger.info("마이페이지 (PET) Action");
		
		HttpSession session = req.getSession();
		GuestVO guestVO = (GuestVO) session.getAttribute("guest");
		
		if(guestVO == null) {
			model.addAttribute("msg", "로그인을 하셔야 이용할 수 있습니다."); 
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		
		for(PetVO vo : petList.getPetList()) {
			if(vo.getId() == null || vo.getId().equals("") ||
					vo.getName() == null || vo.getName().equals("") ||
					vo.getWeight() <= 0) {
				model.addAttribute("msg", "이름, 무게는 값이 비어있으면 안됩니다."); 
				model.addAttribute("url", "/mypage");
				
				return "alert";
			}
		}
		
		
		
		List<PetVO> newListPet = petList.getPetList();
		List<PetVO> oldListPet = petService.login(guestVO);
		
		int del = oldListPet.size() - newListPet.size();
		
		if(del > 0) {
			for(int i=0; i<del; i++) {
				int delIndex = (oldListPet.size() - i);
				PetVO vo = oldListPet.get(delIndex-1);
				petService.deleteOne(vo);
			}			
			
			for(int i=0; i<newListPet.size(); i++) {
				PetVO vo = newListPet.get(i);
				vo.setPet_code(oldListPet.get(i).getPet_code());
				petService.update(vo);
			}

		} else {
			for(int i=0; i<Math.abs(del); i++) {
				int addIndex = newListPet.size() - i;
				PetVO vo = newListPet.get(addIndex-1);
				petService.signup(vo);
			}
			
			for(int i=0; i<newListPet.size() - Math.abs(del); i++) {
				PetVO vo = newListPet.get(i);
				vo.setPet_code(oldListPet.get(i).getPet_code());
				petService.update(vo);
			}
		}
		

			
		
//		petService.delete(guestVO);
//		
//		for(PetVO vo : petList.getPetList()) {
//				petService.signup(vo);
//			
//		}
		
		model.addAttribute("msg", "펫 수정 성공 !"); 
		model.addAttribute("url", "/mypage");
		
		
		List<PetVO> loginPet = petService.login(guestVO);
		session.setAttribute("petList", loginPet);
		
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
	
	@RequestMapping("/call")
	public String doCall(HttpServletRequest req, Model model) {
		logger.info("콜 페이지");
		HttpSession session = req.getSession();
		GuestVO vo = (GuestVO) session.getAttribute("guest");
		
		if(vo == null) {
			model.addAttribute("msg", "로그인 하셔야 이용가능합니다."); 
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		
		
		return "/call";
	}
	
	@RequestMapping("/call/map")
	public String doCallMap() {
		logger.info("callMap 페이지");
		return "/call/call_map";
	}
	
	@RequestMapping("/iot2")
	public String doIot() {
		logger.info("iot 페이지 진입");
		return "/iot";
	}
	
	@RequestMapping(value = "/call/action", method = RequestMethod.POST)
	public String doCallAction(Model model, CallVO vo, HttpServletRequest req) throws Exception {
		logger.info("콜 액션");
		
		HttpSession session = req.getSession();
		GuestVO guestVo = (GuestVO) session.getAttribute("guest");
		
		if(guestVo == null) {
			model.addAttribute("msg", "로그인 하셔야 이용가능합니다."); 
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		
		logger.info(req.getParameter("shuttle_time")); // TODO ..
		
		String start = vo.getStart_latitude();
		String des = vo.getDestination_latitude();
		
		if(start == null || start.isEmpty() || des == null || des.isEmpty()) {
			model.addAttribute("msg", "출발지, 도착지 모두 선택해주세요."); 
			model.addAttribute("url", "/call");
			
			return "alert";
		}
		
		vo.setGuest_id(guestVo.getId());
//		vo.setStart_time(new Timestamp(System.currentTimeMillis()));
		vo.setCode(0);
		logger.info(vo.toString());
		
		if(vo.isIs_call()) {
			vo.setStart_time(new Timestamp(System.currentTimeMillis()));
		} else {
			String startTimeStr = req.getParameter("re_time");
			if(startTimeStr == null) {
				model.addAttribute("msg", "예약 시간을 선택해주세요."); 
				model.addAttribute("url", "/call");
				
				return "alert";
			} else {
				Timestamp startTime = pickerToTimestamp(startTimeStr);
//				logger.info("스타트 타임 : "+startTime.toString());
				vo.setStart_time(startTime);
			}
		}
		
		if(vo.isIs_shuttle()) {
			String shuttleTimeStr = req.getParameter("shuttle_time");
			if(shuttleTimeStr == null) {
				model.addAttribute("msg", "왕복 시간을 선택해주세요."); 
				model.addAttribute("url", "/call");
				
				return "alert";
			}
			
			CallVO shuttleVO = new CallVO();
			shuttleVO.setCode(0);
			shuttleVO.setStart_time(pickerToTimestamp(shuttleTimeStr));
			shuttleVO.setDestination_latitude(vo.getStart_latitude());
			shuttleVO.setDestination_longitude(vo.getStart_longitude());
			shuttleVO.setGuest_count(vo.getGuest_count());
			shuttleVO.setGuest_id(vo.getGuest_id());
			shuttleVO.setIs_shuttle(true);
			shuttleVO.setIs_call(false);
			shuttleVO.setPlace_addr(vo.getPlace_addr_start());
			shuttleVO.setPlace_addr_start(vo.getPlace_addr());
			shuttleVO.setPlace_name(vo.getPlace_name_start());
			shuttleVO.setPlace_name_start(vo.getPlace_name());
			shuttleVO.setPs(vo.getPs());
			shuttleVO.setStart_latitude(vo.getDestination_latitude());
			shuttleVO.setStart_longitude(vo.getDestination_longitude());
			
			callService.insert(vo);
			callService.insert(shuttleVO);
			
			vo.setShuttle_code(shuttleVO.getSerial_number());
			shuttleVO.setShuttle_code(vo.getSerial_number());
			
			callService.updateShuttle(vo);
			callService.updateShuttle(shuttleVO);
			
			String[] arrayPetCode = req.getParameterValues("pet_code");
			
			if(arrayPetCode != null) {
//				logger.info("pet_code = " + Arrays.toString(arrayPetCode));
				for(int i=0; i<arrayPetCode.length; i++) {
					CallPetVO callPetVO = new CallPetVO();
					
					callPetVO.setSerial_number(shuttleVO.getSerial_number());
					callPetVO.setId(vo.getGuest_id());
					callPetVO.setPet_code(Integer.parseInt(arrayPetCode[i]));
					
					callPetDAO.insert(callPetVO);
				}
			}
			
		} else {
			int temp = callService.insert(vo);
			
	//		logger.info("시리얼 넘버 : "+vo.getSerial_number());
	//		logger.info("temp : "+temp);
		}
		
		String[] arrayPetCode = req.getParameterValues("pet_code");
		
		if(arrayPetCode != null) {
//			logger.info("pet_code = " + Arrays.toString(arrayPetCode));
			for(int i=0; i<arrayPetCode.length; i++) {
				CallPetVO callPetVO = new CallPetVO();
				
				callPetVO.setSerial_number(vo.getSerial_number());
				callPetVO.setId(vo.getGuest_id());
				callPetVO.setPet_code(Integer.parseInt(arrayPetCode[i]));
				
				callPetDAO.insert(callPetVO);
			}
		}
		
		model.addAttribute("msg", "콜 요청 성공 !"); 
		model.addAttribute("url", "/");
		
		return "alert";
	}
	
	
	public Timestamp pickerToTimestamp(String str) {
		Timestamp time = null;

		int year = Integer.parseInt(str.substring(0, 4)) - 1900;
		int month = Integer.parseInt(str.substring(5,7)) - 1;
		int date = Integer.parseInt(str.substring(8, 10));
		int hour = 0;
		int minute = Integer.parseInt(str.substring(18,20));
		
		if(str.substring(12, 14).equalsIgnoreCase("AM")) {
			hour = Integer.parseInt(str.substring(15, 17));
		} else {
			hour = Integer.parseInt(str.substring(15, 17)) + 12;
		}
		
		return new Timestamp(year, month, date, hour, minute, 0, 0);
	}

}
