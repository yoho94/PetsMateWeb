package com.petsmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.petsmate.dto.ChatVO;
import com.petsmate.service.ChatService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Inject
	ChatService service;
	
	@RequestMapping("/")
	public String chatMain() {
		logger.info("채팅 메인화면");
		return "/chat/chat_main";
	}	
	
	@RequestMapping("/chat_main")
	public String chatMain1() {
		logger.info("채팅 메인화면");
		return "/chat/chat_main";
	}
	
	@RequestMapping("/chat_room")
	public String chatRoom() {
		logger.info("채팅방 화면");
		return "/chat/chat_room";
	}
	
	// 채팅장 입장 get
	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public void getEnter() throws Exception {
		logger.info("get enter");
		
	}
	
	//채팅창 입장 post
	@RequestMapping(value = "/enter", method =RequestMethod.POST)
	public String postEnter(ChatVO vo) throws Exception {
		logger.info("post enter");
		logger.info(vo.toString());
		service.enter(vo);
		
		return "redirect:/chat/chat_main";
	}
	
	//채팅방 목록
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("get list");
		List<ChatVO> list = service.list();
		
		model.addAttribute("list",list);
	
	}
	
	//채팅방 삭제  GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("CHATID") int CHATID, Model model) throws Exception {
		logger.info("get delete");

		model.addAttribute("delete", CHATID);

	}
	
	//채팅방삭제  POST
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String postDelete(@RequestParam("CHATID") int CHATID) throws Exception {
			logger.info("post delete");

			service.delete(CHATID);

			return "redirect:/chat/chat_main";
		}
		
		//채팅방 나가기 get
		@RequestMapping(value ="/quit", method = RequestMethod.GET)
		public void getQuit() throws Exception {
			logger.info("get quit");

		}
		
		//채팅방 나가기 post
		//@RequestMapping(value ="/quit", method = RequestMethod.POST)
		//public String postQuit(ChatVO vo) throws Exception {
			//logger.info("post quit");
			//logger.info(vo.toString());
			//service.quit(vo);
			
			//return "redirect:/chat/list";
			
		//}
		
		//채팅 전송하기 get
		//@RequestMapping(value="/forward", method = RequestMethod.GET)
		//public void getForward() throws Exception {
			//logger.info("get forward");
		//}
		
		//채팅 전송하기 post
		//@RequestMapping(value ="/forward", method = RequestMethod.POST)
		//public String postForward(ChatVO vo) throws Exception {
			//logger.info("post forward");
			//logger.info(vo.toString());
			//service.forward(vo);
			
			//return "redirect:/chat/room";
		//}
	
	

}
