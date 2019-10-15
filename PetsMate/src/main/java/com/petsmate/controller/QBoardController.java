package com.petsmate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petsmate.service.QBoardService;
import com.petsmate.dto.QBoardDto;
import com.petsmate.domain.QBoardForm;

@Controller
@RequestMapping(value = "/qboard")
public class QBoardController {
	@Autowired
	private QBoardService qboardService;
	
	@RequestMapping(value="/qboardList")
	public String getQBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			return "qboard/qboardList";
	}
	
	@RequestMapping(value="/getQBoardList")
	@ResponseBody
	public List<QBoardDto> getQBoardList(HttpServletRequest request, HttpServletResponse response, QBoardForm qboardForm) throws Exception{
		List<QBoardDto> qboardList = qboardService.getQBoardList(qboardForm);
		
		return qboardList;
	}
}
