package com.myweb.www.service;

import java.util.List;


import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.myweb.www.domain.DonationVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.DonationDAO;

@Service
public class DonationServiceImpl implements DonationService {

	@Inject
	private DonationDAO ddao;
	
	@Inject
	private BoardDAO bdao;
	
	@Override
	public int register(DonationVO dvo) {
		bdao.updateFinal(dvo);
		return ddao.insert(dvo);
	}

	@Override
	public PagingHandler spread(long bno, PagingVO pgvo) {
		return new PagingHandler(ddao.selectList(bno, pgvo), 
				ddao.selectTotalCount(bno), pgvo);
	}

	@Override
	public List<DonationVO> getMyList(PagingVO pgvo) {
		return ddao.selectMyList(pgvo);
	}

	@Override
	public int getMyTotalCount(PagingVO pgvo) {
		return ddao.selectMyTotalCount(pgvo);
	}
}
