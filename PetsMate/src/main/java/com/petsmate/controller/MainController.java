package com.petsmate.controller;

import java.sql.Timestamp;
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
import com.petsmate.dao.ChatDAO;
import com.petsmate.dto.CallPetVO;
import com.petsmate.dto.CallVO;
import com.petsmate.dto.ChatVO;
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

	@RequestMapping("/")
	public String doHome() {
		logger.info("홈 페이지");
		return "home";
	}
	
	@RequestMapping("/home")
	public String doHome3() {
		logger.info("홈 페이지");
		return "home";
	}
	
	public String doHome2() {
		logger.info("홈 페이지");
		return "home";
	}
	
	@RequestMapping("/priceinfo")
	public String priceinfo() {
		logger.info("가격안내");
		return "priceinfo";
	}
	
	@RequestMapping("/intro")
	public String intro() {
		logger.info("펫택시소개");
		return "intro";
	}
	
	public static Timestamp pickerToTimestamp(String str) {
		
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
