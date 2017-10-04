package service;

import domain.Member;

public interface MemberService {

	//회원 등록
	int createMember(Member member);
	
	//아이디 찾기(중복)
	Member findMember(String id);
	
	//회원정보 수정
	
	//회원 삭제
}
