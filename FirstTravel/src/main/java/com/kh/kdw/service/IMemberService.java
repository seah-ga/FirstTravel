package com.kh.kdw.service;

import com.kh.kdw.domain.MemberVo;

public interface IMemberService {
	// 아이디 체크 확인
	public MemberVo checkId(String user_id) throws Exception;
	
	// 회원 가입
	public void memberJoin(MemberVo memberVo) throws Exception;
	
	// 로그인
	public MemberVo memberLogin(String user_id, String user_pw) throws Exception;
	
	// 회원 정보 수정
	public void memberModify(MemberVo memberVo) throws Exception;
	
	// 회원 삭제
	public void memberDelete(String user_id, String user_pw) throws Exception;
}
