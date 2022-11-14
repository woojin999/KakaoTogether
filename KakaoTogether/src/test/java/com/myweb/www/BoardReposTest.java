package com.myweb.www;


import javax.inject.Inject;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.repository.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.myweb.www.config.RootConfig.class})

public class BoardReposTest {
	private static Logger log = LoggerFactory.getLogger(BoardReposTest.class);
	
	@Inject
	private BoardDAO bdao;
	
	@Test
	public void insertBoardTest() throws Exception {
		int isUp = bdao.insert(new BoardVO(2,
				"testtitle","testsub", "Testwrter","testtopic","testst",
				"testdesc",33333,"testkey1","testkey2","testkey3","testdate","testimg"));
		log.info(">>> Test of insert board : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void selectBoardTest() throws Exception {
		BoardVO bvo = bdao.selectOne(2L);
		log.info(">>>> selectBoardTest > {}", bvo);
	}
	
	@Test
	public void updateBoardTest() throws Exception {
		int isUp = bdao.update(new BoardVO(2,
				"updatetitle","updatesub", "updatewrter","updatetopic","updatest",
				"updateesc",3333333,"updatekey1","updatekey2","updatekey3","updatedate","updateimg"));
		log.info(">>> Test of update board : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
}
