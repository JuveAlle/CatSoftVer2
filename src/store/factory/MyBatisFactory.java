package store.factory;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisFactory {
	   //
	   private static MyBatisFactory instance;
	   private SqlSessionFactory sessionFactory;
	   
	   private MyBatisFactory() {
	      //
	      InputStream is = null;
	      try {
	         is = Resources.getResourceAsStream("mybatis-config.xml");
	      } catch (IOException e) {
	         e.printStackTrace();
	         System.out.println("Mybatis 설정파일 오류");
	      }

	      // SQL을 실행하기위한 핵심객체인 SqlSession객체를 생성한다.
	      sessionFactory = new SqlSessionFactoryBuilder().build(is);
	   }
	   
	   public static MyBatisFactory createInstance() {
	      if(instance == null) {
	         instance = new MyBatisFactory();
	      }
	      
	      return instance;
	   }
	   
	   /**
	    * <PRE>
	    * SqlSession 객체 생성
	    * 기본적으로 auto commit 모드로 동작함 
	    * </PRE>
	    * @return
	    */
	   public SqlSession openSession() {
	      //
	      return openSession(true);
	   }
	   
	   public SqlSession openSession(boolean autoCommit) {
	      SqlSession sqlSession = sessionFactory.openSession(autoCommit);
	      return sqlSession;
	   }
	}
