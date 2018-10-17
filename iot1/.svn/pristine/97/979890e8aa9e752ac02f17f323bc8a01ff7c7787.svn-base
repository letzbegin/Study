package member.dao;

import java.util.HashMap;

import member.vo.MemberVO;

public interface MemberDAO {
	boolean select(String userid);//아이디중복확인
	MemberVO select(HashMap map);//로그인처리
	boolean insert(MemberVO vo);//회원가입시 회원정보 저장
	boolean update(MemberVO vo);//마이페이지에서 회원정보 변경저장
	boolean delete(String userid);//마이페이지에서 회원탈퇴
}
