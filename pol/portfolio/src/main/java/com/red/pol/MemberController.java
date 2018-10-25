package com.red.pol;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import common.service.CommonService;
import member.service.MemberService;
import member.vo.MemberVO;

@Controller
@SessionAttributes({ "login_info", "category" })
public class MemberController {
	@Autowired
	private MemberService service_;
	private Log log = LogFactory.getLog(MemberController.class);

	// 로그아웃처리 요청
	@ResponseBody
	@RequestMapping("/logout")
	public void logout(SessionStatus session) {
		session.setComplete();
	}

	// 로그인처리 요청
	@ResponseBody
	@RequestMapping("/login")
	public String login(@RequestParam String userid, @RequestParam String userpwd, Model model) {
		// 화면에서 입력한 아이디,비번에 일치하는 회원정보를 DB에서 조회한 후
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		MemberVO vo = service_.select(map);
		model.addAttribute("login_info", vo);
		return vo == null ? "fail" : "success";
	}

	@Autowired
	private CommonService common;

	// 회원가입처리 요청
	@ResponseBody
	@RequestMapping(value = "/join", produces = "text/html; charset=utf-8")
	public String join(MemberVO vo, HttpSession session) {
		// 화면에서 입력한 회원정보를 DB에 저장처리한 후
		log.info("성별"+vo.getGender());
		log.info("이름"+vo.getName());
		String msg = "<script type='text/javascript'>";
		if (service_.insert(vo)) {
			common.emailSend(vo.getEmail(), vo.getName(), session);
			msg += "alert('회원가입을 축하합니다^^'); location='index'; ";
			// history.go(-2);
		} else {
			msg += "alert('회원가입 실패!!'); location='member'";
			// history.go(-1);
		}
		msg += "</script>";

		return msg;
	}

	// 아이디 중복여부확인처리 요청
	@ResponseBody
	@RequestMapping("/id_check")
	public String id_check(@RequestParam String userid) {
		log.info("아이디값:"+userid);
		// 화면에 입력한 아이디가 DB에 있는지를 조회하여 아이디의 사용가능여부를 리턴한다.
		// 사용가능(true)/사용불가(false)
		return String.valueOf(service_.select(userid));
	}

	// 회원가입화면 요청
	@RequestMapping("/member")
	public String member(Model model) {
		model.addAttribute("category", "");
		return "member/join";
	}
}
