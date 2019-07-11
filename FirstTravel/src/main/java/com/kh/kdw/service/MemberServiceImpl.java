package com.kh.kdw.service;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.kdw.domain.ChkEmailVo;
import com.kh.kdw.domain.MemberVo;
import com.kh.kdw.persistence.IMemberBoardDao;
import com.kh.kdw.persistence.IMemberDao;
import com.kh.kdw.util.MailHandler;
import com.kh.kdw.util.TempKey;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	private IMemberDao memberDao;
	@Inject
	private IMemberBoardDao memberBoardDao;
	
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
		sb.append("메일인증 번호 : [").append(chkEmailVo.getAuthkey()).append("]");
		sendMail.setText(sb.toString());
		sendMail.setForm("FirstTravel@naver.com", "(주)First Travel");
		sendMail.setTo(chkEmailVo.getUser_email());
		sendMail.send();
	}

	@Override
	public MemberVo memberId(int user_code) throws Exception {
		// 아이디 얻기
		MemberVo memberVo = memberDao.memberId(user_code);
		return memberVo;
	}

	@Override
	public String searchId(String user_id, String user_email) throws Exception {
		// 아이디 비번 찾기
		String message = "non-success";
		MemberVo memberVo = memberDao.idSearch(user_id, user_email);
		if (memberVo != null) {
			int user_code = memberVo.getUser_code();
			TempKey tempKey = new TempKey();
			String key = tempKey.getKey(12, false);
			String user_pw = key;	
			memberDao.passwoardUpdate(user_code, user_pw);
			memberVo = memberDao.memberId(user_code);
			System.out.println("수정된 비밀번호 : " + memberVo);
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("비밀번호 변경");
			sendMail.setText(new StringBuffer().append("비밀번호 변경 : ").append("[" + key + "] 로 변경되었습니다.").toString());
			sendMail.setForm("FirstTravel@naver.com", "(주)First Travel");
			sendMail.setTo(user_email);
			sendMail.send();
			message = "success";
		}
		return message;
	}

	@Transactional
	@Override
	public int memberBoardWriteCount(int user_code) throws Exception {
		// 작성한 게시판 게시글 수 얻기
		System.out.println("user_code : " + user_code);
		int galleryCount = memberBoardDao.memberGalleryWriteCount(user_code);
		System.out.println("galleryCount : " + galleryCount);
		int tipCount = memberBoardDao.memberTipWriteCount(user_code);
		System.out.println("tipCount : " + tipCount);
		int reviewCount = memberBoardDao.memberReviewWriteCount(user_code);
		System.out.println("reviewCount : " + reviewCount);
		int totalCount = galleryCount + tipCount + reviewCount;
		System.out.println("totalCount : " + totalCount);
		return totalCount;
	}

}
