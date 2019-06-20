package com.kh.kdw.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.kdw.domain.MemberVo;
@Repository
public class MemberDaoImpl implements IMemberDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "member.";

	@Override
	public MemberVo checkId(String user_id) throws Exception {
		// TODO Auto-generated method stub
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "checkId", user_id);
		return memberVo;
	}

	@Override
	public void memberJoin(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVo memberLogin(String user_id, String user_pw) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberModify(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberDelete(String user_id, String user_pw) throws Exception {
		// TODO Auto-generated method stub

	}

}
