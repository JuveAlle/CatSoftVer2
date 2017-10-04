package store;

import java.util.List;
import java.util.Map;

import domain.Member;

public interface MemberMapper {

	// 회원가입
	int createUser(Member member);

	// 회원 찾기
	Member findMember(String id);

	// 비밀번호 수정
	int updateMember(Map<String,String> map);
	
	//회원 목록
	List<Member> selectMember(String admin);
	
	//회원 탈퇴
	int deleteMember(String id);
	
}
