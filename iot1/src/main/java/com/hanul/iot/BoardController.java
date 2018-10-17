package com.hanul.iot;

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
	@Autowired private BoardService service;
	@Autowired private BoardPage page;
	@Autowired private CommonService common;
	
	//÷�����ϴٿ�ε�ó�� ��û
	@RequestMapping("/download.bo")
	public File download(@RequestParam int id,
			HttpSession session, HttpServletResponse res){
		//������ ���̵��� �Խñۿ� ÷�ε� ������ DB���� ��ȸ�ؿ´�.
		BoardVO vo = service.select(id);
		return common.download(
			vo.getFilepath(), vo.getFilename(), session, res);
	}
	
	//�Խñۻ�ȭ�� ��û
	@RequestMapping("/detail.bo")
	public String detail(@RequestParam int id, Model model){
		//������ �Խñ� ������ DB���� ��ȸ�� ȭ�鿡 ���
		model.addAttribute("vo", service.select(id) );
		model.addAttribute("page", page);
		model.addAttribute("lf", "\n");
		model.addAttribute("crlf", "\r\n");
		return "board/detail";
	}
	
	//�ű԰Խñ�����ó�� ��û
	@RequestMapping("/insert.bo")
	public String insert(BoardVO vo, HttpSession session,
			@RequestParam MultipartFile file){
		vo.setFilename("");
		vo.setFilepath("");
		if( file.getSize()>0 ){
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath(
					common.upload("board", file, session) );
		}
		//�α����� ȸ���� ���̵� userid �ʵ忡 ��´�
		vo.setUserid(
			((MemberVO)session.getAttribute("login_info")).getUserid()
		);
		//ȭ���� �Է������� DB�� ������ ��
		service.insert(vo);
		//�Խñ۸��ȭ������ ����
		return "redirect:list.bo";
	}
	
	//�ű԰Խñ��ۼ�ȭ�� ��û
	@RequestMapping("/new.bo")
	public String board(){
		return "board/new";
	}
	
	//�Խñ۸��ȭ�� ��û
	@RequestMapping("/list.bo")
	public String list(Model model, 
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(required=false) String search,
			@RequestParam(defaultValue="") String keyword){
		model.addAttribute("category", "bo");
		
		page.setCurPage(curPage);
		page.setSearch( keyword.isEmpty() ? "" : search);
		page.setKeyword(keyword);
		
		model.addAttribute("page", service.list(page) );
		
		return "board/list";
	}
}
