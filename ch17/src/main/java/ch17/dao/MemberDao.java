package ch17.dao;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import ch17.model.Member;
public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	// static 공유(여러 메서드에서 같이 사용)
	private static SqlSession session;  // mybatis 사용할 객체
	static {  // 클래스 초기화 블럭 
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);  
		}catch (Exception e) {
			System.out.println("초기화 에러 : "+e.getMessage());
		}
	}
	public Member select(String id) {
		return (Member) session.selectOne("memberns.select", id);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}
	public int update(Member member) {
		return session.update("memberns.update", member);
	}
	public int delete(String id) {
		return session.update("memberns.delete", id);
	}
	public int getToal() {
		return (int) session.selectOne("memberns.getTotal");
	}
	@SuppressWarnings("unchecked")
	public List<Member> list(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("memberns.list",map );
	}
}