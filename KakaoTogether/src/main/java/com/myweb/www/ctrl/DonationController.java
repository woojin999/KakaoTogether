package com.myweb.www.ctrl;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;
import com.myweb.www.service.DonationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/donation/*")
@Controller
public class DonationController {
	@Inject
	private DonationService dsv;
	
	@Inject
	private BoardService bsv;
	
	@GetMapping("/register")
	public void register(Model model, @RequestParam("bno") long bno) {
		BoardDTO bdto = bsv.getDetail(bno);
		model.addAttribute("pdto", bdto);
	}
	
	@PostMapping("/register")
	public String register(DonationVO dvo, RedirectAttributes rttr) {
		int isUp = dsv.register(dvo); 
		log.info(">>> DonationController > register > {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/board/detail?bno=" + dvo.getBno();
	}
	
	@GetMapping(value = "/{bno}/{pageNo}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<PagingHandler> spread(@PathVariable("bno") long bno,
			@PathVariable("pageNo") int pageNo) {
		log.info(">>> DonationController > list - GET");
		PagingVO pgvo = new PagingVO(pageNo, 10);
		return new ResponseEntity<PagingHandler>(dsv.spread(bno, pgvo), HttpStatus.OK);
	}
}













