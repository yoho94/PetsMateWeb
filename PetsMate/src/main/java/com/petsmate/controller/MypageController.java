package com.petsmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private PetService petService;
	@Inject
	private CallService callService;
	@Inject
	private DriverService driverService;
	
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
}
