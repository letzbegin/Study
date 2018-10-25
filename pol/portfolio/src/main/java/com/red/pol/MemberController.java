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

	// �α׾ƿ�ó�� ��û
	@ResponseBody
	@RequestMapping("/logout")
	public void logout(SessionStatus session) {
		session.setComplete();
	}

	// �α���ó�� ��û
	@ResponseBody
	@RequestMapping("/login")
	public String login(@RequestParam String userid, @RequestParam String userpwd, Model model) {
		// ȭ�鿡�� �Է��� ���̵�,����� ��ġ�ϴ� ȸ�������� DB���� ��ȸ�� ��
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		MemberVO vo = service_.select(map);
		model.addAttribute("login_info", vo);
		return vo == null ? "fail" : "success";
	}

	@Autowired
	private CommonService common;

	// ȸ������ó�� ��û
	@ResponseBody
	@RequestMapping(value = "/join", produces = "text/html; charset=utf-8")
	public String join(MemberVO vo, HttpSession session) {
		// ȭ�鿡�� �Է��� ȸ�������� DB�� ����ó���� ��
		log.info("����"+vo.getGender());
		log.info("�̸�"+vo.getName());
		String msg = "<script type='text/javascript'>";
		if (service_.insert(vo)) {
			common.emailSend(vo.getEmail(), vo.getName(), session);
			msg += "alert('ȸ�������� �����մϴ�^^'); location='index'; ";
			// history.go(-2);
		} else {
			msg += "alert('ȸ������ ����!!'); location='member'";
			// history.go(-1);
		}
		msg += "</script>";

		return msg;
	}

	// ���̵� �ߺ�����Ȯ��ó�� ��û
	@ResponseBody
	@RequestMapping("/id_check")
	public String id_check(@RequestParam String userid) {
		log.info("���̵�:"+userid);
		// ȭ�鿡 �Է��� ���̵� DB�� �ִ����� ��ȸ�Ͽ� ���̵��� ��밡�ɿ��θ� �����Ѵ�.
		// ��밡��(true)/���Ұ�(false)
		return String.valueOf(service_.select(userid));
	}

	// ȸ������ȭ�� ��û
	@RequestMapping("/member")
	public String member(Model model) {
		model.addAttribute("category", "");
		return "member/join";
	}
}
