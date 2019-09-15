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
import com.petsmate.domain.BoardVO;
import com.petsmate.domain.Criteria;
import com.petsmate.domain.PageMaker;
import com.petsmate.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;

	@RequestMapping("/")
	public String boardMain() {
		logger.info("게시판 메인화면");
		return "/board/main";
	}

	// 글 작성 get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
		logger.info("get write");
	}

	// 글 작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void postWrite(BoardVO vo) throws Exception {
		logger.info("post write");
		logger.info(vo.toString());
		service.write(vo);

	}

	// 글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("get read");

		BoardVO vo = service.read(bno);

		model.addAttribute("read", vo);

	}

	@RequestMapping("/board/list")
	public String boardMain2() {
		logger.info("게시판 메인화면");
		return "/board/main";
	}

	// 글 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("get list");

		List<BoardVO> list = service.list();

		model.addAttribute("list", list);

	}

	// 글 수 정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("get modify");

		BoardVO vo = service.read(bno);

		model.addAttribute("modify", vo);

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model) throws Exception {
		logger.info("get delete");

		model.addAttribute("delete", bno);

	}

	// 글 수정  POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void postModify(BoardVO vo) throws Exception {
		logger.info("post modify");

		service.update(vo);


	}

	// 글 삭제  POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void postDelete(@RequestParam("bno") int bno) throws Exception {
		logger.info("post delete");

		service.delete(bno);

		
	}

	// 글 목록 + 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
	 logger.info("get list page");
	 
	 List<BoardVO> list = service.listPage(cri);
	 model.addAttribute("list", list);
	 
	 PageMaker pageMaker = new PageMaker();
	 pageMaker.setCri(cri);
	 pageMaker.setTotalCount(service.listCount());
	 model.addAttribute("pageMaker", pageMaker);
	 
	}

}