package com.kh.kdw.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.persistence.IMemberDao;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	private IMemberDao memberDao;

	@Override
	public MemberVo checkId(String user_id) throws Exception {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.checkId(user_id);
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
