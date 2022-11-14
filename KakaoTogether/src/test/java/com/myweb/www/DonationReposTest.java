package com.myweb.www;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.DonationDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {com.myweb.www.config.RootConfig.class})

public class DonationReposTest {
	private static Logger log = LoggerFactory.getLogger(DonationReposTest.class);
	
	@Inject
	private DonationDAO ddao;
	
	@Test
	public void insertDonationTest() throws Exception {
		int isUp = ddao.insert(new DonationVO(2, 3, 2, "test"));
		log.info(">>> Test of insert donation : {} ", isUp > 0 ? "OK":"FAIL");
	}
	
	@Test
	public void ListDonationTest() throws Exception {
		List<DonationVO> list = ddao.selectList(2, new PagingVO());
		log.info(">>>>> {}", list);
	}
}
