package com.hanul.iot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import customer.service.CustomerService;
import customer.vo.CustomerVO;

@Controller @SessionAttributes("category")
public class CustomerController {
	@Autowired private CustomerService service;
	
	//고객정보삭제처리 요청
	@RequestMapping("/delete.cs")
	public String delete(@RequestParam int id){
		//해당고객정보를 삭제처리한 후 
		service.delete(id);
		//고객목록화면으로 이동
		return "redirect:list.cs";
	}
	
	//고객정보변경처리 요청
	@RequestMapping("/update.cs")
	public String update(CustomerVO vo){
		//화면에서 변경입력한 정보를 DB에 저장처리한 후
		service.update(vo);
		//변경된 정보를 확인할 수 있도록 상세화면으로 이동
		return "redirect:detail.cs?id="+vo.getId();
	}
	
	//고객정보변경화면 요청
	@RequestMapping("/modify.cs")
	public String modify(@RequestParam int id, Model model){
		//해당고객정보를 조회해와 화면에 변경할 수 있는 형태로 출력
		model.addAttribute("vo", service.select(id) );
		return "customer/modify";
	}
	
	//고객상세화면 요청
	@RequestMapping("/detail.cs")
	public String detail(@RequestParam int id, Model model){
		//DB에서 해당고객정보를 조회해와 화면에 출력
		model.addAttribute("vo", service.select(id) );
		return "customer/detail";
	}
	
	//전체고객목록화면 요청
	@RequestMapping("/list.cs")
	public String list(Model model){
		//DB에서 고객목록을 조회해와 화면에 출력
		model.addAttribute("list", service.list() );
		model.addAttribute("category", "cs");
		return "customer/list";
	}
	
	//신규고객정보 등록처리 요청
	@RequestMapping("/insert.cs")
	public String insert(CustomerVO vo){
		//데이터객체에 담긴 정보를 DB에 저장처리
		//Controller -> Service -> DAO -> Mybatis
		service.insert(vo);
		return "redirect:list.cs";
	}
	
	//신규고객입력화면 요청
	@RequestMapping("/new.cs")
	public String customer(){
		//customer 폴더내의 new.jsp 화면으로 연결
		return "customer/new"; 
	}
}
