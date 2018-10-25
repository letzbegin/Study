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
	private String clientId = "YMVEGBS1W7wky54OHuub";// 애플리케이션 클라이언트 아이디값";
	private String clientSecret = "M6sD4DuQ3l";// 애플리케이션 클라이언트 시크릿값";
	private Log log = LogFactory.getLog(MemberController.class);
	ObjectMapper mapper = new ObjectMapper();
	String key = null;
	String tempname = null;
	
	
	// 캡차 처리
		@ResponseBody
		@RequestMapping("/chaptcha00")
		public String chaptcha00() {
			log.info("캡챠 수신됨");
			try {
				String code = "0"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
				String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				log.info("===============================================");
				log.info(" 캡차 반환값:" + response.toString());

				JSONParser jsonParser = new JSONParser();
	            JSONObject jsonObj = (JSONObject) jsonParser.parse(response.toString());
	            key = (String) jsonObj.get("key");
	            
	            log.info(" 반환 키값:" + key);
	            
				
			} catch (Exception e) {
				System.out.println(e);
			}
			try {
//				String key = "EVHhbJxz9LF2YZG3"; // https://openapi.naver.com/v1/captcha/nkey
													// 호출로 받은 키값
				String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					log.info("정상호출");
					InputStream is = con.getInputStream();
					int read = 0;
					byte[] bytes = new byte[1024];
					// 랜덤한 이름으로 파일 생성
					tempname = Long.valueOf(new Date().getTime()).toString();
					log.info("생성된 파일값:"+tempname+".jpg");
					String re = "D:\\Study\\pol\\portfolio\\src\\main\\webapp\\resources\\img\\chaptcha";
					File f = new File(re,tempname+ ".jpg");
					f.createNewFile();
					OutputStream outputStream = new FileOutputStream(f);
					while ((read = is.read(bytes)) != -1) {
						outputStream.write(bytes, 0, read);
						log.info("====================="+read);
					}
					is.close();
				} else { // 에러 발생
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
		            String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
		            String value = request.getParameter("value"); // 사용자가 입력한 캡차 이미지 글자값
		            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;

		            URL url = new URL(apiURL);
		            HttpURLConnection con = (HttpURLConnection)url.openConnection();
		            con.setRequestMethod("GET");
		            con.setRequestProperty("X-Naver-Client-Id", clientId);
		            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		            int responseCode = con.getResponseCode();
		            BufferedReader br;
		            if(responseCode==200) { // 정상 호출
		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		            } else {  // 에러 발생
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
