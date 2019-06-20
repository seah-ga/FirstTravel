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
		MemberVo memberVo = memberDao.checkId(user_id);
		System.out.println(memberVo + "234");
	}
}
