package com.red.pol;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.vo.SidoVo;

@Controller
public class DataController {
	private Logger log = LoggerFactory.getLogger(DataController.class);
	private String ServiceKey2
	= "FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D"; 
	private String ServiceKey_
	="J%2BE1EgGTLsmQ14rplf4VnZtgedUCXFme08XZ%2BcX%2FTkn4Vilo9Etb29ViX8R6RLJfl0QJGiBACnZXeVJw1kQtvw%3D%3D"; 

	@ResponseBody
	@RequestMapping("data/sidolist")
	public String[] sidolist(HttpServletRequest request, HttpSession session){
		session.setAttribute("sido", request.getParameter("sido"));
		log.info("========================================");
		log.info("선택한 시도 이름"+request.getParameter("sido"));
		log.info("========================================");
		String sido = request.getParameter("sido");
		return sidochecker(sido, session);
	}
	
	
	//약국정보조회처리 요청
	@ResponseBody @RequestMapping(value="/data/pharmacy",
				produces="application/text; charset=utf-8")
	public String pharmacy(HttpServletRequest request ,HttpSession session, 
			@RequestParam(defaultValue="1") String pageNo,
			@RequestParam(defaultValue="10") String numOfRows){
		StringBuilder url 
//			= new StringBuilder("http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
		= new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire");
		log.info("====================================================");
		if(request.getParameter("sido")!=null){
			session.setAttribute("sido", request.getParameter("sido"));
		}
		if(request.getParameter("gungu")!=null) {
			session.setAttribute("gungu", request.getParameter("gungu"));
		}
		log.info("조회하고자 하는 시,도:"+session.getAttribute("sido"));
		log.info("조회하고자 하는 군,구:"+session.getAttribute("gungu"));
		log.info("====================================================");
		try {
			url.append("?ServiceKey=" +  ServiceKey_);
//			url.append("?ServiceKey=" + URLEncoder.encode( ServiceKey, "utf-8"));
			url.append("&Q0="+ URLEncoder.encode( session.getAttribute("sido").toString(), "utf-8") );
			url.append("&Q1="+ URLEncoder.encode( session.getAttribute("gungu").toString(), "utf-8") );
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		}
		url.append("&pageNo="+pageNo);
		url.append("&numOfRows="+numOfRows);
		String result = url.toString();
		log.info("================================================");
		log.info("조회주소"+result);
		log.info("================================================");
		
		return public_data(result);
	}
	
	private String public_data(String result){
		log.info("===========================================================");
		log.info("공공데이터 처리를 시작합니다");
		try{
		HttpURLConnection conn 
			= (HttpURLConnection)new URL(result).openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			log.info("conn.getResponseCode():" + conn.getResponseCode());
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            
        } else {
        	log.info("conn.getResponseCode():" + conn.getResponseCode());
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
        }
		log.info("===========================================================");
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
            log.info("XML형"+line);
//            log.info(rd.readLine()); --해당 문장을 실행시 출력 데이터에 오류가 발생
        }
		
        rd.close();
        conn.disconnect();
        result = sb.toString();
        log.info("====================================================");
        log.info("조회된데이터:"+result );
        log.info("====================================================");
        
		}catch(Exception e){}
		return result;
	}
	
	private String[] sidochecker(String sido,HttpSession session) {
		SidoVo vo = new SidoVo();
		String[] list = null;
		if(sido.equals("Seoul")){
			list = vo.getSeoul();
			session.setAttribute("sido", "서울특별시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Busan")){
			list = vo.getBusan();
			session.setAttribute("sido", "부산광역시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("NorthChungcheong")){
			session.setAttribute("sido", "충청남도");
			list = vo.getNorthChungcheong();
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Incheon")){
			list = vo.getIncheon();
			session.setAttribute("sido", "인천광역시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Gangwon")){
			list = vo.getGangwon();
			session.setAttribute("sido", "강원도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Gyeonggi")){
			list =vo.getGyeonggi();
			session.setAttribute("sido", "경기도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("NorthJeolla")){
			list =vo.getNorthJeolla();
			session.setAttribute("sido", "전라북도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Gwangju")){
			list =vo.getGwangju();
			session.setAttribute("sido", "광주광역시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("SouthChungcheong")){
			list =vo.getSouthChungcheong();
			session.setAttribute("sido", "충청남도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Daejeon")){
			list =vo.getDaejeon();
			session.setAttribute("sido", "대전광역시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Daegu")){
			list =vo.getDaegu();
			session.setAttribute("sido", "대구광역시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("SouthGyeongsang")){
			list =vo.getSouthGyeongsang();
			session.setAttribute("sido", "경상남도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("SouthJeolla")){
			list =vo.getSouthJeolla();
			session.setAttribute("sido", "전라남도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Ulsan")){
			list =vo.getUlsan();
			session.setAttribute("sido", "울산광역시");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("NorthGyeongsang")){
			list =vo.getNorthGyeongsang();
			session.setAttribute("sido", "경상북도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Jeju")){
			list =vo.getJeju();
			session.setAttribute("sido", "제주특별자치도");
			log.info("선택한 시도 길이"+list.length);
		}
		else if(sido.equals("Sejong")){
			list =vo.getSejong();
			session.setAttribute("sido", "세종특별자치시");
			log.info("선택한 시도 길이"+list.length);
		}
		log.info("========================================");
		return list;
	}
}
