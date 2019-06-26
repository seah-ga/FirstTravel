package com.kh.kdw.service;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.kdw.domain.ChkEmailVo;
import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.persistence.IMemberDao;
import com.kh.kdw.util.MailHandler;
import com.kh.kdw.util.TempKey;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	private IMemberDao memberDao;
	
	@Inject
	private JavaMailSender mailSender;

	@Override
	public int checkId(String user_id) throws Exception {
		// 아이디 체크
		int cnt = memberDao.checkId(user_id);
		System.out.println(cnt + "ser");
		return cnt;
	}

	@Transactional
	@Override
	public MemberVo memberJoin(MemberVo memberVo) throws Exception {
		// 회원가입
		memberDao.memberJoin(memberVo);
		memberVo = memberDao.memberLogin(memberVo.getUser_id(), memberVo.getUser_pw());
		return memberVo;
	}

	@Override
	public MemberVo memberLogin(String user_id, String user_pw) throws Exception {
		// 로그인
		MemberVo memberVo = memberDao.memberLogin(user_id, user_pw);
		return memberVo;
	}

	@Override
	public void memberModify(MemberVo memberVo) throws Exception {
		// 회원 정보 수정
		memberDao.memberModify(memberVo);
	}

	@Override
	public void memberDelete(String user_id, String user_pw) throws Exception {
		// 회원 삭제
		memberDao.memberDelete(user_id, user_pw);
	}

	@Override
	public void chkEmail(ChkEmailVo chkEmailVo) throws Exception {
		// 이메일 인증
		memberDao.chkEmail(chkEmailVo.getUser_email(), chkEmailVo.getAuthkey());
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("이메일 인증");
		StringBuffer sb = new StringBuffer();
		sb.append("<h1>메일인증</h1>").append("<a href = 'http://localhost/kdw/join?key=")
		  .append(chkEmailVo.getAuthkey()).append("' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setText(sb.toString());
		sendMail.setForm("FirstTravel@naver.com", "(주)First Travel");
		sendMail.setTo(chkEmailVo.getUser_email());
		sendMail.send();
	}

}
