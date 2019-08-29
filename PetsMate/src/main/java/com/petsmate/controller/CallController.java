package com.petsmate.controller;

import java.sql.Timestamp;

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
import com.petsmate.dto.GuestVO;
import com.petsmate.service.CallService;
import com.petsmate.service.DriverService;
import com.petsmate.service.GuestService;
import com.petsmate.service.PetService;

@Controller
@RequestMapping("/")
public class CallController {
	
	private static final Logger logger = LoggerFactory.getLogger(CallController.class);
	
	@Inject
	private CallService callService;
	@Inject
	private CallPetDAO callPetDAO;
	

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
				Timestamp startTime = MainController.pickerToTimestamp(startTimeStr);
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
			shuttleVO.setStart_time(MainController.pickerToTimestamp(shuttleTimeStr));
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
	

}
