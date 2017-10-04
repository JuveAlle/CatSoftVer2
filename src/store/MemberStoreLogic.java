package store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import domain.Member;
import store.factory.MyBatisFactory;

@Repository
public class MemberStoreLogic implements MemberStore {

	@Override
	public int createUser(Member member) {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		mapper.createUser(member);
		sqlSession.commit();
		sqlSession.close();

		return 0;
	}

	@Override
	public Member findMember(String id) {
		SqlSession sqlSession = MyBatisFactory.createInstance().openSession();
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		Member member = mapper.findMember(id);
		sqlSession.close();

		return member;
	}

}
