package service;

import java.util.List;

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
		}else{
			return 1;
		}
	}

	@Override
	public Boolean findMember(String id) {
		Member member = store.findMember(id);
		if(member==null){
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Member loginMember(String id) {
		Member member = store.findMember(id);
		return member;
	}

	@Override
	public List<Member> memberList() {
		List<Member> memberList = store.customerList();
		
		return memberList;
	}

}
