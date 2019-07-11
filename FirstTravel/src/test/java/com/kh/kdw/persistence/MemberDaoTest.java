package com.kh.kdw.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.kdw.domain.MemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDaoTest {

	@Inject
	private IMemberDao memberDao;
	
	@Test
	public void chkId() throws Exception {
		
		String user_id = "user1";
		int cnt = memberDao.checkId(user_id);
		System.out.println(cnt);
	}
	
	@Test
	public void memberJoinTest() throws Exception {
		MemberVo memberVo = new MemberVo();
		memberVo.setUser_id("suk155");
		memberVo.setUser_name("신영숙");
		memberVo.setUser_pw("1234");
		memberVo.setUser_address("울산 123-23번지", "123");
		memberVo.setUser_phone("1234-3456-34252");
		memberVo.setUser_email("234@3214");
		memberVo.setChk_ad("N");
		memberDao.memberJoin(memberVo);
		System.out.println(memberVo);
	}
	
	@Test
	public void memberLoginTest() throws Exception {
		String user_id = "user12";
		String user_pw = "12345678";
		MemberVo memberVo = memberDao.memberLogin(user_id, user_pw);
		System.out.println(memberVo);
	}
	
	@Test
	public void memeberModifyTest() throws Exception {
		MemberVo memberVo = new MemberVo();
		memberVo.setUser_id("user2");
		memberVo.setUser_name("username");
		memberVo.setUser_pw("1234");
		memberVo.setUser_address("울산 123-23번지", "123");
		memberVo.setUser_phone("1234-3456-34252");
		memberVo.setUser_email("234@3214");
		memberVo.setChk_ad("Y");
		
		memberDao.memberModify(memberVo);
		System.out.println(memberVo);
	}
	
	@Test
	public void memberDeleteTest() throws Exception {
		memberDao.memberDelete("user12", "12345678");
	}
	
	
}
