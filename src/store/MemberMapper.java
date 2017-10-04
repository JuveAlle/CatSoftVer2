package store;

import domain.Member;

public interface MemberMapper {

	int createUser(Member member);

	Member findMember(String id);

}
