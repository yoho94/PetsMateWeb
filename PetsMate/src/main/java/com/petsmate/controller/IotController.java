package com.petsmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petsmate.dao.IotDAO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.IotVO;

@Controller
public class IotController {
	
	private static final Logger logger = LoggerFactory.getLogger(IotController.class);
	
	@Inject
	private IotDAO iotDAO;
	
	@RequestMapping("/iot")
	public String doIot(HttpSession session, Model model) throws Exception {
		logger.info("IoT 페이지");
//		HttpSession session = req.getSession();
		GuestVO vo = (GuestVO) session.getAttribute("guest");
		
		if(vo == null) {
			model.addAttribute("msg", "로그인 하셔야 이용가능합니다."); 
			model.addAttribute("url", "/login");
			
			return "alert";
		}
		
		List<IotVO> iots = iotDAO.select(vo);
		
		model.addAttribute("iots", iots);
		
		return "/iot";
	}
}
