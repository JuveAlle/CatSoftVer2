package store;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import domain.Member;

public class MemberTest {
	
	private MemberStore store =new MemberStoreLogic();
	
	@Test
	public void registMember() {
		
		Member member = new Member();
		
		member.setId("01");
		member.setName("나야나");
		member.setEmail("sms@naver.com");
		member.setPassword("1234");
		
		store.createUser(member);
		assertTrue(true);
		
	}
	
	@Test
	public void findMember() {
		
		Member member = store.findMember("dd");
		assertTrue(true);
		assertEquals("dd", member.getId());
		assertEquals("dd", member.getName());
		assertEquals("dd", member.getPassword());
	}

}
