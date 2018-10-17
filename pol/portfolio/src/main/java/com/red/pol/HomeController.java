package com.red.pol;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	//IP로 위치를 가져오는 api return json
//		private String mappingUrl_ ="http://api.ipstack.com/";
//		private String access_key_ ="?access_key=ee75adf85da2c5d7a69086cc92523acf";
		private String url0_="https://maps.googleapis.com/maps/api/geocode/json?latlng=";
		private String url1_="&key=AIzaSyCsrerDHJrp9Wu09Ij7MUELxCTPiYfxfBI&language=ko";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		log.info("Welcome home! The client locale is {}.", locale);
		//시간 확인
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="lctncheck" , produces="application/json; charset=utf-8")
	public String ipcheck(HttpServletRequest request) {
		
				String latitude = request.getParameter("lat");
				String longitude = request.getParameter("lon");
				log.info("==========================================");
				log.info("유저의 위도 :"+latitude);
				log.info("유저의 경도 :"+longitude);
				log.info("==========================================");
				
//				String fullurl =mappingUrl_+ip+access_key_; 
				String fullurl =url0_+latitude+","+longitude+url1_; 
				log.info("==========================================");
				log.info("Fullurl :"+fullurl);
				log.info("==========================================");
			
		return public_data(fullurl);
	}
	
	private String public_data(String result){
		log.info("===========================================================");
		log.info("공공데이터 처리를 시작합니다");
		try{
		HttpURLConnection conn 
			= (HttpURLConnection)new URL(result).openConnection();
		log.info("conn:"+conn);
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
//            log.info("XML형"+sb);
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
}
