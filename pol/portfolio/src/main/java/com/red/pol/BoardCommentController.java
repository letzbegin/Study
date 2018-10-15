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
	
	//��ۻ���ó�� ��û
	@ResponseBody @RequestMapping("/board/comment/delete/{id}")
	public void delete(@PathVariable int id){
		service.delete(id);
	}
	
	//��ۺ�������ó�� ��û
	//json �����͸� �����Ͱ�ü�� ��´�: @RequestBody
	//ajax �� ���ϵ����ͷ� �ѱ��� �������� produces �Ӽ� ����
	@ResponseBody @RequestMapping(value="/board/comment/update",
						produces="application/text; charset=utf-8")
	public String update(@RequestBody BoardCommentVO vo){
		return service.update(vo) ? "����" : "����";
	}
	
	//��۸��ȭ�� ��û
	@RequestMapping("/board/comment/{pid}")
	public String list(@PathVariable int pid, Model model){
		//�ش� ���ۿ� ���� ��۸���� DB���� ��ȸ�� �� 
		model.addAttribute("list", service.list(pid) );
		model.addAttribute("lf", "\n");
		model.addAttribute("crlf", "\r\n");
		//���ȭ������ ����
		return "board/comment/comment_list";
	}
	
	//�������ó�� ��û
	@ResponseBody @RequestMapping("/board/comment/insert")
	public String insert(@RequestParam int pid, HttpSession session, 
							@RequestParam String content){
		HashMap<String, Object> map =
					new HashMap<String, Object>();
		map.put("pid", pid);
		map.put("content", content);
		map.put("userid", 
		((MemberVO)session.getAttribute("login_info")).getUserid() );
		
		//ȭ�鿡�� �Է��� ��������� DB�� ������ ��
		return String.valueOf(service.insert(map));
	}
}
