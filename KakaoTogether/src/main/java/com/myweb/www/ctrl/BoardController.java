package com.myweb.www.ctrl;



import java.util.List;



import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.FileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Inject
	private BoardService bsv;
	
	@Inject
	private FileHandler fhd;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register") 
	public String register(BoardVO bvo, RedirectAttributes rttr,
			@RequestParam(name = "fileAttached", required = false) MultipartFile[] files) {
		List<FileVO> fileList = null;
		fileList = fhd.getFileList(files);
		bvo.setBoardImg(fileList.get(0).getSaveDir()+"\\"+fileList.get(0).getUuid()+"_th"+fileList.get(0).getImageName());
		int isUp = bsv.register(new BoardDTO(bvo, fileList));
		log.info(">>> board register : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo) {
		model.addAttribute("list", bsv.getList(pgvo));
		int totalCount = bsv.getTotalCount(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/mylist/{mno}")
	public String mylist(Model model, PagingVO pgvo, @PathVariable("mno") long mno) {
		model.addAttribute("list", bsv.getMyList(pgvo));
		int totalCount = bsv.getMyTotalCount(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		return "/board/mylist";
	}
	
	@GetMapping({"detail", "/modify"})
	public void detail(@RequestParam("bno") long bno, Model model,
			@ModelAttribute("pgvo") PagingVO pgvo) {
		model.addAttribute("bdto", bsv.getDetail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo,
			@RequestParam(name = "fileAttached", required = false) MultipartFile[] files,
			RedirectAttributes rttr, PagingVO pgvo) {
				List<FileVO> fileList = null;
				fileList = fhd.getFileList(files);
				bvo.setBoardImg(fileList.get(0).getSaveDir()+"\\"+fileList.get(0).getUuid()+"_th"+fileList.get(0).getImageName());
				if(files[0].getSize() > 0) {
					fileList = fhd.getFileList(files);
					bvo.setFileCount(fileList.size());
				}	
		bsv.modify(new BoardDTO(bvo, fileList));
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		rttr.addAttribute("type", pgvo.getType());
		rttr.addAttribute("kw", pgvo.getKw());
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") long bno, RedirectAttributes rttr, PagingVO pgvo) {
		bsv.remove(bno);
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		rttr.addAttribute("type", pgvo.getType());
		rttr.addAttribute("kw", pgvo.getKw());
		return "redirect:/board/list";
	}
	
	// cheerup
	@PutMapping(value = "/{bno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> edit(@PathVariable("bno") long bno,
			@RequestBody BoardVO bvo){	
		log.info(">>> Cheerup > edit - GET>>>>>>>>>");
		return bsv.cheerup(bvo) > 0 ? 
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}












