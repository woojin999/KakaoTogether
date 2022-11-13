package com.myweb.www.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	private MemberService msv;
	
	@RequestMapping(value= "/register" , method = RequestMethod.GET)
	public void register() {
		log.info(">>> MemberController > register - GET");
	}
	
	@RequestMapping(value= "/register", method = RequestMethod.POST)
	public String register(MemberVO mvo) {
		log.info(">>> register-mvo : {}", mvo);
		int isUp = msv.register(mvo);
		log.info(">>> member register - post : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/member/login";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info(">>> member login - get");	
	}
	
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses, RedirectAttributes rttr) {
		MemberVO sesMvo = msv.login(mvo);
		if (sesMvo != null) {
			log.info(">>> member login - OK");
			ses.setAttribute("ses", sesMvo);
			ses.setMaxInactiveInterval(20*60);
			rttr.addFlashAttribute("isLogin", 1);
			return "redirect:/";
		}else {
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses, RedirectAttributes rttr) {
		ses.removeAttribute("ses"); 
		ses.invalidate();
		rttr.addFlashAttribute("isLogout", 1);
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public void detail(Model model, @RequestParam("mno") long mno) {
		log.info(">>> member detail - get");
		MemberVO mvo = msv.getDetail(mno);
		model.addAttribute("mvo", mvo);
	}
	

}










