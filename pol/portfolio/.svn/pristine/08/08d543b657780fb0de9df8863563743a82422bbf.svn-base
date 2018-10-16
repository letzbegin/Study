package com.red.pol;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import board.service.BoardService;
import board.vo.BoardPage;
import board.vo.BoardVO;
import common.service.CommonService;
import member.vo.MemberVO;

@Controller @SessionAttributes("category")
public class BoardController {
	@Autowired private BoardService service_;
	@Autowired private BoardPage page_;
	@Autowired private CommonService common_;
	
	//첨부파일다운로드처리 요청
	@RequestMapping("/download.bo")
	public File download(@RequestParam int id,
			HttpSession session, HttpServletResponse res){
		//선택한 아이디의 게시글에 첨부된 정보를 DB에서 조회해온다.
		BoardVO vo = service_.select(id);
		return common_.download(
			vo.getFilepath(), vo.getFilename(), session, res);
	}
	
	//게시글상세화면 요청
	@RequestMapping("/detail.bo")
	public String detail(@RequestParam int id, Model model){
		//선택한 게시글 정보를 DB에서 조회해 화면에 출력
		model.addAttribute("vo", service_.select(id) );
		model.addAttribute("page", page_);
		model.addAttribute("lf", "\n");
		model.addAttribute("crlf", "\r\n");
		return "board/detail";
	}
	
	//신규게시글저장처리 요청
	@RequestMapping("/insert.bo")
	public String insert(BoardVO vo, HttpSession session,
			@RequestParam MultipartFile file){
		vo.setFilename("");
		vo.setFilepath("");
		if( file.getSize()>0 ){
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath(
					common_.upload("board", file, session) );
		}
		//로그인한 회원의 아이디를 userid 필드에 담는다
		vo.setUserid(
			((MemberVO)session.getAttribute("login_info")).getUserid()
		);
		//화면의 입력정보를 DB에 저장한 후
		service_.insert(vo);
		//게시글목록화면으로 연결
		return "redirect:list.bo";
	}
	
	//신규게시글작성화면 요청
	@RequestMapping("/new.bo")
	public String board(){
		return "board/new";
	}
	
	//게시글목록화면 요청
	@RequestMapping("/list.bo")
	public String list(Model model, 
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(required=false) String search,
			@RequestParam(defaultValue="") String keyword){
		model.addAttribute("category", "bo");
		
		page_.setCurPage(curPage);
		page_.setSearch( keyword.isEmpty() ? "" : search);
		page_.setKeyword(keyword);
		
		model.addAttribute("page", service_.list(page_) );
		
		return "board/list";
	}
}
