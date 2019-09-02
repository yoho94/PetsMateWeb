package com.petsmate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class IotController {
	
	private static final Logger logger = LoggerFactory.getLogger(IotController.class);
	
	@RequestMapping("/iot")
	public void doIot() {
		logger.info("doiot");
	}
}
