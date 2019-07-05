package com.kh.kdw.persistence;

import java.util.HashMap;
import java.util.Map;

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
	public int checkId(String user_id) throws Exception {
		// TODO Auto-generated method stub
		int cnt = sqlSession.selectOne(NAMESPACE + "checkId", user_id);
		System.out.println(cnt + "dao");
		return cnt;
	}

	@Override
	public void memberJoin(MemberVo memberVo) throws Exception {
		// 회원가입
		sqlSession.insert(NAMESPACE + "memberJoin", memberVo);

	}

	@Override
	public MemberVo memberLogin(String user_id, String user_pw) throws Exception {
		// 로그인
		Map<String, Object> loginMap = new HashMap<>();
		loginMap.put("user_id", user_id);
		loginMap.put("user_pw", user_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberLogin", loginMap);
		return memberVo;
	}

	@Override
	public void memberModify(MemberVo memberVo) throws Exception {
		// 회원정보수정
		sqlSession.update(NAMESPACE + "memberModify", memberVo);
	}

	@Override
	public void memberDelete(String user_id, String user_pw) throws Exception {
		// 회원 탈퇴
		Map<String, Object> loginMap = new HashMap<>();
		loginMap.put("user_id", user_id);
		loginMap.put("user_pw", user_pw);
		sqlSession.delete(NAMESPACE + "memberDelete", loginMap);

	}

	@Override
	public void chkEmail(String user_email, String authkey) throws Exception {
		// 이메일 인증 키 생성
		Map<String, Object> map = new HashMap<>();
		map.put("user_email", user_email);
		map.put("authkey", authkey);
		sqlSession.insert(NAMESPACE + "createAuthKey", map);
	}

	@Override
	public MemberVo memberId(int user_code) throws Exception {
		// 아이디 얻기
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getUserInfo", user_code);
		return memberVo;
	}

	@Override
	public MemberVo idSearch(String user_id, String user_email) throws Exception {
		// 아이디/비번 찾기
		Map<String, Object> userInfoMap = new HashMap<>();
		userInfoMap.put("user_id", user_id);
		userInfoMap.put("user_email", user_email);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "idSearch", userInfoMap);
		return memberVo;
	}

	@Override
	public void passwoardUpdate(int user_code, String user_pw) throws Exception {
		// 비밀번호 변경
		Map<String, Object> userInfoMap = new HashMap<>();
		userInfoMap.put("user_code", user_code);
		userInfoMap.put("user_pw", user_pw);
		sqlSession.update(NAMESPACE + "passwoardUpdate", userInfoMap);
	}

}
