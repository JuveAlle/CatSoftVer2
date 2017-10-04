package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Member;
import store.MemberStore;

@Service
public class MemberServiceLogic implements MemberService {

	@Autowired
	private MemberStore store;
	
	@Override
	public int createMember(Member member) {
		
		if(store.createUser(member)==0) {
			return 0;
		}
		return 1;
	}

	@Override
	public Member findMember(String id) {
		Member member = store.findMember(id);
		return member;
	}

}
