package com.petsmate.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.petsmate.dao.ChatDAO;
import com.petsmate.dto.ChatRoomVO;
import com.petsmate.dto.ChatVO;
import com.petsmate.dto.GuestVO;
import com.petsmate.dto.MessageVO;
import com.petsmate.service.ChatService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Inject
	ChatService service;
	@Inject
	ChatDAO chatDAO;

	@RequestMapping("/chat_main")
	public String chatMain() {
		logger.info("채팅 메인화면");
		return "/chat/chat_main";
	}
	
	@RequestMapping("/note")
	public String note() {
		logger.info("연습");
		return "/chat/note";
	}
	
	
	
	@RequestMapping("/chatpractice")
	public String chatpractice() {
		logger.info("채팅 연습화면");
		return "/chat/chatpractice";
	}
	/*
	public class ChatWebSocketHandler extends TextWebSocketHandler {

		@Inject
		private ChatDAO dao;

		private List<WebSocketSession> connectedUsers;

		public ChatWebSocketHandler() {
		      connectedUsers = new ArrayList<WebSocketSession>();
		   }

		private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

		public void afterConnectionEstablished(

				WebSocketSession session) throws Exception {

			log(session.getId() + " 연결 됨!!");

			users.put(session.getId(), session);
			connectedUsers.add(session);
		}

		public void afterConnectionClosed(

				WebSocketSession session, CloseStatus status) throws Exception {

			log(session.getId() + " 연결 종료됨");
			connectedUsers.remove(session);
			users.remove(session.getId());

		}


		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


			System.out.println(message.getPayload());

			  Map<String, Object> map = null;

		      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());

		      System.out.println("1 : " + messageVO.toString());


		      ChatRoomVO roomVO  = new ChatRoomVO();
		     // roomVO.setclassID(messageVO.getclass_ID()); //클래스
		     // roomVO.setdriverID(messageVO.getdriverID()); //드라이버
		     // roomVO.setUSER_user_id(messageVO.getUSER_user_id()); //유저

		      ChatRoomVO croom =null;
		      if(!messageVO.getUSER_user_id().equals(messageVO.getDRIVER_driver_id())) {
		    	  System.out.println("a");



		    	  if(dao.isRoom(roomVO) == null ) {
		    		  System.out.println("b");
		    		  dao.createRoom(roomVO);
		    		  System.out.println("d");
		    		  croom = dao.isRoom(roomVO);

		    	  }else {
		    		  System.out.println("C");
		    		  croom = dao.isRoom(roomVO);
		    	  }
		      }else {

	    		  croom = dao.isRoom(roomVO);
	    	  }

		      messageVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
		      if(croom.getUSER_user_id().equals(messageVO.getMessage_sender())) {

		    	  messageVO.setMessage_receiver(roomVO.getDRIVER_USER_user_id());
		      }else {
		    	  messageVO.setMessage_receiver(roomVO.getUSER_user_id());
		      }




		      for (WebSocketSession websocketSession : connectedUsers) {
		         map = websocketSession.getAttributes();
		         GuestVO login = (GuestVO) map.get("login");

		         //받는사람
		         if (login.getId().equals(messageVO.getMessage_sender())) {

		            Gson gson = new Gson();
		            String msgJson = gson.toJson(messageVO);
		            websocketSession.sendMessage(new TextMessage(msgJson));
		         }


		      }
		   }

		@Override

		public void handleTransportError(

				WebSocketSession session, Throwable exception) throws Exception {

			log(session.getId() + " 익셉션 발생: " + exception.getMessage());

		}

		private void log(String logmsg) {

			System.out.println(new Date() + " : " + logmsg);

		}

	}
/*
	@RequestMapping(value = "/chat_main", method = RequestMethod.GET)
	public String chatMain1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("채팅 메인화면");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset =UTF-8");
		String fromID = request.getParameter("fromID");
		String toID = request.getParameter("toID");
		String listType = request.getParameter("listType");

		if (fromID == null || fromID.equals("") || toID == null || toID.equals("") || listType == null
				|| listType.equals("")) {
			logger.info("채팅 메인 화면 : null");
			response.getWriter().write("");
		}

		else if (listType.equals("ten"))
			response.getWriter().write(getTen(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8")));
		else {
			try {
				response.getWriter()
						.write(getID(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"), listType));
			}

			catch (Exception e) {
				response.getWriter().write("");
			}
		}

		return "/chat/chat_main";
	}

	@RequestMapping(value = "/chat_main", method = RequestMethod.POST)
	public String chatMain2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("채팅 메인화면");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset =UTF-8");
		String fromID = request.getParameter("fromID");
		String toID = request.getParameter("toID");
		String listType = request.getParameter("listType");

		if (fromID == null || fromID.equals("") || toID == null || toID.equals("") || listType == null
				|| listType.equals("")) {
			logger.info("채팅 메인 화면 : null");
			response.getWriter().write("");
		}

		else if (listType.equals("ten"))
			response.getWriter().write(getTen(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8")));
		else {
			try {
				response.getWriter()
						.write(getID(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"), listType));
			}

			catch (Exception e) {
				response.getWriter().write("");
			}
		}

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

	// 채팅창 입장 post
	@RequestMapping(value = "/enter", method = RequestMethod.POST)
	public String postEnter(ChatVO vo) throws Exception {
		logger.info("post enter");
		logger.info(vo.toString());
		service.enter(vo);

		return "redirect:/chat/chat_main";
	}

	// 채팅방 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("get list");
		List<ChatVO> list = service.list();

		model.addAttribute("list", list);

	}

	// 채팅방 삭제 GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("CHATID") int CHATID, Model model) throws Exception {
		logger.info("get delete");

		model.addAttribute("delete", CHATID);

	}

	// 채팅방삭제  POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("CHATID") int CHATID) throws Exception {
		logger.info("post delete");

		service.delete(CHATID);

		return "redirect:/chat/chat_main";
	}

	// 채팅방 나가기 get
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public void getQuit() throws Exception {
		logger.info("get quit");

	}

//		public String getTen(String fromID, String toID) {
	/*
	public String getTen(String fromID, String toID) throws Exception {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
//			ChatDAO chatDAO = new ChatDAO();
//			ArrayList<ChatDTO> chatList = chatDAO.getChatListByRecent(fromID, toID, 10);
		ChatVO vo = new ChatVO();
		vo.setFROMID(fromID);
		vo.setTOID(toID);
		vo.setCHATID(10);
		ArrayList<ChatVO> chatList = new ArrayList<>(chatDAO.getChatListByID(vo));

		if (chatList.size() == 0)
			return "";
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getFROMID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getTOID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getCHATCONTENT() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getCHATTIME() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getCHATID() + "\"}");
		return result.toString();
	}

	public String getID(String fromID, String toID, String chatID) throws Exception {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
//		ChatDAO chatDAO = new ChatDAO();
		
		ChatVO vo = new ChatVO();
		vo.setFROMID(fromID);
		vo.setTOID(toID);
		vo.setCHATID(Integer.parseInt(chatID));
		
		ArrayList<ChatVO> chatList = new ArrayList<>(chatDAO.getChatListByID(vo));
		if (chatList.size() == 0)
			return "";
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getFROMID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getTOID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getCHATCONTENT() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getCHATTIME() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getCHATID() + "\"}");
		return result.toString();
	}

	// 채팅방 나가기 post
	// @RequestMapping(value ="/quit", method = RequestMethod.POST)
	// public String postQuit(ChatVO vo) throws Exception {
	// logger.info("post quit");
	// logger.info(vo.toString());
	// service.quit(vo);

	// return "redirect:/chat/list";

	// }

	// 채팅 전송하기 get
	// @RequestMapping(value="/forward", method = RequestMethod.GET)
	// public void getForward() throws Exception {
	// logger.info("get forward");
	// }

	// 채팅 전송하기 post
	// @RequestMapping(value ="/forward", method = RequestMethod.POST)
	// public String postForward(ChatVO vo) throws Exception {
	// logger.info("post forward");
	// logger.info(vo.toString());
	// service.forward(vo);

	// return "redirect:/chat/room";
	// }
*/
}
