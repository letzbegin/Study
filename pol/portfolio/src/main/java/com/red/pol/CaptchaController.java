package com.red.pol;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CaptchaController {
	private String clientId = "YMVEGBS1W7wky54OHuub";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
	private String clientSecret = "M6sD4DuQ3l";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";
	private Log log = LogFactory.getLog(MemberController.class);
	ObjectMapper mapper = new ObjectMapper();
	String key = null;
	String tempname = null;
	
	
	// ĸ�� ó��
		@ResponseBody
		@RequestMapping("/chaptcha00")
		public String chaptcha00() {
			log.info("ĸí ���ŵ�");
			try {
				String code = "0"; // Ű �߱޽� 0, ĸ�� �̹��� �񱳽� 1�� ����
				String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // ���� ȣ��
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // ���� �߻�
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				log.info("===============================================");
				log.info(" ĸ�� ��ȯ��:" + response.toString());

				JSONParser jsonParser = new JSONParser();
	            JSONObject jsonObj = (JSONObject) jsonParser.parse(response.toString());
	            key = (String) jsonObj.get("key");
	            
	            log.info(" ��ȯ Ű��:" + key);
	            
				
			} catch (Exception e) {
				System.out.println(e);
			}
			try {
//				String key = "EVHhbJxz9LF2YZG3"; // https://openapi.naver.com/v1/captcha/nkey
													// ȣ��� ���� Ű��
				String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // ���� ȣ��
					log.info("����ȣ��");
					InputStream is = con.getInputStream();
					int read = 0;
					byte[] bytes = new byte[1024];
					// ������ �̸����� ���� ����
					tempname = Long.valueOf(new Date().getTime()).toString();
					log.info("������ ���ϰ�:"+tempname+".jpg");
					String re = "D:\\Study\\pol\\portfolio\\src\\main\\webapp\\resources\\img\\chaptcha";
					File f = new File(re,tempname+ ".jpg");
					f.createNewFile();
					OutputStream outputStream = new FileOutputStream(f);
					while ((read = is.read(bytes)) != -1) {
						outputStream.write(bytes, 0, read);
						log.info("====================="+read);
					}
					is.close();
				} else { // ���� �߻�
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
					String inputLine;
					StringBuffer response = new StringBuffer();
					while ((inputLine = br.readLine()) != null) {
						response.append(inputLine);
					}
					br.close();
					System.out.println(response.toString());
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			return tempname;
			
		}
		
		@RequestMapping("chaptcha01")
		public void chaptcha01(HttpServletRequest request){
			  try {
		            String code = "1"; // Ű �߱޽� 0,  ĸ�� �̹��� �񱳽� 1�� ����
		            String value = request.getParameter("value"); // ����ڰ� �Է��� ĸ�� �̹��� ���ڰ�
		            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;

		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("X-Naver-Client-Id", clientId);
		            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // ���� ȣ��
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // ���� �߻�
		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		            }
		            String inputLine;
		            StringBuffer response = new StringBuffer();
		            while ((inputLine = br.readLine()) != null) {
		                response.append(inputLine);
		            }
		            br.close();
		            System.out.println(response.toString());
		        } catch (Exception e) {
		            System.out.println(e);
		        }
		}
}
