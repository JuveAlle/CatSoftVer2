package store;

import java.util.List;

import domain.Member;

public interface MemberStore {
	
	int createUser(Member member);
	
	Member findMember(String id);
	
	void ModifyMember(String id, String password);
	
	void deleteMember(String id);
	
	List<Member> customerList();

}
