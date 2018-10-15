package common.service;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonServiceImpl implements CommonService {

	@Override
	public String upload(String category, MultipartFile file, HttpSession session) {
		//선택한 파일을 서버의 물리적위치에 저장하는 처리
		String project 
			= session.getServletContext().getRealPath("");
		//Study_Spring/.metadata/.plugins/../iot/
		
		//파일업로드할 위치: 
		//Study_Spring...iot/upload/notice/2018/08/09/abc.txt
		//Study_Spring...iot/upload/notice/2018/08/09/andfs.img
		//Study_Spring...iot/upload/board/..
		String upload = project + "upload";
		String uploadFolder = makeFolder(category, upload);
		
//		동시다발적으로 동일한 파일명의 서로 다른 파일을 업로드할 수도 있으므로
//		각 파일에 고유한 ID를 부여해 업로드한다.
		String uuid = UUID.randomUUID().toString() 
				+"_"+ file.getOriginalFilename(); 
		
		try{
		//업로드할 폴더에 파일을 업로드한다.
		file.transferTo( new File(uploadFolder, uuid) );
		
		}catch(Exception e){}
		
		//업로드한 파일의 정보를 DB에 저장할 수 있도록 정보를 리턴한다
//		upload/notice/2018/08/09/andfs.img
		return uploadFolder.replace(project, "")
					+ File.separator + uuid;
	}
	
	private String makeFolder(String category, String upload){
		String folders[] = new String[5];
		folders[0] = upload;
		folders[1] = upload + File.separator + category;
		Date now = new Date();
		folders[2] = folders[1] +  File.separator
				+ new SimpleDateFormat("yyyy")
										.format(now);
		folders[3] = folders[2] + File.separator
				+ new SimpleDateFormat("MM").format(now);
		folders[4] = folders[3] + File.separator
				+ new SimpleDateFormat("dd").format(now);
					
		//해당 폴더가 없다면 만들도록 한다.
		File folder = new File(folders[4]);
		if( !folder.exists() ) folder.mkdirs();
		return folders[4];
	}

	@Override
	public File download(String filepath, String filename, HttpSession session, HttpServletResponse res) {
	
		//다운로드할 파일객체 생성
		File file 
			= new File(
				session.getServletContext()
							.getRealPath(filepath));	
		String mime 
			= session.getServletContext()
							.getMimeType(filename);
		if(mime==null) mime = "application/octet-stream";
		
		res.setContentType(mime);
		
		try{
			//한글 파일명에 대한 처리
			//():%28%29 []%59%60 <>%27%29
			filename = URLEncoder.encode(filename, "utf-8")
						.replaceAll("\\+", "%20");
			
			res.setHeader("content-disposition",
				"attachment; filename=" + filename);
			
			ServletOutputStream out = res.getOutputStream();
			FileCopyUtils.copy(
					new FileInputStream(file), out);
			out.flush();
		}catch(Exception e){}
		return file;
	}

	@Override
	public void emailSend(String email, String name, HttpSession session) {
		//수신인 이메일주소, 수신인 성명
//		simpleSend(email, name);//기본형태의 이메일전송
//		attachSend(email, name, session);//첨부파일이 있는 이메일전송
		htmlSend(email, name, session);//html 태그형식의 이메일전송
	}
	
	private void htmlSend(String email, String name, HttpSession session){
		//파일첨부도 가능함
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
		
		try{
		mail.setFrom("ojink2@naver.com", "관리자");
		mail.addTo(email, name);
		mail.setSubject("한울 IoT과정 -Html형식");
		String msg = "<html>";
		msg += "<body>";
		msg += "<a href='http://hanuledu.co.kr'>한울홈</a><br>";
		msg += "<h3>한울 IoT 과정</h3>";
		msg += "축하합니다!<br>과정에 가입되셨습니다!<br>";
		msg += "<img src='http://apache.org/img/asf_logo.png'/>";
		msg += "</body>";
		msg += "</html>";
		mail.setHtmlMsg(msg);
		
		EmailAttachment attach = new EmailAttachment();
		attach.setURL( 
		new URL("https://www.google.co.kr/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png") );
		mail.attach(attach);
		
		attach = new EmailAttachment();
		attach.setPath( session.getServletContext()
				.getRealPath("resources/css/default.css"));
		mail.attach(attach);
		
		mail.send();
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
	
	private void attachSend(String email, String name, HttpSession session){
		MultiPartEmail mail = new MultiPartEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
		
		try{ 
		mail.setFrom("ojink2@naver.com", "한울관리자");
		mail.addTo(email, name);
		mail.setSubject("한울 IoT 과정 - 파일첨부");
		mail.setMsg("한울 IoT 과정 회원가입 축하! 첨부파일확인 요망");
		
//		첨부파일객체생성
		EmailAttachment attach = new EmailAttachment();
		attach.setPath("D:\\공개특강\\2조(아모르) ppt.pptx");
		mail.attach(attach);
		
		attach = new EmailAttachment();
		attach.setPath(session.getServletContext()
			.getRealPath("resources/img/hanul.logo.png"));
		mail.attach(attach);
		
		attach = new EmailAttachment();
		attach.setURL( 
			new URL("http://apache.org/img/asf_logo.png") );
		mail.attach(attach);
		
		mail.send();
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	
	
	private void simpleSend(String email, String name){
		SimpleEmail mail = new SimpleEmail();
		
		//이메일을 보내는 사람의 메일서버 지정
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true); //메일전송처리확인하기 위한 로그출력
		
		//로그인하기 위한 아이디/비번 지정
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
		
		try{
		mail.setFrom("ojink2@naver.com", "한울관리자"); //메일송신인이메일주소, 송신인성명
		mail.addTo(email, name); //수신인정보
//		여러수신인에게 메일전송시 addTo()처리를 추가한다.
//		mail.addTo("test@naver.com", name); 
		
		mail.setSubject("한울 IoT 과정"); //메일제목
		mail.setMsg("IoT 과정 회원가입을 축하합니다!"); //메일내용
		mail.send();
		
		}catch(Exception e){
		}
	}
	
}





