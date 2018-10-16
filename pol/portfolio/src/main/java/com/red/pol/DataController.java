package com.red.pol;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.vo.SidoVo;

@Controller
public class DataController {
	private Log log = LogFactory.getLog(DataController.class);
	private String ServiceKey2 
	= "FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D"; 
	private String ServiceKey 
	="J%2BE1EgGTLsmQ14rplf4VnZtgedUCXFme08XZ%2BcX%2FTkn4Vilo9Etb29ViX8R6RLJfl0QJGiBACnZXeVJw1kQtvw%3D%3D"; 

	private String animal_url 
		= "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/";

	/*//�ñ���������ȸ ��û
	@ResponseBody @RequestMapping(value="/data/animal/sigungu",
						produces="application/text; charset=utf-8")
	public String animal_sigungu( @RequestParam String sido){
		StringBuilder url
			= new StringBuilder( animal_url + "sigungu");
		url.append("?ServiceKey=" + ServiceKey);
		url.append("&upr_cd=" + sido);
		return public_data(url.toString());
	}
	
	//��ȣ�Ҹ����ȸ ��û
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
	
	//���⵿�������ȸ ��û
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
	
	//������ ǰ����ȸ ��û
	@ResponseBody @RequestMapping(value="/data/animal/kind",
				produces="application/text; charset=utf-8")
	public String kind(@RequestParam String upkind){
		StringBuilder url = new StringBuilder( animal_url + "kind");
		url.append("?ServiceKey=" + ServiceKey );
		url.append("&up_kind_cd=" + upkind );
		return public_data(url.toString());
	}
	
	//���⵿���õ���ȸ ��û
	@ResponseBody @RequestMapping(value="/data/aniaml/sido", 
				produces="application/text; charset=utf-8")
	public String sido(){
		StringBuilder url 
			= new StringBuilder(animal_url + "sido");
		url.append("?ServiceKey=" + ServiceKey);
		String result = url.toString();
		return public_data(result);
	}*/
	
	@ResponseBody
	@RequestMapping("data/sidolist")
	public String[] sidolist(HttpServletRequest request, HttpSession session){
		session.setAttribute("sido", request.getParameter("sido"));
		log.info("========================================");
		log.info("������ �õ� �̸�"+request.getParameter("sido"));
		log.info("========================================");
		String sido = request.getParameter("sido");
		SidoVo vo = new SidoVo();
		
		String[] list = null;
		if(sido.equals("seoul")){
			list = vo.getSeoul();
			session.setAttribute("sido", "����Ư����");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Busan")){
			list = vo.getBusan();
			session.setAttribute("sido", "�λ걤����");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("NorthChungcheong")){
			session.setAttribute("sido", "��û����");
			list = vo.getNorthChungcheong();
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Incheon")){
			list = vo.getIncheon();
			session.setAttribute("sido", "��õ������");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Gangwon")){
			list = vo.getGangwon();
			session.setAttribute("sido", "������");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Gyeonggi")){
			list =vo.getGyeonggi();
			session.setAttribute("sido", "��⵵");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("NorthJeolla")){
			list =vo.getNorthJeolla();
			session.setAttribute("sido", "���󳲵�");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Gwangju")){
			list =vo.getGwangju();
			session.setAttribute("sido", "���ֱ�����");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("SouthChungcheong")){
			list =vo.getSouthChungcheong();
			session.setAttribute("sido", "��û����");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Daejeon")){
			list =vo.getDaejeon();
			session.setAttribute("sido", "����������");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Daegu")){
			list =vo.getDaegu();
			session.setAttribute("sido", "�뱸������");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("SouthGyeongsang")){
			list =vo.getSouthGyeongsang();
			session.setAttribute("sido", "��󳲵�");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("SouthJeolla")){
			list =vo.getSouthJeolla();
			session.setAttribute("sido", "���󳲵�");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Ulsan")){
			list =vo.getUlsan();
			session.setAttribute("sido", "��걤����");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("NorthGyeongsang")){
			list =vo.getNorthGyeongsang();
			session.setAttribute("sido", "���ϵ�");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Jeju")){
			list =vo.getJeju();
			session.setAttribute("sido", "����Ư����ġ��");
			log.info("������ �õ� ����"+list.length);
		}
		else if(sido.equals("Sejong")){
			list =vo.getSejong();
			session.setAttribute("sido", "����Ư����ġ��");
			log.info("������ �õ� ����"+list.length);
		}
		log.info("========================================");
		return list;
	}
	
	private String public_data(String result){
		log.info("===========================================================");
		log.info("���������� ó���� �����մϴ�");
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
            log.info("XML��"+rd.readLine());
        }
		
        rd.close();
        conn.disconnect();
        result = sb.toString();
        log.info("====================================================");
        log.info("��ȸ�ȵ�����:"+result );
        log.info("====================================================");
        
		}catch(Exception e){}
		return result;
	}
	
	//�౹������ȸó�� ��û
	@ResponseBody @RequestMapping(value="/data/pharmacy",
				produces="application/text; charset=utf-8")
	public String pharmacy(HttpServletRequest request ,HttpSession session){
		StringBuilder url 
//			= new StringBuilder("http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
		= new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire");
		log.info("====================================================");
		log.info("��ȸ�ϰ��� �ϴ� ��,��:"+session.getAttribute("sido"));
		log.info("��ȸ�ϰ��� �ϴ� ��,��:"+request.getParameter("gungu"));
		log.info("====================================================");
		try {
			url.append("?ServiceKey=" +  ServiceKey);
//			url.append("?ServiceKey=" + URLEncoder.encode( ServiceKey, "utf-8"));
			url.append("&Q0="+ URLEncoder.encode( session.getAttribute("sido").toString(), "utf-8") );
			url.append("&Q1="+ URLEncoder.encode(request.getParameter("gungu"), "utf-8") );
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		}
		url.append("&pageNo=1");
		url.append("&numOfRows=10");
		String result = url.toString();
		log.info("================================================");
		log.info("��ȸ�ּ�"+result);
		log.info("================================================");
		
		return public_data(result);
	}
}