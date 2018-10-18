package com.hanul.iot;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import common.service.CommonService;
import notice.service.NoticeService;
import notice.vo.NoticePage;
import notice.vo.NoticeVO;

@Controller @SessionAttributes("category")
public class NoticeController {
	@Autowired private NoticeService service;
	
	//처리의 흐름: Controller -> Service -> DAO -> mapper
	
	@Autowired private CommonService common;
	
	//답글저장처리 요청
	@RequestMapping("/reply_insert.no")
	public String reply(NoticeVO vo, 
			@RequestParam MultipartFile file, HttpSession session){
		vo.setFilename("");
		vo.setFilepath("");
		if( file.getSize()>0 ){
			vo.setFilename( file.getOriginalFilename());
			vo.setFilepath( common.upload("notice", file, session));
		}
		// 답글작성화면에서 입력한 정보를 DB에 저장처리한 후
		service.reply_insert(vo);
		// 공지글목록화면으로 연결
		return "redirect:list.no";
	}
	
	//답글작성화면 요청
	@RequestMapping("/reply.no")
	public String reply(@RequestParam int id, Model model){
		//답글작성시 원글의 정보가 필요하므로 원글정보를 DB에서 조회해온다
		model.addAttribute("vo", service.select(id));
		return "notice/reply";
	}
	
	
	//공지글삭제처리 요청
	@RequestMapping("/delete.no")
	public String delete(@RequestParam int id){
		//해당 공지글 삭제처리한 후
		service.delete(id);
		
		//공지글목록화면으로 연결
		return "redirect:list.no";
	}
	
	//공지글변경처리 요청
	@RequestMapping("/update.no")
	public String update(NoticeVO vo, HttpSession session,
			@RequestParam MultipartFile file, 
			@RequestParam String attach){
		//변경화면에서 입력한 정보를 DB에 변경저장처리한 후 
		//변경파일정보를 서버에 업로드한다
		vo.setFilename("");
		vo.setFilepath("");
		
		//저장되어 있는 원래 파일의 정보를 조회해 둔다.
		NoticeVO original = service.select(vo.getId());
		String uuid = session.getServletContext().getRealPath("")
					+ original.getFilepath();
		
		if( file.getSize()>0 ){
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath( 
				common.upload("notice", file, session));
			
			//원래 업로드한 파일은 서버에서 삭제한다.
			File f = new File(uuid);
			if( f.exists() ) f.delete();
		}else{
			//첨부된 파일을 삭제
			if( attach.equals("n")){
				File f = new File(uuid);
				if( f.exists() ) f.delete();
			}else{
				//원래파일을 그대로 사용
				if( original.getFilename()!=null){
					vo.setFilename(original.getFilename());
					vo.setFilepath(original.getFilepath());
				}
			}
		}
		
		service.update(vo);
		
		//화면으로 연결
		return "redirect:detail.no?id="+vo.getId();
	}
	
	
	//첨부파일 다운로드 처리 요청
	//파일을 다운로드하는 처리 자체가 응답
	@ResponseBody @RequestMapping("/download.no")
	public File download(@RequestParam int id, 
								HttpSession session,
								HttpServletResponse res){
		//다운로드할 파일정보를 조회한다.
		NoticeVO vo = service.select(id);
		return common.download(vo.getFilepath(), vo.getFilename(), 
							session, res);
	}
	
	//공지글변경화면 요청
	@RequestMapping("/modify.no")
	public String modify(@RequestParam int id, Model model){
		//해당 공지글정보를 DB에서 조회해와 변경화면에 출력 
		model.addAttribute("vo", service.select(id));
		return "notice/modify";
	}
	
	//줄바꿈: lf(line feed), cr(carriage return)
	//공지글상세화면 요청
	@RequestMapping("/detail.no")
	public String detail(Model model, @RequestParam int id){
		//조회수증가처리
		service.read(id);
		//해당 공지글정보를 DB에서 조회해와 화면에 출력
		model.addAttribute("vo", service.select(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		return "notice/detail";
	}
	
	//신규공지글저장처리 요청
	@RequestMapping("/insert.no")
	public String insert(NoticeVO vo, HttpSession session,
			@RequestParam MultipartFile file){
		vo.setFilename("");
		vo.setFilepath("");
		
		//첨부파일이 있다면 서버에 업로드시켜둔다.
		if( file.getSize()>0 ){
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(
				common.upload("notice", file, session) );
		}
				
		//화면에서 입력한 정보를 DB에 저장한 후
		service.insert(vo);
		//목록화면으로 이동
		return "redirect:list.no";
	}
	
	//신규공지글작성화면 요청
	@RequestMapping("/new.no")
	public String notice(){
		return "notice/new";
	}
	
	//공지글목록화면 요청
	//파라미터가 꼭 있어야하는 것은 아니라고 지정: required=false
	//파라미터에 기본값을 지정: defaultValue
	@Autowired private NoticePage page;
	@RequestMapping("/list.no")
	public String list(Model model, 
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(required=false) String search,
			@RequestParam(defaultValue="") String keyword){
		
			model.addAttribute("category", "no");
			page.setCurPage(curPage);			
			//검색어가 없으면 유형을 선택했더라도 검색하지 않는 형태임
			page.setSearch(keyword.isEmpty() ? "" : search);
			page.setKeyword(keyword);
			model.addAttribute("page", service.list(page));
/*		
		if( keyword.isEmpty() ){
			//검색어가 없으면 전체목록조회
			//DB에서 공지글목록을 조회해와 화면에 출력
			model.addAttribute("list", service.list() );
			
		}else{
			//검색어가 있으면 검색어목록조회
			//검색유형, 검색키워드를 HashMap에 담는다
			HashMap<String, String> map 
					= new HashMap<String, String>();
			map.put("search", search);
			map.put("keyword", keyword);
			model.addAttribute("search", search);
			model.addAttribute("keyword", keyword);
			model.addAttribute("list", service.list(map));
		}
*/		
		return "notice/list";
	}
	
}
