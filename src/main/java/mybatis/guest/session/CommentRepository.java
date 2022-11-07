package mybatis.guest.session;

import java.io.*;
import java.util.*;

import javax.servlet.jsp.tagext.TryCatchFinally;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository {
	// private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {

		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory = new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}

	public List<Comment> selectComment() {
		// *** 연결객체 Connection => SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.selectList("CommentMapper.selectComment");
		} finally {
			session.close(); // 연결 객체 반환
		}
	}

	public Comment selectCommentByPK(int commentNo) {
		// *** 연결객체 Connection => SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			Comment c = session.selectOne("CommentMapper.selectCommentByPK", map);
			return c;
		} finally {
			session.close();
		}
	}

	public void insertComment(Comment c) {
		// *** 연결객체 Connection => SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement = "CommentMapper.insertComment";
			int result = session.insert(statement, c);
			if (result > 0)
				session.commit();
			else
				session.rollback();
			// *********** mybatis는 auto Commit 이 아니므로 반드시 Commit 이 필요
		} finally {
			session.close();
		}
	}

	public int deleteCommentByPrimaryKey(int commentNo) {
		// *** 연결객체 Connection => SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			int result = session.delete("CommentMapper.deleteCommentByPK", map);
			if (result > 0)
				session.commit();
			else
				session.rollback();
			return result;
		} finally {
			session.close();
		}

	}

	public int updateCommentByPK(Comment comment) {
		// *** 연결객체 Connection => SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			
			int result = session.update("CommentMapper.updateCommentByPK", comment);
			if (result > 0)
				session.commit();
			else
				session.rollback();
			return result;
		} finally {
			session.close();
		}
	}
}
