package store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import domain.Member;
import store.factory.MyBatisFactory;

@Repository
public class MemberStoreLogic implements MemberStore {

	//회원등록
	@Override
	public int createUser(Member member) {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		mapper.createUser(member);
		sqlSession.commit();
		sqlSession.close();

		return 0;
	}

	//Member찾기
	@Override
	public Member findMember(String id) {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		Member member = mapper.findMember(id);
		sqlSession.close();

		return member;
	}

	//비밀번호 수정
	@Override
	public void ModifyMember(String id, String password) {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		
		mapper.updateMember(map);
		sqlSession.commit();
		sqlSession.close();
		
	}

	//Member 삭제
	@Override
	public void deleteMember(String id) {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		mapper.deleteMember(id);
		
		sqlSession.commit();
		sqlSession.close();
	}

	//회원목록
	@Override
	public List<Member> customerList() {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		List<Member> memberList = mapper.selectMember("admin");
		
		sqlSession.commit();
		sqlSession.close();
		
		return memberList;
	}
	
}
