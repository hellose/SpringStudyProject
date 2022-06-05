package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SqlDAO {


	@Autowired
	private SqlSession SqlSession;

	public <T> T selectOne(String statement, Object parameter) {
		System.out.println("queryType: selectOne, queryId: " + statement);
		return SqlSession.selectOne(statement, parameter);
	}

	public <T> List<T> selectList(String statement, Object parameter) {
		System.out.println("queryType: selectList, queryId: " + statement);
		return SqlSession.selectList(statement, parameter);
	}
	
	
	
	

}
