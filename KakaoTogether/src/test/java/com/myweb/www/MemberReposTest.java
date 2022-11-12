package com.myweb.www;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.MemberReposTest;
import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.myweb.www.config.RootConfig.class})
@Slf4j
public class MemberReposTest {

	@Inject
	private MemberDAO mdao;
	
	@Test
	public void insertMemberDummy() throws Exception {
		int isUp = mdao.insert(new MemberVO("test1","1234", "name1", "1234", "test1@test.com", "1234", "test1"));
		
		log.info(">>> Test of insert Member : {} ", isUp > 0 ? "OK":"FAIL");
	}
}
