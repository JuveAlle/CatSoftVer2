package service;

import java.util.List;

import domain.Member;

public interface MemberService {

	//회원 등록
	int createMember(Member member);
	
	//회원 반환하기
	Member loginMember(String id);
	
	//아이디 찾기(중복)
	Boolean findMember(String id);
	
	//회원 목록
	List<Member> memberList();
	
	//회원정보 수정
	
	//회원 삭제
}
