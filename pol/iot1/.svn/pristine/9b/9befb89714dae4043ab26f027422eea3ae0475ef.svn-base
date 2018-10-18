package com.hanul.iot;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DataController {

	private String ServiceKey 
	= "FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D"; 

	private String animal_url 
		= "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/";

	//시군구정보조회 요청
	@ResponseBody @RequestMapping(value="/data/animal/sigungu",
						produces="application/text; charset=utf-8")
	public String animal_sigungu( @RequestParam String sido){
		StringBuilder url
			= new StringBuilder( animal_url + "sigungu");
		url.append("?ServiceKey=" + ServiceKey);
		url.append("&upr_cd=" + sido);
		return public_data(url.toString());
	}
	
	//보호소목록조회 요청
	@ResponseBody @RequestMapping(value="/data/animal/shelter",
			produces="application/text; charset=utf-8")
	public String animal_shelter(@RequestParam String sido,
							@RequestParam String sigungu){
		StringBuilder url 
		= new StringBuilder( animal_url + "shelter");
		url.append("?ServiceKey=" + ServiceKey );
		url.append("&upr_cd=" + sido);
		url.append("&org_cd=" + sigungu);
		return public_data(url.toString());
	}
	
	//유기동물목록조회 요청
	@ResponseBody @RequestMapping(value="/data/animal/list", 
			produces="application/text; charset=utf-8")
	public String animal_list(@RequestBody HashMap<String, String> map){
		StringBuilder url 
			= new StringBuilder(animal_url + "abandonmentPublic");
			
		url.append("?ServiceKey=" + ServiceKey);
		url.append("&upr_cd=" + map.get("sido"));
		url.append("&org_cd=" + map.get("sigungu"));
		url.append("&care_reg_no=" + map.get("shelter"));
		url.append("&upkind=" + map.get("upkind") );
		url.append("&kind=" + map.get("kind") );
		String result = url.toString();
		return public_data(result);
	}
	
	//축종별 품종조회 요청
	@ResponseBody @RequestMapping(value="/data/animal/kind",
				produces="application/text; charset=utf-8")
	public String kind(@RequestParam String upkind){
		StringBuilder url = new StringBuilder( animal_url + "kind");
		url.append("?ServiceKey=" + ServiceKey );
		url.append("&up_kind_cd=" + upkind );
		return public_data(url.toString());
	}
	
	//유기동물시도조회 요청
	@ResponseBody @RequestMapping(value="/data/aniaml/sido", 
				produces="application/text; charset=utf-8")
	public String sido(){
		StringBuilder url 
			= new StringBuilder(animal_url + "sido");
		url.append("?ServiceKey=" + ServiceKey);
		String result = url.toString();
		return public_data(result);
	}
	
	
	private String public_data(String result){
		try{
		HttpURLConnection conn 
			= (HttpURLConnection)new URL(result).openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
        }
		
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
		
        rd.close();
        conn.disconnect();
        result = sb.toString();
        System.out.println( result );
        
		}catch(Exception e){}
		return result;
	}
	
	//약국정보조회처리 요청
	@ResponseBody @RequestMapping(value="/data/pharmacy",
				produces="application/text; charset=utf-8")
	public String pharmacy(){
		StringBuilder url 
			= new StringBuilder("http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
		url.append("?ServiceKey=" + ServiceKey);
		url.append("&pageNo=1");
		url.append("&numOfRows=10");
		String result = url.toString();
		
		return public_data(result);
	}
	
	//공공데이터 화면 요청
	@RequestMapping("/list.pu")
	public String data(){
		return "data/list";
	}
}
