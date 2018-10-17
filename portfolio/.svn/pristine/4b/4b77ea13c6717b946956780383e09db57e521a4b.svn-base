package com.red.pol;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.service.BoardCommentService;
import board.vo.BoardCommentVO;
import member.vo.MemberVO;

@Controller
public class BoardCommentController {
	@Autowired private BoardCommentService service;
	
	//댓글삭제처리 요청
	@ResponseBody @RequestMapping("/board/comment/delete/{id}")
	public void delete(@PathVariable int id){
		service.delete(id);
	}
	
	//댓글변경저장처리 요청
	//json 데이터를 데이터객체에 담는다: @RequestBody
	//ajax 의 리턴데이터로 한글을 보내려면 produces 속성 지정
	@ResponseBody @RequestMapping(value="/board/comment/update",
						produces="application/text; charset=utf-8")
	public String update(@RequestBody BoardCommentVO vo){
		return service.update(vo) ? "성공" : "실패";
	}
	
	//댓글목록화면 요청
	@RequestMapping("/board/comment/{pid}")
	public String list(@PathVariable int pid, Model model){
		//해당 원글에 대한 댓글목록을 DB에서 조회한 후 
		model.addAttribute("list", service.list(pid) );
		model.addAttribute("lf", "\n");
		model.addAttribute("crlf", "\r\n");
		//목록화면으로 연결
		return "board/comment/comment_list";
	}
	
	//댓글저장처리 요청
	@ResponseBody @RequestMapping("/board/comment/insert")
	public String insert(@RequestParam int pid, HttpSession session, 
							@RequestParam String content){
		HashMap<String, Object> map =
					new HashMap<String, Object>();
		map.put("pid", pid);
		map.put("content", content);
		map.put("userid", 
		((MemberVO)session.getAttribute("login_info")).getUserid() );
		
		//화면에서 입력한 댓글정보를 DB에 저장한 후
		return String.valueOf(service.insert(map));
	}
}
