package store;

import domain.Member;

public interface MemberStore {
	
	int createUser(Member member);
	
	Member findMember(String id);
	

}
