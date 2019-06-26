package com.kh.kdw.persistence;

import com.kh.kdw.domain.MemberVo;

public interface IMemberDao {
	// 아이디 체크 확인
	public int checkId(String user_id) throws Exception;
	
	// 회원 가입
	public void memberJoin(MemberVo memberVo) throws Exception;
	
	// 로그인
	public MemberVo memberLogin(String user_id, String user_pw) throws Exception;
	
	// 회원 정보 수정
	public void memberModify(MemberVo memberVo) throws Exception;
	
	// 회원 삭제
	public void memberDelete(String user_id, String user_pw) throws Exception;
	
	// 이메일 인증 키 생성
	public void chkEmail(String user_email, String authkey) throws Exception;
	
}
